Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C181B5F59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 17:34:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497LvR4KgRzDqnc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 01:34:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497LMS2cWwzDr1F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:10:12 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NF3hJJ065605; Thu, 23 Apr 2020 11:09:40 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30k09wqrxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 11:09:40 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03NF6Fdu017128;
 Thu, 23 Apr 2020 15:09:37 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 30fs6582n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 15:09:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03NF9ZO750921924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 15:09:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32565AE051;
 Thu, 23 Apr 2020 15:09:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3230AE055;
 Thu, 23 Apr 2020 15:09:33 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.73.158])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 15:09:33 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/ftrace: Simplify error checking when patching
 instructions
Date: Thu, 23 Apr 2020 20:39:03 +0530
Message-Id: <872c5c3d9cf6db8e52b2abcdd16d7ab61fce8070.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_10:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=1 phishscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Introduce a macro PATCH_INSN() to simplify instruction patching, and to
make the error messages more uniform and useful:
- print an error message that includes the original return value
- print the function name and line numbers, so that the offending
  location is clear
- always return -EPERM, which ftrace_bug() expects for proper error
  handling

Also eliminate use of patch_branch() since most such uses already call
create_branch() for error checking before patching. Instead, use the
return value from create_branch() with PATCH_INSN().

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 69 ++++++++++++++----------------
 1 file changed, 33 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7ea0ca044b65..5cf84c0c64cb 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -31,6 +31,17 @@
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
+#define PATCH_INSN(addr, instr)						     \
+do {									     \
+	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
+	if (rc) {							     \
+		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
+				__func__, __LINE__,			     \
+				(void *)(addr), (void *)(addr), rc);	     \
+		return -EPERM;						     \
+	}								     \
+} while (0)
+
 /*
  * We generally only have a single long_branch tramp and at most 2 or 3 plt
  * tramps generated. But, we don't use the plt tramps currently. We also allot
@@ -78,8 +89,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
 	}
 
 	/* replace the text with the new text */
-	if (patch_instruction((unsigned int *)ip, new))
-		return -EPERM;
+	PATCH_INSN(ip, new);
 
 	return 0;
 }
@@ -204,10 +214,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
 
-	if (patch_instruction((unsigned int *)ip, pop)) {
-		pr_err("Patching NOP failed.\n");
-		return -EPERM;
-	}
+	PATCH_INSN(ip, pop);
 
 	return 0;
 }
@@ -276,8 +283,7 @@ __ftrace_make_nop(struct module *mod,
 
 	op = PPC_INST_NOP;
 
-	if (patch_instruction((unsigned int *)ip, op))
-		return -EPERM;
+	PATCH_INSN(ip, op);
 
 	return 0;
 }
@@ -322,7 +328,7 @@ static int add_ftrace_tramp(unsigned long tramp)
  */
 static int setup_mcount_compiler_tramp(unsigned long tramp)
 {
-	int i, op;
+	unsigned int i, op;
 	unsigned long ptr;
 	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
 
@@ -366,16 +372,14 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
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
+	PATCH_INSN(tramp, op);
 
 	if (add_ftrace_tramp(tramp)) {
 		pr_debug("No tramp locations left\n");
@@ -416,10 +420,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		}
 	}
 
-	if (patch_instruction((unsigned int *)ip, PPC_INST_NOP)) {
-		pr_err("Patching NOP failed.\n");
-		return -EPERM;
-	}
+	PATCH_INSN(ip, PPC_INST_NOP);
 
 	return 0;
 }
@@ -557,15 +558,13 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
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
+	PATCH_INSN(ip, op[0]);
 
 	return 0;
 }
@@ -603,8 +602,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	pr_devel("write to %lx\n", rec->ip);
 
-	if (patch_instruction((unsigned int *)ip, op))
-		return -EPERM;
+	PATCH_INSN(ip, op);
 
 	return 0;
 }
@@ -650,11 +648,14 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("Error patching branch to ftrace tramp!\n");
+	op = create_branch(ip, tramp, BRANCH_SET_LINK);
+	if (!op) {
+		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
 
+	PATCH_INSN(ip, op);
+
 	return 0;
 }
 
@@ -748,10 +749,8 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	/* The new target may be within range */
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
-		if (patch_branch((unsigned int *)ip, addr, BRANCH_SET_LINK)) {
-			pr_err("REL24 out of range!\n");
-			return -EINVAL;
-		}
+		op = create_branch((unsigned int *)ip, addr, BRANCH_SET_LINK);
+		PATCH_INSN(ip, op);
 
 		return 0;
 	}
@@ -776,15 +775,13 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
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
+	PATCH_INSN(ip, op);
 
 	return 0;
 }
-- 
2.25.1

