Return-Path: <linuxppc-dev+bounces-14744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A3CBBAC9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1K0JBgz2xqf;
	Mon, 15 Dec 2025 00:04:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717476;
	cv=none; b=jOSwPR33mDxZWEu4a4ciejRSnnP97GcKLcQA3gfl3aFnB4Z3AowAsFZqysCAcrnjUdYhHMvO0u4Raflk7tGzEwCwNrH5EgmKK4i0AWBb3yk8bC0rF9oQYp2qRSsOY85yMpFx2aL6ioFHOBxNDvakRqOhfPdY7gzmM9VOFpygYlpd5vKvjCa6Q2o5Pym1mVMJsYSI/fWhwt6PAb/2xukUECAiOm6+sAeNCZlhSmsT6cJ9j8Ejtl1tVUzSqHT9WSYhwWwTYDTqO/k4VH1Xzj3EI/CL8aOPiESDIVeeqOunaRtgEySk1J3ilI9i0lWMFrSANuFR5d41e63STdScj/3z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717476; c=relaxed/relaxed;
	bh=p7RMWUX6Srv88655zmYNbDS/aFYQswREgmTiEmnXrt4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awojkwiASiBzunxn9YI+/fS75OSLzoiQXvCDJ2dqvykjRWKtZLULVPlcbK/6wWNzb32M4wp27TuFlIuZ8hacSITo3O/CZK+ifAuaaTmLhhSvi6YfR4iX1qL304w8bvUuSsVWLoroYxTAY59CnTODaPDNbeLssbcG1g8c3+FstPG54yKK6NgIipHg7aBz1g7Yh10eMcmJ12YEC8dW7L+GPeMHtH1XuyYU0seph5raPX+NCqHYTXMRWBq6uhASQds4mlE8i5g7/DdsaO0wDhEpQjHLCrc1cJ8rKQAF8O535HBQEVjFpNgXc1uhqE/zDXPbXCg2pK5nIwvsCH4ZNo55bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yx9cGR5p; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yx9cGR5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1H1Xl4z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:04:34 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BE6usPe002648;
	Sun, 14 Dec 2025 13:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=p7RMWUX6Srv88655z
	mYNbDS/aFYQswREgmTiEmnXrt4=; b=Yx9cGR5pRFChubwvNoYUE+EgyL1lEa4Qm
	WmtqXOGQ6rF5OEd4kV7PzmDYda/eZf7GglVsazQb23EoDBzcNK5Rnw0cBO5WOLQg
	50fzJyyYzWUUL3n58p9zlG0j86LxoiK3vDDdpkWqOwr4ohNczHly4TYaPn+SPZF7
	AdMK/CQoKeomt1KeGJLR9256sy5QBS8nyvhf+UwpdGqlOkzBr8V1tUbPqlNFF/3/
	bqsIZfiWDQe/hx9WNRMi9Y/7cAJOQCjhdSbw9Ldv3x7sA72ehZclhJa13f3bXbl5
	O8nkMMxA6GHDnSqrlvgQ3H8EULWnHJPhgT0AVMd2hhPZEKgjuND1g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjpnns5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED4A57023642;
	Sun, 14 Dec 2025 13:04:10 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjpnns3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BEAdu0K012835;
	Sun, 14 Dec 2025 13:04:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1juxt3rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:09 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED45AH36831716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:04:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D18720043;
	Sun, 14 Dec 2025 13:04:05 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E512720040;
	Sun, 14 Dec 2025 13:03:58 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:03:58 +0000 (GMT)
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
Subject: [PATCH v2 4/8] powerpc: Introduce syscall exit arch functions
Date: Sun, 14 Dec 2025 18:32:40 +0530
Message-ID: <20251214130245.43664-5-mkchauras@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwMSBTYWx0ZWRfXzRBQESpRwMRy
 sm0D2roqmEbCpZq2EQsZ69K19smMR2VZajuJ8LVwUx4x3NeQXtX7LVfdwwzzaZs3en6lNS0GdWv
 FOm/jTXd/aGCY60eEA0jUU5ODnV84DW8iE2WH91wUQi4c8UdC7YkPhF2cjDJWu9o5K6Eux5VZhS
 0kx6BpAGfesVP90eHIm4uokrZRXOVEacCYbZpew4pk8ZyGNBvC1KpF/LLIyE1yYU1NfJlyZ89CK
 srinjpVALouhr5MCxxeqQixXPQgbkTgBUMEvXI+CXpiMv4cb94XY0ARexSuNnBqkxm1oGvNNqyA
 M2ldaZL5qK7sKeAXVlnIDqOpN/fkt9YiimWVr/cEsNBn1rT6UPiIyKHZPWK4hLdGhYZGZiQhOfk
 EjZtw3K6zK30LXkTqNglMvVrDzkgEA==
X-Proofpoint-GUID: Skk0TDzN03hjddwt9vfbVTHbN97kpPlT
X-Proofpoint-ORIG-GUID: agosFuUJhXXg2hcbVYE-1gbfCL-T4_ty
X-Authority-Analysis: v=2.4 cv=Kq5AGGWN c=1 sm=1 tr=0 ts=693eb5cb cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=1zgF-uAQnxabbVpijEgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Add PowerPC-specific implementations of the generic syscall exit hooks
used by the generic entry/exit framework:

 - arch_exit_to_user_mode_work_prepare()
 - arch_exit_to_user_mode_work()

These helpers handle user state restoration when returning from the
kernel to userspace, including FPU/VMX/VSX state, transactional memory,
KUAP restore, and per-CPU accounting.

Additionally, move check_return_regs_valid() from interrupt.c to
interrupt.h so it can be shared by the new entry/exit logic, and add
arch_do_signal_or_restart() for use with the generic entry flow.

No functional change is intended with this patch.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 49 +++++++++++++++
 arch/powerpc/include/asm/interrupt.h    | 82 +++++++++++++++++++++++++
 arch/powerpc/kernel/interrupt.c         | 81 ------------------------
 arch/powerpc/kernel/signal.c            | 14 +++++
 4 files changed, 145 insertions(+), 81 deletions(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 093ece06ef79..e8ebd42a4e6d 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -8,6 +8,7 @@
 #include <asm/cputime.h>
 #include <asm/interrupt.h>
 #include <asm/stacktrace.h>
+#include <asm/switch_to.h>
 #include <asm/tm.h>
 
 static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
@@ -104,5 +105,53 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 
 #define arch_enter_from_user_mode arch_enter_from_user_mode
 
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work)
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
+	/* Restore user access locks last */
+	kuap_user_restore(regs);
+}
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
+
+static __always_inline void arch_exit_to_user_mode(void)
+{
+	booke_load_dbcr0();
+
+	account_cpu_user_exit();
+}
+
+#define arch_exit_to_user_mode arch_exit_to_user_mode
+
 #endif /* CONFIG_GENERIC_IRQ_ENTRY */
 #endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index ca8a2cda9400..77ff8e33f8cd 100644
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
@@ -172,6 +174,86 @@ static inline void booke_restore_dbcr0(void)
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
+		pr_warn("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
+		pr_warn("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
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
index 2a09ac5dabd6..f53d432f6087 100644
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
index aa17e62f3754..719930cf4ae1 100644
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
2.52.0


