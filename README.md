# make4ht build action

[make4ht](https://github.com/michal-h21/make4ht) is a build system for
[TeX4ht](https://tug.org/tex4ht/), TeX to XML converter. This Docker image can
be used to compile your LaTeX document in automated environment, such as Github
Actions.

## Examples 

- How to use [make4ht with Overleaf](https://www.kodymirus.cz/overleaf-html-sample/main.html)
- [TeX4ht documentation](https://www.kodymirus.cz/tex4ht-doc/tex4ht-doc.html) / [Github Actions file](https://github.com/michal-h21/tex4ht-doc/blob/master/.github/workflows/main.yml)

##  Usage

Sample `.github/workflows/main.yml` file:

```yaml
name: CI 
on: [push] 
jobs: 
  build: 
   runs-on: ubuntu-latest 
   steps: 
   - uses: actions/checkout@v1 
   - name: Run make4ht 
     uses: docker://ghcr.io/michal-h21/make4ht-action:latest 
     env: 
       command: "make4ht -d out main.tex" 
   - name: Publish the web pages 
     uses:  peaceiris/actions-gh-pages@v3 
     with: 
       github_token: ${{ secrets.GITHUB_TOKEN }} 
       publish_dir: ./out 
```

This worflow compiles file `main.tex` using `make4ht`. The resulting
`main.html` file is placed in the `out` directory, which is then served using
Github Pages.
