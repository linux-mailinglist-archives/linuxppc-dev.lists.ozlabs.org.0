Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A5513AC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 19:21:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kq2V243lyz3bjq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 03:21:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ftbs1Os8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ftbs1Os8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq2Sg4wQrz3bd7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 03:20:35 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SGxWeP030289;
 Thu, 28 Apr 2022 17:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=Jwa4moR6BWyGRuOue7Ud8oyoihx8z0cUHqqqDRl+rpY=;
 b=Ftbs1Os8xmFvSYSmoEzapWyWvkiD+0vv6bJFt3zJ0V4xjrvMsJJa3wt4J0voXWYZ4SIC
 Hy6V/36GHB+gUylyE5bI9tar3P/N4x6eZwQ9cGgb2Hako+bA8FBX7dAFkcaTGqAg1YZi
 uYiweDnKnPwpzEFqXzodPJqrcDjusJB90fmptgFowoNusZCiMyCGSSYd+qMQfe0BMJCA
 SGNOhD4BROIuWFSDxGjGh+ttnEXu2Zq3sczQfURz0uwyTYpnWnKGQ11Va8DuVkd7w+xr
 N74ErhRt2nNDYy1D8JxojCW02qhhDxcRoBZUjp0SrSPzSx6clbCLe6BvzG59d5Ja7li3 GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtvwynt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:23 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23SH0KVI000309;
 Thu, 28 Apr 2022 17:20:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtvwyns9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23SHCkLr011629;
 Thu, 28 Apr 2022 17:20:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3fm938x72w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23SH7BlU48234892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 17:07:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A776A404D;
 Thu, 28 Apr 2022 17:20:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3963CA4055;
 Thu, 28 Apr 2022 17:20:15 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.8.21])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 17:20:14 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 2/2] ftrace: recordmcount: Handle sections with no non-weak
 symbols
Date: Thu, 28 Apr 2022 22:49:52 +0530
Message-Id: <126aca34935cf1c7168e17970c706e36577094e7.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sT1q0yISHPTrNKW59VPaw-E8t99qOugQ
X-Proofpoint-GUID: aJIjRObShvYJVkoOHz_KSCXz8msFaLOz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_02,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280103
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel builds on powerpc are failing with the below error [1]:
      CC      kernel/kexec_file.o
    Cannot find symbol for section 9: .text.unlikely.
    kernel/kexec_file.o: failed

Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
symbols") [2], binutils started dropping section symbols that it thought
were unused.  This isn't an issue in general, but with kexec_file.c, gcc
is placing kexec_arch_apply_relocations[_add] into a separate
.text.unlikely section and the section symbol ".text.unlikely" is being
dropped. Due to this, recordmcount is unable to find a non-weak symbol
in .text.unlikely to generate a relocation record against.

Handle this by falling back to a weak symbol, similar to what objtool
does in commit 44f6a7c0755d8d ("objtool: Fix seg fault with Clang
non-section symbols"). This approach however can result in duplicate
and/or invalid addresses in the final vmlinux mcount location table.

As an example, with this commit, relocation records for __mcount_loc for
kexec_file.o now include two entries with the weak functions
arch_kexec_apply_relocations() and arch_kexec_apply_relocation_add() as
the relocation bases:

  ...
  0000000000000080 R_PPC64_ADDR64    .text+0x0000000000001d34
  0000000000000088 R_PPC64_ADDR64    .text+0x0000000000001fec
  0000000000000090 R_PPC64_ADDR64    arch_kexec_apply_relocations_add+0x000000000000000c
  0000000000000098 R_PPC64_ADDR64    arch_kexec_apply_relocations+0x000000000000000c

Powerpc does not override these functions today, so these get converted
to correct offsets in the mcount location table in vmlinux.

If one or both of these weak functions are overridden in future, in the
final vmlinux mcount table, references to these will change over to the
non-weak variant which has its own mcount location entry. As such, there
will now be two entries for these functions.

On ppc32, mcount location is always the third instruction in a function.
On ppc64 with elf abi v2 (ppc64le), mcount location depends on whether
the function has a global entry (fourth instruction) or not (second
instruction), but this is expected to be the same across weak/non-weak
implementations of a function. As such, in both these scenarios, as well
as with other architectures where mcount location is at the same offset
into a function, the two mcount entries will point to the same address.
Ftrace skips the duplicate entries due to a previous commit.

But, with ppc64 elf abi v1 which only supports the old -pg flag, mcount
location can differ between the weak and non-weak variants of a
function. In such scenarios, one of the two mcount entries will be
invalid. Such architectures need to validate mcount locations by
ensuring that the instruction(s) at those locations are as expected. On
powerpc, this can be a simple check to ensure that the instruction is a
'bl'. This check can be further tightened as necessary.

Introduce a config option HAVE_MCOUNT_LOC_VALIDATION that architectures
can select to indicate support for validating the mcount locations
during ftrace initialization. Add a flag (-a) to recordmcount which can
then be passed to allow recordmcount to emit relocation records using
weak symbols as the base.

[1] https://github.com/linuxppc/issues/issues/388
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 Makefile                           |  4 ++
 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/ftrace.h  |  8 +--
 arch/powerpc/kernel/trace/ftrace.c | 11 ++++
 kernel/trace/Kconfig               |  6 ++
 scripts/Makefile.build             |  3 +
 scripts/recordmcount.c             |  6 +-
 scripts/recordmcount.h             | 94 ++++++++++++++++++++++++++----
 8 files changed, 113 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 29e273d3f8ccbf..b2a9fdb49815fb 100644
--- a/Makefile
+++ b/Makefile
@@ -858,6 +858,10 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
     BUILD_C_RECORDMCOUNT := y
     export BUILD_C_RECORDMCOUNT
   endif
+  ifdef CONFIG_HAVE_MCOUNT_LOC_VALIDATION
+    HAVE_MCOUNT_LOC_VALIDATION := y
+    export HAVE_MCOUNT_LOC_VALIDATION
+  endif
 endif
 ifdef CONFIG_HAVE_FENTRY
   # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa11..acae4085aa6d6b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -229,6 +229,7 @@ config PPC
 	select HAVE_KRETPROBES
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
+	select HAVE_MCOUNT_LOC_VALIDATION
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index d83758acd1c7c3..d8b104ed2fdf38 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -12,13 +12,7 @@
 
 #ifndef __ASSEMBLY__
 extern void _mcount(void);
-
-static inline unsigned long ftrace_call_adjust(unsigned long addr)
-{
-       /* relocation of mcount call site is the same as the address */
-       return addr;
-}
-
+unsigned long ftrace_call_adjust(unsigned long addr);
 unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 				    unsigned long sp);
 
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 4ee04aacf9f13c..976c08cd0573f7 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -858,6 +858,17 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
+unsigned long ftrace_call_adjust(unsigned long addr)
+{
+	ppc_inst_t op = ppc_inst_read((u32 *)addr);
+
+	if (!is_bl_op(op))
+		return 0;
+
+	/* relocation of mcount call site is the same as the address */
+	return addr;
+}
+
 #ifdef CONFIG_PPC64
 #define PACATOC offsetof(struct paca_struct, kernel_toc)
 
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 2c43e327a619f7..f1704c764fa66a 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -81,6 +81,12 @@ config HAVE_C_RECORDMCOUNT
 	help
 	  C version of recordmcount available?
 
+config HAVE_MCOUNT_LOC_VALIDATION
+	bool
+	help
+	  Arch validates mcount locations and can cope with invalid entries
+	  in the mcount table.
+
 config HAVE_BUILDTIME_MCOUNT_SORT
        bool
        help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9717e6f6fb3149..4401103991fd5c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -199,6 +199,9 @@ ifdef BUILD_C_RECORDMCOUNT
 ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
   RECORDMCOUNT_FLAGS = -w
 endif
+ifdef HAVE_MCOUNT_LOC_VALIDATION
+  RECORDMCOUNT_FLAGS += -a
+endif
 # Due to recursion, we must skip empty.o.
 # The empty.o file is created in the make process in order to determine
 # the target endianness and word size. It is made before all other C
diff --git a/scripts/recordmcount.c b/scripts/recordmcount.c
index cce12e1971d853..30308109446e86 100644
--- a/scripts/recordmcount.c
+++ b/scripts/recordmcount.c
@@ -50,6 +50,7 @@ static char gpfx;	/* prefix for global symbol name (sometimes '_') */
 static struct stat sb;	/* Remember .st_size, etc. */
 static const char *altmcount;	/* alternate mcount symbol name */
 static int warn_on_notrace_sect; /* warn when section has mcount not being recorded */
+static int allow_weak_sym_rel; /* allow relocations using weak symbols */
 static void *file_map;	/* pointer of the mapped file */
 static void *file_end;	/* pointer to the end of the mapped file */
 static int file_updated; /* flag to state file was changed */
@@ -631,8 +632,11 @@ int main(int argc, char *argv[])
 	int c;
 	int i;
 
-	while ((c = getopt(argc, argv, "w")) >= 0) {
+	while ((c = getopt(argc, argv, "aw")) >= 0) {
 		switch (c) {
+		case 'a':
+			allow_weak_sym_rel = 1;
+			break;
 		case 'w':
 			warn_on_notrace_sect = 1;
 			break;
diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index 1e9baa5c4fc6ef..c3817b3679e601 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -25,6 +25,7 @@
 #undef sift_rel_mcount
 #undef nop_mcount
 #undef find_secsym_ndx
+#undef find_sym_ndx
 #undef __has_rel_mcount
 #undef has_rel_mcount
 #undef tot_relsize
@@ -60,6 +61,7 @@
 # define sift_rel_mcount	sift64_rel_mcount
 # define nop_mcount		nop_mcount_64
 # define find_secsym_ndx	find64_secsym_ndx
+# define find_sym_ndx		find64_sym_ndx
 # define __has_rel_mcount	__has64_rel_mcount
 # define has_rel_mcount		has64_rel_mcount
 # define tot_relsize		tot64_relsize
@@ -98,6 +100,7 @@
 # define sift_rel_mcount	sift32_rel_mcount
 # define nop_mcount		nop_mcount_32
 # define find_secsym_ndx	find32_secsym_ndx
+# define find_sym_ndx		find32_sym_ndx
 # define __has_rel_mcount	__has32_rel_mcount
 # define has_rel_mcount		has32_rel_mcount
 # define tot_relsize		tot32_relsize
@@ -392,6 +395,51 @@ static void get_sym_str_and_relp(Elf_Shdr const *const relhdr,
 	*relp = rel0;
 }
 
+/*
+ * Find a symbol in the given section containing the instruction offset passed
+ * in r_offset, to be used in generating the relocation record for the mcount
+ * location. This is used if there were no local/global symbols in the given
+ * section to be used as the base. Weak symbols are ok, and are expected to
+ * result in duplicate mcount locations which get dropped by ftrace.
+ */
+static int find_sym_ndx(unsigned const txtndx,
+			 char const *const txtname,
+			 uint_t *const recvalp,
+			 unsigned int *sym_index,
+			 Elf_Shdr const *const symhdr,
+			 Elf32_Word const *symtab,
+			 Elf32_Word const *symtab_shndx,
+			 unsigned const r_offset,
+			 Elf_Ehdr const *const ehdr)
+{
+	Elf_Sym const *const sym0 = (Elf_Sym const *)(_w(symhdr->sh_offset)
+		+ (void *)ehdr);
+	unsigned const nsym = _w(symhdr->sh_size) / _w(symhdr->sh_entsize);
+	Elf_Sym const *symp;
+	unsigned t;
+
+	for (symp = sym0, t = nsym; t; --t, ++symp) {
+		if (txtndx == get_symindex(symp, symtab, symtab_shndx)) {
+			/* function symbols on ARM have quirks, avoid them */
+			if (w2(ehdr->e_machine) == EM_ARM &&
+			    ELF_ST_TYPE(symp->st_info) == STT_FUNC)
+				continue;
+
+			if (r_offset >= _w(symp->st_value) &&
+			    r_offset < _w(symp->st_value) + _w(symp->st_size)) {
+				*recvalp = _w(symp->st_value);
+				*sym_index = symp - sym0;
+				return 0;
+			}
+		}
+	}
+
+	fprintf(stderr, "Cannot find symbol containing offset %u for section %u: %s.\n",
+		r_offset, txtndx, txtname);
+
+	return -1;
+}
+
 /*
  * Look at the relocations in order to find the calls to mcount.
  * Accumulate the section offsets that are found, and their relocation info,
@@ -402,9 +450,14 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
 			       Elf_Rel **const mrelpp,
 			       Elf_Shdr const *const relhdr,
 			       Elf_Ehdr const *const ehdr,
-			       unsigned const recsym,
-			       uint_t const recval,
-			       unsigned const reltype)
+			       unsigned recsym,
+			       uint_t recval,
+			       unsigned const reltype,
+			       unsigned int no_secsym,
+			       char const *const txtname,
+			       Elf_Shdr const *const shdr0,
+			       Elf32_Word const *symtab,
+			       Elf32_Word const *symtab_shndx)
 {
 	uint_t *const mloc0 = mlocp;
 	Elf_Rel *mrelp = *mrelpp;
@@ -415,6 +468,7 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
 	unsigned const nrel = _w(relhdr->sh_size) / rel_entsize;
 	unsigned mcountsym = 0;
 	unsigned t;
+	uint_t addend;
 
 	get_sym_str_and_relp(relhdr, ehdr, &sym0, &str0, &relp);
 
@@ -424,8 +478,13 @@ static uint_t *sift_rel_mcount(uint_t *mlocp,
 
 		if (mcountsym && mcountsym == Elf_r_sym(relp) &&
 				!is_fake_mcount(relp)) {
-			uint_t const addend =
-				_w(_w(relp->r_offset) - recval + mcount_adjust);
+			if (no_secsym && find_sym_ndx(w(relhdr->sh_info),
+						      txtname, &recval, &recsym,
+						      &shdr0[w(relhdr->sh_link)],
+						      symtab, symtab_shndx,
+						      _w(relp->r_offset), ehdr))
+				return 0;
+			addend = _w(_w(relp->r_offset) - recval + mcount_adjust);
 			mrelp->r_offset = _w(offbase
 				+ ((void *)mlocp - (void *)mloc0));
 			Elf_r_info(mrelp, recsym, reltype);
@@ -544,8 +603,9 @@ static int find_secsym_ndx(unsigned const txtndx,
 			return 0;
 		}
 	}
-	fprintf(stderr, "Cannot find symbol for section %u: %s.\n",
-		txtndx, txtname);
+	if (!allow_weak_sym_rel)
+		fprintf(stderr, "Cannot find symbol for section %u: %s.\n",
+			txtndx, txtname);
 	return -1;
 }
 
@@ -660,22 +720,32 @@ static int do_func(Elf_Ehdr *const ehdr, char const *const fname,
 			goto out; /* Nothing to be done; don't append! */
 		}
 		if (txtname && is_mcounted_section_name(txtname)) {
-			unsigned int recsym;
+			unsigned int recsym = 0, no_secsym = 0;
 			uint_t recval = 0;
 
 			symsec_sh_link = w(relhdr->sh_link);
-			result = find_secsym_ndx(w(relhdr->sh_info), txtname,
+			if (find_secsym_ndx(w(relhdr->sh_info), txtname,
 						&recval, &recsym,
 						&shdr0[symsec_sh_link],
 						symtab, symtab_shndx,
-						ehdr);
-			if (result)
+						ehdr))
+				no_secsym = 1;
+
+			if (no_secsym && !allow_weak_sym_rel) {
+				result = -1;
 				goto out;
+			}
 
 			rel_entsize = _w(relhdr->sh_entsize);
 			mlocp = sift_rel_mcount(mlocp,
 				(void *)mlocp - (void *)mloc0, &mrelp,
-				relhdr, ehdr, recsym, recval, reltype);
+				relhdr, ehdr, recsym, recval, reltype,
+				no_secsym, txtname, shdr0, symtab,
+				symtab_shndx);
+			if (!mlocp) {
+				result = -1;
+				goto out;
+			}
 		} else if (txtname && (warn_on_notrace_sect || make_nop)) {
 			/*
 			 * This section is ignored by ftrace, but still
-- 
2.35.1

