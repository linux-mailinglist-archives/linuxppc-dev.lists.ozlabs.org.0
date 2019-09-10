Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C98AE826
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 12:31:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SLsw5GxpzDrg7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 20:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SLl22h7tzDrPs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 20:25:18 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8AAIGtA088629
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 06:25:15 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux9g49522-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 06:25:15 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 10 Sep 2019 11:25:12 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 11:25:10 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8AAP9Bo45875212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 10:25:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B95252051;
 Tue, 10 Sep 2019 10:25:09 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.54.190])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D35F152050;
 Tue, 10 Sep 2019 10:24:55 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH 1/2] powerpc/hw_breakpoint: move instruction stepping out of
 hw_breakpoint_handler()
Date: Tue, 10 Sep 2019 15:54:21 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910102422.23233-1-ravi.bangoria@linux.ibm.com>
References: <20190910102422.23233-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091010-4275-0000-0000-00000363E6E7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091010-4276-0000-0000-000038763A85
Message-Id: <20190910102422.23233-2-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100105
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
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

On 8xx, breakpoints stop after executing the instruction, so
stepping/emulation is not needed. Move it into a sub-function and
remove the #ifdefs.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 60 ++++++++++++++++-------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index c8d1fa2e9d53..28ad3171bb82 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -198,15 +198,43 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 /*
  * Handle debug exception notifications.
  */
+static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
+			     unsigned long addr)
+{
+	int stepped;
+	unsigned int instr;
+
+	/* Do not emulate user-space instructions, instead single-step them */
+	if (user_mode(regs)) {
+		current->thread.last_hit_ubp = bp;
+		regs->msr |= MSR_SE;
+		return false;
+	}
+
+	stepped = 0;
+	instr = 0;
+	if (!__get_user_inatomic(instr, (unsigned int *)regs->nip))
+		stepped = emulate_step(regs, instr);
+
+	/*
+	 * emulate_step() could not execute it. We've failed in reliably
+	 * handling the hw-breakpoint. Unregister it and throw a warning
+	 * message to let the user know about it.
+	 */
+	if (!stepped) {
+		WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
+			"0x%lx will be disabled.", addr);
+		perf_event_disable_inatomic(bp);
+		return false;
+	}
+	return true;
+}
+
 int hw_breakpoint_handler(struct die_args *args)
 {
 	int rc = NOTIFY_STOP;
 	struct perf_event *bp;
 	struct pt_regs *regs = args->regs;
-#ifndef CONFIG_PPC_8xx
-	int stepped = 1;
-	unsigned int instr;
-#endif
 	struct arch_hw_breakpoint *info;
 	unsigned long dar = regs->dar;
 
@@ -251,31 +279,9 @@ int hw_breakpoint_handler(struct die_args *args)
 	      (dar - bp->attr.bp_addr < bp->attr.bp_len)))
 		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
 
-#ifndef CONFIG_PPC_8xx
-	/* Do not emulate user-space instructions, instead single-step them */
-	if (user_mode(regs)) {
-		current->thread.last_hit_ubp = bp;
-		regs->msr |= MSR_SE;
+	if (!IS_ENABLED(CONFIG_PPC_8xx) && !stepping_handler(regs, bp, info->address))
 		goto out;
-	}
-
-	stepped = 0;
-	instr = 0;
-	if (!__get_user_inatomic(instr, (unsigned int *) regs->nip))
-		stepped = emulate_step(regs, instr);
 
-	/*
-	 * emulate_step() could not execute it. We've failed in reliably
-	 * handling the hw-breakpoint. Unregister it and throw a warning
-	 * message to let the user know about it.
-	 */
-	if (!stepped) {
-		WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
-			"0x%lx will be disabled.", info->address);
-		perf_event_disable_inatomic(bp);
-		goto out;
-	}
-#endif
 	/*
 	 * As a policy, the callback is invoked in a 'trigger-after-execute'
 	 * fashion
-- 
2.21.0

