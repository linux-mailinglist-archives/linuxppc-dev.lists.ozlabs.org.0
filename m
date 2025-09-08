Return-Path: <linuxppc-dev+bounces-11890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8EB49B6A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 23:04:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLKFJ6rrsz3bpS;
	Tue,  9 Sep 2025 07:04:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757365444;
	cv=none; b=UXRVoTcUczRsuQVrtlG4ry4WWJVZR5kn3N7kUpT+ezlZTTxOrsXGUwt6NTHbvJyKQycLXcNuQtQw/zVSdJ0gRvV1nHZzw9eU9dyaFhELVQ98IW1yyTJ41UUANU+lcGejobVzUg9IUCnIuZXr6vxz4OZApQd/D+cZJsX85i9PxRyAXCidHSIKhc/7Bx0VEWjFQAMSO6YhflSJPheAHjQ4cTm9CNOslbC7DOL48bmhRo967CcQvttHlDkNnkbcobYGYOAWEyqdoRXQzzxCkpDPK7ZCjG12oyEh9BUP51kxDgTs5sWqI+j4KnmZ9ohUKb3nEfMMOA4C/DuFaVd+aV79IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757365444; c=relaxed/relaxed;
	bh=qlXCMbQkDWBpT22TQmobxOlx/c7Ew9Xr8RGpNdOvAaY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWp53NZMGzxvaxTk+2hNhUHgUduleB9IzAvZjNbwWjPLw2+MHeX6FQfMq22K5lRkl9JV2pQzMPLhxvb2Cqv9bUQd3uoP1eZvM7ZIffxbE3FSfoeTkxL/Lq44aGSH9f3uQmZuATmRLLZ8dK0JvOocIKn5e5bxCpVSol4WvEZ0fbZ2VG/tCCRtXn/5ikGbq2Jzf53K+vBR9zS0A3OEseoNB272FK3lvBiEu28HoTv4ByWPlnTq9QegqoZtCWr0w0G2gp8MK6w528iO5jraf2fzH9P3AR8Hzxgm3NQZzxrMpE8Pmw99bOnElAtSKGOTXZG1/TnwVk/MRLeCXJ9wv27TUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e7AjXVQ1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e7AjXVQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLKFJ1nrsz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 07:04:04 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588KWuOU015917;
	Mon, 8 Sep 2025 21:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qlXCMbQkDWBpT22TQ
	mobxOlx/c7Ew9Xr8RGpNdOvAaY=; b=e7AjXVQ1EyoO5jSkJBtsHvqtcwq9gN6Pg
	smPPvqanDql1lua+5wYlmQxRzsmfkhfeDRl+fgoxAcyoy/BSCMW5GDhKyTYwGWO6
	cGM7dYPR/WMVsF3VTFvDr+uqRmRVJppQz4JaRxWkuHan31AAsa56j2rQxSWDyhs0
	dYXdbqJDQOajEMbpuk228dl2x4mVXAKOrvrXK/hjak05G4zvWsUJCrOwLSiRaK26
	43uDNdb6fQg/D8EOYbN6x3OYDOjH1mLP5DzwL3AKJw7EO7O3TpQ6fZVJVX9GjmR9
	w5dum6hAaeik+NPXfMSNM0lsM32Qy8M2mtBgHx77T7jjnh4mvd9Vw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff3ynj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:03:40 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 588L3eij000377;
	Mon, 8 Sep 2025 21:03:40 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cff3ynf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:03:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 588KjSFW007895;
	Mon, 8 Sep 2025 21:03:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109pfy02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:03:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 588L3YtL42533132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 21:03:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F89B20040;
	Mon,  8 Sep 2025 21:03:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C080820049;
	Mon,  8 Sep 2025 21:03:26 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.29.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 21:03:26 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        deller@gmx.de, ldv@strace.io, macro@orcam.me.uk, charlie@rivosinc.com,
        akpm@linux-foundation.org, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, sshegde@linux.ibm.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC V2 1/8] powerpc: rename arch_irq_disabled_regs
Date: Tue,  9 Sep 2025 02:32:29 +0530
Message-ID: <20250908210235.137300-3-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908210235.137300-2-mchauras@linux.ibm.com>
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 5pLbNry8nW0-OX01XJbnUhyjktixOS9h
X-Proofpoint-GUID: JBFYkRnzM7nOfj4G31_970P1CusF0Jia
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68bf44ad cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=8txWmKPpaVdEF_iBmVcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX3W6qPUp92bDi
 wjJISJITvFP6DBsaejXfMCg5NZ6dX6xmHlBt/+fRX043JeqNHTtBIGFpxO2gdAq26a3kEx6gupe
 9sevyEE1bFeoTiJTs0kuqbygm0lMUsbFfFhmwWuWfvFl1LtLpWqYQEpv4dLpyMcELSJzBfgnA6m
 8i8Lp5ZUtw+3SPywAJaMX/Eo51V6OhTZo63ns8QKP1XJmSxxQyuoScYjNkBtnE6SCp5B1qjrmpT
 KOBYh1LS2MS0OLNtDhCUZKRaRFGDP2hT7nuX3kCM24FyUc3CRXvH+jKaIvSdZq+SR7G2OMJYTcP
 2ber6S7iN97SsxHYXwoV6nyTAmbvOkymn5VKBNGXqVROebpwO23d6eTzVvnmzrOPcbrB3FG7mwU
 h2Z/QX8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Renaming arch_irq_disabled_regs to regs_irqs_disabled to be used
commonly in generic entry exit framework and ppc arch code.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_irq.h    |  4 ++--
 arch/powerpc/include/asm/interrupt.h | 12 ++++++------
 arch/powerpc/kernel/interrupt.c      |  4 ++--
 arch/powerpc/kernel/syscall.c        |  2 +-
 arch/powerpc/kernel/traps.c          |  2 +-
 arch/powerpc/kernel/watchdog.c       |  2 +-
 arch/powerpc/perf/core-book3s.c      |  2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 569ac1165b069..2b9cf0380e0e9 100644
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
index 23638d4e73ac0..56bc8113b8cde 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -172,7 +172,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
 #endif
 
-	if (!arch_irq_disabled_regs(regs))
+	if (!regs_irqs_disabled(regs))
 		trace_hardirqs_off();
 
 	if (user_mode(regs)) {
@@ -192,10 +192,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 			CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
 				   ct_state() != CT_STATE_IDLE);
 		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
-		INT_SOFT_MASK_BUG_ON(regs, arch_irq_disabled_regs(regs) &&
+		INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
 					   search_kernel_restart_table(regs->nip));
 	}
-	INT_SOFT_MASK_BUG_ON(regs, !arch_irq_disabled_regs(regs) &&
+	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
 				   !(regs->msr & MSR_EE));
 
 	booke_restore_dbcr0();
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
index e0c681d0b0763..0d8fd47049a19 100644
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
index be159ad4b77bd..9f03a6263fb41 100644
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
index cb8e9357383e9..629f2a2d4780e 100644
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
index 2429cb1c7baa7..6111cbbde069d 100644
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
index 8b0081441f85d..f7518b7e30554 100644
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
2.51.0


