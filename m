Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27A524462
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 06:38:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzJv91fZXz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 14:38:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=xXD+m8oS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90;
 helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=xXD+m8oS; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzJtC2hmyz3cCd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 14:37:55 +1000 (AEST)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 24C4bPLs022954
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 13:37:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 24C4bPLs022954
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652330246;
 bh=IUVNjJxNI8Y2N6J08VzVrWq/34IrVEKJXOQ5ZZINgIk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xXD+m8oSWbCTXA/qPnGHaiS/QVg/PxSHsr4fIhcqjOlaZsP1KJqpZNwCpRKJ4KH2S
 pCHiA69DicaE9dMqlpi9Lj88GUELYSKbzkpXSmyIESxuhMReVp3jIoaO+lKFMk97gI
 xctCZYMzFOZewSVp4xOsU2bELYT0AkGcMSyubPfRkaReQxW15ssceEaoYRb9yxmH90
 FhS1gpSkMSK50KWjOWLoFWZyA6hzoKZmA/7W7dEPf1CdpWk2lk8qT9Gww/6r0PNsZy
 0XL5fnSft5EpmOVuLcLCkAczz4fmjDSGFh/LVYhPsnoVdZZtVFlb9PWQs9wQ5qb9y9
 3rd3eU5/5oh+g==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id c11so3762914plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 21:37:25 -0700 (PDT)
X-Gm-Message-State: AOAM530WlaWDQYip65MtqXRwxgcl75pRoun3XlN+Xg9YrByjtdWsqYhr
 ZzRQrSemmBEr7yhRDs/VzBK+xO7utnp0yS2W6Rs=
X-Google-Smtp-Source: ABdhPJxIUnQ07JXrHxlmHeRUWu09ufIC94QEfhLUzNSqT72tmaZ5IS17kMlGKNSvGNHedylj1IZCjWj5ZROsWHhla+w=
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id
 s7-20020a170902988700b001516e1c7082mr27988770plp.162.1652330245039; Wed, 11
 May 2022 21:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-3-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 May 2022 13:36:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhgfkSP+jmoTF2nVJtd=amPTNsNRjgaV+H7NhgjV+6Bw@mail.gmail.com>
Message-ID: <CAK7LNARhgfkSP+jmoTF2nVJtd=amPTNsNRjgaV+H7NhgjV+6Bw@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] modpost: change the license of EXPORT_SYMBOL to
 bool type
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 9, 2022 at 4:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> There were more EXPORT_SYMBOL types in the past. The following commits
> removed unused ones.
>
>  - f1c3d73e973c ("module: remove EXPORT_SYMBOL_GPL_FUTURE")
>  - 367948220fce ("module: remove EXPORT_UNUSED_SYMBOL*")
>
> There are 3 remaining in enum export, but export_unknown does not make
> any sense because we never expect such a situation like "we do not know
> how it was exported".
>
> If the symbol name starts with "__ksymtab_", but the section name
> does not start with "___ksymtab+" or "___ksymtab_gpl+", it is not an
> exported symbol.
>
> It occurs when a variable starting with "__ksymtab_" is directly defined:
>
>    int __ksymtab_foo;
>
> Presumably, there is no practical issue for using such a weird variable
> name (but there is no good reason for doing so, either).
>
> Anyway, that is not an exported symbol. Setting export_unknown is not
> the right thing to do. Do not call sym_add_exported() in this case.
>
> With pointless export_unknown removed, the export type finally becomes
> boolean (either EXPORT_SYMBOL or EXPORT_SYMBOL_GPL).
>
> I renamed the field name to is_gpl_only. EXPORT_SYMBOL_GPL sets it true.
> Only GPL-compatible modules can use it.
>
> I removed the orphan comment, "How a symbol is exported", which is
> unrelated to sec_mismatch_count. It is about enum export.
> See commit bd5cbcedf446 ("kbuild: export-type enhancement to modpost.c")
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> ---

Applied to linux-kbuild.


>
> Changes in v4:
>   - Rebase again because I dropped
>      https://patchwork.kernel.org/project/linux-kbuild/patch/20220501084032.1025918-11-masahiroy@kernel.org/
>   - Remove warning message because I plan to change this hunk again in a later commit
>   - Remove orphan comment
>
> Changes in v3:
>   - New patch
>
>  scripts/mod/modpost.c | 108 ++++++++++++------------------------------
>  1 file changed, 30 insertions(+), 78 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d9efbd5b31a6..a78b75f0eeb0 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -30,7 +30,7 @@ static bool all_versions;
>  static bool external_module;
>  /* Only warn about unresolved symbols */
>  static bool warn_unresolved;
> -/* How a symbol is exported */
> +
>  static int sec_mismatch_count;
>  static bool sec_mismatch_warn_only = true;
>  /* ignore missing files */
> @@ -47,12 +47,6 @@ static bool error_occurred;
>  #define MAX_UNRESOLVED_REPORTS 10
>  static unsigned int nr_unresolved;
>
> -enum export {
> -       export_plain,
> -       export_gpl,
> -       export_unknown
> -};
> -
>  /* In kernel, this size is defined in linux/module.h;
>   * here we use Elf_Addr instead of long for covering cross-compile
>   */
> @@ -219,7 +213,7 @@ struct symbol {
>         bool crc_valid;
>         bool weak;
>         bool is_static;         /* true if symbol is not global */
> -       enum export  export;       /* Type of export */
> +       bool is_gpl_only;       /* exported by EXPORT_SYMBOL_GPL */
>         char name[];
>  };
>
> @@ -316,34 +310,6 @@ static void add_namespace(struct list_head *head, const char *namespace)
>         }
>  }
>
> -static const struct {
> -       const char *str;
> -       enum export export;
> -} export_list[] = {
> -       { .str = "EXPORT_SYMBOL",            .export = export_plain },
> -       { .str = "EXPORT_SYMBOL_GPL",        .export = export_gpl },
> -       { .str = "(unknown)",                .export = export_unknown },
> -};
> -
> -
> -static const char *export_str(enum export ex)
> -{
> -       return export_list[ex].str;
> -}
> -
> -static enum export export_no(const char *s)
> -{
> -       int i;
> -
> -       if (!s)
> -               return export_unknown;
> -       for (i = 0; export_list[i].export != export_unknown; i++) {
> -               if (strcmp(export_list[i].str, s) == 0)
> -                       return export_list[i].export;
> -       }
> -       return export_unknown;
> -}
> -
>  static void *sym_get_data_by_offset(const struct elf_info *info,
>                                     unsigned int secindex, unsigned long offset)
>  {
> @@ -374,18 +340,6 @@ static const char *sec_name(const struct elf_info *info, int secindex)
>
>  #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
>
> -static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
> -{
> -       const char *secname = sec_name(elf, sec);
> -
> -       if (strstarts(secname, "___ksymtab+"))
> -               return export_plain;
> -       else if (strstarts(secname, "___ksymtab_gpl+"))
> -               return export_gpl;
> -       else
> -               return export_unknown;
> -}
> -
>  static void sym_update_namespace(const char *symname, const char *namespace)
>  {
>         struct symbol *s = find_symbol(symname);
> @@ -405,7 +359,7 @@ static void sym_update_namespace(const char *symname, const char *namespace)
>  }
>
>  static struct symbol *sym_add_exported(const char *name, struct module *mod,
> -                                      enum export export)
> +                                      bool gpl_only)
>  {
>         struct symbol *s = find_symbol(name);
>
> @@ -417,7 +371,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>
>         s = alloc_symbol(name);
>         s->module = mod;
> -       s->export    = export;
> +       s->is_gpl_only = gpl_only;
>         list_add_tail(&s->list, &mod->exported_symbols);
>         hash_add_symbol(s);
>
> @@ -689,8 +643,6 @@ static void handle_modversion(const struct module *mod,
>  static void handle_symbol(struct module *mod, struct elf_info *info,
>                           const Elf_Sym *sym, const char *symname)
>  {
> -       const char *name;
> -
>         switch (sym->st_shndx) {
>         case SHN_COMMON:
>                 if (strstarts(symname, "__gnu_lto_")) {
> @@ -724,12 +676,15 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
>         default:
>                 /* All exported symbols */
>                 if (strstarts(symname, "__ksymtab_")) {
> -                       enum export export;
> +                       const char *name, *secname;
>
>                         name = symname + strlen("__ksymtab_");
> -                       export = export_from_secname(info,
> -                                                    get_secindex(info, sym));
> -                       sym_add_exported(name, mod, export);
> +                       secname = sec_name(info, get_secindex(info, sym));
> +
> +                       if (strstarts(secname, "___ksymtab_gpl+"))
> +                               sym_add_exported(name, mod, true);
> +                       else if (strstarts(secname, "___ksymtab+"))
> +                               sym_add_exported(name, mod, false);
>                 }
>                 if (strcmp(symname, "init_module") == 0)
>                         mod->has_init = true;
> @@ -2140,20 +2095,6 @@ void buf_write(struct buffer *buf, const char *s, int len)
>         buf->pos += len;
>  }
>
> -static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
> -{
> -       switch (exp) {
> -       case export_gpl:
> -               error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
> -                     m, s);
> -               break;
> -       case export_plain:
> -       case export_unknown:
> -               /* ignore */
> -               break;
> -       }
> -}
> -
>  static void check_exports(struct module *mod)
>  {
>         struct symbol *s, *exp;
> @@ -2192,8 +2133,9 @@ static void check_exports(struct module *mod)
>                         add_namespace(&mod->missing_namespaces, exp->namespace);
>                 }
>
> -               if (!mod->is_gpl_compatible)
> -                       check_for_gpl_usage(exp->export, basename, exp->name);
> +               if (!mod->is_gpl_compatible && exp->is_gpl_only)
> +                       error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
> +                             basename, exp->name);
>         }
>  }
>
> @@ -2437,6 +2379,7 @@ static void read_dump(const char *fname)
>                 unsigned int crc;
>                 struct module *mod;
>                 struct symbol *s;
> +               bool gpl_only;
>
>                 if (!(symname = strchr(line, '\t')))
>                         goto fail;
> @@ -2454,12 +2397,22 @@ static void read_dump(const char *fname)
>                 crc = strtoul(line, &d, 16);
>                 if (*symname == '\0' || *modname == '\0' || *d != '\0')
>                         goto fail;
> +
> +               if (!strcmp(export, "EXPORT_SYMBOL_GPL")) {
> +                       gpl_only = true;
> +               } else if (!strcmp(export, "EXPORT_SYMBOL")) {
> +                       gpl_only = false;
> +               } else {
> +                       error("%s: unknown license %s. skip", symname, export);
> +                       continue;
> +               }
> +
>                 mod = find_module(modname);
>                 if (!mod) {
>                         mod = new_module(modname);
>                         mod->from_dump = true;
>                 }
> -               s = sym_add_exported(symname, mod, export_no(export));
> +               s = sym_add_exported(symname, mod, gpl_only);
>                 s->is_static = false;
>                 sym_set_crc(symname, crc);
>                 sym_update_namespace(symname, namespace);
> @@ -2481,9 +2434,9 @@ static void write_dump(const char *fname)
>                 if (mod->from_dump)
>                         continue;
>                 list_for_each_entry(sym, &mod->exported_symbols, list) {
> -                       buf_printf(&buf, "0x%08x\t%s\t%s\t%s\t%s\n",
> +                       buf_printf(&buf, "0x%08x\t%s\t%s\tEXPORT_SYMBOL%s\t%s\n",
>                                    sym->crc, sym->name, mod->name,
> -                                  export_str(sym->export),
> +                                  sym->is_gpl_only ? "_GPL" : "",
>                                    sym->namespace ?: "");
>                 }
>         }
> @@ -2604,9 +2557,8 @@ int main(int argc, char **argv)
>
>                 for (s = symbolhash[n]; s; s = s->next) {
>                         if (s->is_static)
> -                               error("\"%s\" [%s] is a static %s\n",
> -                                     s->name, s->module->name,
> -                                     export_str(s->export));
> +                               error("\"%s\" [%s] is a static EXPORT_SYMBOL\n",
> +                                     s->name, s->module->name);
>                 }
>         }
>
> --
> 2.32.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20220508190631.2386038-3-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
