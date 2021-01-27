Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C09305D93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 14:52:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQlQs164MzDqjv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 00:52:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jeyu@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oMEQhTvG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQlMx02XtzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 00:49:48 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33261207A3;
 Wed, 27 Jan 2021 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611755386;
 bh=24kau5dRxNvNkOJxfzZ0cHryerwzFFv0aEway+hPzJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oMEQhTvGgFb516J1ynVDH68s1bM6PW9bB7Crgw2gra4DFSIBeyHNfLsM227UBHxso
 xvHiYDiqVqj838JGX7Kv3b25oLXqTSCBwKDu67BYwKWt8wuzBNflZMpHtFpST57z8x
 YMF5SSMDoxf728i4nQgG4JhYFMdA3pZF4bVyEwMpGdY2564k3MZoIG8v1w0vYbjznr
 k5ZWbJaff5rJOqpUfaFSzfHsc1Njb7Wp9W7Er49xImkmn2Um9cZ60JWRH7ROQlrjHO
 FmEvZgvDBrp1P+gX7idKIN0DlOS+lf+gPe6BKEDWOZb4yFOCTUHvx6PPnkyXK5qfMS
 vajLS/4k4ayWg==
Date: Wed, 27 Jan 2021 14:49:38 +0100
From: Jessica Yu <jeyu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/13] module: remove EXPORY_UNUSED_SYMBOL*
Message-ID: <YBFvcmUiHRjkucbf@gunter>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-14-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210121074959.313333-14-hch@lst.de>
X-OS: Linux gunter 5.10.7-1-default x86_64
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+++ Christoph Hellwig [21/01/21 08:49 +0100]:
>EXPORT_UNUSED_SYMBOL* is not actually used anywhere.  Remove the
>unused functionality as we generally just remove unused code anyway.
>
>Signed-off-by: Christoph Hellwig <hch@lst.de>
>---
> arch/arm/configs/bcm2835_defconfig          |  1 -
> arch/arm/configs/mxs_defconfig              |  1 -
> arch/mips/configs/nlm_xlp_defconfig         |  1 -
> arch/mips/configs/nlm_xlr_defconfig         |  1 -
> arch/parisc/configs/generic-32bit_defconfig |  1 -
> arch/parisc/configs/generic-64bit_defconfig |  1 -
> arch/powerpc/configs/ppc6xx_defconfig       |  1 -
> arch/s390/configs/debug_defconfig           |  1 -
> arch/s390/configs/defconfig                 |  1 -
> arch/sh/configs/edosk7760_defconfig         |  1 -
> arch/sh/configs/sdk7780_defconfig           |  1 -
> arch/x86/configs/i386_defconfig             |  1 -
> arch/x86/configs/x86_64_defconfig           |  1 -
> arch/x86/tools/relocs.c                     |  4 +-
> include/asm-generic/vmlinux.lds.h           | 28 ---------
> include/linux/export.h                      |  8 ---
> include/linux/module.h                      | 13 ----
> init/Kconfig                                | 17 -----
> kernel/module.c                             | 69 ++-------------------
> scripts/checkpatch.pl                       |  6 +-
> scripts/mod/modpost.c                       | 39 +-----------
> scripts/mod/modpost.h                       |  2 -
> scripts/module.lds.S                        |  4 --
> tools/include/linux/export.h                |  2 -
> 24 files changed, 13 insertions(+), 192 deletions(-)
>
>diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
>index 44ff9cd88d8161..d6c6c2e031c43a 100644
>--- a/arch/arm/configs/bcm2835_defconfig
>+++ b/arch/arm/configs/bcm2835_defconfig
>@@ -177,7 +177,6 @@ CONFIG_BOOT_PRINTK_DELAY=y
> CONFIG_DYNAMIC_DEBUG=y
> CONFIG_DEBUG_INFO=y
> # CONFIG_ENABLE_MUST_CHECK is not set
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_DEBUG_MEMORY_INIT=y
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SCHED_TRACER=y
>diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
>index a9c6f32a9b1c9d..ca32446b187f5d 100644
>--- a/arch/arm/configs/mxs_defconfig
>+++ b/arch/arm/configs/mxs_defconfig
>@@ -164,7 +164,6 @@ CONFIG_FONTS=y
> CONFIG_PRINTK_TIME=y
> CONFIG_DEBUG_INFO=y
> CONFIG_FRAME_WARN=2048
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_DEBUG_KERNEL=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
>diff --git a/arch/mips/configs/nlm_xlp_defconfig b/arch/mips/configs/nlm_xlp_defconfig
>index 72a211d2d556fd..32c29061172325 100644
>--- a/arch/mips/configs/nlm_xlp_defconfig
>+++ b/arch/mips/configs/nlm_xlp_defconfig
>@@ -549,7 +549,6 @@ CONFIG_PRINTK_TIME=y
> CONFIG_DEBUG_INFO=y
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=1024
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_DEBUG_MEMORY_INIT=y
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_SCHEDSTATS=y
>diff --git a/arch/mips/configs/nlm_xlr_defconfig b/arch/mips/configs/nlm_xlr_defconfig
>index 4ecb157e56d427..bf9b9244929ecd 100644
>--- a/arch/mips/configs/nlm_xlr_defconfig
>+++ b/arch/mips/configs/nlm_xlr_defconfig
>@@ -500,7 +500,6 @@ CONFIG_CRC7=m
> CONFIG_PRINTK_TIME=y
> CONFIG_DEBUG_INFO=y
> # CONFIG_ENABLE_MUST_CHECK is not set
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_DEBUG_MEMORY_INIT=y
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_SCHEDSTATS=y
>diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
>index 3cbcfad5f7249d..7611d48c599e01 100644
>--- a/arch/parisc/configs/generic-32bit_defconfig
>+++ b/arch/parisc/configs/generic-32bit_defconfig
>@@ -22,7 +22,6 @@ CONFIG_PCI_LBA=y
> CONFIG_MODULES=y
> CONFIG_MODULE_UNLOAD=y
> CONFIG_MODULE_FORCE_UNLOAD=y
>-CONFIG_UNUSED_SYMBOLS=y
> # CONFIG_BLK_DEV_BSG is not set
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> CONFIG_BINFMT_MISC=m
>diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
>index 8f81fcbf04c413..53054b81461a10 100644
>--- a/arch/parisc/configs/generic-64bit_defconfig
>+++ b/arch/parisc/configs/generic-64bit_defconfig
>@@ -31,7 +31,6 @@ CONFIG_MODULE_FORCE_LOAD=y
> CONFIG_MODULE_UNLOAD=y
> CONFIG_MODULE_FORCE_UNLOAD=y
> CONFIG_MODVERSIONS=y
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_BLK_DEV_INTEGRITY=y
> CONFIG_BINFMT_MISC=m
> # CONFIG_COMPACTION is not set
>diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
>index ef09f3cce1fa85..34c3859040f9f7 100644
>--- a/arch/powerpc/configs/ppc6xx_defconfig
>+++ b/arch/powerpc/configs/ppc6xx_defconfig
>@@ -1072,7 +1072,6 @@ CONFIG_NLS_ISO8859_15=m
> CONFIG_NLS_KOI8_R=m
> CONFIG_NLS_KOI8_U=m
> CONFIG_DEBUG_INFO=y
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_HEADERS_INSTALL=y
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_DEBUG_KERNEL=y
>diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
>index c4f6ff98a612cd..58e54d17e3154b 100644
>--- a/arch/s390/configs/debug_defconfig
>+++ b/arch/s390/configs/debug_defconfig
>@@ -71,7 +71,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
> CONFIG_MODVERSIONS=y
> CONFIG_MODULE_SRCVERSION_ALL=y
> CONFIG_MODULE_SIG_SHA256=y
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_BLK_DEV_INTEGRITY=y
> CONFIG_BLK_DEV_THROTTLING=y
> CONFIG_BLK_WBT=y
>diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
>index 51135893cffe34..b5e62c0d3e23e0 100644
>--- a/arch/s390/configs/defconfig
>+++ b/arch/s390/configs/defconfig
>@@ -66,7 +66,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
> CONFIG_MODVERSIONS=y
> CONFIG_MODULE_SRCVERSION_ALL=y
> CONFIG_MODULE_SIG_SHA256=y
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_BLK_DEV_THROTTLING=y
> CONFIG_BLK_WBT=y
> CONFIG_BLK_CGROUP_IOLATENCY=y
>diff --git a/arch/sh/configs/edosk7760_defconfig b/arch/sh/configs/edosk7760_defconfig
>index 02ba622985769d..d77f54e906fd04 100644
>--- a/arch/sh/configs/edosk7760_defconfig
>+++ b/arch/sh/configs/edosk7760_defconfig
>@@ -102,7 +102,6 @@ CONFIG_NLS_UTF8=y
> CONFIG_PRINTK_TIME=y
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_MAGIC_SYSRQ=y
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_DEBUG_KERNEL=y
> CONFIG_DEBUG_SHIRQ=y
> CONFIG_DETECT_HUNG_TASK=y
>diff --git a/arch/sh/configs/sdk7780_defconfig b/arch/sh/configs/sdk7780_defconfig
>index d10a0414123a51..d53c4595fb2e98 100644
>--- a/arch/sh/configs/sdk7780_defconfig
>+++ b/arch/sh/configs/sdk7780_defconfig
>@@ -130,7 +130,6 @@ CONFIG_NLS_ISO8859_15=y
> CONFIG_NLS_UTF8=y
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_MAGIC_SYSRQ=y
>-CONFIG_UNUSED_SYMBOLS=y
> CONFIG_DEBUG_KERNEL=y
> CONFIG_DETECT_HUNG_TASK=y
> # CONFIG_SCHED_DEBUG is not set
>diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
>index 78210793d357cf..9c9c4a888b1dbf 100644
>--- a/arch/x86/configs/i386_defconfig
>+++ b/arch/x86/configs/i386_defconfig
>@@ -50,7 +50,6 @@ CONFIG_JUMP_LABEL=y
> CONFIG_MODULES=y
> CONFIG_MODULE_UNLOAD=y
> CONFIG_MODULE_FORCE_UNLOAD=y
>-# CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_BINFMT_MISC=y
> CONFIG_NET=y
> CONFIG_PACKET=y
>diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
>index 9936528e19393a..b60bd2d8603499 100644
>--- a/arch/x86/configs/x86_64_defconfig
>+++ b/arch/x86/configs/x86_64_defconfig
>@@ -48,7 +48,6 @@ CONFIG_JUMP_LABEL=y
> CONFIG_MODULES=y
> CONFIG_MODULE_UNLOAD=y
> CONFIG_MODULE_FORCE_UNLOAD=y
>-# CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_BINFMT_MISC=y
> CONFIG_NET=y
> CONFIG_PACKET=y
>diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
>index 0d210d0e83e241..b9c577a3cacca6 100644
>--- a/arch/x86/tools/relocs.c
>+++ b/arch/x86/tools/relocs.c
>@@ -61,8 +61,8 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
> 	"(__iommu_table|__apicdrivers|__smp_locks)(|_end)|"
> 	"__(start|end)_pci_.*|"
> 	"__(start|end)_builtin_fw|"
>-	"__(start|stop)___ksymtab(|_gpl|_unused|_unused_gpl)|"
>-	"__(start|stop)___kcrctab(|_gpl|_unused|_unused_gpl)|"
>+	"__(start|stop)___ksymtab(|_gpl)|"
>+	"__(start|stop)___kcrctab(|_gpl)|"
> 	"__(start|stop)___param|"
> 	"__(start|stop)___modver|"
> 	"__(start|stop)___bug_table|"
>diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
>index 83243506e68b00..1fa338ac6a5477 100644
>--- a/include/asm-generic/vmlinux.lds.h
>+++ b/include/asm-generic/vmlinux.lds.h
>@@ -481,20 +481,6 @@
> 		__stop___ksymtab_gpl = .;				\
> 	}								\
> 									\
>-	/* Kernel symbol table: Normal unused symbols */		\
>-	__ksymtab_unused  : AT(ADDR(__ksymtab_unused) - LOAD_OFFSET) {	\
>-		__start___ksymtab_unused = .;				\
>-		KEEP(*(SORT(___ksymtab_unused+*)))			\
>-		__stop___ksymtab_unused = .;				\
>-	}								\
>-									\
>-	/* Kernel symbol table: GPL-only unused symbols */		\
>-	__ksymtab_unused_gpl : AT(ADDR(__ksymtab_unused_gpl) - LOAD_OFFSET) { \
>-		__start___ksymtab_unused_gpl = .;			\
>-		KEEP(*(SORT(___ksymtab_unused_gpl+*)))			\
>-		__stop___ksymtab_unused_gpl = .;			\
>-	}								\
>-									\
> 	/* Kernel symbol table: Normal symbols */			\
> 	__kcrctab         : AT(ADDR(__kcrctab) - LOAD_OFFSET) {		\
> 		__start___kcrctab = .;					\
>@@ -509,20 +495,6 @@
> 		__stop___kcrctab_gpl = .;				\
> 	}								\
> 									\
>-	/* Kernel symbol table: Normal unused symbols */		\
>-	__kcrctab_unused  : AT(ADDR(__kcrctab_unused) - LOAD_OFFSET) {	\
>-		__start___kcrctab_unused = .;				\
>-		KEEP(*(SORT(___kcrctab_unused+*)))			\
>-		__stop___kcrctab_unused = .;				\
>-	}								\
>-									\
>-	/* Kernel symbol table: GPL-only unused symbols */		\
>-	__kcrctab_unused_gpl : AT(ADDR(__kcrctab_unused_gpl) - LOAD_OFFSET) { \
>-		__start___kcrctab_unused_gpl = .;			\
>-		KEEP(*(SORT(___kcrctab_unused_gpl+*)))			\
>-		__stop___kcrctab_unused_gpl = .;			\
>-	}								\
>-									\
> 	/* Kernel symbol table: strings */				\
>         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
> 		*(__ksymtab_strings)					\
>diff --git a/include/linux/export.h b/include/linux/export.h
>index 362b64f8d4a7c2..6271a5d9c988fa 100644
>--- a/include/linux/export.h
>+++ b/include/linux/export.h
>@@ -160,14 +160,6 @@ struct kernel_symbol {
> #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", #ns)
> #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "_gpl", #ns)
>
>-#ifdef CONFIG_UNUSED_SYMBOLS
>-#define EXPORT_UNUSED_SYMBOL(sym)	_EXPORT_SYMBOL(sym, "_unused")
>-#define EXPORT_UNUSED_SYMBOL_GPL(sym)	_EXPORT_SYMBOL(sym, "_unused_gpl")
>-#else
>-#define EXPORT_UNUSED_SYMBOL(sym)
>-#define EXPORT_UNUSED_SYMBOL_GPL(sym)
>-#endif
>-
> #endif /* !__ASSEMBLY__ */
>
> #endif /* _LINUX_EXPORT_H */
>diff --git a/include/linux/module.h b/include/linux/module.h
>index 8f4d577d4707c2..0e70596c9a704a 100644
>--- a/include/linux/module.h
>+++ b/include/linux/module.h
>@@ -392,18 +392,6 @@ struct module {
> 	const s32 *gpl_crcs;
> 	bool using_gplonly_symbols;
>
>-#ifdef CONFIG_UNUSED_SYMBOLS
>-	/* unused exported symbols. */
>-	const struct kernel_symbol *unused_syms;
>-	const s32 *unused_crcs;
>-	unsigned int num_unused_syms;
>-
>-	/* GPL-only, unused exported symbols. */
>-	unsigned int num_unused_gpl_syms;
>-	const struct kernel_symbol *unused_gpl_syms;
>-	const s32 *unused_gpl_crcs;
>-#endif
>-
> #ifdef CONFIG_MODULE_SIG
> 	/* Signature was verified. */
> 	bool sig_ok;
>@@ -592,7 +580,6 @@ struct symsearch {
> 		GPL_ONLY,
> 		WILL_BE_GPL_ONLY,
> 	} license;
>-	bool unused;
> };

Thanks for the cleanups. While we're here, I noticed that struct
symsearch is only used internally in kernel/module.c, so I don't think
it actually needs to be in include/linux/module.h. I don't see it used
anywhere else. We could move maybe that to kernel/module-internal.h.

