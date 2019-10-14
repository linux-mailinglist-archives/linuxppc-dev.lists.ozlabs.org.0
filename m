Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B01D63A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 15:19:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sK0N4j9ZzDq9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 00:19:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sJfr75ZMzDqhk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 00:04:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ED2BM6060973
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 09:04:14 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vms6es1mh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 09:04:14 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 14 Oct 2019 14:04:12 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 14 Oct 2019 14:04:10 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ED49r651707948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 13:04:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 631A44C05C;
 Mon, 14 Oct 2019 13:04:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96B9A4C040;
 Mon, 14 Oct 2019 13:04:06 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Oct 2019 13:04:06 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: christophe.leroy@c-s.fr, mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 4/7] Powerpc/Watchpoint: Don't ignore extraneous exceptions
 blindly
Date: Mon, 14 Oct 2019 18:33:43 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014130346.22660-1-ravi.bangoria@linux.ibm.com>
References: <20191014130346.22660-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101413-0020-0000-0000-00000378EEA3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101413-0021-0000-0000-000021CF0702
Message-Id: <20191014130346.22660-5-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910140126
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Powerpc, watchpoint match range is double-word granular. On a
watchpoint hit, DAR is set to the first byte of overlap between
actual access and watched range. And thus it's quite possible that
DAR does not point inside user specified range. Ex, say user creates
a watchpoint with address range 0x1004 to 0x1007. So hw would be
configured to watch from 0x1000 to 0x1007. If there is a 4 byte
access from 0x1002 to 0x1005, DAR will point to 0x1002 and thus
interrupt handler considers it as extraneous, but it's actually not,
because part of the access belongs to what user has asked.

Instead of blindly ignoring the exception, get actual address range
by analysing an instruction, and ignore only if actual range does
not overlap with user specified range.

Note: The behavior is unchanged for 8xx.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 52 +++++++++++++++++------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f36274d426ed..58ce3d37c2a3 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -222,33 +222,49 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 	tsk->thread.last_hit_ubp = NULL;
 }
 
-static bool is_larx_stcx_instr(struct pt_regs *regs, unsigned int instr)
+static bool dar_within_range(unsigned long dar, struct arch_hw_breakpoint *info)
 {
-	int ret, type;
-	struct instruction_op op;
+	return ((info->address <= dar) && (dar - info->address < info->len));
+}
 
-	ret = analyse_instr(&op, regs, instr);
-	type = GETTYPE(op.type);
-	return (!ret && (type == LARX || type == STCX));
+static bool
+dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
+{
+	return ((dar <= info->address + info->len - 1) &&
+		(dar + size - 1 >= info->address));
 }
 
 /*
  * Handle debug exception notifications.
  */
 static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
-			     unsigned long addr)
+			     struct arch_hw_breakpoint *info)
 {
 	unsigned int instr = 0;
+	int ret, type, size;
+	struct instruction_op op;
+	unsigned long addr = info->address;
 
 	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
 		goto fail;
 
-	if (is_larx_stcx_instr(regs, instr)) {
+	ret = analyse_instr(&op, regs, instr);
+	type = GETTYPE(op.type);
+	size = GETSIZE(op.type);
+
+	if (!ret && (type == LARX || type == STCX)) {
 		printk_ratelimited("Breakpoint hit on instruction that can't be emulated."
 				   " Breakpoint at 0x%lx will be disabled.\n", addr);
 		goto disable;
 	}
 
+	/*
+	 * If it's extraneous event, we still need to emulate/single-
+	 * step the instruction, but we don't generate an event.
+	 */
+	if (size && !dar_range_overlaps(regs->dar, size, info))
+		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+
 	/* Do not emulate user-space instructions, instead single-step them */
 	if (user_mode(regs)) {
 		current->thread.last_hit_ubp = bp;
@@ -280,7 +296,6 @@ int hw_breakpoint_handler(struct die_args *args)
 	struct perf_event *bp;
 	struct pt_regs *regs = args->regs;
 	struct arch_hw_breakpoint *info;
-	unsigned long dar = regs->dar;
 
 	/* Disable breakpoints during exception handling */
 	hw_breakpoint_disable();
@@ -312,19 +327,14 @@ int hw_breakpoint_handler(struct die_args *args)
 		goto out;
 	}
 
-	/*
-	 * Verify if dar lies within the address range occupied by the symbol
-	 * being watched to filter extraneous exceptions.  If it doesn't,
-	 * we still need to single-step the instruction, but we don't
-	 * generate an event.
-	 */
 	info->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
-	if (!((bp->attr.bp_addr <= dar) &&
-	      (dar - bp->attr.bp_addr < bp->attr.bp_len)))
-		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
-
-	if (!IS_ENABLED(CONFIG_PPC_8xx) && !stepping_handler(regs, bp, info->address))
-		goto out;
+	if (IS_ENABLED(CONFIG_PPC_8xx)) {
+		if (!dar_within_range(regs->dar, info))
+			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+	} else {
+		if (!stepping_handler(regs, bp, info))
+			goto out;
+	}
 
 	/*
 	 * As a policy, the callback is invoked in a 'trigger-after-execute'
-- 
2.21.0

