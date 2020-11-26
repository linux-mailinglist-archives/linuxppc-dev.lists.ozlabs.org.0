Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421882C5C0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:33:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmbR22MYzDqxF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:33:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ST5YO4Jb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm5L2HvBzDrNg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:10:30 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI3BDf092439; Thu, 26 Nov 2020 13:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=88MsbajRuMEmY8OR/KaTCRULWiQO12u1zZFm/n4q7Mw=;
 b=ST5YO4Jb1eGAuDnKSMJZVw9gY03+29Gg+wAJRqdaSkoSsn8KSlLzIiVcybOGLnAV5SqE
 FsXcsvYH6yN2DgVXZpSag+G8IBMZVOWjPB4ITnn+y42OLW7nrQRX/jWDSSfhXQuNSe48
 r+ZHHwmkh7tACs/80lWbJhxw5e76YFMj+2nPRaDAEAPrK2iTJtphk/Zze1AzbKfT6Lij
 rwHLl3OLxzSo/2CATvNb9j1h1S3OFZ68dm5jju1Zdx7fL0oB1kCWMzBzAiVg81I6a3uT
 qE/uCicK63nSOYbhGcsrZa1bD1r1f3vedh32j1alM2lURot8xAynxJCuoG1Phis0eU4N cQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352b28b1e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:57 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI7Vsp028991;
 Thu, 26 Nov 2020 18:09:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3518j8hxcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9r4w11010708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24D94A405B;
 Thu, 26 Nov 2020 18:09:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D65CDA4054;
 Thu, 26 Nov 2020 18:09:50 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:50 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 13/14] powerpc/ftrace: Add support for
 register_ftrace_direct() for MPROFILE_KERNEL
Date: Thu, 26 Nov 2020 23:38:50 +0530
Message-Id: <6241150c8e908289c6f161c41e68b61fa782e73d.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260112
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for register_ftrace_direct() for MPROFILE_KERNEL, as it
depends on DYNAMIC_FTRACE_WITH_REGS.

Since powerpc only provides a branch range of 32MB, we set aside a 64k
area within kernel text for creating stubs that can be used to branch to
the provided trampoline, which can be located in the module area. This
is limited to kernel text, and as such, ftrace direct calls are not
supported for functions in kernel modules at this time.

We use orig_gpr3 to stash the address of the direct call trampoline in
arch_ftrace_set_direct_caller().  ftrace_regs_caller() is updated to
check for this to determine if we need to redirect to a direct call
trampoline. As the direct call trampoline has to work as an alternative
for the ftrace trampoline, we setup LR and r0 appropriately, and update
ctr to the trampoline address.  Finally, ftrace_graph_caller() is
updated to save/restore r0.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/ftrace.h             |  14 ++
 arch/powerpc/kernel/trace/ftrace.c            | 140 +++++++++++++++++-
 .../powerpc/kernel/trace/ftrace_64_mprofile.S |  40 ++++-
 4 files changed, 182 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cfc6dd787f532c..a87ac2e403196e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -197,6 +197,7 @@ config PPC
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
+	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS	if MPROFILE_KERNEL
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if MPROFILE_KERNEL
 	select HAVE_EBPF_JIT			if PPC64
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS	if !(CPU_LITTLE_ENDIAN && POWER7_CPU)
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index bc76970b6ee532..2f1c46e9f5d416 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -10,6 +10,8 @@
 
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
+#define FTRACE_STUBS_SIZE	65536
+
 #ifdef __ASSEMBLY__
 
 /* Based off of objdump optput from glibc */
@@ -59,6 +61,18 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 struct dyn_arch_ftrace {
 	struct module *mod;
 };
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+/*
+ * When there is a direct caller registered, we use regs->orig_gpr3 (similar to
+ * how x86 uses orig_ax) to let ftrace_{regs_}_caller know that we should go
+ * there instead of returning to the function
+ */
+static inline void arch_ftrace_set_direct_caller(struct pt_regs *regs, unsigned long addr)
+{
+	regs->orig_gpr3 = addr;
+}
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 #endif /* __ASSEMBLY__ */
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index fcb21a9756e456..815b14ae45a71f 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -37,6 +37,7 @@ static DEFINE_HASHTABLE(ppc_ftrace_stubs, 8);
 struct ppc_ftrace_stub_data {
 	unsigned long addr;
 	unsigned long target;
+	refcount_t refs;
 	struct hlist_node hentry;
 };
 
@@ -299,7 +300,7 @@ static unsigned long find_ftrace_tramp(unsigned long ip, unsigned long target)
 	return 0;
 }
 
-static int add_ftrace_tramp(unsigned long tramp, unsigned long target)
+static int add_ftrace_tramp(unsigned long tramp, unsigned long target, int lock)
 {
 	struct ppc_ftrace_stub_data *stub;
 
@@ -309,11 +310,123 @@ static int add_ftrace_tramp(unsigned long tramp, unsigned long target)
 
 	stub->addr = tramp;
 	stub->target = target;
+	refcount_set(&stub->refs, 1);
+	if (lock)
+		refcount_inc(&stub->refs);
 	hash_add(ppc_ftrace_stubs, &stub->hentry, target);
 
 	return 0;
 }
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+static u32 ftrace_direct_stub_insns[] = {
+	PPC_RAW_LIS(12, 0),
+	PPC_RAW_ORI(12, 12, 0),
+	PPC_RAW_SLDI(12, 12, 32),
+	PPC_RAW_ORIS(12, 12, 0),
+	PPC_RAW_ORI(12, 12, 0),
+	PPC_RAW_MTCTR(12),
+	PPC_RAW_BCTR(),
+};
+#define FTRACE_NUM_STUBS	(FTRACE_STUBS_SIZE / sizeof(ftrace_direct_stub_insns))
+static DECLARE_BITMAP(stubs_bitmap, FTRACE_NUM_STUBS);
+extern unsigned int ftrace_stubs[];
+
+static unsigned long get_ftrace_tramp(unsigned long ip, unsigned long target)
+{
+	struct ppc_ftrace_stub_data *stub_data;
+	struct ppc_inst instr;
+	unsigned int *stub;
+	int index;
+
+	hash_for_each_possible(ppc_ftrace_stubs, stub_data, hentry, target) {
+		if (stub_data->target == target &&
+				!create_branch(&instr, (void *)ip, stub_data->addr, 0)) {
+			refcount_inc(&stub_data->refs);
+			return stub_data->addr;
+		}
+	}
+
+	/* Allocate a stub */
+	do {
+		index = find_first_zero_bit(stubs_bitmap, FTRACE_NUM_STUBS);
+		if (index >= FTRACE_NUM_STUBS) {
+			pr_err("No stubs available\n");
+			return 0;
+		}
+	} while (test_and_set_bit(index, stubs_bitmap));
+	stub = &ftrace_stubs[index * sizeof(ftrace_direct_stub_insns) / 4];
+
+	if (create_branch(&instr, (void *)ip, (unsigned long)stub, 0)) {
+		/* Stub is not reachable from the ftrace location */
+		clear_bit(index, stubs_bitmap);
+		return 0;
+	}
+
+	memcpy(stub, ftrace_direct_stub_insns, sizeof(ftrace_direct_stub_insns));
+	stub[0] |= IMM_L(target >> 48);
+	stub[1] |= IMM_L(target >> 32);
+	stub[3] |= IMM_L(target >> 16);
+	stub[4] |= IMM_L(target);
+	if (add_ftrace_tramp((unsigned long)stub, target, 0)) {
+		pr_err("Error allocating ftrace stub");
+		clear_bit(index, stubs_bitmap);
+		return 0;
+	}
+
+	return (unsigned long)stub;
+}
+
+static void remove_ftrace_tramp(unsigned long ip, unsigned long target, unsigned long stub_addr)
+{
+	struct ppc_ftrace_stub_data *stub;
+	unsigned long tramp = 0;
+	struct ppc_inst instr;
+	int index;
+
+	hash_for_each_possible(ppc_ftrace_stubs, stub, hentry, target) {
+		if (stub->target == target && stub->addr == stub_addr &&
+				!create_branch(&instr, (void *)ip, stub->addr, 0)) {
+			if (refcount_dec_and_test(&stub->refs)) {
+				tramp = stub->addr;
+				hash_del(&stub->hentry);
+				kfree(stub);
+				break;
+			}
+			return;
+		}
+	}
+
+	if (tramp) {
+		synchronize_rcu_tasks();
+		index = (tramp - (unsigned long)ftrace_stubs) / sizeof(ftrace_direct_stub_insns);
+		clear_bit(index, stubs_bitmap);
+	}
+}
+
+int arch_register_ftrace_direct(unsigned long ip, unsigned long addr)
+{
+	if (addr & 0x03) {
+		pr_err("Target address is not at instruction boundary: 0x%lx\n", addr);
+		return -EINVAL;
+	}
+
+	if (is_module_text_address(ip)) {
+		pr_err("Kernel modules are not supported for direct calls\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+#else
+static unsigned long get_ftrace_tramp(unsigned long ip, unsigned long target)
+{
+	return find_ftrace_tramp(ip, target);
+}
+
+static void remove_ftrace_tramp(unsigned long ip, unsigned long target, unsigned long stub_addr) { }
+#endif
+
 /*
  * If this is a compiler generated long_branch trampoline (essentially, a
  * trampoline that has a branch to _mcount()), we re-write the branch to
@@ -365,7 +478,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 		return -1;
 	}
 
-	if (add_ftrace_tramp(tramp, ftrace_target)) {
+	if (add_ftrace_tramp(tramp, ftrace_target, 1)) {
 		pr_debug("No tramp locations left\n");
 		return -1;
 	}
@@ -409,6 +522,8 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EPERM;
 	}
 
+	remove_ftrace_tramp(ip, addr, tramp);
+
 	return 0;
 }
 
@@ -631,7 +746,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	tramp = find_ftrace_tramp((unsigned long)ip, ptr);
+	tramp = get_ftrace_tramp((unsigned long)ip, ptr);
 	if (!tramp) {
 		pr_err("No ftrace trampolines reachable from %ps\n", ip);
 		return -EINVAL;
@@ -782,7 +897,7 @@ __ftrace_modify_call_kernel(struct dyn_ftrace *rec, unsigned long old_addr, unsi
 {
 	struct ppc_inst op;
 	unsigned long ip = rec->ip;
-	unsigned long entry, ptr, tramp;
+	unsigned long entry, ptr, tramp, tramp_old = 0;
 
 	/* read where this goes */
 	if (probe_kernel_read_inst(&op, (void *)ip)) {
@@ -814,6 +929,8 @@ __ftrace_modify_call_kernel(struct dyn_ftrace *rec, unsigned long old_addr, unsi
 			pr_err("we don't know about the tramp at %lx!\n", tramp);
 			return -EFAULT;
 		}
+
+		tramp_old = tramp;
 	}
 
 	/* The new target may be within range */
@@ -824,7 +941,7 @@ __ftrace_modify_call_kernel(struct dyn_ftrace *rec, unsigned long old_addr, unsi
 			return -EINVAL;
 		}
 
-		return 0;
+		goto out;
 	}
 
 	ptr = ppc_global_function_entry((void *)addr);
@@ -836,7 +953,7 @@ __ftrace_modify_call_kernel(struct dyn_ftrace *rec, unsigned long old_addr, unsi
 		ptr = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
 #endif
 
-	tramp = find_ftrace_tramp(ip, ptr);
+	tramp = get_ftrace_tramp(ip, ptr);
 
 	if (!tramp) {
 		pr_err("Couldn't find a trampoline\n");
@@ -850,8 +967,13 @@ __ftrace_modify_call_kernel(struct dyn_ftrace *rec, unsigned long old_addr, unsi
 		return -EINVAL;
 	}
 
+out:
+	if (tramp_old)
+		remove_ftrace_tramp(ip, old_addr, tramp_old);
+
 	return 0;
 }
+
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 			unsigned long addr)
 {
@@ -950,9 +1072,13 @@ int __init ftrace_dyn_arch_init(void)
 		memcpy(tramp[i], stub_insns, sizeof(stub_insns));
 		tramp[i][1] |= PPC_HA(reladdr);
 		tramp[i][2] |= PPC_LO(reladdr);
-		add_ftrace_tramp((unsigned long)tramp[i], addr);
+		add_ftrace_tramp((unsigned long)tramp[i], addr, 1);
 	}
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	bitmap_zero(stubs_bitmap, FTRACE_NUM_STUBS);
+#endif
+
 	return 0;
 }
 #else
diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
index c5602e9b07faa3..ffd2e33ff979bc 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
@@ -13,6 +13,13 @@
 #include <asm/bug.h>
 #include <asm/ptrace.h>
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	.balign	4
+.global ftrace_stubs
+ftrace_stubs:
+	.space FTRACE_STUBS_SIZE
+#endif
+
 /*
  *
  * ftrace_caller()/ftrace_regs_caller() is the function that replaces _mcount()
@@ -91,6 +98,10 @@ _GLOBAL(ftrace_regs_caller)
 	std     r10, _XER(r1)
 	std     r11, _CCR(r1)
 
+	/* Clear out orig_gpr3 */
+	li	r6, 0
+	std	r6, ORIG_GPR3(r1)
+
 	/* Load &pt_regs in r6 for call below */
 	addi    r6, r1 ,STACK_FRAME_OVERHEAD
 
@@ -103,20 +114,34 @@ ftrace_regs_call:
 	/* Load ctr with the possibly modified NIP */
 	ld	r3, _NIP(r1)
 	mtctr	r3
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Check if we should go to a direct call next */
+	ld	r4, ORIG_GPR3(r1)
+	cmpdi	r4, 0
+	beq+	1f
+	/* r4 has the direct call target, setup LR and r0 as on our entry, reset cr0 */
+	mtctr	r4
+	mtlr	r3
+	ld	r0, _LINK(r1)
+	cmpd	r3, r3
+	b	2f
+#endif
+
+1:
 #ifdef CONFIG_LIVEPATCH
 	cmpd	r14, r3		/* has NIP been altered? */
 #endif
 
-	/* Restore gprs */
-	REST_GPR(0,r1)
-	REST_10GPRS(2,r1)
-	REST_10GPRS(12,r1)
-	REST_10GPRS(22,r1)
-
 	/* Restore possibly modified LR */
 	ld	r0, _LINK(r1)
 	mtlr	r0
 
+	/* Restore gprs */
+2:	REST_10GPRS(2,r1)
+	REST_10GPRS(12,r1)
+	REST_10GPRS(22,r1)
+
 	/* Restore callee's TOC */
 	ld	r2, 24(r1)
 
@@ -282,6 +307,7 @@ _GLOBAL(ftrace_graph_caller)
 	stdu	r1,-SWITCH_FRAME_SIZE(r1)
 	/* with -mprofile-kernel, parameter regs are still alive at _mcount */
 	SAVE_8GPRS(3, r1)
+	SAVE_GPR(0, r1)
 
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, 24(r1)
@@ -304,6 +330,8 @@ _GLOBAL(ftrace_graph_caller)
 
 	ld	r0, _NIP(r1)
 	mtctr	r0
+
+	REST_GPR(0, r1)
 	REST_8GPRS(3, r1)
 
 	/* Restore callee's TOC */
-- 
2.25.4

