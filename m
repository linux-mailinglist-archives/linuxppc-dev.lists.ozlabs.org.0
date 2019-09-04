Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 798DAA7A79
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 06:57:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NWlb3P9kzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gromero@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NWjj1jVyzDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 14:55:52 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x844qRoj031130; Wed, 4 Sep 2019 00:55:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ut4r32wqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 00:55:42 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x844sPSI035165;
 Wed, 4 Sep 2019 00:55:42 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ut4r32wqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 00:55:42 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x844t9qq017264;
 Wed, 4 Sep 2019 04:55:41 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2uqgh6q0qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 04:55:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x844tfxL51183884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 04:55:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F032AC059;
 Wed,  4 Sep 2019 04:55:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC751AC05B;
 Wed,  4 Sep 2019 04:55:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.235.180])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 04:55:38 +0000 (GMT)
From: gromero <gromero@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mikey@neuling.org
Subject: [PATCH v2 1/3] powerpc/tm: Fix FP/VMX unavailable exceptions inside a
 transaction
Date: Wed,  4 Sep 2019 00:55:27 -0400
Message-Id: <20190904045529.23002-1-gromero@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190903044718.13773-1-mikey@neuling.org>
References: <20190903044718.13773-1-mikey@neuling.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040050
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
Cc: cyrilbur@gmail.com, gromero@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Gustavo Romero <gromero@linux.ibm.com>

When we take an FP unavailable exception in a transaction we have to
account for the hardware FP TM checkpointed registers being
incorrect. In this case for this process we know the current and
checkpointed FP registers must be the same (since FP wasn't used
inside the transaction) hence in the thread_struct we copy the current
FP registers to the checkpointed ones.

This copy is done in tm_reclaim_thread(). We use thread->ckpt_regs.msr
to determine if FP was on when in userspace. thread->ckpt_regs.msr
represents the state of the MSR when exiting userspace. This is setup
by check_if_tm_restore_required().

Unfortunatley there is an optimisation in giveup_all() which returns
early if tsk->thread.regs->msr (via local variable `usermsr`) has
FP=VEC=VSX=SPE=0. This optimisation means that
check_if_tm_restore_required() is not called and hence
thread->ckpt_regs.msr is not updated and will contain an old value.

This can happen if due to load_fp=255 we start a userspace process
with MSR FP=1 and then we are context switched out. In this case
thread->ckpt_regs.msr will contain FP=1. If that same process is then
context switched in and load_fp overflows, MSR will have FP=0. If that
process now enters a transaction and does an FP instruction, the FP
unavailable will not update thread->ckpt_regs.msr (the bug) and MSR
FP=1 will be retained in thread->ckpt_regs.msr.  tm_reclaim_thread()
will then not perform the required memcpy and the checkpointed FP regs
in the thread struct will contain the wrong values.

The code path for this happening is:

       Userspace:                      Kernel
                   Start userspace
                    with MSR FP/VEC/VSX/SPE=0 TM=1
                      < -----
       ...
       tbegin
       bne
       fp instruction
                   FP unavailable
                       ---- >
                                        fp_unavailable_tm()
					  tm_reclaim_current()
					    tm_reclaim_thread()
					      giveup_all()
					        return early since FP/VMX/VSX=0
						/* ckpt MSR not updated (Incorrect) */
					      tm_reclaim()
					        /* thread_struct ckpt FP regs contain junk (OK) */
                                              /* Sees ckpt MSR FP=1 (Incorrect) */
					      no memcpy() performed
					        /* thread_struct ckpt FP regs not fixed (Incorrect) */
					  tm_recheckpoint()
					     /* Put junk in hardware checkpoint FP regs */
                                         ....
                      < -----
                   Return to userspace
                     with MSR TM=1 FP=1
                     with junk in the FP TM checkpoint
       TM rollback
       reads FP junk

This is a data integrity problem for the current process as the FP
registers are corrupted. It's also a security problem as the FP
registers from one process may be leaked to another.

This patch moves up check_if_tm_restore_required() in giveup_all() to
ensure thread->ckpt_regs.msr is updated correctly.

A simple testcase to replicate this will be posted to
tools/testing/selftests/powerpc/tm/tm-poison.c

Similarly for VMX.

This fixes CVE-2019-15030.

Fixes: f48e91e87e67 ("powerpc/tm: Fix FP and VMX register corruption")
Cc: stable@vger.kernel.org # 4.12+
Signed-off-by: Gustavo Romero <gromero@linux.vnet.ibm.com>
Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8fc4de0d22b4..437b57068cf8 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -497,13 +497,14 @@ void giveup_all(struct task_struct *tsk)
 	if (!tsk->thread.regs)
 		return;
 
+	check_if_tm_restore_required(tsk);
+
 	usermsr = tsk->thread.regs->msr;
 
 	if ((usermsr & msr_all_available) == 0)
 		return;
 
 	msr_check_and_set(msr_all_available);
-	check_if_tm_restore_required(tsk);
 
 	WARN_ON((usermsr & MSR_VSX) && !((usermsr & MSR_FP) && (usermsr & MSR_VEC)));
 
-- 
2.17.2

