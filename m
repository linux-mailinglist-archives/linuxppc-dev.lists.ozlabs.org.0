Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B3307E50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 19:44:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRTs702qzzDrqC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 05:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+81cfe4b7420194b52767+6367+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=TzumpdSp; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRTF35XD4zDrgb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 05:16:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5XGCjqaepDsSHzoKunVw8nEmIPNDn9YH/EE2yXzpf+Q=; b=TzumpdSpHv48sefecCfpsUQGjc
 LIuGdVJiLQ06AClxNPAClkwT+HaT6TPzIDZJEqGN6VIATJQq7pgF6X/dR09Lpy2iv8o47Ot3wa6Yc
 YGY8CSEHKTsIK3g/t1xbn8Nc8+HQRnwczpFhEkCPYAn66XnSuaGSK/NQHMLJbyXhn8YJXWFYqO03b
 8BUyxdVQz82ev+SJS9zzWi6pfkjrmhITjrH+WrZAJyby62r9J8bOcuncs+IqbYsOfUfEjYKBjcFqG
 3HvjiAp0J9S361rJQIpEssycm8ZUOSWpSChSSTnxTdXwCFONjA0rSNsSpWj9ApRGOhH4yuDUPVPz1
 FtHwn0Aw==;
Received: from [2001:4bb8:198:6bf4:e052:196b:7e32:37d9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l5Bpg-008o2B-JE; Thu, 28 Jan 2021 18:15:53 +0000
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
Subject: [PATCH 13/13] module: remove EXPORT_UNUSED_SYMBOL*
Date: Thu, 28 Jan 2021 19:14:21 +0100
Message-Id: <20210128181421.2279-14-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128181421.2279-1-hch@lst.de>
References: <20210128181421.2279-1-hch@lst.de>
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

EXPORT_UNUSED_SYMBOL* is not actually used anywhere.  Remove the
unused functionality as we generally just remove unused code anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/configs/bcm2835_defconfig          |  1 -
 arch/arm/configs/mxs_defconfig              |  1 -
 arch/mips/configs/nlm_xlp_defconfig         |  1 -
 arch/mips/configs/nlm_xlr_defconfig         |  1 -
 arch/parisc/configs/generic-32bit_defconfig |  1 -
 arch/parisc/configs/generic-64bit_defconfig |  1 -
 arch/powerpc/configs/ppc6xx_defconfig       |  1 -
 arch/s390/configs/debug_defconfig           |  1 -
 arch/s390/configs/defconfig                 |  1 -
 arch/sh/configs/edosk7760_defconfig         |  1 -
 arch/sh/configs/sdk7780_defconfig           |  1 -
 arch/x86/configs/i386_defconfig             |  1 -
 arch/x86/configs/x86_64_defconfig           |  1 -
 arch/x86/tools/relocs.c                     |  4 +-
 include/asm-generic/vmlinux.lds.h           | 28 --------
 include/linux/export.h                      |  8 ---
 include/linux/module.h                      | 12 ----
 init/Kconfig                                | 17 -----
 kernel/module.c                             | 71 ++-------------------
 scripts/checkpatch.pl                       |  6 +-
 scripts/mod/modpost.c                       | 39 +----------
 scripts/mod/modpost.h                       |  2 -
 scripts/module.lds.S                        |  4 --
 tools/include/linux/export.h                |  2 -
 24 files changed, 13 insertions(+), 193 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index 44ff9cd88d8161..d6c6c2e031c43a 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -177,7 +177,6 @@ CONFIG_BOOT_PRINTK_DELAY=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO=y
 # CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_LOCKUP_DETECTOR=y
 CONFIG_SCHED_TRACER=y
diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index a9c6f32a9b1c9d..ca32446b187f5d 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -164,7 +164,6 @@ CONFIG_FONTS=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_FRAME_WARN=2048
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
diff --git a/arch/mips/configs/nlm_xlp_defconfig b/arch/mips/configs/nlm_xlp_defconfig
index 72a211d2d556fd..32c29061172325 100644
--- a/arch/mips/configs/nlm_xlp_defconfig
+++ b/arch/mips/configs/nlm_xlp_defconfig
@@ -549,7 +549,6 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_FRAME_WARN=1024
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_SCHEDSTATS=y
diff --git a/arch/mips/configs/nlm_xlr_defconfig b/arch/mips/configs/nlm_xlr_defconfig
index 4ecb157e56d427..bf9b9244929ecd 100644
--- a/arch/mips/configs/nlm_xlr_defconfig
+++ b/arch/mips/configs/nlm_xlr_defconfig
@@ -500,7 +500,6 @@ CONFIG_CRC7=m
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 # CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_SCHEDSTATS=y
diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 3cbcfad5f7249d..7611d48c599e01 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -22,7 +22,6 @@ CONFIG_PCI_LBA=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_UNUSED_SYMBOLS=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
index 8f81fcbf04c413..53054b81461a10 100644
--- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -31,7 +31,6 @@ CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_BLK_DEV_INTEGRITY=y
 CONFIG_BINFMT_MISC=m
 # CONFIG_COMPACTION is not set
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index ef09f3cce1fa85..34c3859040f9f7 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -1072,7 +1072,6 @@ CONFIG_NLS_ISO8859_15=m
 CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_DEBUG_INFO=y
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_HEADERS_INSTALL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index c4f6ff98a612cd..58e54d17e3154b 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -71,7 +71,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_MODULE_SIG_SHA256=y
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_BLK_DEV_INTEGRITY=y
 CONFIG_BLK_DEV_THROTTLING=y
 CONFIG_BLK_WBT=y
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 51135893cffe34..b5e62c0d3e23e0 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -66,7 +66,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_MODULE_SIG_SHA256=y
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_BLK_DEV_THROTTLING=y
 CONFIG_BLK_WBT=y
 CONFIG_BLK_CGROUP_IOLATENCY=y
diff --git a/arch/sh/configs/edosk7760_defconfig b/arch/sh/configs/edosk7760_defconfig
index 02ba622985769d..d77f54e906fd04 100644
--- a/arch/sh/configs/edosk7760_defconfig
+++ b/arch/sh/configs/edosk7760_defconfig
@@ -102,7 +102,6 @@ CONFIG_NLS_UTF8=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_SHIRQ=y
 CONFIG_DETECT_HUNG_TASK=y
diff --git a/arch/sh/configs/sdk7780_defconfig b/arch/sh/configs/sdk7780_defconfig
index d00376eb044f8a..6c719ab4332ac9 100644
--- a/arch/sh/configs/sdk7780_defconfig
+++ b/arch/sh/configs/sdk7780_defconfig
@@ -128,7 +128,6 @@ CONFIG_NLS_ISO8859_15=y
 CONFIG_NLS_UTF8=y
 # CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_UNUSED_SYMBOLS=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DETECT_HUNG_TASK=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index 78210793d357cf..9c9c4a888b1dbf 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -50,7 +50,6 @@ CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_UNUSED_SYMBOLS is not set
 CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index 9936528e19393a..b60bd2d8603499 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -48,7 +48,6 @@ CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_UNUSED_SYMBOLS is not set
 CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 0d210d0e83e241..b9c577a3cacca6 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -61,8 +61,8 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"(__iommu_table|__apicdrivers|__smp_locks)(|_end)|"
 	"__(start|end)_pci_.*|"
 	"__(start|end)_builtin_fw|"
-	"__(start|stop)___ksymtab(|_gpl|_unused|_unused_gpl)|"
-	"__(start|stop)___kcrctab(|_gpl|_unused|_unused_gpl)|"
+	"__(start|stop)___ksymtab(|_gpl)|"
+	"__(start|stop)___kcrctab(|_gpl)|"
 	"__(start|stop)___param|"
 	"__(start|stop)___modver|"
 	"__(start|stop)___bug_table|"
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 83243506e68b00..1fa338ac6a5477 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -481,20 +481,6 @@
 		__stop___ksymtab_gpl = .;				\
 	}								\
 									\
-	/* Kernel symbol table: Normal unused symbols */		\
-	__ksymtab_unused  : AT(ADDR(__ksymtab_unused) - LOAD_OFFSET) {	\
-		__start___ksymtab_unused = .;				\
-		KEEP(*(SORT(___ksymtab_unused+*)))			\
-		__stop___ksymtab_unused = .;				\
-	}								\
-									\
-	/* Kernel symbol table: GPL-only unused symbols */		\
-	__ksymtab_unused_gpl : AT(ADDR(__ksymtab_unused_gpl) - LOAD_OFFSET) { \
-		__start___ksymtab_unused_gpl = .;			\
-		KEEP(*(SORT(___ksymtab_unused_gpl+*)))			\
-		__stop___ksymtab_unused_gpl = .;			\
-	}								\
-									\
 	/* Kernel symbol table: Normal symbols */			\
 	__kcrctab         : AT(ADDR(__kcrctab) - LOAD_OFFSET) {		\
 		__start___kcrctab = .;					\
@@ -509,20 +495,6 @@
 		__stop___kcrctab_gpl = .;				\
 	}								\
 									\
-	/* Kernel symbol table: Normal unused symbols */		\
-	__kcrctab_unused  : AT(ADDR(__kcrctab_unused) - LOAD_OFFSET) {	\
-		__start___kcrctab_unused = .;				\
-		KEEP(*(SORT(___kcrctab_unused+*)))			\
-		__stop___kcrctab_unused = .;				\
-	}								\
-									\
-	/* Kernel symbol table: GPL-only unused symbols */		\
-	__kcrctab_unused_gpl : AT(ADDR(__kcrctab_unused_gpl) - LOAD_OFFSET) { \
-		__start___kcrctab_unused_gpl = .;			\
-		KEEP(*(SORT(___kcrctab_unused_gpl+*)))			\
-		__stop___kcrctab_unused_gpl = .;			\
-	}								\
-									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
 		*(__ksymtab_strings)					\
diff --git a/include/linux/export.h b/include/linux/export.h
index 362b64f8d4a7c2..6271a5d9c988fa 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -160,14 +160,6 @@ struct kernel_symbol {
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", #ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "_gpl", #ns)
 
-#ifdef CONFIG_UNUSED_SYMBOLS
-#define EXPORT_UNUSED_SYMBOL(sym)	_EXPORT_SYMBOL(sym, "_unused")
-#define EXPORT_UNUSED_SYMBOL_GPL(sym)	_EXPORT_SYMBOL(sym, "_unused_gpl")
-#else
-#define EXPORT_UNUSED_SYMBOL(sym)
-#define EXPORT_UNUSED_SYMBOL_GPL(sym)
-#endif
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _LINUX_EXPORT_H */
diff --git a/include/linux/module.h b/include/linux/module.h
index e6e50ee3041238..59f094fa6f7441 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -392,18 +392,6 @@ struct module {
 	const s32 *gpl_crcs;
 	bool using_gplonly_symbols;
 
-#ifdef CONFIG_UNUSED_SYMBOLS
-	/* unused exported symbols. */
-	const struct kernel_symbol *unused_syms;
-	const s32 *unused_crcs;
-	unsigned int num_unused_syms;
-
-	/* GPL-only, unused exported symbols. */
-	unsigned int num_unused_gpl_syms;
-	const struct kernel_symbol *unused_gpl_syms;
-	const s32 *unused_gpl_crcs;
-#endif
-
 #ifdef CONFIG_MODULE_SIG
 	/* Signature was verified. */
 	bool sig_ok;
diff --git a/init/Kconfig b/init/Kconfig
index b77c60f8b963d4..11b803b45c1995 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2262,25 +2262,8 @@ config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
 
 	  If unsure, say N.
 
-config UNUSED_SYMBOLS
-	bool "Enable unused/obsolete exported symbols"
-	default y if X86
-	help
-	  Unused but exported symbols make the kernel needlessly bigger.  For
-	  that reason most of these unused exports will soon be removed.  This
-	  option is provided temporarily to provide a transition period in case
-	  some external kernel module needs one of these symbols anyway. If you
-	  encounter such a case in your module, consider if you are actually
-	  using the right API.  (rationale: since nobody in the kernel is using
-	  this in a module, there is a pretty good chance it's actually the
-	  wrong interface to use).  If you really need the symbol, please send a
-	  mail to the linux kernel mailing list mentioning the symbol and why
-	  you really need it, and what the merge plan to the mainline kernel for
-	  your module is.
-
 config TRIM_UNUSED_KSYMS
 	bool "Trim unused exported kernel symbols"
-	depends on !UNUSED_SYMBOLS
 	help
 	  The kernel and some modules make many symbols available for
 	  other modules to use via EXPORT_SYMBOL() and variants. Depending
diff --git a/kernel/module.c b/kernel/module.c
index 492b6fa5a662c8..f8b831edb69b12 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -415,14 +415,6 @@ extern const struct kernel_symbol __start___ksymtab_gpl[];
 extern const struct kernel_symbol __stop___ksymtab_gpl[];
 extern const s32 __start___kcrctab[];
 extern const s32 __start___kcrctab_gpl[];
-#ifdef CONFIG_UNUSED_SYMBOLS
-extern const struct kernel_symbol __start___ksymtab_unused[];
-extern const struct kernel_symbol __stop___ksymtab_unused[];
-extern const struct kernel_symbol __start___ksymtab_unused_gpl[];
-extern const struct kernel_symbol __stop___ksymtab_unused_gpl[];
-extern const s32 __start___kcrctab_unused[];
-extern const s32 __start___kcrctab_unused_gpl[];
-#endif
 
 #ifndef CONFIG_MODVERSIONS
 #define symversion(base, idx) NULL
@@ -437,7 +429,6 @@ struct symsearch {
 		NOT_GPL_ONLY,
 		GPL_ONLY,
 	} license;
-	bool unused;
 };
 
 struct find_symbol_arg {
@@ -461,19 +452,6 @@ static bool check_exported_symbol(const struct symsearch *syms,
 
 	if (!fsa->gplok && syms->license == GPL_ONLY)
 		return false;
-
-#ifdef CONFIG_UNUSED_SYMBOLS
-	if (syms->unused && fsa->warn) {
-		pr_warn("Symbol %s is marked as UNUSED, however this module is "
-			"using it.\n", fsa->name);
-		pr_warn("This symbol will go away in the future.\n");
-		pr_warn("Please evaluate if this is the right api to use and "
-			"if it really is, submit a report to the linux kernel "
-			"mailing list together with submitting your code for "
-			"inclusion.\n");
-	}
-#endif
-
 	fsa->owner = owner;
 	fsa->crc = symversion(syms->crcs, symnum);
 	fsa->sym = &syms->start[symnum];
@@ -540,18 +518,10 @@ static bool find_symbol(struct find_symbol_arg *fsa)
 {
 	static const struct symsearch arr[] = {
 		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
-		  NOT_GPL_ONLY, false },
+		  NOT_GPL_ONLY },
 		{ __start___ksymtab_gpl, __stop___ksymtab_gpl,
 		  __start___kcrctab_gpl,
-		  GPL_ONLY, false },
-#ifdef CONFIG_UNUSED_SYMBOLS
-		{ __start___ksymtab_unused, __stop___ksymtab_unused,
-		  __start___kcrctab_unused,
-		  NOT_GPL_ONLY, true },
-		{ __start___ksymtab_unused_gpl, __stop___ksymtab_unused_gpl,
-		  __start___kcrctab_unused_gpl,
-		  GPL_ONLY, true },
-#endif
+		  GPL_ONLY },
 	};
 	struct module *mod;
 	unsigned int i;
@@ -566,20 +536,10 @@ static bool find_symbol(struct find_symbol_arg *fsa)
 				lockdep_is_held(&module_mutex)) {
 		struct symsearch arr[] = {
 			{ mod->syms, mod->syms + mod->num_syms, mod->crcs,
-			  NOT_GPL_ONLY, false },
+			  NOT_GPL_ONLY },
 			{ mod->gpl_syms, mod->gpl_syms + mod->num_gpl_syms,
 			  mod->gpl_crcs,
-			  GPL_ONLY, false },
-#ifdef CONFIG_UNUSED_SYMBOLS
-			{ mod->unused_syms,
-			  mod->unused_syms + mod->num_unused_syms,
-			  mod->unused_crcs,
-			  NOT_GPL_ONLY, true },
-			{ mod->unused_gpl_syms,
-			  mod->unused_gpl_syms + mod->num_unused_gpl_syms,
-			  mod->unused_gpl_crcs,
-			  GPL_ONLY, true },
-#endif
+			  GPL_ONLY },
 		};
 
 		if (mod->state == MODULE_STATE_UNFORMED)
@@ -2279,10 +2239,6 @@ static int verify_exported_symbols(struct module *mod)
 	} arr[] = {
 		{ mod->syms, mod->num_syms },
 		{ mod->gpl_syms, mod->num_gpl_syms },
-#ifdef CONFIG_UNUSED_SYMBOLS
-		{ mod->unused_syms, mod->num_unused_syms },
-		{ mod->unused_gpl_syms, mod->num_unused_gpl_syms },
-#endif
 	};
 
 	for (i = 0; i < ARRAY_SIZE(arr); i++) {
@@ -3197,16 +3153,6 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 				     &mod->num_gpl_syms);
 	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
 
-#ifdef CONFIG_UNUSED_SYMBOLS
-	mod->unused_syms = section_objs(info, "__ksymtab_unused",
-					sizeof(*mod->unused_syms),
-					&mod->num_unused_syms);
-	mod->unused_crcs = section_addr(info, "__kcrctab_unused");
-	mod->unused_gpl_syms = section_objs(info, "__ksymtab_unused_gpl",
-					    sizeof(*mod->unused_gpl_syms),
-					    &mod->num_unused_gpl_syms);
-	mod->unused_gpl_crcs = section_addr(info, "__kcrctab_unused_gpl");
-#endif
 #ifdef CONFIG_CONSTRUCTORS
 	mod->ctors = section_objs(info, ".ctors",
 				  sizeof(*mod->ctors), &mod->num_ctors);
@@ -3387,13 +3333,8 @@ static int check_module_license_and_versions(struct module *mod)
 		pr_warn("%s: module license taints kernel.\n", mod->name);
 
 #ifdef CONFIG_MODVERSIONS
-	if ((mod->num_syms && !mod->crcs)
-	    || (mod->num_gpl_syms && !mod->gpl_crcs)
-#ifdef CONFIG_UNUSED_SYMBOLS
-	    || (mod->num_unused_syms && !mod->unused_crcs)
-	    || (mod->num_unused_gpl_syms && !mod->unused_gpl_crcs)
-#endif
-		) {
+	if ((mod->num_syms && !mod->crcs) ||
+	    (mod->num_gpl_syms && !mod->gpl_crcs)) {
 		return try_to_force_load(mod,
 					 "no versions for exported symbols");
 	}
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92e888ed939f98..eabd2d5467b156 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4290,8 +4290,7 @@ sub process {
 		if (defined $realline_next &&
 		    exists $lines[$realline_next - 1] &&
 		    !defined $suppress_export{$realline_next} &&
-		    ($lines[$realline_next - 1] =~ /EXPORT_SYMBOL.*\((.*)\)/ ||
-		     $lines[$realline_next - 1] =~ /EXPORT_UNUSED_SYMBOL.*\((.*)\)/)) {
+		    ($lines[$realline_next - 1] =~ /EXPORT_SYMBOL.*\((.*)\)/)) {
 			# Handle definitions which produce identifiers with
 			# a prefix:
 			#   XXX(foo);
@@ -4318,8 +4317,7 @@ sub process {
 		}
 		if (!defined $suppress_export{$linenr} &&
 		    $prevline =~ /^.\s*$/ &&
-		    ($line =~ /EXPORT_SYMBOL.*\((.*)\)/ ||
-		     $line =~ /EXPORT_UNUSED_SYMBOL.*\((.*)\)/)) {
+		    ($line =~ /EXPORT_SYMBOL.*\((.*)\)/)) {
 #print "FOO B <$lines[$linenr - 1]>\n";
 			$suppress_export{$linenr} = 2;
 		}
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 25c1446055d16b..20fc57837881ab 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -43,8 +43,9 @@ static int allow_missing_ns_imports;
 static bool error_occurred;
 
 enum export {
-	export_plain,      export_unused,     export_gpl,
-	export_unused_gpl, export_unknown
+	export_plain,
+	export_gpl,
+	export_unknown
 };
 
 /* In kernel, this size is defined in linux/module.h;
@@ -301,9 +302,7 @@ static const struct {
 	enum export export;
 } export_list[] = {
 	{ .str = "EXPORT_SYMBOL",            .export = export_plain },
-	{ .str = "EXPORT_UNUSED_SYMBOL",     .export = export_unused },
 	{ .str = "EXPORT_SYMBOL_GPL",        .export = export_gpl },
-	{ .str = "EXPORT_UNUSED_SYMBOL_GPL", .export = export_unused_gpl },
 	{ .str = "(unknown)",                .export = export_unknown },
 };
 
@@ -362,12 +361,8 @@ static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
 
 	if (strstarts(secname, "___ksymtab+"))
 		return export_plain;
-	else if (strstarts(secname, "___ksymtab_unused+"))
-		return export_unused;
 	else if (strstarts(secname, "___ksymtab_gpl+"))
 		return export_gpl;
-	else if (strstarts(secname, "___ksymtab_unused_gpl+"))
-		return export_unused_gpl;
 	else
 		return export_unknown;
 }
@@ -376,12 +371,8 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 {
 	if (sec == elf->export_sec)
 		return export_plain;
-	else if (sec == elf->export_unused_sec)
-		return export_unused;
 	else if (sec == elf->export_gpl_sec)
 		return export_gpl;
-	else if (sec == elf->export_unused_gpl_sec)
-		return export_unused_gpl;
 	else
 		return export_unknown;
 }
@@ -585,12 +576,8 @@ static int parse_elf(struct elf_info *info, const char *filename)
 			info->modinfo_len = sechdrs[i].sh_size;
 		} else if (strcmp(secname, "__ksymtab") == 0)
 			info->export_sec = i;
-		else if (strcmp(secname, "__ksymtab_unused") == 0)
-			info->export_unused_sec = i;
 		else if (strcmp(secname, "__ksymtab_gpl") == 0)
 			info->export_gpl_sec = i;
-		else if (strcmp(secname, "__ksymtab_unused_gpl") == 0)
-			info->export_unused_gpl_sec = i;
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB) {
 			unsigned int sh_link_idx;
@@ -2141,32 +2128,13 @@ static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
 		error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
 		      m, s);
 		break;
-	case export_unused_gpl:
-		error("GPL-incompatible module %s.ko uses GPL-only symbol marked UNUSED '%s'\n",
-		      m, s);
-		break;
 	case export_plain:
-	case export_unused:
 	case export_unknown:
 		/* ignore */
 		break;
 	}
 }
 
-static void check_for_unused(enum export exp, const char *m, const char *s)
-{
-	switch (exp) {
-	case export_unused:
-	case export_unused_gpl:
-		warn("module %s.ko uses symbol '%s' marked UNUSED\n",
-		     m, s);
-		break;
-	default:
-		/* ignore */
-		break;
-	}
-}
-
 static void check_exports(struct module *mod)
 {
 	struct symbol *s, *exp;
@@ -2197,7 +2165,6 @@ static void check_exports(struct module *mod)
 
 		if (!mod->gpl_compatible)
 			check_for_gpl_usage(exp->export, basename, exp->name);
-		check_for_unused(exp->export, basename, exp->name);
 	}
 }
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 834220de002bd1..0c47ff95c0e227 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -139,9 +139,7 @@ struct elf_info {
 	Elf_Sym      *symtab_start;
 	Elf_Sym      *symtab_stop;
 	Elf_Section  export_sec;
-	Elf_Section  export_unused_sec;
 	Elf_Section  export_gpl_sec;
-	Elf_Section  export_unused_gpl_sec;
 	char         *strtab;
 	char	     *modinfo;
 	unsigned int modinfo_len;
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index d82b452e8a7168..24e8af579ce378 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -11,12 +11,8 @@ SECTIONS {
 
 	__ksymtab		0 : { *(SORT(___ksymtab+*)) }
 	__ksymtab_gpl		0 : { *(SORT(___ksymtab_gpl+*)) }
-	__ksymtab_unused	0 : { *(SORT(___ksymtab_unused+*)) }
-	__ksymtab_unused_gpl	0 : { *(SORT(___ksymtab_unused_gpl+*)) }
 	__kcrctab		0 : { *(SORT(___kcrctab+*)) }
 	__kcrctab_gpl		0 : { *(SORT(___kcrctab_gpl+*)) }
-	__kcrctab_unused	0 : { *(SORT(___kcrctab_unused+*)) }
-	__kcrctab_unused_gpl	0 : { *(SORT(___kcrctab_unused_gpl+*)) }
 
 	.init_array		0 : ALIGN(8) { *(SORT(.init_array.*)) *(.init_array) }
 
diff --git a/tools/include/linux/export.h b/tools/include/linux/export.h
index 9f61349a8944e1..acb6f4daa2f0b4 100644
--- a/tools/include/linux/export.h
+++ b/tools/include/linux/export.h
@@ -3,7 +3,5 @@
 
 #define EXPORT_SYMBOL(sym)
 #define EXPORT_SYMBOL_GPL(sym)
-#define EXPORT_UNUSED_SYMBOL(sym)
-#define EXPORT_UNUSED_SYMBOL_GPL(sym)
 
 #endif
-- 
2.29.2

