<?php
/**
 * impProse — prepares rich text (content fields) for the site design:
 *  - top-level <h2> get class "title" and an id (for the table of contents);
 *  - top-level headings, figures, quotes, callouts, checklists, summary boxes appear on scroll (data-reveal);
 *  - <ol class="step-list"> items appear one by one (data-stagger);
 *  - <img> get width/height (from the file) and loading="lazy";
 *  - links and images: relative URLs (as the visual editor may save them) become absolute,
 *    /en/assets/… and /ru/assets/… point to /assets/…; MODX tags like [[~5]] are kept intact;
 *  - a space is kept after <br class="br-desk"> (the editor removes it, and the line break is hidden on phones).
 * &html — the HTML; &toc=1 — give h2 ids; &mode=toc — return only the table of contents (<li><a href="#id">…</a></li>).
 *
 * @var modX $modx
 * @var array $scriptProperties
 */
$html = trim((string)($scriptProperties['html'] ?? ''));
$tocOnly = ($scriptProperties['mode'] ?? '') === 'toc';
$withToc = $tocOnly || !empty($scriptProperties['toc']);
if ($html === '') {
    return '';
}

// MODX tags ([[~5]], [[++site_url]] …) must survive the HTML parser untouched
$tags = [];
$html = preg_replace_callback('/\[\[(?:[^\[\]]++|(?R))*\]\]/', function ($m) use (&$tags) {
    $tags[] = $m[0];
    return 'imp-modx-tag-' . (count($tags) - 1) . '-x';
}, $html);
$restoreTags = function ($s) use (&$tags) {
    return preg_replace_callback('/imp-modx-tag-(\d+)-x/', function ($m) use (&$tags) {
        return $tags[(int)$m[1]] ?? $m[0];
    }, $s);
};

// relative URL → absolute path from the current language root; assets always live at the site root
$base = '/' . trim((string)$modx->getOption('base_url', null, '/'), '/') . '/';
$base = $base === '//' ? '/' : $base;
$fixUrl = function (string $url) use ($base): string {
    $url = trim($url);
    if ($url === '' || preg_match('#^([a-z][a-z0-9+.-]*:|//|\#|\?|imp-modx-tag-)#i', $url)) {
        return $url;
    }
    if ($url[0] !== '/') {
        $url = $base . $url;
    }
    $parts = [];
    $path = strtok($url, '?#');
    $tail = substr($url, strlen($path));
    foreach (explode('/', $path) as $seg) {
        if ($seg === '..') {
            array_pop($parts);
        } elseif ($seg !== '.') {
            $parts[] = $seg;
        }
    }
    $url = '/' . ltrim(implode('/', $parts), '/') . $tail;
    return preg_replace('#^/(?:en|ru)/assets/#', '/assets/', $url);
};

$doc = new DOMDocument('1.0', 'UTF-8');
$prev = libxml_use_internal_errors(true);
$doc->loadHTML('<?xml encoding="UTF-8"><div id="imp-root">' . $html . '</div>', LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
libxml_clear_errors();
libxml_use_internal_errors($prev);
$root = $doc->getElementById('imp-root');
if (!$root) {
    return $html;
}

$hasClass = function (DOMElement $el, string $class): bool {
    return in_array($class, preg_split('/\s+/', $el->getAttribute('class')), true);
};
$slug = function (string $text): string {
    $map = ['а'=>'a','б'=>'b','в'=>'v','г'=>'h','ґ'=>'g','д'=>'d','е'=>'e','є'=>'ie','ж'=>'zh','з'=>'z','и'=>'y','і'=>'i','ї'=>'i','й'=>'i','к'=>'k','л'=>'l','м'=>'m','н'=>'n','о'=>'o','п'=>'p','р'=>'r','с'=>'s','т'=>'t','у'=>'u','ф'=>'f','х'=>'kh','ц'=>'ts','ч'=>'ch','ш'=>'sh','щ'=>'shch','ь'=>'','ю'=>'iu','я'=>'ia','ы'=>'y','э'=>'e','ъ'=>'','ё'=>'e'];
    $text = mb_strtolower(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
    $text = strtr($text, $map);
    $text = preg_replace('/[^a-z0-9]+/', '-', $text);
    return trim(substr($text, 0, 60), '-') ?: 'section';
};

$toc = [];
$usedIds = [];
foreach (iterator_to_array($root->childNodes) as $node) {
    if (!$node instanceof DOMElement) {
        continue;
    }
    $tag = strtolower($node->tagName);
    $revealable = in_array($tag, ['h2', 'h3', 'h4', 'figure', 'blockquote', 'aside', 'table'], true)
        || ($tag === 'div' && ($hasClass($node, 'callout') || $hasClass($node, 'checklist-box') || $hasClass($node, 'summary-box')))
        || ($tag === 'section' && $hasClass($node, 'checklist-box'));
    if ($tag === 'h2') {
        if (!$node->getAttribute('class')) {
            $node->setAttribute('class', 'title');
        }
        if ($withToc) {
            $id = $node->getAttribute('id') ?: $slug(preg_replace('/imp-modx-tag-\d+-x/', '', $node->textContent));
            $base = $id;
            for ($n = 2; isset($usedIds[$id]); $n++) {
                $id = $base . '-' . $n;
            }
            $usedIds[$id] = true;
            $node->setAttribute('id', $id);
            $inner = '';
            foreach ($node->childNodes as $child) {
                $inner .= $doc->saveHTML($child);
            }
            $toc[] = '            <li><a href="#' . $id . '">' . trim($inner) . '</a></li>';
        }
    }
    if ($revealable && !$node->hasAttribute('data-reveal') && !$node->hasAttribute('data-stagger')) {
        $node->setAttribute('data-reveal', '');
    }
    if ($tag === 'ol' && $hasClass($node, 'step-list') && !$node->hasAttribute('data-stagger')) {
        $node->setAttribute('data-stagger', '');
    }
}

foreach (['a' => 'href', 'img' => 'src', 'source' => 'src'] as $tagName => $attr) {
    foreach ($root->getElementsByTagName($tagName) as $el) {
        if ($el->hasAttribute($attr)) {
            $el->setAttribute($attr, $fixUrl($el->getAttribute($attr)));
        }
    }
}

foreach ($root->getElementsByTagName('img') as $img) {
    $src = $img->getAttribute('src');
    if (!$img->hasAttribute('width') && $src !== '') {
        $attrs = $modx->runSnippet('impImg', ['src' => $src]);
        if (preg_match('/width="(\d+)" height="(\d+)"/', $attrs, $m)) {
            $img->setAttribute('width', $m[1]);
            $img->setAttribute('height', $m[2]);
        }
    }
    if (!$img->hasAttribute('loading') && !$img->hasAttribute('fetchpriority')) {
        $img->setAttribute('loading', 'lazy');
    }
    if (!$img->hasAttribute('alt')) {
        $img->setAttribute('alt', '');
    }
}

$out = '';
foreach ($root->childNodes as $child) {
    $out .= $doc->saveHTML($child);
}
// boolean attributes: data-reveal="" → data-reveal
$out = str_replace(['data-reveal=""', 'data-stagger=""'], ['data-reveal', 'data-stagger'], $out);
// the desktop-only line break is hidden on phones — words around it must stay apart
$out = preg_replace('#(<br class="br-desk">)(?=[^\s<])#u', '$1 ', $out);
$out = $restoreTags($out);

return $tocOnly ? $restoreTags(implode("\n", $toc)) : $out;
