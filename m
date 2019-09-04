Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E29A7A7F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 06:59:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NWnm0Vx9zDqjY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:59:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gromero@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NWjk6C2bzDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 14:55:54 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x844qFHE038506; Wed, 4 Sep 2019 00:55:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ut5vw18x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 00:55:49 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x844sjxM043270;
 Wed, 4 Sep 2019 00:55:49 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ut5vw18wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 00:55:48 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x844t8Lw015332;
 Wed, 4 Sep 2019 04:55:47 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 2us9fn0ukg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 04:55:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x844tl3B53608802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 04:55:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D1BCAC05F;
 Wed,  4 Sep 2019 04:55:47 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 772E2AC05B;
 Wed,  4 Sep 2019 04:55:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.235.180])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 04:55:44 +0000 (GMT)
From: gromero <gromero@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mikey@neuling.org
Subject: [PATCH v2 2/3] powerpc/tm: Fix restoring FP/VMX facility incorrectly
 on interrupts
Date: Wed,  4 Sep 2019 00:55:28 -0400
Message-Id: <20190904045529.23002-2-gromero@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190904045529.23002-1-gromero@linux.vnet.ibm.com>
References: <20190903044718.13773-1-mikey@neuling.org>
 <20190904045529.23002-1-gromero@linux.vnet.ibm.com>
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

When in userspace and MSR FP=0 the hardware FP state is unrelated to
the current process. This is extended for transactions where if tbegin
is run with FP=0, the hardware checkpoint FP state will also be
unrelated to the current process. Due to this, we need to ensure this
hardware checkpoint is updated with the correct state before we enable
FP for this process.

Unfortunately we get this wrong when returning to a process from a
hardware interrupt. A process that starts a transaction with FP=0 can
take an interrupt. When the kernel returns back to that process, we
change to FP=1 but with hardware checkpoint FP state not updated. If
this transaction is then rolled back, the FP registers now contain the
wrong state.

The process looks like this:
   Userspace:                      Kernel

               Start userspace
                with MSR FP=0 TM=1
                  < -----
   ...
   tbegin
   bne
               Hardware interrupt
                   ---- >
                                    <do_IRQ...>
                                    ....
                                    ret_from_except
                                      restore_math()
				        /* sees FP=0 */
                                        restore_fp()
                                          tm_active_with_fp()
					    /* sees FP=1 (Incorrect) */
                                          load_fp_state()
                                        FP = 0 -> 1
                  < -----
               Return to userspace
                 with MSR TM=1 FP=1
                 with junk in the FP TM checkpoint
   TM rollback
   reads FP junk

When returning from the hardware exception, tm_active_with_fp() is
incorrectly making restore_fp() call load_fp_state() which is setting
FP=1.

The fix is to remove tm_active_with_fp().

tm_active_with_fp() is attempting to handle the case where FP state
has been changed inside a transaction. In this case the checkpointed
and transactional FP state is different and hence we must restore the
FP state (ie. we can't do lazy FP restore inside a transaction that's
used FP). It's safe to remove tm_active_with_fp() as this case is
handled by restore_tm_state(). restore_tm_state() detects if FP has
been using inside a transaction and will set load_fp and call
restore_math() to ensure the FP state (checkpoint and transaction) is
restored.

This is a data integrity problem for the current process as the FP
registers are corrupted. It's also a security problem as the FP
registers from one process may be leaked to another.

Similarly for VMX.

A simple testcase to replicate this will be posted to
tools/testing/selftests/powerpc/tm/tm-poison.c

This fixes CVE-2019-15031.

Fixes: a7771176b439 ("powerpc: Don't enable FP/Altivec if not checkpointed")
Cc: stable@vger.kernel.org # 4.15+
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/process.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 437b57068cf8..7a84c9f1778e 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -101,21 +101,8 @@ static void check_if_tm_restore_required(struct task_struct *tsk)
 	}
 }
 
-static bool tm_active_with_fp(struct task_struct *tsk)
-{
-	return MSR_TM_ACTIVE(tsk->thread.regs->msr) &&
-		(tsk->thread.ckpt_regs.msr & MSR_FP);
-}
-
-static bool tm_active_with_altivec(struct task_struct *tsk)
-{
-	return MSR_TM_ACTIVE(tsk->thread.regs->msr) &&
-		(tsk->thread.ckpt_regs.msr & MSR_VEC);
-}
 #else
 static inline void check_if_tm_restore_required(struct task_struct *tsk) { }
-static inline bool tm_active_with_fp(struct task_struct *tsk) { return false; }
-static inline bool tm_active_with_altivec(struct task_struct *tsk) { return false; }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 bool strict_msr_control;
@@ -252,7 +239,7 @@ EXPORT_SYMBOL(enable_kernel_fp);
 
 static int restore_fp(struct task_struct *tsk)
 {
-	if (tsk->thread.load_fp || tm_active_with_fp(tsk)) {
+	if (tsk->thread.load_fp) {
 		load_fp_state(&current->thread.fp_state);
 		current->thread.load_fp++;
 		return 1;
@@ -334,8 +321,7 @@ EXPORT_SYMBOL_GPL(flush_altivec_to_thread);
 
 static int restore_altivec(struct task_struct *tsk)
 {
-	if (cpu_has_feature(CPU_FTR_ALTIVEC) &&
-		(tsk->thread.load_vec || tm_active_with_altivec(tsk))) {
+	if (cpu_has_feature(CPU_FTR_ALTIVEC) && (tsk->thread.load_vec)) {
 		load_vr_state(&tsk->thread.vr_state);
 		tsk->thread.used_vr = 1;
 		tsk->thread.load_vec++;
-- 
2.17.2

