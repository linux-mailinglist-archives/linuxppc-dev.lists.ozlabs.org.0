Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8312230D106
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:51:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVl5Y55PPzDrdh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:51:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+78410b086ab5a19d433c+6372+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=lpfoG6XH; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNzJ4S83zDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 23:14:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xXlOCBozKDAJ3MS0tiixScSnXf+zKdWG/OKhTDfGaGg=; b=lpfoG6XHL9exga9Q56DreURg75
 0QjnAlulckvJ8tjzbSs1bdw9vzvLotJZDNm0EGIcrDs3/ACwwk1XVOLZX8u3uDg7fKS3l1aOH3aHh
 WPVZGXrp+aihpJMy6BLemIUekgJqHQGjyaHsEPoFdXbFT8s9lVfQNl/LFuDul30hygswglntO8lM7
 zV3DQuttsOG9Q62UqOQxrVw6NHx/zQbIsIAsMOSlVxy0BXY+awbdM/YkyVHfe3L5IVk90IiZWgnXU
 Id1M135f6ycm5fM5/EMvrHgf3VqwhiLSLc8GMpQ9/Kpfns0mXv5ZWyoEdOgJP50jE1D8O3H8inFQR
 qzKHRyqA==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6uZK-00FANg-OJ; Tue, 02 Feb 2021 12:14:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH 12/13] module: remove EXPORT_SYMBOL_GPL_FUTURE
Date: Tue,  2 Feb 2021 13:13:33 +0100
Message-Id: <20210202121334.1361503-13-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202121334.1361503-1-hch@lst.de>
References: <20210202121334.1361503-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As far as I can tell this has never been used at all, and certainly
not any time recently.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/tools/relocs.c           |  4 ++--
 include/asm-generic/vmlinux.lds.h | 14 --------------
 include/linux/export.h            |  1 -
 include/linux/module.h            |  5 -----
 kernel/module.c                   | 29 ++---------------------------
 scripts/mod/modpost.c             | 13 +------------
 scripts/mod/modpost.h             |  1 -
 scripts/module.lds.S              |  2 --
 tools/include/linux/export.h      |  1 -
 9 files changed, 5 insertions(+), 65 deletions(-)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index ce7188cbdae58a..0d210d0e83e241 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -61,8 +61,8 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"(__iommu_table|__apicdrivers|__smp_locks)(|_end)|"
 	"__(start|end)_pci_.*|"
 	"__(start|end)_builtin_fw|"
-	"__(start|stop)___ksymtab(|_gpl|_unused|_unused_gpl|_gpl_future)|"
-	"__(start|stop)___kcrctab(|_gpl|_unused|_unused_gpl|_gpl_future)|"
+	"__(start|stop)___ksymtab(|_gpl|_unused|_unused_gpl)|"
+	"__(start|stop)___kcrctab(|_gpl|_unused|_unused_gpl)|"
 	"__(start|stop)___param|"
 	"__(start|stop)___modver|"
 	"__(start|stop)___bug_table|"
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2b3d81b1535a5..83243506e68b00 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -495,13 +495,6 @@
 		__stop___ksymtab_unused_gpl = .;			\
 	}								\
 									\
-	/* Kernel symbol table: GPL-future-only symbols */		\
-	__ksymtab_gpl_future : AT(ADDR(__ksymtab_gpl_future) - LOAD_OFFSET) { \
-		__start___ksymtab_gpl_future = .;			\
-		KEEP(*(SORT(___ksymtab_gpl_future+*)))			\
-		__stop___ksymtab_gpl_future = .;			\
-	}								\
-									\
 	/* Kernel symbol table: Normal symbols */			\
 	__kcrctab         : AT(ADDR(__kcrctab) - LOAD_OFFSET) {		\
 		__start___kcrctab = .;					\
@@ -530,13 +523,6 @@
 		__stop___kcrctab_unused_gpl = .;			\
 	}								\
 									\
-	/* Kernel symbol table: GPL-future-only symbols */		\
-	__kcrctab_gpl_future : AT(ADDR(__kcrctab_gpl_future) - LOAD_OFFSET) { \
-		__start___kcrctab_gpl_future = .;			\
-		KEEP(*(SORT(___kcrctab_gpl_future+*)))			\
-		__stop___kcrctab_gpl_future = .;			\
-	}								\
-									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
 		*(__ksymtab_strings)					\
diff --git a/include/linux/export.h b/include/linux/export.h
index fceb5e85571711..362b64f8d4a7c2 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -157,7 +157,6 @@ struct kernel_symbol {
 
 #define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym)		_EXPORT_SYMBOL(sym, "_gpl")
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)	_EXPORT_SYMBOL(sym, "_gpl_future")
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", #ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "_gpl", #ns)
 
diff --git a/include/linux/module.h b/include/linux/module.h
index da0f5966ee80c9..e6e50ee3041238 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -411,11 +411,6 @@ struct module {
 
 	bool async_probe_requested;
 
-	/* symbols that will be GPL-only in the near future. */
-	const struct kernel_symbol *gpl_future_syms;
-	const s32 *gpl_future_crcs;
-	unsigned int num_gpl_future_syms;
-
 	/* Exception table */
 	unsigned int num_exentries;
 	struct exception_table_entry *extable;
diff --git a/kernel/module.c b/kernel/module.c
index 7a4bce8507b96f..c987e2f42e1ad5 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -408,11 +408,8 @@ extern const struct kernel_symbol __start___ksymtab[];
 extern const struct kernel_symbol __stop___ksymtab[];
 extern const struct kernel_symbol __start___ksymtab_gpl[];
 extern const struct kernel_symbol __stop___ksymtab_gpl[];
-extern const struct kernel_symbol __start___ksymtab_gpl_future[];
-extern const struct kernel_symbol __stop___ksymtab_gpl_future[];
 extern const s32 __start___kcrctab[];
 extern const s32 __start___kcrctab_gpl[];
-extern const s32 __start___kcrctab_gpl_future[];
 #ifdef CONFIG_UNUSED_SYMBOLS
 extern const struct kernel_symbol __start___ksymtab_unused[];
 extern const struct kernel_symbol __stop___ksymtab_unused[];
@@ -434,7 +431,6 @@ struct symsearch {
 	enum mod_license {
 		NOT_GPL_ONLY,
 		GPL_ONLY,
-		WILL_BE_GPL_ONLY,
 	} license;
 	bool unused;
 };
@@ -458,15 +454,8 @@ static bool check_exported_symbol(const struct symsearch *syms,
 {
 	struct find_symbol_arg *fsa = data;
 
-	if (!fsa->gplok) {
-		if (syms->license == GPL_ONLY)
-			return false;
-		if (syms->license == WILL_BE_GPL_ONLY && fsa->warn) {
-			pr_warn("Symbol %s is being used by a non-GPL module, "
-				"which will not be allowed in the future\n",
-				fsa->name);
-		}
-	}
+	if (!fsa->gplok && syms->license == GPL_ONLY)
+		return false;
 
 #ifdef CONFIG_UNUSED_SYMBOLS
 	if (syms->unused && fsa->warn) {
@@ -550,9 +539,6 @@ static bool find_symbol(struct find_symbol_arg *fsa)
 		{ __start___ksymtab_gpl, __stop___ksymtab_gpl,
 		  __start___kcrctab_gpl,
 		  GPL_ONLY, false },
-		{ __start___ksymtab_gpl_future, __stop___ksymtab_gpl_future,
-		  __start___kcrctab_gpl_future,
-		  WILL_BE_GPL_ONLY, false },
 #ifdef CONFIG_UNUSED_SYMBOLS
 		{ __start___ksymtab_unused, __stop___ksymtab_unused,
 		  __start___kcrctab_unused,
@@ -579,10 +565,6 @@ static bool find_symbol(struct find_symbol_arg *fsa)
 			{ mod->gpl_syms, mod->gpl_syms + mod->num_gpl_syms,
 			  mod->gpl_crcs,
 			  GPL_ONLY, false },
-			{ mod->gpl_future_syms,
-			  mod->gpl_future_syms + mod->num_gpl_future_syms,
-			  mod->gpl_future_crcs,
-			  WILL_BE_GPL_ONLY, false },
 #ifdef CONFIG_UNUSED_SYMBOLS
 			{ mod->unused_syms,
 			  mod->unused_syms + mod->num_unused_syms,
@@ -2292,7 +2274,6 @@ static int verify_exported_symbols(struct module *mod)
 	} arr[] = {
 		{ mod->syms, mod->num_syms },
 		{ mod->gpl_syms, mod->num_gpl_syms },
-		{ mod->gpl_future_syms, mod->num_gpl_future_syms },
 #ifdef CONFIG_UNUSED_SYMBOLS
 		{ mod->unused_syms, mod->num_unused_syms },
 		{ mod->unused_gpl_syms, mod->num_unused_gpl_syms },
@@ -3210,11 +3191,6 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 				     sizeof(*mod->gpl_syms),
 				     &mod->num_gpl_syms);
 	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
-	mod->gpl_future_syms = section_objs(info,
-					    "__ksymtab_gpl_future",
-					    sizeof(*mod->gpl_future_syms),
-					    &mod->num_gpl_future_syms);
-	mod->gpl_future_crcs = section_addr(info, "__kcrctab_gpl_future");
 
 #ifdef CONFIG_UNUSED_SYMBOLS
 	mod->unused_syms = section_objs(info, "__ksymtab_unused",
@@ -3408,7 +3384,6 @@ static int check_module_license_and_versions(struct module *mod)
 #ifdef CONFIG_MODVERSIONS
 	if ((mod->num_syms && !mod->crcs)
 	    || (mod->num_gpl_syms && !mod->gpl_crcs)
-	    || (mod->num_gpl_future_syms && !mod->gpl_future_crcs)
 #ifdef CONFIG_UNUSED_SYMBOLS
 	    || (mod->num_unused_syms && !mod->unused_crcs)
 	    || (mod->num_unused_gpl_syms && !mod->unused_gpl_crcs)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d6c81657d69550..25c1446055d16b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -44,7 +44,7 @@ static bool error_occurred;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
-	export_unused_gpl, export_gpl_future, export_unknown
+	export_unused_gpl, export_unknown
 };
 
 /* In kernel, this size is defined in linux/module.h;
@@ -304,7 +304,6 @@ static const struct {
 	{ .str = "EXPORT_UNUSED_SYMBOL",     .export = export_unused },
 	{ .str = "EXPORT_SYMBOL_GPL",        .export = export_gpl },
 	{ .str = "EXPORT_UNUSED_SYMBOL_GPL", .export = export_unused_gpl },
-	{ .str = "EXPORT_SYMBOL_GPL_FUTURE", .export = export_gpl_future },
 	{ .str = "(unknown)",                .export = export_unknown },
 };
 
@@ -369,8 +368,6 @@ static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
 		return export_gpl;
 	else if (strstarts(secname, "___ksymtab_unused_gpl+"))
 		return export_unused_gpl;
-	else if (strstarts(secname, "___ksymtab_gpl_future+"))
-		return export_gpl_future;
 	else
 		return export_unknown;
 }
@@ -385,8 +382,6 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 		return export_gpl;
 	else if (sec == elf->export_unused_gpl_sec)
 		return export_unused_gpl;
-	else if (sec == elf->export_gpl_future_sec)
-		return export_gpl_future;
 	else
 		return export_unknown;
 }
@@ -596,8 +591,6 @@ static int parse_elf(struct elf_info *info, const char *filename)
 			info->export_gpl_sec = i;
 		else if (strcmp(secname, "__ksymtab_unused_gpl") == 0)
 			info->export_unused_gpl_sec = i;
-		else if (strcmp(secname, "__ksymtab_gpl_future") == 0)
-			info->export_gpl_future_sec = i;
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB) {
 			unsigned int sh_link_idx;
@@ -2152,10 +2145,6 @@ static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
 		error("GPL-incompatible module %s.ko uses GPL-only symbol marked UNUSED '%s'\n",
 		      m, s);
 		break;
-	case export_gpl_future:
-		warn("GPL-incompatible module %s.ko uses future GPL-only symbol '%s'\n",
-		     m, s);
-		break;
 	case export_plain:
 	case export_unused:
 	case export_unknown:
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index e6f46eee0af02f..834220de002bd1 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -142,7 +142,6 @@ struct elf_info {
 	Elf_Section  export_unused_sec;
 	Elf_Section  export_gpl_sec;
 	Elf_Section  export_unused_gpl_sec;
-	Elf_Section  export_gpl_future_sec;
 	char         *strtab;
 	char	     *modinfo;
 	unsigned int modinfo_len;
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 69b9b71a6a4731..d82b452e8a7168 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -13,12 +13,10 @@ SECTIONS {
 	__ksymtab_gpl		0 : { *(SORT(___ksymtab_gpl+*)) }
 	__ksymtab_unused	0 : { *(SORT(___ksymtab_unused+*)) }
 	__ksymtab_unused_gpl	0 : { *(SORT(___ksymtab_unused_gpl+*)) }
-	__ksymtab_gpl_future	0 : { *(SORT(___ksymtab_gpl_future+*)) }
 	__kcrctab		0 : { *(SORT(___kcrctab+*)) }
 	__kcrctab_gpl		0 : { *(SORT(___kcrctab_gpl+*)) }
 	__kcrctab_unused	0 : { *(SORT(___kcrctab_unused+*)) }
 	__kcrctab_unused_gpl	0 : { *(SORT(___kcrctab_unused_gpl+*)) }
-	__kcrctab_gpl_future	0 : { *(SORT(___kcrctab_gpl_future+*)) }
 
 	.init_array		0 : ALIGN(8) { *(SORT(.init_array.*)) *(.init_array) }
 
diff --git a/tools/include/linux/export.h b/tools/include/linux/export.h
index d07e586b9ba0ec..9f61349a8944e1 100644
--- a/tools/include/linux/export.h
+++ b/tools/include/linux/export.h
@@ -3,7 +3,6 @@
 
 #define EXPORT_SYMBOL(sym)
 #define EXPORT_SYMBOL_GPL(sym)
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)
 #define EXPORT_UNUSED_SYMBOL(sym)
 #define EXPORT_UNUSED_SYMBOL_GPL(sym)
 
-- 
2.29.2

