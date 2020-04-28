Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 779601BC0AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 16:08:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BNlk0C2szDqNx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 00:08:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BNgg1PgmzDq83
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 00:04:46 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SDVfw9060825; Tue, 28 Apr 2020 10:04:16 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pjxuxnue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 10:04:15 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SE2hSQ019522;
 Tue, 28 Apr 2020 14:04:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 30mcu58wjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 14:04:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SE4BGH37421278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 14:04:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C55411C04C;
 Tue, 28 Apr 2020 14:04:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12DD411C04A;
 Tue, 28 Apr 2020 14:04:10 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.73.214])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 14:04:09 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 1/2] powerpc/ftrace: Simplify error checking when patching
 instructions
Date: Tue, 28 Apr 2020 19:33:58 +0530
Message-Id: <46df7406ed1a426800de687324262e344fd19434.1588082133.git.naveen.n.rao@linux.vnet.ibm.com>
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
 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=1 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280102
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

Introduce a macro PATCH_INSN_OR_GOTO() to simplify instruction patching,
and to make the error messages more uniform and useful:
- print an error message that includes the original return value
- print the function name and line numbers, so that the offending
  location is clear
- goto a label which always return -EPERM, which ftrace_bug() expects
  for proper error handling

Also eliminate use of patch_branch() since most such uses already call
create_branch() for error checking before patching. Instead, use the
return value from create_branch() with PATCH_INSN_OR_GOTO().

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 96 +++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7ea0ca044b65..63edbd48af42 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -31,6 +31,17 @@
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
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
  * We generally only have a single long_branch tramp and at most 2 or 3 plt
  * tramps generated. But, we don't use the plt tramps currently. We also allot
@@ -78,10 +89,12 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
 	}
 
 	/* replace the text with the new text */
-	if (patch_instruction((unsigned int *)ip, new))
-		return -EPERM;
+	PATCH_INSN_OR_GOTO(ip, new, patch_err);
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 
 /*
@@ -204,12 +217,12 @@ __ftrace_make_nop(struct module *mod,
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
 
-	if (patch_instruction((unsigned int *)ip, pop)) {
-		pr_err("Patching NOP failed.\n");
-		return -EPERM;
-	}
+	PATCH_INSN_OR_GOTO(ip, pop, patch_err);
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 
 #else /* !PPC64 */
@@ -276,10 +289,12 @@ __ftrace_make_nop(struct module *mod,
 
 	op = PPC_INST_NOP;
 
-	if (patch_instruction((unsigned int *)ip, op))
-		return -EPERM;
+	PATCH_INSN_OR_GOTO(ip, op, patch_err);
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 #endif /* PPC64 */
 #endif /* CONFIG_MODULES */
@@ -322,7 +337,7 @@ static int add_ftrace_tramp(unsigned long tramp)
  */
 static int setup_mcount_compiler_tramp(unsigned long tramp)
 {
-	int i, op;
+	unsigned int i, op;
 	unsigned long ptr;
 	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
 
@@ -366,16 +381,14 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 #else
 	ptr = ppc_global_function_entry((void *)ftrace_caller);
 #endif
-	if (!create_branch((void *)tramp, ptr, 0)) {
+	op = create_branch((void *)tramp, ptr, 0);
+	if (!op) {
 		pr_debug("%ps is not reachable from existing mcount tramp\n",
 				(void *)ptr);
 		return -1;
 	}
 
-	if (patch_branch((unsigned int *)tramp, ptr, 0)) {
-		pr_debug("REL24 out of range!\n");
-		return -1;
-	}
+	PATCH_INSN_OR_GOTO(tramp, op, patch_err);
 
 	if (add_ftrace_tramp(tramp)) {
 		pr_debug("No tramp locations left\n");
@@ -383,6 +396,9 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 	}
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 
 static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
@@ -416,12 +432,12 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		}
 	}
 
-	if (patch_instruction((unsigned int *)ip, PPC_INST_NOP)) {
-		pr_err("Patching NOP failed.\n");
-		return -EPERM;
-	}
+	PATCH_INSN_OR_GOTO(ip, PPC_INST_NOP, patch_err);
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 
 int ftrace_make_nop(struct module *mod,
@@ -557,17 +573,18 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (!create_branch(ip, tramp, BRANCH_SET_LINK)) {
+	op[0] = create_branch(ip, tramp, BRANCH_SET_LINK);
+	if (!op[0]) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
 
-	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("REL24 out of range!\n");
-		return -EINVAL;
-	}
+	PATCH_INSN_OR_GOTO(ip, op[0], patch_err);
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 
 #else  /* !CONFIG_PPC64: */
@@ -603,10 +620,12 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	pr_devel("write to %lx\n", rec->ip);
 
-	if (patch_instruction((unsigned int *)ip, op))
-		return -EPERM;
+	PATCH_INSN_OR_GOTO(ip, op, patch_err);
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 #endif /* CONFIG_PPC64 */
 #endif /* CONFIG_MODULES */
@@ -650,12 +669,18 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("Error patching branch to ftrace tramp!\n");
+	op = create_branch(ip, tramp, BRANCH_SET_LINK);
+	if (!op) {
+		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
 
+	PATCH_INSN_OR_GOTO(ip, op, patch_err);
+
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
@@ -748,10 +773,8 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	/* The new target may be within range */
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
-		if (patch_branch((unsigned int *)ip, addr, BRANCH_SET_LINK)) {
-			pr_err("REL24 out of range!\n");
-			return -EINVAL;
-		}
+		op = create_branch((unsigned int *)ip, addr, BRANCH_SET_LINK);
+		PATCH_INSN_OR_GOTO(ip, op, patch_err);
 
 		return 0;
 	}
@@ -776,17 +799,18 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (!create_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
+	op = create_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK);
+	if (!op) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
 
-	if (patch_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("REL24 out of range!\n");
-		return -EINVAL;
-	}
+	PATCH_INSN_OR_GOTO(ip, op, patch_err);
 
 	return 0;
+
+patch_err:
+	return -EPERM;
 }
 #endif
 
-- 
2.25.1

