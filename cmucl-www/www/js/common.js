import {html, render} from 'https://unpkg.com/lit-html?module';

// Figure out what prefix to use for the image and for the navbar
// links.  We need to do this because the we want these links to work
// no matter if we're being served from cmucl.org or from
// common-lisp.net/project/cmucl.
function getPrefix() {
  let scripts = document.getElementsByTagName("script");

  // Find our script by looking for the one that is matches our name
  // of this script.  The prefix is then everything up to
  // "/js/common.js".
  for (let k = 0; k < scripts.length; ++k) {
    let m = scripts[k].src.indexOf("js/common.js");
    if (m >= 0) {
      return encodeURI(scripts[k].src.substring(0, m));
    }
  }
}

let prefix = getPrefix();

const headerTemplate = () =>
html`
  <!-- top banner -->  
  <div style="text-align: center">
    <img src="${prefix}images/CMUCL.jpg"
         alt="cmucl">
  </div><!-- top rule -->
  <div style="height: 20px; background: #003333"></div>
`;

const footerTemplate = () =>
html`
  <!-- Horizonal line that works the same everywhere -->
  <div style="height: 2px; background: #003333;"></div>
  <p>
    <a href="https://validator.w3.org/check?uri=referer"><img src=
    "https://www.w3.org/Icons/valid-html40"
         alt="Valid HTML 4.0 Transitional"
         height="31"
         width="88"></a> <a href=
         "https://jigsaw.w3.org/css-validator/check/referer"><img style=
         "border:0;width:88px;height:31px"
         src="https://jigsaw.w3.org/css-validator/images/vcss"
         alt="Valid CSS!"></a>
  </p>
  <p style="font-size: smaller; font-family: Helvetica, Arial;">
    Copyright © 1999-2019 CMUCL Project<br>
    Validate <a id="links"
       href="https://validator.w3.org/checklink?uri=${window.location.href}"
       target="_blank" rel="noopener">links</a>, <a id="html"
       href="https://validator.w3.org/check?uri=${window.location.href}"
       target="_blank" rel="noopener">HTML</a>, <a id="css"
       href=
       "https://jigsaw.w3.org/css-validator/validator?uri=${prefix}cmucl.css"
       target="_blank" rel="noopener">stylesheet</a>.
  </p>
  <address>
    <a href="https://gitlab.common-lisp.net/cmucl/cmucl-site/issues"
             target="_blank" rel="noopener">CMUCL Site Issue tracker</a>
  </address>
`;


// Every li element of the navbar must have an id of "nav-name", where
// "name" is the name of the item.  This is basically the item text,
// in lower case.  Then on every page, the main tag must have an id of
// "content-name" so we can match the page to the nav item.
const navbarTemplate = () => 
html`
  <nav id="nav-container">
    <div class="bg"></div>
    <div class="button" tabindex="0">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </div>
    <div id="nav-content" tabindex="0">
      <ul id="navitems">
        <li id="nav-faq">
          <a href="${prefix}FAQ.html">FAQ</a>
        </li>
        <li id="nav-benchmarks">
          <a href="${prefix}benchmarks/index.html">Benchmarks</a>
        </li>
        <li id="nav-credits">
          <a href="${prefix}credits.html">Credits</a>
        </li>
        <li id="nav-documentation">
          <a href="${prefix}doc/index.html">Documentation</a>
        </li>
        <li id="nav-download">
          <a href="${prefix}download.html">Download</a>
        </li>
        <li id="nav-hemlock">
          <a href="${prefix}hemlock/index.html">Hemlock</a>
        </li>
        <li id="nav-home">
          <a href="${prefix}index.html">Home</a>
        </li>
        <li id="nav-install">
          <a href="${prefix}install.html">Install</a>
        </li>
        <li id="nav-news">
          <a href="${prefix}news/index.html">News</a>
        </li>
        <li id="nav-platforms">
          <a href="${prefix}platforms.html">Platforms</a>
        </li>
        <li id="nav-ports">
          <a href="${prefix}ports.html">Ports</a>
        </li>
        <li id="nav-projects">
          <a href="${prefix}projects.html">Projects</a>
        </li>
        <li id="nav-search">
          <a href="${prefix}search.html">Search</a>
        </li>
        <li id="nav-support">
          <a href="${prefix}support.html">Support</a>
        </li>
      </ul>
    </div>
  </nav>
`;

render(headerTemplate(), document.getElementById('header'));
render(navbarTemplate(), document.getElementById('navbar'));
render(footerTemplate(), document.getElementById('footer'));

// Highlight the navitem depending on the id of the main tag.
function highlight () {
  // Find the main tag.  The id is of the form "content-foo" and
  // "foo" indicates what navbar item to highlight.
  let collection = document.getElementsByTagName("main");
  let id = collection[0].id;
  let matches = id.match(/content-(.*)/);
  let name = matches[1];
  
  if (name) {
    // Find the entry in the ordered list of the navbar and add a
    // class to the item to let CSS highlight it appropriately.
    let item = document.getElementById("nav-" + name);
    item.classList.add("nav-highlight");
  }
}
highlight();

