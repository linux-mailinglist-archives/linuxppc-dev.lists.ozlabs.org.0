Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5F1B5F09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 17:23:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Lg81hnNzDq7w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 01:23:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497LLx68GyzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:09:45 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NF3wSB145681
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:09:44 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jtk2rgm3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:09:43 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 23 Apr 2020 16:08:54 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 Apr 2020 16:08:50 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03NF9bwh53870636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 15:09:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 034ADAE051;
 Thu, 23 Apr 2020 15:09:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB23AE056;
 Thu, 23 Apr 2020 15:09:35 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.73.158])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 15:09:35 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] powerpc/kprobes: Check return value of patch_instruction()
Date: Thu, 23 Apr 2020 20:39:04 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042315-4275-0000-0000-000003C54C72
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042315-4276-0000-0000-000038DAD78E
Message-Id: <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_10:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=3 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230118
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
 arch/powerpc/kernel/kprobes.c   | 10 +++-
 arch/powerpc/kernel/optprobes.c | 99 ++++++++++++++++++++++++++-------
 2 files changed, 87 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 81efb605113e..4a297ae2bd87 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -138,13 +138,19 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
 
 void arch_arm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
+	int rc = patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
+
+	if (rc)
+		WARN("Failed to patch trap at 0x%pK: %d\n", (void *)p->addr, rc);
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
 
 void arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, p->opcode);
+	int rc = patch_instruction(p->addr, p->opcode);
+
+	if (rc)
+		WARN("Failed to remove trap at 0x%pK: %d\n", (void *)p->addr, rc);
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
 
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 024f7aad1952..046485bb0a52 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -139,52 +139,67 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 	}
 }
 
+#define PATCH_INSN(addr, instr)						     \
+do {									     \
+	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
+	if (rc) {							     \
+		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
+				__func__, __LINE__,			     \
+				(void *)(addr), (void *)(addr), rc);	     \
+		return rc;						     \
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
+	PATCH_INSN(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
 			  ((val >> 16) & 0xffff));
 	addr++;
 
 	/* ori r4,r4,(insn)@l */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(4) |
+	PATCH_INSN(addr, PPC_INST_ORI | ___PPC_RA(4) |
 			  ___PPC_RS(4) | (val & 0xffff));
+
+	return 0;
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
+	PATCH_INSN(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
 			  ((val >> 48) & 0xffff));
 	addr++;
 
 	/* ori r3,r3,(op)@higher */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
+	PATCH_INSN(addr, PPC_INST_ORI | ___PPC_RA(3) |
 			  ___PPC_RS(3) | ((val >> 32) & 0xffff));
 	addr++;
 
 	/* rldicr r3,r3,32,31 */
-	patch_instruction(addr, PPC_INST_RLDICR | ___PPC_RA(3) |
+	PATCH_INSN(addr, PPC_INST_RLDICR | ___PPC_RA(3) |
 			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31));
 	addr++;
 
 	/* oris r3,r3,(op)@h */
-	patch_instruction(addr, PPC_INST_ORIS | ___PPC_RA(3) |
+	PATCH_INSN(addr, PPC_INST_ORIS | ___PPC_RA(3) |
 			  ___PPC_RS(3) | ((val >> 16) & 0xffff));
 	addr++;
 
 	/* ori r3,r3,(op)@l */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
+	PATCH_INSN(addr, PPC_INST_ORI | ___PPC_RA(3) |
 			  ___PPC_RS(3) | (val & 0xffff));
+
+	return 0;
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
@@ -216,14 +231,18 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
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
@@ -231,15 +250,22 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	pr_devel("Copying template to %p, size %lu\n", buff, size);
 	for (i = 0; i < size; i++) {
 		rc = patch_instruction(buff + i, *(optprobe_template_entry + i));
-		if (rc < 0)
+		if (rc) {
+			pr_err("%s: Error copying optprobe template to 0x%pK: %d\n",
+					__func__, (void *)(buff + i), rc);
+			rc = -EFAULT;
 			goto error;
+		}
 	}
 
 	/*
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
 	 */
-	patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
+	if (patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX)) {
+		rc = -EFAULT;
+		goto error;
+	}
 
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
@@ -248,6 +274,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	emulate_step_addr = (kprobe_opcode_t *)ppc_kallsyms_lookup_name("emulate_step");
 	if (!op_callback_addr || !emulate_step_addr) {
 		WARN(1, "Unable to lookup optimized_callback()/emulate_step()\n");
+		rc = -ERANGE;
 		goto error;
 	}
 
@@ -259,21 +286,48 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 				(unsigned long)emulate_step_addr,
 				BRANCH_SET_LINK);
 
-	if (!branch_op_callback || !branch_emulate_step)
+	if (!branch_op_callback || !branch_emulate_step) {
+		rc = -ERANGE;
 		goto error;
+	}
 
-	patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
-	patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
+	rc = patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
+	if (rc) {
+		pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
+				__func__, __LINE__,
+				(void *)(buff + TMPL_CALL_HDLR_IDX), rc);
+		rc = -EFAULT;
+		goto error;
+	}
+
+	rc = patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
+	if (rc) {
+		pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
+				__func__, __LINE__,
+				(void *)(buff + TMPL_EMULATE_IDX), rc);
+		rc = -EFAULT;
+		goto error;
+	}
 
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
+	if (patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX)) {
+		rc = -EFAULT;
+		goto error;
+	}
 
 	/*
 	 * 4. branch back from trampoline
 	 */
-	patch_branch(buff + TMPL_RET_IDX, (unsigned long)nip, 0);
+	rc = patch_branch(buff + TMPL_RET_IDX, (unsigned long)nip, 0);
+	if (rc) {
+		pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
+				__func__, __LINE__,
+				(void *)(buff + TMPL_RET_IDX), rc);
+		rc = -EFAULT;
+		goto error;
+	}
 
 	flush_icache_range((unsigned long)buff,
 			   (unsigned long)(&buff[TMPL_END_IDX]));
@@ -284,7 +338,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 
 error:
 	free_ppc_optinsn_slot(buff, 0);
-	return -ERANGE;
+	return rc;
 
 }
 
@@ -307,6 +361,7 @@ void arch_optimize_kprobes(struct list_head *oplist)
 {
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
+	int rc;
 
 	list_for_each_entry_safe(op, tmp, oplist, list) {
 		/*
@@ -315,9 +370,13 @@ void arch_optimize_kprobes(struct list_head *oplist)
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

