Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214AA6052
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 06:51:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MvgB4cvYzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 14:51:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mvb81466zDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 14:48:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="JFiE14M8"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 46Mvb742wvz9sN1;
 Tue,  3 Sep 2019 14:48:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1567486083;
 bh=56O+kCXt/bx3nXkVVp8ufeGXi+N1KOnytsXbuWp6W4c=;
 h=From:To:Cc:Subject:Date:From;
 b=JFiE14M8bt2kgjbx6DLIyghabJwdjSJpIZsdkIGfyrTL/gT8uPg7AUTJqPggZsMbp
 RUDVh7biWis/LhW6EcTLgz2INHhV+orc75wdO710Gl8OM8MREuB3d9vuXpdbXAbWNM
 f09ErCraw/uEpRKxHKgLori+RyvZGU7o6xbixlhyeMHV9ZxZF1IVgFct0cAZV6BFxK
 JA4hcT82d89eHpRXGC/ZjcMmVhqw9yExYuxnGGUNjz1KCD1JsLQjVkaibAjwHTytWX
 kRv0zdB/sZjkEO78+Aj+vDCTp8uclhoWRC6+deJUMTzW4MQQluhFdnadkZqBhFqhBv
 pHEJsK17RoSBg==
Received: by neuling.org (Postfix, from userid 1000)
 id 81A772A581E; Tue,  3 Sep 2019 14:48:03 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc/tm: Fix FP/VMX unavailable exceptions inside a
 transaction
Date: Tue,  3 Sep 2019 14:47:16 +1000
Message-Id: <20190903044718.13773-1-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, cyrilbur@gmail.com,
 Gustavo Romero <gromero@linux.ibm.com>
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
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8fc4de0d22..437b57068c 100644
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
2.21.0

