Return-Path: <linuxppc-dev+bounces-14746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9CCBBACF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:04:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1K57TDz2yFg;
	Mon, 15 Dec 2025 00:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717477;
	cv=none; b=oWXZjq8uxMSVxye/Cz8L8qVh9W/Z/1MxN3IenCDe3TIGmgyOhxFTwMesFp4c/0UghZg4Jffw82H928pfzzJbbqaL87gjiGboNsofKbQj3PfnZNpadoyPxZc0osXNh+UCob9eJYhevNdzzKgWuWl7O7KTga5A34qoNRoqLemvbv47rgbqeTyKoQqCpPWuoBYI1hgLJLTVPImBfASHO38KfBFu3s87IxRmSo9N75eLTWS95CAekuc3zzEGfDFHSVo2XCOT+30nWAJzUgXXqdJTCwOyiYe+p3qfoI7he0MUzquiXdUk9No0gbSJ9ivqcXtOQ96ORKT+vEPUthdQbo97RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717477; c=relaxed/relaxed;
	bh=FZ2IueKfjc+kVKAVvPE/dhFI9dU/rajb2XDRL4AhFXk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+iKoxvCWFbsm4la0v4Wj7uxgvfo90Bbl3RHSeB+74KWWvxhXJodHLE1gLQGTb4Kvh9xRbQIlomqZAEDiG/AxOSSCPWQUN9/KKfQQfWuSLeJDbe13vTGGiKPy0+uyqWFR8W2DFZBo6d9Y3s2X6FSgBEUK0vUjedb40ZjP4SQgZQuwL2f0xWlhr+JGylEUeD8kM9bL+k4UlrB1hyUrfBE74A1U/7FTv1kR3Q1bwKOmjbDQ4FSQXOGSQsHqoM1usH+zMrUSJGYv6jFSXmriNsHcSD+L3jCBcYUQK3om3PIsFBzrQcoG6Sk1JaJ6sM6g9/bUCa0i0qnx5oMxjry3C9kUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M7nQts+y; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M7nQts+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1J0yXvz2xnl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:04:35 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BDKn6O9019019;
	Sun, 14 Dec 2025 13:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FZ2IueKfjc+kVKAVv
	PE/dhFI9dU/rajb2XDRL4AhFXk=; b=M7nQts+y8MOpjOINpSF/GoTFNZURDNfff
	BRIgYyGG29oS8CyMAPtVSFV85uO3AJu6CUiwDsOxOcEPq/IyiYzsMyby6IQH2Ore
	JjcLnBPA6E+oDu/BhBgFpTzbHmGRo5zxbDh4/1ZotBx8brvc8YAjV9LXVqh5+IhB
	Fb5sIPGs06GftZftQ6hyOSFK/WlBhjL6RQ7g+sav49j4xle3s1osoefK9BmKFbLS
	OWIDYgQba4XcvpF4+TT5A8AnpUTcvTUCYNm0rxXnJGJYA9SSzj6m3enRSf1g0Aev
	P8SmLNHpuGSbT1WYwJRG4nsEqUnVSMgV+93P2pK9LKzKFJLM2Yx8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvawntc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED07VP032014;
	Sun, 14 Dec 2025 13:03:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvawnt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BEAKAH6026761;
	Sun, 14 Dec 2025 13:03:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfs263g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED3ieP53477824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:03:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D424E20040;
	Sun, 14 Dec 2025 13:03:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42F8E20043;
	Sun, 14 Dec 2025 13:03:38 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:03:38 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] powerpc: rename arch_irq_disabled_regs
Date: Sun, 14 Dec 2025 18:32:37 +0530
Message-ID: <20251214130245.43664-2-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214130245.43664-1-mkchauras@linux.ibm.com>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=V/JwEOni c=1 sm=1 tr=0 ts=693eb5b6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=8txWmKPpaVdEF_iBmVcA:9
X-Proofpoint-GUID: nOtvlvCYQ1mM4l2BIZKwbAbgfsGhUPgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXxHlQlHZP611L
 Jkxri/FOrGx4HTcP5qhYAwCqDluNSqApA09cf+HUgSPrGt6qgu54b85a8cwGRk8XN73KJbCFkEz
 3mzuABf6aruPHCoU6XoZXsUmQPqjN/f0GmjnhvqhSABda/iHO1aXnHkMpcniMe2tlITcyzUzR/z
 70bPQljm6oMupeJp2Shj5uMcLM5LL+GoUmo1rjpHXLQffvA3lK64ZZtGnZTzuz7LeUUjCbxG62f
 7wV1oKYpq81hmamNCTKvTm0MwPaBgZxAPEEXu+X5EJ3rEBeg2YJ0tcVyBBpIkviUF50+bdBc6rY
 F0EO/uEodXweOPiLZdXPov3ar/OZtuBsm5AL0xMxQe3ECZBRuKOv3i6CyVSv2d/KB2CBDVy+Fo1
 Nt8zsaXvoKflMn+2CYKMPVJ6dHmeYQ==
X-Proofpoint-ORIG-GUID: 9aeGBx41lxahiGOT8rMQ31JC7RO2Gapj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
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
index e0c681d0b076..0d8fd47049a1 100644
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


