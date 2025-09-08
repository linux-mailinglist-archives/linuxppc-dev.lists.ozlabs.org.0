Return-Path: <linuxppc-dev+bounces-11893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB9B49B74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 23:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLKGV4s1qz3cYP;
	Tue,  9 Sep 2025 07:05:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757365506;
	cv=none; b=Ivl8qqQhNux/XmgsTeYqSsmaSPbg/+wSyM/8lgftqYzw4dQ5ciIxZbZ7HXCfEPYrfMx/Pxt/ZjD01qR3sVgZob3KHzfL5FD2e5bLmche11lvcSbIi2QTraVEkcUmIu5yPphDzFbNSr+kR+fiujK1qWa9Nn9SI8JVGuqH+ChGVd1J6ToKlTFr4lTJYRfST2wtdLTAEkxnYcAgK3xDjqplAw/VwK0ImiDr32GIXm+QnPLSCVgD807TQrc5crOYGxYJQJsBpgAYEmS0NTkf3N+EdbH9xl/TzNJO6uUl0cJme5maxXkE54n49PHcvjYi3xaNrcJxBryTxcpfeajKumoQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757365506; c=relaxed/relaxed;
	bh=ReXtKKKww1lLhPa5IGnlEFtq6TNJ6fpaENDSrdrrnTc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzHWxfWhCNVqEQT6D9/qhBTXJY5fAaIhwiTMTHGjthVWFXLkbWQO/0WLGlokuMR1q5f0ynvvpv/LLk49lFv3gfyyy0MQT+xB8NGwECV324c4cHt4MW8dvx9Vhs16G3+cL//RWLfnK5+zPpYx79ZfMH8wiYzKMzuGIZ44bA5pjNTT0BLjXyU/vKINa1OlX78FWj6DQQDfPCxVDyCOTmsKqud4uR31nRNSgW1JZBUmiWixtHc5OnfkzuV+lRw2NQFre3lXnARb6GtdcIE/giRPDbURqqSyBtzO8VNr5SSSPVUBWp8wZ/PXcMAqFXr/fdjigwVMxZHJ13dcOTIvSWHqkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AnYju9B5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AnYju9B5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLKGT66WSz3cYH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 07:05:05 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Hfn2Y003804;
	Mon, 8 Sep 2025 21:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ReXtKKKww1lLhPa5I
	GnlEFtq6TNJ6fpaENDSrdrrnTc=; b=AnYju9B57K3F02/BWc5H3oF0SnN+bMb+A
	Vwl3yXBUa0my3/uQle4eccUMeXb7eaIiMBu99Mtd9hvZIemOXH6V/X9uwTL1IJCf
	y6Qx8sv+7WkNUmnkTAWaFTxg+1NwSmYNd8IiRBu0JjFqbKgV3EQEFLVlq65fSj/x
	aXjjw5TP68egXPX7voAK5zrCQVRBEYGk5CExF2KFA3B6b0CE0T4vp1SjbTVNoPQp
	4Z0LpE/v7hnGzaLNQCVnqm6sC5qMdN9l4ettu3/AtKjCCGDZheZV57Vx9pPhbCqF
	kXsiNXfvM+0a6DTh4uXVm4cju3pF87QCuyrAgJvtXkNbP8Jwso6sA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycrv3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:39 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 588L1soJ014338;
	Mon, 8 Sep 2025 21:04:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycrv3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 588JpQEH011434;
	Mon, 8 Sep 2025 21:04:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9u85uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:37 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 588L4XIO44630460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 21:04:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 983782004B;
	Mon,  8 Sep 2025 21:04:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97C5320049;
	Mon,  8 Sep 2025 21:04:25 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.29.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 21:04:25 +0000 (GMT)
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
Subject: [RFC V2 4/8] powerpc: Introduce syscall exit arch functions
Date: Tue,  9 Sep 2025 02:32:32 +0530
Message-ID: <20250908210235.137300-6-mchauras@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 4Bj-9TghBmUhfEHrdvtFk5HtcJNUiDJw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX9Lga+NETD4/k
 +Ttnrl13KtsiDlDSoCxDE5MPl15Ywt4DAwxRdiHzhHlqocs6F/OnUmFf12sBa+mmQygRPF+bZLG
 dX+O6thbuaEF6+jyO18FlIHKgb9m1viZvE/k4MmHHLKw61WPGxlo0mPOxqPDV10RhVw3ljICzIo
 2wuO4T1OnIlj/I8gANcYt6MCm/S9xjrcA3irZHY5EUctNAK3aQ04OpthkpsoOA4lXRCRuQRvCS/
 JHZxPX/BtpSC5reLHzBNcx3Nktxnbq3l97p5W9GaRTgiy8fQloXqwm5KOM0XtZ+2EkCSQxWrYbi
 8/wxLfEPC4DmqC6dRYbXmq2Cl/DU8LjBSxc+rO2PD28ahlEeGXBA7HxYTKOO/R4piM2JO2nMGi/
 JZCMxxHN
X-Proofpoint-GUID: _IvYmWnV2d2YD5dXPf3gkNtGR0n2yTDz
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bf44e7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=azVfos6laG1Ide8r4ucA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introducing following functions for syscall exit
 - arch_exit_to_user_mode_work
 - arch_exit_to_user_mode_work_prepare

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 46 ++++++++++++++
 arch/powerpc/include/asm/interrupt.h    | 82 +++++++++++++++++++++++++
 arch/powerpc/kernel/interrupt.c         | 81 ------------------------
 arch/powerpc/kernel/signal.c            | 14 +++++
 4 files changed, 142 insertions(+), 81 deletions(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 49607292bf5a5..adea093274279 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -8,6 +8,7 @@
 #include <asm/cputime.h>
 #include <asm/interrupt.h>
 #include <asm/stacktrace.h>
+#include <asm/switch_to.h>
 #include <asm/tm.h>
 
 static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
@@ -101,7 +102,52 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 	}
 #endif // CONFIG_PPC_TRANSACTIONAL_MEM
 }
+
 #define arch_enter_from_user_mode arch_enter_from_user_mode
 
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+		unsigned long ti_work)
+{
+	unsigned long mathflags;
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
+		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+		    unlikely((ti_work & _TIF_RESTORE_TM))) {
+			restore_tm_state(regs);
+		} else {
+			mathflags = MSR_FP;
+
+			if (cpu_has_feature(CPU_FTR_VSX))
+				mathflags |= MSR_VEC | MSR_VSX;
+			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
+				mathflags |= MSR_VEC;
+
+			/*
+			 * If userspace MSR has all available FP bits set,
+			 * then they are live and no need to restore. If not,
+			 * it means the regs were given up and restore_math
+			 * may decide to restore them (to avoid taking an FP
+			 * fault).
+			 */
+			if ((regs->msr & mathflags) != mathflags)
+				restore_math(regs);
+		}
+	}
+
+	check_return_regs_valid(regs);
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	local_paca->tm_scratch = regs->msr;
+#endif
+}
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
+
+static __always_inline void arch_exit_to_user_mode(void)
+{
+	booke_load_dbcr0();
+
+	account_cpu_user_exit();
+}
+#define arch_exit_to_user_mode arch_exit_to_user_mode
+
 #endif /* CONFIG_GENERIC_IRQ_ENTRY */
 #endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 6edf064a0fea2..c6ab286a723f2 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -68,6 +68,8 @@
 
 #include <linux/context_tracking.h>
 #include <linux/hardirq.h>
+#include <linux/sched/debug.h> /* for show_regs */
+
 #include <asm/cputime.h>
 #include <asm/firmware.h>
 #include <asm/ftrace.h>
@@ -173,6 +175,86 @@ static inline void booke_restore_dbcr0(void)
 #endif
 }
 
+static inline void check_return_regs_valid(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	unsigned long trap, srr0, srr1;
+	static bool warned;
+	u8 *validp;
+	char *h;
+
+	if (trap_is_scv(regs))
+		return;
+
+	trap = TRAP(regs);
+	// EE in HV mode sets HSRRs like 0xea0
+	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
+		trap = 0xea0;
+
+	switch (trap) {
+	case 0x980:
+	case INTERRUPT_H_DATA_STORAGE:
+	case 0xe20:
+	case 0xe40:
+	case INTERRUPT_HMI:
+	case 0xe80:
+	case 0xea0:
+	case INTERRUPT_H_FAC_UNAVAIL:
+	case 0x1200:
+	case 0x1500:
+	case 0x1600:
+	case 0x1800:
+		validp = &local_paca->hsrr_valid;
+		if (!READ_ONCE(*validp))
+			return;
+
+		srr0 = mfspr(SPRN_HSRR0);
+		srr1 = mfspr(SPRN_HSRR1);
+		h = "H";
+
+		break;
+	default:
+		validp = &local_paca->srr_valid;
+		if (!READ_ONCE(*validp))
+			return;
+
+		srr0 = mfspr(SPRN_SRR0);
+		srr1 = mfspr(SPRN_SRR1);
+		h = "";
+		break;
+	}
+
+	if (srr0 == regs->nip && srr1 == regs->msr)
+		return;
+
+	/*
+	 * A NMI / soft-NMI interrupt may have come in after we found
+	 * srr_valid and before the SRRs are loaded. The interrupt then
+	 * comes in and clobbers SRRs and clears srr_valid. Then we load
+	 * the SRRs here and test them above and find they don't match.
+	 *
+	 * Test validity again after that, to catch such false positives.
+	 *
+	 * This test in general will have some window for false negatives
+	 * and may not catch and fix all such cases if an NMI comes in
+	 * later and clobbers SRRs without clearing srr_valid, but hopefully
+	 * such things will get caught most of the time, statistically
+	 * enough to be able to get a warning out.
+	 */
+	if (!READ_ONCE(*validp))
+		return;
+
+	if (!data_race(warned)) {
+		data_race(warned = true);
+		printk("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
+		printk("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
+		show_regs(regs);
+	}
+
+	WRITE_ONCE(*validp, 0); /* fixup */
+#endif
+}
+
 static inline void interrupt_enter_prepare(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 2a09ac5dabd62..f53d432f60870 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -4,7 +4,6 @@
 #include <linux/err.h>
 #include <linux/compat.h>
 #include <linux/rseq.h>
-#include <linux/sched/debug.h> /* for show_regs */
 
 #include <asm/kup.h>
 #include <asm/cputime.h>
@@ -78,86 +77,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 	return true;
 }
 
-static notrace void check_return_regs_valid(struct pt_regs *regs)
-{
-#ifdef CONFIG_PPC_BOOK3S_64
-	unsigned long trap, srr0, srr1;
-	static bool warned;
-	u8 *validp;
-	char *h;
-
-	if (trap_is_scv(regs))
-		return;
-
-	trap = TRAP(regs);
-	// EE in HV mode sets HSRRs like 0xea0
-	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
-		trap = 0xea0;
-
-	switch (trap) {
-	case 0x980:
-	case INTERRUPT_H_DATA_STORAGE:
-	case 0xe20:
-	case 0xe40:
-	case INTERRUPT_HMI:
-	case 0xe80:
-	case 0xea0:
-	case INTERRUPT_H_FAC_UNAVAIL:
-	case 0x1200:
-	case 0x1500:
-	case 0x1600:
-	case 0x1800:
-		validp = &local_paca->hsrr_valid;
-		if (!READ_ONCE(*validp))
-			return;
-
-		srr0 = mfspr(SPRN_HSRR0);
-		srr1 = mfspr(SPRN_HSRR1);
-		h = "H";
-
-		break;
-	default:
-		validp = &local_paca->srr_valid;
-		if (!READ_ONCE(*validp))
-			return;
-
-		srr0 = mfspr(SPRN_SRR0);
-		srr1 = mfspr(SPRN_SRR1);
-		h = "";
-		break;
-	}
-
-	if (srr0 == regs->nip && srr1 == regs->msr)
-		return;
-
-	/*
-	 * A NMI / soft-NMI interrupt may have come in after we found
-	 * srr_valid and before the SRRs are loaded. The interrupt then
-	 * comes in and clobbers SRRs and clears srr_valid. Then we load
-	 * the SRRs here and test them above and find they don't match.
-	 *
-	 * Test validity again after that, to catch such false positives.
-	 *
-	 * This test in general will have some window for false negatives
-	 * and may not catch and fix all such cases if an NMI comes in
-	 * later and clobbers SRRs without clearing srr_valid, but hopefully
-	 * such things will get caught most of the time, statistically
-	 * enough to be able to get a warning out.
-	 */
-	if (!READ_ONCE(*validp))
-		return;
-
-	if (!data_race(warned)) {
-		data_race(warned = true);
-		printk("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
-		printk("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
-		show_regs(regs);
-	}
-
-	WRITE_ONCE(*validp, 0); /* fixup */
-#endif
-}
-
 static notrace unsigned long
 interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
 {
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index aa17e62f37547..719930cf4ae1f 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -22,6 +22,11 @@
 
 #include "signal.h"
 
+/* This will be removed */
+#ifdef CONFIG_GENERIC_ENTRY
+#include <linux/entry-common.h>
+#endif /* CONFIG_GENERIC_ENTRY */
+
 #ifdef CONFIG_VSX
 unsigned long copy_fpr_to_user(void __user *to,
 			       struct task_struct *task)
@@ -368,3 +373,12 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
 		printk_ratelimited(regs->msr & MSR_64BIT ? fm64 : fm32, tsk->comm,
 				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
 }
+
+#ifdef CONFIG_GENERIC_ENTRY
+void arch_do_signal_or_restart(struct pt_regs *regs)
+{
+	BUG_ON(regs != current->thread.regs);
+	local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
+	do_signal(current);
+}
+#endif /* CONFIG_GENERIC_ENTRY */
-- 
2.51.0


