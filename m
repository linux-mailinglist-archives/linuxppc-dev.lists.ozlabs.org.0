Return-Path: <linuxppc-dev+bounces-15079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E151DCE5EC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 05:56:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfkSY3fJsz2xrL;
	Mon, 29 Dec 2025 15:55:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766984157;
	cv=none; b=kfq8EpkfOGZjVQmShiXwXoDhnzsnNtQ5ksQSJLeMeXJIq//tSHBWnRUnSoGRJYRAbcyZ9hf4JG7bLOIarNdjTIXM7RRcybz271RrNmkUluG5Jzn9LSuOksWmF6pqG87L8mXI6foMPMfXXOjsYftzyvrvDkkW6xJbySc2fFZ3vc9RyT208Dm3UfJk8JKmzwOFRjy/1CMTzlbYclqsZpzV9djPKlpfrPuVR61QuMZbrxWI+6rWV3lrjNEjPtzCAJXJRZ1ZxRuJ8KYBWpl61+IWj0ele0Z+aK4n5w90A9M/U7mBAUjqihXQA+9piKT5yEQ5TKpmL3FxszEa7qU5LJXB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766984157; c=relaxed/relaxed;
	bh=HqJeoKBuLdG70x5pJoKQnQKCsWU99alJSoJRMXsAqzA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL6n7PeNFv5aIhRWadhF60N8D4bg1sFoZ2PhTe2LqaACxmu53UlZAZUR00me7j+2BShexniGxT2yev6Qo8uInbKIdPflOTACAktDdez5d0t5a26hgzaj/7snVlSLe2vxLrjP8k2SMWPjh2Kny28QnIcJ3cAMfieRzLez8cGuA4szidqdGW4C1thYBh2YP1y4kjp6vyJ9joqzQyKnziK0fH20oIm/w9GXEyD0rXVGG7HXQKQFOr0a9itZ67T3bwLzmeCQk2ExW877zr8p1ON35Wnw0oYPP/Cqkhw6w32S1Aax6KTMxwc8FbLUfgbkC7DwV+wCkvRcksS6ToxQQo33zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XbNaNvm0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XbNaNvm0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfkSW708mz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 15:55:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BSNNT8g028351;
	Mon, 29 Dec 2025 04:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=HqJeoKBuLdG70x5pJ
	oKQnQKCsWU99alJSoJRMXsAqzA=; b=XbNaNvm0cK0cowhDACGfDSMS6+BTagGlf
	qZeZJwwjT/NMj5J7xJm27cCCZcdr2DUyqE3R8u2Qnssq76RUKe23Y9Lz66CGBfcm
	YWvsimuavOPa77dqqbfAkfLjZAnm6NS8jhq44P5TGKgTJnwPThCuLrW1sd/j3fMw
	FJ3tsib47kuimvoWOpwb2Akai1rZYBnrMy+uDj3bBnkLsZtYA+dTUGMLKOY3VVYb
	+C0WKkgjpg0HyLNbe125igrAMjKZpWDd2YtpvlCxc81cjr/HljDtvY5vXXIoe6IP
	wzOJugPCqprtGGuTObbUhXsOihfVDKaztzLebBTxZoX8dqaPpVp3g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vn436-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:08 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BT4t7Fo027206;
	Mon, 29 Dec 2025 04:55:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vn434-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BT20mxm026066;
	Mon, 29 Dec 2025 04:55:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4batsn3yhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BT4t2sD52822340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 04:55:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C190620043;
	Mon, 29 Dec 2025 04:55:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FFF620040;
	Mon, 29 Dec 2025 04:54:57 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.39.24.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Dec 2025 04:54:57 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, akpm@linux-foundation.org,
        macro@orcam.me.uk, deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] powerpc: rename arch_irq_disabled_regs
Date: Mon, 29 Dec 2025 10:24:09 +0530
Message-ID: <20251229045416.3193779-2-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h7vWmiOEU_qaHMhPtnEyt-vtic3RaPtA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MSBTYWx0ZWRfX/LXkJ0DPrmk9
 cwavdaJob/pkIverCFGhMewYiMdf2aPWK02ds1fxvXyt1DUqcmFkgFoHwt6K8aax/gNrujL8yPd
 osKfyLgRgja1wOxO21jZ+sfi6ehVzydhdRWDZG12qKhtQAFmzvaSc8GcjIvDr4iuCkQOkgOKwIu
 Wm6ZnnHzE93swZVl+1AjAQI/3ylex26oXWiqRCzJEI5XuPU42s29t71Lh7reARoYRlpgEnSHkFc
 w2ewAgmizN79NrwAEPAocKoF8FbnWxusKx5oZivnMYOBbr6KiUJ5dmE+2l3Nb1dIzrihd48tV0l
 B/M8NqMU2Z2aqe6p/6hSXQ6WYXgpUB4p4sJO/YRkJ5vXWjIGtak9GwcPSb/R8OL1jFBW4K9o7Cy
 waJX8HJHUHS4093LYvExCPezF2RKDEEgsSCDBKJuim4/RwJOcCJI4eDUKaOBHY+lUVCX8cp3iUB
 vvVp3SOKN4PR69FHWew==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=695209ac cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=8txWmKPpaVdEF_iBmVcA:9
X-Proofpoint-GUID: B1jN0pCuUOz7NmlrZI7yG0FSRJ7v9Yjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512290041
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Rename arch_irq_disabled_regs() to regs_irqs_disabled() to align with the
naming used in the generic irqentry framework. This makes the function
available for use both in the PowerPC architecture code and in the
common entry/exit paths shared with other architectures.

This is a preparatory change for enabling the generic irqentry framework
on PowerPC.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_irq.h    |  4 ++--
 arch/powerpc/include/asm/interrupt.h | 16 ++++++++--------
 arch/powerpc/kernel/interrupt.c      |  4 ++--
 arch/powerpc/kernel/syscall.c        |  2 +-
 arch/powerpc/kernel/traps.c          |  2 +-
 arch/powerpc/kernel/watchdog.c       |  2 +-
 arch/powerpc/perf/core-book3s.c      |  2 +-
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 1078ba88efaf..8dfe36b442a5 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -393,7 +393,7 @@ static inline void do_hard_irq_enable(void)
 	__hard_irq_enable();
 }
 
-static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
+static inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
 	return (regs->softe & IRQS_DISABLED);
 }
@@ -466,7 +466,7 @@ static inline bool arch_irqs_disabled(void)
 
 #define hard_irq_disable()		arch_local_irq_disable()
 
-static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
+static inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
 	return !(regs->msr & MSR_EE);
 }
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index eb0e4a20b818..0e2cddf8bd21 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -172,7 +172,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
 #endif
 
-	if (!arch_irq_disabled_regs(regs))
+	if (!regs_irqs_disabled(regs))
 		trace_hardirqs_off();
 
 	if (user_mode(regs)) {
@@ -192,11 +192,11 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 			CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
 				   ct_state() != CT_STATE_IDLE);
 		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
-		INT_SOFT_MASK_BUG_ON(regs, arch_irq_disabled_regs(regs) &&
-					   search_kernel_restart_table(regs->nip));
+		INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
+				     search_kernel_restart_table(regs->nip));
 	}
-	INT_SOFT_MASK_BUG_ON(regs, !arch_irq_disabled_regs(regs) &&
-				   !(regs->msr & MSR_EE));
+	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
+			     !(regs->msr & MSR_EE));
 
 	booke_restore_dbcr0();
 }
@@ -298,7 +298,7 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 		 * Adjust regs->softe to be soft-masked if it had not been
 		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
 		 * not yet set disabled), or if it was in an implicit soft
-		 * masked state. This makes arch_irq_disabled_regs(regs)
+		 * masked state. This makes regs_irqs_disabled(regs)
 		 * behave as expected.
 		 */
 		regs->softe = IRQS_ALL_DISABLED;
@@ -372,7 +372,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 
 #ifdef CONFIG_PPC64
 #ifdef CONFIG_PPC_BOOK3S
-	if (arch_irq_disabled_regs(regs)) {
+	if (regs_irqs_disabled(regs)) {
 		unsigned long rst = search_kernel_restart_table(regs->nip);
 		if (rst)
 			regs_set_return_ip(regs, rst);
@@ -661,7 +661,7 @@ void replay_soft_interrupts(void);
 
 static inline void interrupt_cond_local_irq_enable(struct pt_regs *regs)
 {
-	if (!arch_irq_disabled_regs(regs))
+	if (!regs_irqs_disabled(regs))
 		local_irq_enable();
 }
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index aea6f7e8e9c6..9ce2013e70ae 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -347,7 +347,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 	unsigned long ret;
 
 	BUG_ON(regs_is_unrecoverable(regs));
-	BUG_ON(arch_irq_disabled_regs(regs));
+	BUG_ON(regs_irqs_disabled(regs));
 	CT_WARN_ON(ct_state() == CT_STATE_USER);
 
 	/*
@@ -396,7 +396,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
 	local_irq_disable();
 
-	if (!arch_irq_disabled_regs(regs)) {
+	if (!regs_irqs_disabled(regs)) {
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index be159ad4b77b..9f03a6263fb4 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -32,7 +32,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 
 	BUG_ON(regs_is_unrecoverable(regs));
 	BUG_ON(!user_mode(regs));
-	BUG_ON(arch_irq_disabled_regs(regs));
+	BUG_ON(regs_irqs_disabled(regs));
 
 #ifdef CONFIG_PPC_PKEY
 	if (mmu_has_feature(MMU_FTR_PKEY)) {
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index cb8e9357383e..629f2a2d4780 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1956,7 +1956,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(performance_monitor_exception)
 	 * prevent hash faults on user addresses when reading callchains (and
 	 * looks better from an irq tracing perspective).
 	 */
-	if (IS_ENABLED(CONFIG_PPC64) && unlikely(arch_irq_disabled_regs(regs)))
+	if (IS_ENABLED(CONFIG_PPC64) && unlikely(regs_irqs_disabled(regs)))
 		performance_monitor_exception_nmi(regs);
 	else
 		performance_monitor_exception_async(regs);
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 2429cb1c7baa..6111cbbde069 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -373,7 +373,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 	u64 tb;
 
 	/* should only arrive from kernel, with irqs disabled */
-	WARN_ON_ONCE(!arch_irq_disabled_regs(regs));
+	WARN_ON_ONCE(!regs_irqs_disabled(regs));
 
 	if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
 		return 0;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 8b0081441f85..f7518b7e3055 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2482,7 +2482,7 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	 * will trigger a PMI after waking up from idle. Since counter values are _not_
 	 * saved/restored in idle path, can lead to below "Can't find PMC" message.
 	 */
-	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
+	if (unlikely(!found) && !regs_irqs_disabled(regs))
 		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
 
 	/*
-- 
2.52.0


