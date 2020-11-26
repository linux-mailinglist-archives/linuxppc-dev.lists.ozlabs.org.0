Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08662C5C0B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:31:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmYK0RlkzDrZZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:31:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r1mxnto1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm5B1SfHzDrN1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:10:21 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI3Frt126777; Thu, 26 Nov 2020 13:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5C45SA8tSbg7iyu0298Eb4LClwalZRJYloG1JYXsk2g=;
 b=r1mxnto1kTQkjl7wivJ0IOBO7iITF4QMHFSS+pwO8LHRGXnko7J50J+3xVgtb9FEC79Y
 eXZTdQEJI4+mOkZSdIUtj1uL4JUP+cF+xr2ik0O+33dTHM/rW9YbdS+wW6PcpqDdQ/hD
 1eiV4zs8cT0iJLJHj3jhn80Yg9U7wcOYOZdGeWFyF1giT/QL7hN+zZ4sVMyLIdRfcxPF
 GEVSurljFHkIHDk9BAwxYOSLU4ldCEqmVezNrP2Bj1Bjc9tW95TYl+2vuXhHPGpr1P0X
 aytH+t4+3glqaMsWGaIqSuIpSO7/wgN7zSzHy3U1WXhLGgq4Qp/h/d0Li9Cj5aA7+Ucj XQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 352gu48s01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:46 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI6hoG031786;
 Thu, 26 Nov 2020 18:09:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 352ata06n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9g1v4325982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4614A4054;
 Thu, 26 Nov 2020 18:09:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 095D1A405B;
 Thu, 26 Nov 2020 18:09:41 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:40 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 10/14] powerpc/ftrace: Drop assumptions about ftrace
 trampoline target
Date: Thu, 26 Nov 2020 23:38:47 +0530
Message-Id: <0ed4e63f6b3be1abdd59aa7b28a5dbdb99baeba1.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
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
 malwarescore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

We currently assume that ftrace locations are patched to go to either
ftrace_caller or ftrace_regs_caller. Drop this assumption in preparation
for supporting ftrace direct calls.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace.c | 107 +++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7ddb6e4b527c39..fcb21a9756e456 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -322,14 +322,15 @@ static int add_ftrace_tramp(unsigned long tramp, unsigned long target)
  */
 static int setup_mcount_compiler_tramp(unsigned long tramp)
 {
+	int i;
 	struct ppc_inst op;
 	struct ppc_inst instr;
 	struct ppc_ftrace_stub_data *stub;
 	unsigned long ptr, ftrace_target = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
 
-	/* Is this a known long jump tramp? */
-	hash_for_each_possible(ppc_ftrace_stubs, stub, hentry, ftrace_target)
-		if (stub->target == ftrace_target && stub->addr == tramp)
+	/* Is this a known tramp? */
+	hash_for_each(ppc_ftrace_stubs, i, stub, hentry)
+		if (stub->addr == tramp)
 			return 0;
 
 	/* New trampoline -- read where this goes */
@@ -608,23 +609,16 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 {
 	struct ppc_inst op;
 	void *ip = (void *)rec->ip;
-	unsigned long tramp, entry, ptr;
+	unsigned long tramp, ptr;
 
-	/* Make sure we're being asked to patch branch to a known ftrace addr */
-	entry = ppc_global_function_entry((void *)ftrace_caller);
 	ptr = ppc_global_function_entry((void *)addr);
 
-	if (ptr != entry) {
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-		entry = ppc_global_function_entry((void *)ftrace_regs_caller);
-		if (ptr != entry) {
+	/* Make sure we branch to ftrace_regs_caller since we only setup stubs for that */
+	tramp = ppc_global_function_entry((void *)ftrace_caller);
+	if (ptr == tramp)
+		ptr = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
 #endif
-			pr_err("Unknown ftrace addr to patch: %ps\n", (void *)ptr);
-			return -EINVAL;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-		}
-#endif
-	}
 
 	/* Make sure we have a nop */
 	if (probe_kernel_read_inst(&op, ip)) {
@@ -637,7 +631,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
-	tramp = find_ftrace_tramp((unsigned long)ip, FTRACE_REGS_ADDR);
+	tramp = find_ftrace_tramp((unsigned long)ip, ptr);
 	if (!tramp) {
 		pr_err("No ftrace trampolines reachable from %ps\n", ip);
 		return -EINVAL;
@@ -783,6 +777,81 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 }
 #endif
 
+static int
+__ftrace_modify_call_kernel(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
+{
+	struct ppc_inst op;
+	unsigned long ip = rec->ip;
+	unsigned long entry, ptr, tramp;
+
+	/* read where this goes */
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
+		pr_err("Fetching opcode failed.\n");
+		return -EFAULT;
+	}
+
+	/* Make sure that this is still a 24bit jump */
+	if (!is_bl_op(op)) {
+		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
+		return -EINVAL;
+	}
+
+	/* lets find where the pointer goes */
+	tramp = find_bl_target(ip, op);
+	entry = ppc_global_function_entry((void *)old_addr);
+
+	pr_devel("ip:%lx jumps to %lx", ip, tramp);
+
+	if (tramp != entry) {
+		/* old_addr is not within range, so we must have used a trampoline */
+		struct ppc_ftrace_stub_data *stub;
+
+		hash_for_each_possible(ppc_ftrace_stubs, stub, hentry, entry)
+			if (stub->target == entry && stub->addr == tramp)
+				break;
+
+		if (stub->target != entry || stub->addr != tramp) {
+			pr_err("we don't know about the tramp at %lx!\n", tramp);
+			return -EFAULT;
+		}
+	}
+
+	/* The new target may be within range */
+	if (test_24bit_addr(ip, addr)) {
+		/* within range */
+		if (patch_branch((struct ppc_inst *)ip, addr, BRANCH_SET_LINK)) {
+			pr_err("REL24 out of range!\n");
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	ptr = ppc_global_function_entry((void *)addr);
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	/* Make sure we branch to ftrace_regs_caller since we only setup stubs for that */
+	entry = ppc_global_function_entry((void *)ftrace_caller);
+	if (ptr == entry)
+		ptr = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
+#endif
+
+	tramp = find_ftrace_tramp(ip, ptr);
+
+	if (!tramp) {
+		pr_err("Couldn't find a trampoline\n");
+		return -EFAULT;
+	}
+
+	pr_devel("trampoline %lx target %lx", tramp, ptr);
+
+	if (patch_branch((struct ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
+		pr_err("REL24 out of range!\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 			unsigned long addr)
 {
@@ -800,11 +869,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		new = ftrace_call_replace(ip, addr, 1);
 		return ftrace_modify_code(ip, old, new);
 	} else if (core_kernel_text(ip)) {
-		/*
-		 * We always patch out of range locations to go to the regs
-		 * variant, so there is nothing to do here
-		 */
-		return 0;
+		return __ftrace_modify_call_kernel(rec, old_addr, addr);
 	}
 
 #ifdef CONFIG_MODULES
-- 
2.25.4

