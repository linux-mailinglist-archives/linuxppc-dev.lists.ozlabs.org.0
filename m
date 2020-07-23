Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D974C22ABA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 11:20:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC6JK1CzWzDrLk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 19:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC62d1RlpzDr28
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 19:08:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N93JOB120586; Thu, 23 Jul 2020 05:08:46 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f23g0nx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 05:08:46 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N94IUw124825;
 Thu, 23 Jul 2020 05:08:45 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f23g0nw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 05:08:45 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N96JUB017391;
 Thu, 23 Jul 2020 09:08:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 32brq837c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 09:08:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06N97ETJ55837138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 09:07:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7D914C040;
 Thu, 23 Jul 2020 09:08:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 961774C04A;
 Thu, 23 Jul 2020 09:08:33 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.40.160])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 09:08:33 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 02/10] powerpc/watchpoint: Fix DAWR exception constraint
Date: Thu, 23 Jul 2020 14:38:05 +0530
Message-Id: <20200723090813.303838-3-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723090813.303838-1-ravi.bangoria@linux.ibm.com>
References: <20200723090813.303838-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_03:2020-07-22,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230069
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, rogealve@br.ibm.com,
 miltonm@us.ibm.com, peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 jolsa@kernel.org, jniethe5@gmail.com, pedromfc@br.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pedro Miraglia Franco de Carvalho noticed that on p8/p9, DAR value is
inconsistent with different type of load/store. Like for byte,word
etc. load/stores, DAR is set to the address of the first byte of
overlap between watch range and real access. But for quadword load/
store it's sometime set to the address of the first byte of real
access whereas sometime set to the address of the first byte of
overlap. This issue has been fixed in p10. In p10(ISA 3.1), DAR is
always set to the address of the first byte of overlap. Commit 27985b2a640e
("powerpc/watchpoint: Don't ignore extraneous exceptions blindly")
wrongly assumes that DAR is set to the address of the first byte of
overlap for all load/stores on p8/p9 as well. Fix that. With the fix,
we now rely on 'ea' provided by analyse_instr(). If analyse_instr()
fails, generate event unconditionally on p8/p9, and on p10 generate
event only if DAR is within a DAWR range.

Note: 8xx is not affected.

Fixes: 27985b2a640e ("powerpc/watchpoint: Don't ignore extraneous exceptions blindly")
Fixes: 74c6881019b7 ("powerpc/watchpoint: Prepare handler to handle more than one watchpoint")
Reported-by: Pedro Miraglia Franco de Carvalho <pedromfc@br.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 72 ++++++++++++++++-------------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 031e6defc08e..a971e22aea81 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -498,11 +498,11 @@ static bool dar_in_user_range(unsigned long dar, struct arch_hw_breakpoint *info
 	return ((info->address <= dar) && (dar - info->address < info->len));
 }
 
-static bool dar_user_range_overlaps(unsigned long dar, int size,
-				    struct arch_hw_breakpoint *info)
+static bool ea_user_range_overlaps(unsigned long ea, int size,
+				   struct arch_hw_breakpoint *info)
 {
-	return ((dar < info->address + info->len) &&
-		(dar + size > info->address));
+	return ((ea < info->address + info->len) &&
+		(ea + size > info->address));
 }
 
 static bool dar_in_hw_range(unsigned long dar, struct arch_hw_breakpoint *info)
@@ -515,20 +515,22 @@ static bool dar_in_hw_range(unsigned long dar, struct arch_hw_breakpoint *info)
 	return ((hw_start_addr <= dar) && (hw_end_addr > dar));
 }
 
-static bool dar_hw_range_overlaps(unsigned long dar, int size,
-				  struct arch_hw_breakpoint *info)
+static bool ea_hw_range_overlaps(unsigned long ea, int size,
+				 struct arch_hw_breakpoint *info)
 {
 	unsigned long hw_start_addr, hw_end_addr;
 
 	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
 	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
 
-	return ((dar < hw_end_addr) && (dar + size > hw_start_addr));
+	return ((ea < hw_end_addr) && (ea + size > hw_start_addr));
 }
 
 /*
  * If hw has multiple DAWR registers, we also need to check all
  * dawrx constraint bits to confirm this is _really_ a valid event.
+ * If type is UNKNOWN, but privilege level matches, consider it as
+ * a positive match.
  */
 static bool check_dawrx_constraints(struct pt_regs *regs, int type,
 				    struct arch_hw_breakpoint *info)
@@ -553,7 +555,8 @@ static bool check_dawrx_constraints(struct pt_regs *regs, int type,
  * including extraneous exception. Otherwise return false.
  */
 static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
-			      int type, int size, struct arch_hw_breakpoint *info)
+			      unsigned long ea, int type, int size,
+			      struct arch_hw_breakpoint *info)
 {
 	bool in_user_range = dar_in_user_range(regs->dar, info);
 	bool dawrx_constraints;
@@ -569,22 +572,27 @@ static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
 	}
 
 	if (unlikely(ppc_inst_equal(instr, ppc_inst(0)))) {
-		if (in_user_range)
-			return true;
+		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
+		    !dar_in_hw_range(regs->dar, info))
+			return false;
 
-		if (dar_in_hw_range(regs->dar, info)) {
-			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
-			return true;
-		}
-		return false;
+		return true;
 	}
 
 	dawrx_constraints = check_dawrx_constraints(regs, type, info);
 
-	if (dar_user_range_overlaps(regs->dar, size, info))
+	if (type == UNKNOWN) {
+		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
+		    !dar_in_hw_range(regs->dar, info))
+			return false;
+
 		return dawrx_constraints;
+	}
 
-	if (dar_hw_range_overlaps(regs->dar, size, info)) {
+	if (ea_user_range_overlaps(ea, size, info))
+		return dawrx_constraints;
+
+	if (ea_hw_range_overlaps(ea, size, info)) {
 		if (dawrx_constraints) {
 			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
 			return true;
@@ -594,7 +602,7 @@ static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
 }
 
 static void get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
-			     int *type, int *size, bool *larx_stcx)
+			     int *type, int *size, unsigned long *ea)
 {
 	struct instruction_op op;
 
@@ -602,16 +610,18 @@ static void get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
 		return;
 
 	analyse_instr(&op, regs, *instr);
-
-	/*
-	 * Set size = 8 if analyse_instr() fails. If it's a userspace
-	 * watchpoint(valid or extraneous), we can notify user about it.
-	 * If it's a kernel watchpoint, instruction  emulation will fail
-	 * in stepping_handler() and watchpoint will be disabled.
-	 */
 	*type = GETTYPE(op.type);
-	*size = !(*type == UNKNOWN) ? GETSIZE(op.type) : 8;
-	*larx_stcx = (*type == LARX || *type == STCX);
+	*ea = op.ea;
+#ifdef __powerpc64__
+	if (!(regs->msr & MSR_64BIT))
+		*ea &= 0xffffffffUL;
+#endif
+	*size = GETSIZE(op.type);
+}
+
+static bool is_larx_stcx_instr(int type)
+{
+	return type == LARX || type == STCX;
 }
 
 /*
@@ -678,7 +688,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	struct ppc_inst instr = ppc_inst(0);
 	int type = 0;
 	int size = 0;
-	bool larx_stcx = false;
+	unsigned long ea;
 
 	/* Disable breakpoints during exception handling */
 	hw_breakpoint_disable();
@@ -692,7 +702,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	rcu_read_lock();
 
 	if (!IS_ENABLED(CONFIG_PPC_8xx))
-		get_instr_detail(regs, &instr, &type, &size, &larx_stcx);
+		get_instr_detail(regs, &instr, &type, &size, &ea);
 
 	for (i = 0; i < nr_wp_slots(); i++) {
 		bp[i] = __this_cpu_read(bp_per_reg[i]);
@@ -702,7 +712,7 @@ int hw_breakpoint_handler(struct die_args *args)
 		info[i] = counter_arch_bp(bp[i]);
 		info[i]->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
 
-		if (check_constraints(regs, instr, type, size, info[i])) {
+		if (check_constraints(regs, instr, ea, type, size, info[i])) {
 			if (!IS_ENABLED(CONFIG_PPC_8xx) &&
 			    ppc_inst_equal(instr, ppc_inst(0))) {
 				handler_error(bp[i], info[i]);
@@ -744,7 +754,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	}
 
 	if (!IS_ENABLED(CONFIG_PPC_8xx)) {
-		if (larx_stcx) {
+		if (is_larx_stcx_instr(type)) {
 			for (i = 0; i < nr_wp_slots(); i++) {
 				if (!hit[i])
 					continue;
-- 
2.26.2

