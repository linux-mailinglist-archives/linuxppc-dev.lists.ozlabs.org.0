Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1540151B8BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:25:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv4wz06Z2z3c8k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:25:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=lnhRgRnl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=lnhRgRnl; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv4wQ1YcSz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:25:09 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 2457Nenk019426;
 Thu, 5 May 2022 16:23:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2457Nenk019426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651735423;
 bh=H5IgqTUvzvIAQNbWlA80TiHii36q0B+qbmYPDwvWwHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lnhRgRnlzXbzGrS8fRxQl4Im2SnuWKwM5HM8+dBalMVK7FAb4hVG19uFtV6N3+Ml2
 gMGl1UDWxeeNHEolXqYDwmIAtbxhUz5hOyrgvp915V82DMnsXO8ZZZ7TRP6/cEBMEa
 FWvdmpsTpafjJfO2EjBKmYPSkgcgr/mUGoZF457N4DU2VGieqV8MGiXj0N77+bClv0
 w1dK9KJHKUst9FYG+wt9N/Qj6eR/0XJCpWMR6yMIFJqEjZ4XC+4X6sxyrhlq/DsIhv
 Iyln2FVdSIJIbwmeDhBhTtUrulsj436hMhuKBpGZH+6/MLBUv0jBS3VGqbDHdLwUGn
 +cL9f4r2LQEGg==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v3 02/15] modpost: change the license of EXPORT_SYMBOL to bool
 type
Date: Thu,  5 May 2022 16:22:31 +0900
Message-Id: <20220505072244.1155033-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505072244.1155033-1-masahiroy@kernel.org>
References: <20220505072244.1155033-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier a <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, enum export is tristate, but export_unknown does not make
sense in any way.

If the symbol name starts with "__ksymtab_", but the section name
does not start with "___ksymtab+" or "___ksymtab_gpl+", it is not
an exported symbol. The variable name just happens to start with
"__ksymtab_". Do not call sym_add_exported() in this case.

__ksymtab_* is internally by EXPORT_SYMBOL(_GPL) but somebody may
directly define a global variable with a such name, like this:

   int __ksymtab_foo;

Presumably, there is no practical issue for this, but there is no good
reason to use such a weird name.

This commit adds a new warning for such a case:

    WARNING: modpost: __ksymtab_foo: Please consider renaming. Variables starting with "__ksymtab_" is for internal use.

With pointless export_unknown removed, the license type of exported
symbols is boolean (EXPORT_SYMBOL or EXPORT_SYMBOL_GPL).

I renamed the field name to is_gpl_only. If it is true, only GPL-compat
modules can use it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - New patch

 scripts/mod/modpost.c | 108 +++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 76 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a55fa2b88a9a..ebd80c77fa03 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -47,12 +47,6 @@ static bool error_occurred;
 #define MAX_UNRESOLVED_REPORTS	10
 static unsigned int nr_unresolved;
 
-enum export {
-	export_plain,
-	export_gpl,
-	export_unknown
-};
-
 /* In kernel, this size is defined in linux/module.h;
  * here we use Elf_Addr instead of long for covering cross-compile
  */
@@ -219,7 +213,7 @@ struct symbol {
 	bool crc_valid;
 	bool weak;
 	bool is_static;		/* true if symbol is not global */
-	enum export  export;       /* Type of export */
+	bool is_gpl_only;	/* exported by EXPORT_SYMBOL_GPL */
 	char name[];
 };
 
@@ -321,34 +315,6 @@ static void add_namespace(struct list_head *head, const char *namespace)
 	}
 }
 
-static const struct {
-	const char *str;
-	enum export export;
-} export_list[] = {
-	{ .str = "EXPORT_SYMBOL",            .export = export_plain },
-	{ .str = "EXPORT_SYMBOL_GPL",        .export = export_gpl },
-	{ .str = "(unknown)",                .export = export_unknown },
-};
-
-
-static const char *export_str(enum export ex)
-{
-	return export_list[ex].str;
-}
-
-static enum export export_no(const char *s)
-{
-	int i;
-
-	if (!s)
-		return export_unknown;
-	for (i = 0; export_list[i].export != export_unknown; i++) {
-		if (strcmp(export_list[i].str, s) == 0)
-			return export_list[i].export;
-	}
-	return export_unknown;
-}
-
 static void *sym_get_data_by_offset(const struct elf_info *info,
 				    unsigned int secindex, unsigned long offset)
 {
@@ -379,18 +345,6 @@ static const char *sec_name(const struct elf_info *info, int secindex)
 
 #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
 
-static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
-{
-	const char *secname = sec_name(elf, sec);
-
-	if (strstarts(secname, "___ksymtab+"))
-		return export_plain;
-	else if (strstarts(secname, "___ksymtab_gpl+"))
-		return export_gpl;
-	else
-		return export_unknown;
-}
-
 static void sym_update_namespace(const char *symname, const char *namespace)
 {
 	struct symbol *s = find_symbol(symname);
@@ -410,7 +364,7 @@ static void sym_update_namespace(const char *symname, const char *namespace)
 }
 
 static struct symbol *sym_add_exported(const char *name, struct module *mod,
-				       enum export export)
+				       bool gpl_only)
 {
 	struct symbol *s = find_symbol(name);
 
@@ -422,7 +376,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 
 	s = alloc_symbol(name);
 	s->module = mod;
-	s->export    = export;
+	s->is_gpl_only = gpl_only;
 	list_add_tail(&s->list, &mod->exported_symbols);
 	hash_add_symbol(s);
 
@@ -694,8 +648,6 @@ static void handle_modversion(const struct module *mod,
 static void handle_symbol(struct module *mod, struct elf_info *info,
 			  const Elf_Sym *sym, const char *symname)
 {
-	const char *name;
-
 	switch (sym->st_shndx) {
 	case SHN_COMMON:
 		if (strstarts(symname, "__gnu_lto_")) {
@@ -729,12 +681,18 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 	default:
 		/* All exported symbols */
 		if (strstarts(symname, "__ksymtab_")) {
-			enum export export;
+			const char *name, *secname;
 
 			name = symname + strlen("__ksymtab_");
-			export = export_from_secname(info,
-						     get_secindex(info, sym));
-			sym_add_exported(name, mod, export);
+			secname = sec_name(info, get_secindex(info, sym));
+
+			if (strstarts(secname, "___ksymtab_gpl+"))
+				sym_add_exported(name, mod, true);
+			else if (strstarts(secname, "___ksymtab+"))
+				sym_add_exported(name, mod, false);
+			else
+				warn("%s: Please consider renaming. Variables starting with \"__ksymtab_\" is for internal use.\n",
+				     symname);
 		}
 		if (strcmp(symname, "init_module") == 0)
 			mod->has_init = true;
@@ -2146,20 +2104,6 @@ void buf_write(struct buffer *buf, const char *s, int len)
 	buf->pos += len;
 }
 
-static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
-{
-	switch (exp) {
-	case export_gpl:
-		error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
-		      m, s);
-		break;
-	case export_plain:
-	case export_unknown:
-		/* ignore */
-		break;
-	}
-}
-
 static void check_exports(struct module *mod)
 {
 	struct symbol *s, *exp;
@@ -2198,14 +2142,15 @@ static void check_exports(struct module *mod)
 			add_namespace(&mod->missing_namespaces, exp->namespace);
 		}
 
-		if (!mod->is_gpl_compatible)
-			check_for_gpl_usage(exp->export, basename, exp->name);
+		if (!mod->is_gpl_compatible && exp->is_gpl_only)
+			error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
+			      basename, exp->name);
 	}
 
 	list_for_each_entry(s, &mod->exported_symbols, list) {
 		if (s->is_static)
-			error("\"%s\" [%s] is a static %s\n",
-			      s->name, mod->name, export_str(s->export));
+			error("\"%s\" [%s] is a static EXPORT_SYMBOL\n",
+			      s->name, mod->name);
 	}
 }
 
@@ -2429,6 +2374,7 @@ static void read_dump(const char *fname)
 		unsigned int crc;
 		struct module *mod;
 		struct symbol *s;
+		bool gpl_only;
 
 		if (!(symname = strchr(line, '\t')))
 			goto fail;
@@ -2446,12 +2392,22 @@ static void read_dump(const char *fname)
 		crc = strtoul(line, &d, 16);
 		if (*symname == '\0' || *modname == '\0' || *d != '\0')
 			goto fail;
+
+		if (!strcmp(export, "EXPORT_SYMBOL_GPL"))
+			gpl_only = true;
+		else if (!strcmp(export, "EXPORT_SYMBOL"))
+			gpl_only = false;
+		else {
+			error("%s: unknown license for %s. skip", export, symname);
+			continue;
+		}
+
 		mod = find_module(modname);
 		if (!mod) {
 			mod = new_module(modname);
 			mod->from_dump = true;
 		}
-		s = sym_add_exported(symname, mod, export_no(export));
+		s = sym_add_exported(symname, mod, gpl_only);
 		s->is_static = false;
 		sym_set_crc(symname, crc);
 		sym_update_namespace(symname, namespace);
@@ -2473,9 +2429,9 @@ static void write_dump(const char *fname)
 		if (mod->from_dump)
 			continue;
 		list_for_each_entry(sym, &mod->exported_symbols, list) {
-			buf_printf(&buf, "0x%08x\t%s\t%s\t%s\t%s\n",
+			buf_printf(&buf, "0x%08x\t%s\t%s\tEXPORT_SYMBOL%s\t%s\n",
 				   sym->crc, sym->name, mod->name,
-				   export_str(sym->export),
+				   sym->is_gpl_only ? "_GPL" : "",
 				   sym->namespace ?: "");
 		}
 	}
-- 
2.32.0

