Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF501BC102
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 16:18:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BNzW41C7zDqw2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 00:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BNgm3cMjzDqDC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 00:04:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SE2EGW091450; Tue, 28 Apr 2020 10:04:21 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhc15rkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 10:04:18 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SE2g4q019519;
 Tue, 28 Apr 2020 14:04:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 30mcu58wjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 14:04:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SE4DRx54132986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 14:04:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5703D11C05B;
 Tue, 28 Apr 2020 14:04:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF53511C058;
 Tue, 28 Apr 2020 14:04:11 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.73.214])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 14:04:11 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/2] powerpc/kprobes: Check return value of
 patch_instruction()
Date: Tue, 28 Apr 2020 19:33:59 +0530
Message-Id: <c94ffad28a43a1a8d405345a43fee852e8f556b1.1588082133.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1588082133.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1588082133.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_09:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=3
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280107
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

patch_instruction() can fail in some scenarios. Add appropriate error
checking so that such failures are caught and logged, and suitable error
code is returned.

Fixes: d07df82c43be8 ("powerpc/kprobes: Move kprobes over to patch_instruction()")
Fixes: f3eca95638931 ("powerpc/kprobes/optprobes: Use patch_instruction()")
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes.c   |  13 +++-
 arch/powerpc/kernel/optprobes.c | 109 +++++++++++++++++++++++---------
 2 files changed, 89 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 81efb605113e..9eb1cc05ddd5 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -19,6 +19,7 @@
 #include <linux/extable.h>
 #include <linux/kdebug.h>
 #include <linux/slab.h>
+#include <linux/bug.h>
 #include <asm/code-patching.h>
 #include <asm/cacheflush.h>
 #include <asm/sstep.h>
@@ -138,13 +139,21 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
 
 void arch_arm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
+	int rc = patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
+
+	if (WARN_ON(rc))
+		pr_err("Failed to patch trap at 0x%pK: %d\n",
+				(void *)p->addr, rc);
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
 
 void arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, p->opcode);
+	int rc = patch_instruction(p->addr, p->opcode);
+
+	if (WARN_ON(rc))
+		pr_err("Failed to remove trap at 0x%pK: %d\n",
+				(void *)p->addr, rc);
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
 
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 024f7aad1952..20897600db2e 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -139,52 +139,80 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 	}
 }
 
+#define PATCH_INSN_OR_GOTO(addr, instr, label)				     \
+do {									     \
+	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
+	if (rc) {							     \
+		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
+				__func__, __LINE__,			     \
+				(void *)(addr), (void *)(addr), rc);	     \
+		goto label;						     \
+	}								     \
+} while (0)
+
 /*
  * emulate_step() requires insn to be emulated as
  * second parameter. Load register 'r4' with the
  * instruction.
  */
-void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
+static int patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 {
 	/* addis r4,0,(insn)@h */
-	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
-			  ((val >> 16) & 0xffff));
+	PATCH_INSN_OR_GOTO(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
+			  ((val >> 16) & 0xffff),
+			  patch_err);
 	addr++;
 
 	/* ori r4,r4,(insn)@l */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(4) |
-			  ___PPC_RS(4) | (val & 0xffff));
+	PATCH_INSN_OR_GOTO(addr, PPC_INST_ORI | ___PPC_RA(4) |
+			  ___PPC_RS(4) | (val & 0xffff),
+			  patch_err);
+
+	return 0;
+
+patch_err:
+	return -EFAULT;
 }
 
 /*
  * Generate instructions to load provided immediate 64-bit value
  * to register 'r3' and patch these instructions at 'addr'.
  */
-void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
+static int patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
 {
 	/* lis r3,(op)@highest */
-	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
-			  ((val >> 48) & 0xffff));
+	PATCH_INSN_OR_GOTO(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
+			  ((val >> 48) & 0xffff),
+			  patch_err);
 	addr++;
 
 	/* ori r3,r3,(op)@higher */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 32) & 0xffff));
+	PATCH_INSN_OR_GOTO(addr, PPC_INST_ORI | ___PPC_RA(3) |
+			  ___PPC_RS(3) | ((val >> 32) & 0xffff),
+			  patch_err);
 	addr++;
 
 	/* rldicr r3,r3,32,31 */
-	patch_instruction(addr, PPC_INST_RLDICR | ___PPC_RA(3) |
-			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31));
+	PATCH_INSN_OR_GOTO(addr, PPC_INST_RLDICR | ___PPC_RA(3) |
+			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31),
+			  patch_err);
 	addr++;
 
 	/* oris r3,r3,(op)@h */
-	patch_instruction(addr, PPC_INST_ORIS | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 16) & 0xffff));
+	PATCH_INSN_OR_GOTO(addr, PPC_INST_ORIS | ___PPC_RA(3) |
+			  ___PPC_RS(3) | ((val >> 16) & 0xffff),
+			  patch_err);
 	addr++;
 
 	/* ori r3,r3,(op)@l */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | (val & 0xffff));
+	PATCH_INSN_OR_GOTO(addr, PPC_INST_ORI | ___PPC_RA(3) |
+			  ___PPC_RS(3) | (val & 0xffff),
+			  patch_err);
+
+	return 0;
+
+patch_err:
+	return -EFAULT;
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
@@ -216,30 +244,33 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 * be within 32MB on either side of the current instruction.
 	 */
 	b_offset = (unsigned long)buff - (unsigned long)p->addr;
-	if (!is_offset_in_branch_range(b_offset))
+	if (!is_offset_in_branch_range(b_offset)) {
+		rc = -ERANGE;
 		goto error;
+	}
 
 	/* Check if the return address is also within 32MB range */
 	b_offset = (unsigned long)(buff + TMPL_RET_IDX) -
 			(unsigned long)nip;
-	if (!is_offset_in_branch_range(b_offset))
+	if (!is_offset_in_branch_range(b_offset)) {
+		rc = -ERANGE;
 		goto error;
+	}
 
 	/* Setup template */
 	/* We can optimize this via patch_instruction_window later */
 	size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
 	pr_devel("Copying template to %p, size %lu\n", buff, size);
-	for (i = 0; i < size; i++) {
-		rc = patch_instruction(buff + i, *(optprobe_template_entry + i));
-		if (rc < 0)
-			goto error;
-	}
+	for (i = 0; i < size; i++)
+		PATCH_INSN_OR_GOTO(buff + i, *(optprobe_template_entry + i),
+				patch_err);
 
 	/*
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
 	 */
-	patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
+	if (patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX))
+		goto patch_err;
 
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
@@ -248,6 +279,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	emulate_step_addr = (kprobe_opcode_t *)ppc_kallsyms_lookup_name("emulate_step");
 	if (!op_callback_addr || !emulate_step_addr) {
 		WARN(1, "Unable to lookup optimized_callback()/emulate_step()\n");
+		rc = -ERANGE;
 		goto error;
 	}
 
@@ -259,21 +291,29 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 				(unsigned long)emulate_step_addr,
 				BRANCH_SET_LINK);
 
-	if (!branch_op_callback || !branch_emulate_step)
+	if (!branch_op_callback || !branch_emulate_step) {
+		rc = -ERANGE;
 		goto error;
+	}
+
+	PATCH_INSN_OR_GOTO(buff + TMPL_CALL_HDLR_IDX, branch_op_callback,
+			patch_err);
 
-	patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
-	patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
+	PATCH_INSN_OR_GOTO(buff + TMPL_EMULATE_IDX, branch_emulate_step,
+			patch_err);
 
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
+	if (patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX))
+		goto patch_err;
 
 	/*
 	 * 4. branch back from trampoline
 	 */
-	patch_branch(buff + TMPL_RET_IDX, (unsigned long)nip, 0);
+	PATCH_INSN_OR_GOTO(buff + TMPL_RET_IDX,
+		create_branch(buff + TMPL_RET_IDX, (unsigned long)nip, 0),
+		patch_err);
 
 	flush_icache_range((unsigned long)buff,
 			   (unsigned long)(&buff[TMPL_END_IDX]));
@@ -282,9 +322,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 
 	return 0;
 
+patch_err:
+	rc = -EFAULT;
 error:
 	free_ppc_optinsn_slot(buff, 0);
-	return -ERANGE;
+	return rc;
 
 }
 
@@ -307,6 +349,7 @@ void arch_optimize_kprobes(struct list_head *oplist)
 {
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
+	int rc;
 
 	list_for_each_entry_safe(op, tmp, oplist, list) {
 		/*
@@ -315,9 +358,13 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		 */
 		memcpy(op->optinsn.copied_insn, op->kp.addr,
 					       RELATIVEJUMP_SIZE);
-		patch_instruction(op->kp.addr,
+		rc = patch_instruction(op->kp.addr,
 			create_branch((unsigned int *)op->kp.addr,
 				      (unsigned long)op->optinsn.insn, 0));
+		if (rc)
+			pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
+					__func__, __LINE__,
+					(void *)(op->kp.addr), rc);
 		list_del_init(&op->list);
 	}
 }
-- 
2.25.1

