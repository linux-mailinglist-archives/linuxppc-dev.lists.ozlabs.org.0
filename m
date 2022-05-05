Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1A51B902
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:29:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv51w2HnDz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:29:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=mzdwuZ8S;
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
 header.s=dec2015msa header.b=mzdwuZ8S; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv4wb6g8mz3bqk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:25:19 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 2457Nenq019426;
 Thu, 5 May 2022 16:23:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2457Nenq019426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651735430;
 bh=T5cNjDt3m8DqLCL49zCb2tssnSiEUZVqbUsRPkELhE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mzdwuZ8SMenyQEqZdUPL4Y2oV0NTtyJY5A1Cu8fLeIAK3Qzgkm2r0KVLn1CwwB5Ju
 wbUKQJEcP0fk9oARePC5LL2PzrONlGpYMngoFaY6qr3W97uwMc3uVdT7g5j4gMBqJk
 EyFOvFFby2vstnR6B8G6azh11aox+iWcJPa1+2vFpFcexEvW4ZhSoEdcuQULgy3Czu
 9HVpmcr3wBSqGAZYH9Wh/0H7kh/tHmuhDvA2aD8lCQn+ozFJl1SsN4k0Yx8AuS65e9
 3I5r98ke7t2xbN7u7mK2ctxgDzFqgQOOu0+NSjrskOXjgJAAUzTH9McEszdsOFFh2X
 qJ5WwzAqODWZw==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v3 08/15] kbuild: link symbol CRCs at final link,
 removing CONFIG_MODULE_REL_CRCS
Date: Thu,  5 May 2022 16:22:37 +0900
Message-Id: <20220505072244.1155033-9-masahiroy@kernel.org>
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

include/{linux,asm-generic}/export.h defines a weak symbol, __crc_*
as a placeholder.

Genksyms writes the version CRCs into the linker script, which will be
used for filling the __crc_* symbols. The linker script format depends
on CONFIG_MODULE_REL_CRCS. If it is enabled, __crc_* holds the offset
to the reference of CRC.

We are ready to get rid of this complexity.

Now that modpost parses text files (.*.cmd) to collect all the CRCs,
it can generate C code that will be linked to the vmlinux or modules.

Generate a new C file, .vmlinux-symver.c, which contains the CRCs of
symbols exported by vmlinux. It is compiled and linked to vmlinux in
scripts/link-vmlinux.sh.

Put the CRCs of symbols exported by modules into the existing *.mod.c
files. No additional build step is needed for modules. As usual,
*.mod.c are compiled and linked to *.ko in scripts/Makefile.modfinal.

Please note we no longer use the linker magic. The new C implementation
works in the same way, whether CONFIG_RELOCATABLE is enabled or not.
CONFIG_MODULE_REL_CRCS is no longer needed.

Previously, Kbuild invoked additional $(LD) to update the CRCs in
objects, but this step is unneeded too.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - New patch

 arch/powerpc/Kconfig         |  1 -
 arch/s390/Kconfig            |  1 -
 arch/um/Kconfig              |  1 -
 include/asm-generic/export.h | 22 ++++++++--------------
 include/linux/export.h       | 30 ++++++++----------------------
 include/linux/symversion.h   | 13 +++++++++++++
 init/Kconfig                 |  4 ----
 kernel/module.c              | 10 +---------
 scripts/Makefile.build       | 27 ++++-----------------------
 scripts/genksyms/genksyms.c  | 17 ++++-------------
 scripts/link-vmlinux.sh      | 20 +++++++++++++-------
 scripts/mod/modpost.c        | 31 +++++++++++++++++++++++++++----
 12 files changed, 78 insertions(+), 99 deletions(-)
 create mode 100644 include/linux/symversion.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..a4e8dd889e29 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -566,7 +566,6 @@ config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
 	select NONSTATIC_KERNEL
-	select MODULE_REL_CRCS if MODVERSIONS
 	help
 	  This builds a kernel image that is capable of running at the
 	  location the kernel is loaded at. For ppc32, there is no any
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 77b5a03de13a..aa5848004c76 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -567,7 +567,6 @@ endchoice
 
 config RELOCATABLE
 	bool "Build a relocatable kernel"
-	select MODULE_REL_CRCS if MODVERSIONS
 	default y
 	help
 	  This builds a kernel image that retains relocation information
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 4d398b80aea8..e8983d098e73 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -106,7 +106,6 @@ config LD_SCRIPT_DYN
 	bool
 	default y
 	depends on !LD_SCRIPT_STATIC
-	select MODULE_REL_CRCS if MODVERSIONS
 
 config LD_SCRIPT_DYN_RPATH
 	bool "set rpath in the binary" if EXPERT
diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
index 07a36a874dca..51ce72ce80fa 100644
--- a/include/asm-generic/export.h
+++ b/include/asm-generic/export.h
@@ -2,6 +2,14 @@
 #ifndef __ASM_GENERIC_EXPORT_H
 #define __ASM_GENERIC_EXPORT_H
 
+/*
+ * This comment block is used by fixdep. Please do not remove.
+ *
+ * When CONFIG_MODVERSIONS is changed from n to y, all source files having
+ * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
+ * side effect of the .o build rule.
+ */
+
 #ifndef KSYM_FUNC
 #define KSYM_FUNC(x) x
 #endif
@@ -12,9 +20,6 @@
 #else
 #define KSYM_ALIGN 4
 #endif
-#ifndef KCRC_ALIGN
-#define KCRC_ALIGN 4
-#endif
 
 .macro __put, val, name
 #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
@@ -43,17 +48,6 @@ __ksymtab_\name:
 __kstrtab_\name:
 	.asciz "\name"
 	.previous
-#ifdef CONFIG_MODVERSIONS
-	.section ___kcrctab\sec+\name,"a"
-	.balign KCRC_ALIGN
-#if defined(CONFIG_MODULE_REL_CRCS)
-	.long __crc_\name - .
-#else
-	.long __crc_\name
-#endif
-	.weak __crc_\name
-	.previous
-#endif
 #endif
 .endm
 
diff --git a/include/linux/export.h b/include/linux/export.h
index 27d848712b90..6c8e24e723bd 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -11,6 +11,14 @@
  * hackers place grumpy comments in header files.
  */
 
+/*
+ * This comment block is used by fixdep. Please do not remove.
+ *
+ * When CONFIG_MODVERSIONS is changed from n to y, all source files having
+ * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
+ * side effect of the .o build rule.
+ */
+
 #ifndef __ASSEMBLY__
 #ifdef MODULE
 extern struct module __this_module;
@@ -19,26 +27,6 @@ extern struct module __this_module;
 #define THIS_MODULE ((struct module *)0)
 #endif
 
-#ifdef CONFIG_MODVERSIONS
-/* Mark the CRC weak since genksyms apparently decides not to
- * generate a checksums for some symbols */
-#if defined(CONFIG_MODULE_REL_CRCS)
-#define __CRC_SYMBOL(sym, sec)						\
-	asm("	.section \"___kcrctab" sec "+" #sym "\", \"a\"	\n"	\
-	    "	.weak	__crc_" #sym "				\n"	\
-	    "	.long	__crc_" #sym " - .			\n"	\
-	    "	.previous					\n")
-#else
-#define __CRC_SYMBOL(sym, sec)						\
-	asm("	.section \"___kcrctab" sec "+" #sym "\", \"a\"	\n"	\
-	    "	.weak	__crc_" #sym "				\n"	\
-	    "	.long	__crc_" #sym "				\n"	\
-	    "	.previous					\n")
-#endif
-#else
-#define __CRC_SYMBOL(sym, sec)
-#endif
-
 #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
 #include <linux/compiler.h>
 /*
@@ -85,7 +73,6 @@ struct kernel_symbol {
 /*
  * For every exported symbol, do the following:
  *
- * - If applicable, place a CRC entry in the __kcrctab section.
  * - Put the name of the symbol and namespace (empty string "" for none) in
  *   __ksymtab_strings.
  * - Place a struct kernel_symbol entry in the __ksymtab section.
@@ -98,7 +85,6 @@ struct kernel_symbol {
 	extern typeof(sym) sym;							\
 	extern const char __kstrtab_##sym[];					\
 	extern const char __kstrtabns_##sym[];					\
-	__CRC_SYMBOL(sym, sec);							\
 	asm("	.section \"__ksymtab_strings\",\"aMS\",%progbits,1	\n"	\
 	    "__kstrtab_" #sym ":					\n"	\
 	    "	.asciz 	\"" #sym "\"					\n"	\
diff --git a/include/linux/symversion.h b/include/linux/symversion.h
new file mode 100644
index 000000000000..09971145710a
--- /dev/null
+++ b/include/linux/symversion.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* This header is used by C files generated by modpost. */
+
+#ifndef __LINUX_SYMVERSION_H__
+#define __LINUX_SYMVERSION_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+#define SYMBOL_CRC(sym, crc, sec)   \
+	u32 __section("___kcrctab" sec "+" #sym) __crc_##sym = crc
+
+#endif /* __LINUX_SYMVERSION_H__ */
diff --git a/init/Kconfig b/init/Kconfig
index ddcbefe535e9..f5b14318dfcb 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2136,10 +2136,6 @@ config ASM_MODVERSIONS
 	  assembly. This can be enabled only when the target architecture
 	  supports it.
 
-config MODULE_REL_CRCS
-	bool
-	depends on MODVERSIONS
-
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/kernel/module.c b/kernel/module.c
index 6cea788fd965..c9e2342da28e 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1231,11 +1231,6 @@ static int try_to_force_load(struct module *mod, const char *reason)
 
 #ifdef CONFIG_MODVERSIONS
 
-static u32 resolve_rel_crc(const s32 *crc)
-{
-	return *(u32 *)((void *)crc + *crc);
-}
-
 static int check_version(const struct load_info *info,
 			 const char *symname,
 			 struct module *mod,
@@ -1264,10 +1259,7 @@ static int check_version(const struct load_info *info,
 		if (strcmp(versions[i].name, symname) != 0)
 			continue;
 
-		if (IS_ENABLED(CONFIG_MODULE_REL_CRCS))
-			crcval = resolve_rel_crc(crc);
-		else
-			crcval = *crc;
+		crcval = *crc;
 		if (versions[i].crc == crcval)
 			return 1;
 		pr_debug("Found checksum %X vs module %lX\n",
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a1023868775f..ddd9080fc028 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -128,7 +128,6 @@ $(obj)/%.i: $(src)/%.c FORCE
 
 genksyms = scripts/genksyms/genksyms		\
 	$(if $(1), -T $(2))			\
-	$(if $(CONFIG_MODULE_REL_CRCS), -R)	\
 	$(if $(KBUILD_PRESERVE), -p)		\
 	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
 
@@ -162,19 +161,11 @@ ifdef CONFIG_MODVERSIONS
 # o if <file>.o doesn't contain a __ksymtab version, i.e. does
 #   not export symbols, it's done.
 # o otherwise, we calculate symbol versions using the good old
-#   genksyms on the preprocessed source and postprocess them in a way
-#   that they are usable as a linker script
-# o generate .tmp_<file>.o from <file>.o using the linker to
-#   replace the unresolved symbols __crc_exported_symbol with
-#   the actual value of the checksum generated by genksyms
-# o remove .tmp_<file>.o to <file>.o
+#   genksyms on the preprocessed source and dump them into the .cmd file.
+# o modpost will extract versions from that file and create *.c files that will
+#   be compiled and linked to the kernel and/or modules.
 
-# Generate .o.symversions files for each .o with exported symbols, and link these
-# to the kernel and/or modules at the end.
-
-genksyms_format_rel_crc := [^_]*__crc_\([^ ]*\) = \.; LONG(\([^)]*\)).*
-genksyms_format_normal := __crc_\(.*\) = \(.*\);
-genksyms_format := $(if $(CONFIG_MODULE_REL_CRCS),$(genksyms_format_rel_crc),$(genksyms_format_normal))
+genksyms_format := __crc_\(.*\) = \(.*\);
 
 gen_symversions =								\
 	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
@@ -188,12 +179,6 @@ gen_symversions =								\
 
 cmd_gen_symversions_c =	$(call gen_symversions,c)
 
-cmd_modversions =								\
-	if [ -r $@.symversions ]; then						\
-		$(LD) $(KBUILD_LDFLAGS) -r -o $(@D)/.tmp_$(@F) $@ 		\
-			-T $@.symversions;					\
-		mv -f $(@D)/.tmp_$(@F) $@;					\
-	fi
 endif
 
 ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
@@ -273,7 +258,6 @@ define rule_cc_o_c
 	$(call cmd,checkdoc)
 	$(call cmd,gen_objtooldep)
 	$(call cmd,gen_symversions_c)
-	$(if $(CONFIG_LTO_CLANG),,$(call cmd,modversions))
 	$(call cmd,record_mcount)
 endef
 
@@ -282,7 +266,6 @@ define rule_as_o_S
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,gen_objtooldep)
 	$(call cmd,gen_symversions_S)
-	$(call cmd,modversions)
 endef
 
 # Built-in and composite module parts
@@ -296,8 +279,6 @@ ifneq ($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT),)
 quiet_cmd_cc_prelink_modules = LD [M]  $@
       cmd_cc_prelink_modules =						\
 	$(LD) $(ld_flags) -r -o $@					\
-               $(shell [ -s $(@:.prelink.o=.o.symversions) ] &&		\
-                       echo -T $(@:.prelink.o=.o.symversions))		\
 		--whole-archive $(filter-out FORCE,$^)			\
 		$(cmd_objtool)
 
diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 4827c5abe5b7..6e6933ae7911 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -33,7 +33,7 @@ char *cur_filename;
 int in_source_file;
 
 static int flag_debug, flag_dump_defs, flag_reference, flag_dump_types,
-	   flag_preserve, flag_warnings, flag_rel_crcs;
+	   flag_preserve, flag_warnings;
 
 static int errors;
 static int nsyms;
@@ -681,10 +681,7 @@ void export_symbol(const char *name)
 			fputs(">\n", debugfile);
 
 		/* Used as a linker script. */
-		printf(!flag_rel_crcs ? "__crc_%s = 0x%08lx;\n" :
-		       "SECTIONS { .rodata : ALIGN(4) { "
-		       "__crc_%s = .; LONG(0x%08lx); } }\n",
-		       name, crc);
+		printf("__crc_%s = 0x%08lx;\n", name, crc);
 	}
 }
 
@@ -733,7 +730,6 @@ static void genksyms_usage(void)
 	      "  -q, --quiet           Disable warnings (default)\n"
 	      "  -h, --help            Print this message\n"
 	      "  -V, --version         Print the release version\n"
-	      "  -R, --relative-crc    Emit section relative symbol CRCs\n"
 #else				/* __GNU_LIBRARY__ */
 	      "  -s                    Select symbol prefix\n"
 	      "  -d                    Increment the debug level (repeatable)\n"
@@ -745,7 +741,6 @@ static void genksyms_usage(void)
 	      "  -q                    Disable warnings (default)\n"
 	      "  -h                    Print this message\n"
 	      "  -V                    Print the release version\n"
-	      "  -R                    Emit section relative symbol CRCs\n"
 #endif				/* __GNU_LIBRARY__ */
 	      , stderr);
 }
@@ -766,14 +761,13 @@ int main(int argc, char **argv)
 		{"preserve", 0, 0, 'p'},
 		{"version", 0, 0, 'V'},
 		{"help", 0, 0, 'h'},
-		{"relative-crc", 0, 0, 'R'},
 		{0, 0, 0, 0}
 	};
 
-	while ((o = getopt_long(argc, argv, "s:dwqVDr:T:phR",
+	while ((o = getopt_long(argc, argv, "s:dwqVDr:T:ph",
 				&long_opts[0], NULL)) != EOF)
 #else				/* __GNU_LIBRARY__ */
-	while ((o = getopt(argc, argv, "s:dwqVDr:T:phR")) != EOF)
+	while ((o = getopt(argc, argv, "s:dwqVDr:T:ph")) != EOF)
 #endif				/* __GNU_LIBRARY__ */
 		switch (o) {
 		case 'd':
@@ -813,9 +807,6 @@ int main(int argc, char **argv)
 		case 'h':
 			genksyms_usage();
 			return 0;
-		case 'R':
-			flag_rel_crcs = 1;
-			break;
 		default:
 			genksyms_usage();
 			return 1;
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index eceb3ee7ec06..2742b7dd089a 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -88,11 +88,6 @@ modpost_link()
 		gen_initcalls
 		lds="-T .tmp_initcalls.lds"
 
-		if is_enabled CONFIG_MODVERSIONS; then
-			gen_symversions
-			lds="${lds} -T .tmp_symversions.lds"
-		fi
-
 		# This might take a while, so indicate that we're doing
 		# an LTO link
 		info LTO ${1}
@@ -277,7 +272,7 @@ kallsyms_step()
 	kallsymso=${kallsyms_vmlinux}.o
 	kallsyms_S=${kallsyms_vmlinux}.S
 
-	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
+	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${vmlinux_symver_o} ${btf_vmlinux_bin_o}
 	kallsyms ${kallsyms_vmlinux} ${kallsyms_S}
 
 	info AS ${kallsyms_S}
@@ -312,6 +307,7 @@ cleanup()
 	rm -f vmlinux.o
 	rm -f .vmlinux.d
 	rm -f .vmlinux.objs
+	rm -f .vmlinux-symver.c
 }
 
 # Use "make V=1" to debug this script
@@ -373,6 +369,16 @@ if is_enabled CONFIG_DEBUG_INFO_BTF; then
 	fi
 fi
 
+vmlinux_symver_o=
+if is_enabled CONFIG_MODVERSIONS; then
+	vmlinux_symver_o=.vmlinux-symver.o
+	info CC ${vmlinux_symver_o}
+	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} \
+		${KBUILD_CPPFLAGS} ${KBUILD_CFLAGS} \
+		${KBUILD_CFLAGS_KERNEL} ${CFLAGS_KERNEL} \
+		-c -o ${vmlinux_symver_o} ${vmlinux_symver_o%.o}.c
+fi
+
 kallsymso=""
 kallsymso_prev=""
 kallsyms_vmlinux=""
@@ -413,7 +419,7 @@ if is_enabled CONFIG_KALLSYMS; then
 	fi
 fi
 
-vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
+vmlinux_link vmlinux "${kallsymso}" ${vmlinux_symver_o} ${btf_vmlinux_bin_o}
 
 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 92ee1f454e29..be7d8adc5d31 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2276,20 +2276,30 @@ static void add_header(struct buffer *b, struct module *mod)
 		buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
 }
 
-static void check_symversions(struct module *mod)
+/* Record CRCs for exported symbols */
+static void add_exported_symversions(struct buffer *buf, struct module *mod)
 {
 	struct symbol *sym;
 
 	if (!modversions)
 		return;
 
+	buf_printf(buf,
+		   "\n"
+		   "#include <linux/symversion.h>\n"
+		   "\n");
+
 	list_for_each_entry(sym, &mod->exported_symbols, list) {
 		if (!sym->crc_valid) {
 			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
 			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
 			     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
 			     sym->name);
+			continue;
 		}
+
+		buf_printf(buf, "SYMBOL_CRC(%s, 0x%08x, \"%s\");\n",
+			   sym->name, sym->crc, sym->is_gpl_only ? "_gpl" : "");
 	}
 }
 
@@ -2426,6 +2436,18 @@ static void write_if_changed(struct buffer *b, const char *fname)
 	write_buf(b, fname);
 }
 
+static void write_vmlinux_symver_c_file(struct module *mod)
+{
+	struct buffer buf = { };
+
+	if (!modversions)
+		return;
+
+	add_exported_symversions(&buf, mod);
+	write_if_changed(&buf, ".vmlinux-symver.c");
+	free(buf.p);
+}
+
 /* do sanity checks, and generate *.mod.c file */
 static void write_mod_c_file(struct module *mod)
 {
@@ -2437,6 +2459,7 @@ static void write_mod_c_file(struct module *mod)
 	check_exports(mod);
 
 	add_header(&buf, mod);
+	add_exported_symversions(&buf, mod);
 	add_versions(&buf, mod);
 	add_depends(&buf, mod);
 	add_moddevtable(&buf, mod);
@@ -2633,9 +2656,9 @@ int main(int argc, char **argv)
 		if (mod->from_dump)
 			continue;
 
-		check_symversions(mod);
-
-		if (!mod->is_vmlinux)
+		if (mod->is_vmlinux)
+			write_vmlinux_symver_c_file(mod);
+		else
 			write_mod_c_file(mod);
 	}
 
-- 
2.32.0

