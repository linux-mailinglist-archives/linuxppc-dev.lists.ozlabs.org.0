Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7021B2E84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:45:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4969v05TmfzDqxh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 03:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4969ht61FJzDqgP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 03:36:14 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LHZHue106616
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:36:12 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30gc2xd8te-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:36:12 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 21 Apr 2020 18:36:04 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Apr 2020 18:36:01 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03LHa55960031002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 17:36:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF75011C050;
 Tue, 21 Apr 2020 17:36:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D74A11C04C;
 Tue, 21 Apr 2020 17:36:04 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.72.246])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Apr 2020 17:36:04 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] powerpc/module_64: Use special stub for _mcount() with
 -mprofile-kernel
Date: Tue, 21 Apr 2020 23:05:45 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042117-0028-0000-0000-000003FC7136
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042117-0029-0000-0000-000024C2359B
Message-Id: <8affd4298d22099bbd82544fab8185700a6222b1.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_07:2020-04-21,
 2020-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=73 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004210136
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
Cc: Qian Cai <cai@lca.pw>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit c55d7b5e64265f ("powerpc: Remove STRICT_KERNEL_RWX
incompatibility with RELOCATABLE"), powerpc kernels with
-mprofile-kernel can crash in certain scenarios with a trace like below:

    BUG: Unable to handle kernel instruction fetch (NULL pointer?)
    Faulting instruction address: 0x00000000
    Oops: Kernel access of bad area, sig: 11 [#1]
    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=256 DEBUG_PAGEALLOC NUMA PowerNV
    <snip>
    NIP [0000000000000000] 0x0
    LR [c0080000102c0048] ext4_iomap_end+0x8/0x30 [ext4]
    Call Trace:
     iomap_apply+0x20c/0x920 (unreliable)
     iomap_bmap+0xfc/0x160
     ext4_bmap+0xa4/0x180 [ext4]
     bmap+0x4c/0x80
     jbd2_journal_init_inode+0x44/0x1a0 [jbd2]
     ext4_load_journal+0x440/0x860 [ext4]
     ext4_fill_super+0x342c/0x3ab0 [ext4]
     mount_bdev+0x25c/0x290
     ext4_mount+0x28/0x50 [ext4]
     legacy_get_tree+0x4c/0xb0
     vfs_get_tree+0x4c/0x130
     do_mount+0xa18/0xc50
     sys_mount+0x158/0x180
     system_call+0x5c/0x68

The NIP points to NULL, or a random location (data even), while the LR
always points to the LEP of a function (with an offset of 8), indicating
that something went wrong with ftrace. However, ftrace is not
necessarily active when such crashes occur.

The kernel OOPS sometimes follows a warning from ftrace indicating that
some module functions could not be patched with a nop. Other times, if a
module is loaded early during boot, instruction patching can fail due to
a separate bug, but the error is not reported due to missing error
reporting.

In all the above cases when instruction patching fails, ftrace will be
disabled but certain kernel module functions will be left with default
calls to _mcount(). This is not a problem with ELFv1. However, with
-mprofile-kernel, the default stub is problematic since it depends on a
valid module TOC in r2. If the kernel (or a different module) calls into
a function that does not use the TOC, the function won't have a prologue
to setup the module TOC. When that function calls into _mcount(), we
will end up in the relocation stub that will use the previous TOC, and
end up trying to jump into a random location. From the above trace:

	iomap_apply+0x20c/0x920 [kernel TOC]
			|
			V
	ext4_iomap_end+0x8/0x30 [no GEP == kernel TOC]
			|
			V
		_mcount() stub
	[uses kernel TOC -> random entry]

To address this, let's change over to using the special stub that is
used for ftrace_[regs_]caller() for _mcount(). This ensures that we are
not dependent on a valid module TOC in r2 for default _mcount()
handling.

Reported-by: Qian Cai <cai@lca.pw>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/module_64.c | 222 +++++++++++++++-----------------
 1 file changed, 104 insertions(+), 118 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7f4cc5346387..cc7e990e8376 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -348,6 +348,92 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 	return 0;
 }
 
+#ifdef CONFIG_MPROFILE_KERNEL
+
+#define PACATOC offsetof(struct paca_struct, kernel_toc)
+
+/*
+ * ld      r12,PACATOC(r13)
+ * addis   r12,r12,<high>
+ * addi    r12,r12,<low>
+ * mtctr   r12
+ * bctr
+ */
+static u32 stub_insns[] = {
+	PPC_INST_LD | __PPC_RT(R12) | __PPC_RA(R13) | PACATOC,
+	PPC_INST_ADDIS | __PPC_RT(R12) | __PPC_RA(R12),
+	PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12),
+	PPC_INST_MTCTR | __PPC_RS(R12),
+	PPC_INST_BCTR,
+};
+
+/*
+ * For mprofile-kernel we use a special stub for ftrace_caller() because we
+ * can't rely on r2 containing this module's TOC when we enter the stub.
+ *
+ * That can happen if the function calling us didn't need to use the toc. In
+ * that case it won't have setup r2, and the r2 value will be either the
+ * kernel's toc, or possibly another modules toc.
+ *
+ * To deal with that this stub uses the kernel toc, which is always accessible
+ * via the paca (in r13). The target (ftrace_caller()) is responsible for
+ * saving and restoring the toc before returning.
+ */
+static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
+					unsigned long addr,
+					struct module *me)
+{
+	long reladdr;
+
+	memcpy(entry->jump, stub_insns, sizeof(stub_insns));
+
+	/* Stub uses address relative to kernel toc (from the paca) */
+	reladdr = addr - kernel_toc_addr();
+	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
+		pr_err("%s: Address of %ps out of range of kernel_toc.\n",
+							me->name, (void *)addr);
+		return 0;
+	}
+
+	entry->jump[1] |= PPC_HA(reladdr);
+	entry->jump[2] |= PPC_LO(reladdr);
+
+	/* Eventhough we don't use funcdata in the stub, it's needed elsewhere. */
+	entry->funcdata = func_desc(addr);
+	entry->magic = STUB_MAGIC;
+
+	return 1;
+}
+
+static bool is_mprofile_ftrace_call(const char *name)
+{
+	if (!strcmp("_mcount", name))
+		return true;
+#ifdef CONFIG_DYNAMIC_FTRACE
+	if (!strcmp("ftrace_caller", name))
+		return true;
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	if (!strcmp("ftrace_regs_caller", name))
+		return true;
+#endif
+#endif
+
+	return false;
+}
+#else
+static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
+					unsigned long addr,
+					struct module *me)
+{
+	return 0;
+}
+
+static bool is_mprofile_ftrace_call(const char *name)
+{
+	return false;
+}
+#endif
+
 /*
  * r2 is the TOC pointer: it actually points 0x8000 into the TOC (this gives the
  * value maximum span in an instruction which uses a signed offset). Round down
@@ -363,10 +449,14 @@ static inline unsigned long my_r2(const Elf64_Shdr *sechdrs, struct module *me)
 static inline int create_stub(const Elf64_Shdr *sechdrs,
 			      struct ppc64_stub_entry *entry,
 			      unsigned long addr,
-			      struct module *me)
+			      struct module *me,
+			      const char *name)
 {
 	long reladdr;
 
+	if (is_mprofile_ftrace_call(name))
+		return create_ftrace_stub(entry, addr, me);
+
 	memcpy(entry->jump, ppc64_stub_insns, sizeof(ppc64_stub_insns));
 
 	/* Stub uses address relative to r2. */
@@ -390,7 +480,8 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
    stub to set up the TOC ptr (r2) for the function. */
 static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 				   unsigned long addr,
-				   struct module *me)
+				   struct module *me,
+				   const char *name)
 {
 	struct ppc64_stub_entry *stubs;
 	unsigned int i, num_stubs;
@@ -407,45 +498,12 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 			return (unsigned long)&stubs[i];
 	}
 
-	if (!create_stub(sechdrs, &stubs[i], addr, me))
+	if (!create_stub(sechdrs, &stubs[i], addr, me, name))
 		return 0;
 
 	return (unsigned long)&stubs[i];
 }
 
-#ifdef CONFIG_MPROFILE_KERNEL
-static bool is_mprofile_ftrace_call(const char *name)
-{
-	if (!strcmp("_mcount", name))
-		return true;
-
-	return false;
-}
-
-/*
- * In case of _mcount calls, do not save the current callee's TOC (in r2) into
- * the original caller's stack frame. If we did we would clobber the saved TOC
- * value of the original caller.
- */
-static void squash_toc_save_inst(const char *name, unsigned long addr)
-{
-	struct ppc64_stub_entry *stub = (struct ppc64_stub_entry *)addr;
-
-	/* Only for calls to _mcount */
-	if (strcmp("_mcount", name) != 0)
-		return;
-
-	stub->jump[2] = PPC_INST_NOP;
-}
-#else
-static void squash_toc_save_inst(const char *name, unsigned long addr) { }
-
-static bool is_mprofile_ftrace_call(const char *name)
-{
-	return false;
-}
-#endif
-
 /* We expect a noop next: if it is, replace it with instruction to
    restore r2. */
 static int restore_r2(const char *name, u32 *instruction, struct module *me)
@@ -590,14 +648,13 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			if (sym->st_shndx == SHN_UNDEF ||
 			    sym->st_shndx == SHN_LIVEPATCH) {
 				/* External: go via stub */
-				value = stub_for_addr(sechdrs, value, me);
+				value = stub_for_addr(sechdrs, value, me,
+						strtab + sym->st_name);
 				if (!value)
 					return -ENOENT;
 				if (!restore_r2(strtab + sym->st_name,
 							(u32 *)location + 1, me))
 					return -ENOEXEC;
-
-				squash_toc_save_inst(strtab + sym->st_name, value);
 			} else
 				value += local_entry_offset(sym);
 
@@ -733,88 +790,17 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
 	return 0;
 }
 
-#ifdef CONFIG_MPROFILE_KERNEL
-
-#define PACATOC offsetof(struct paca_struct, kernel_toc)
-
-/*
- * For mprofile-kernel we use a special stub for ftrace_caller() because we
- * can't rely on r2 containing this module's TOC when we enter the stub.
- *
- * That can happen if the function calling us didn't need to use the toc. In
- * that case it won't have setup r2, and the r2 value will be either the
- * kernel's toc, or possibly another modules toc.
- *
- * To deal with that this stub uses the kernel toc, which is always accessible
- * via the paca (in r13). The target (ftrace_caller()) is responsible for
- * saving and restoring the toc before returning.
- */
-static unsigned long create_ftrace_stub(const Elf64_Shdr *sechdrs,
-				struct module *me, unsigned long addr)
-{
-	struct ppc64_stub_entry *entry;
-	unsigned int i, num_stubs;
-	/*
-	 * ld      r12,PACATOC(r13)
-	 * addis   r12,r12,<high>
-	 * addi    r12,r12,<low>
-	 * mtctr   r12
-	 * bctr
-	 */
-	static u32 stub_insns[] = {
-		PPC_INST_LD | __PPC_RT(R12) | __PPC_RA(R13) | PACATOC,
-		PPC_INST_ADDIS | __PPC_RT(R12) | __PPC_RA(R12),
-		PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12),
-		PPC_INST_MTCTR | __PPC_RS(R12),
-		PPC_INST_BCTR,
-	};
-	long reladdr;
-
-	num_stubs = sechdrs[me->arch.stubs_section].sh_size / sizeof(*entry);
-
-	/* Find the next available stub entry */
-	entry = (void *)sechdrs[me->arch.stubs_section].sh_addr;
-	for (i = 0; i < num_stubs && stub_func_addr(entry->funcdata); i++, entry++);
-
-	if (i >= num_stubs) {
-		pr_err("%s: Unable to find a free slot for ftrace stub.\n", me->name);
-		return 0;
-	}
-
-	memcpy(entry->jump, stub_insns, sizeof(stub_insns));
-
-	/* Stub uses address relative to kernel toc (from the paca) */
-	reladdr = addr - kernel_toc_addr();
-	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-		pr_err("%s: Address of %ps out of range of kernel_toc.\n",
-							me->name, (void *)addr);
-		return 0;
-	}
-
-	entry->jump[1] |= PPC_HA(reladdr);
-	entry->jump[2] |= PPC_LO(reladdr);
-
-	/* Eventhough we don't use funcdata in the stub, it's needed elsewhere. */
-	entry->funcdata = func_desc(addr);
-	entry->magic = STUB_MAGIC;
-
-	return (unsigned long)entry;
-}
-#else
-static unsigned long create_ftrace_stub(const Elf64_Shdr *sechdrs,
-				struct module *me, unsigned long addr)
-{
-	return stub_for_addr(sechdrs, addr, me);
-}
-#endif
-
 int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs)
 {
-	mod->arch.tramp = create_ftrace_stub(sechdrs, mod,
-					(unsigned long)ftrace_caller);
+	mod->arch.tramp = stub_for_addr(sechdrs,
+					(unsigned long)ftrace_caller,
+					mod,
+					"ftrace_caller");
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	mod->arch.tramp_regs = create_ftrace_stub(sechdrs, mod,
-					(unsigned long)ftrace_regs_caller);
+	mod->arch.tramp_regs = stub_for_addr(sechdrs,
+					(unsigned long)ftrace_regs_caller,
+					mod,
+					"ftrace_regs_caller");
 	if (!mod->arch.tramp_regs)
 		return -ENOENT;
 #endif
-- 
2.25.1

