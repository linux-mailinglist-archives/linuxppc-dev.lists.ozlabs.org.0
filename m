Return-Path: <linuxppc-dev+bounces-13673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A28C28EA5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 02 Nov 2025 12:55:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cztSh6N7fz3dBZ;
	Sun,  2 Nov 2025 22:55:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762084516;
	cv=none; b=abY/lXcoZIb3DU9BIxe6JhxquInSg5ryT+4F8TplNAwGNR9Yuxyf0l6FrKngAmQmsVQWT1oOPlnJShHZC2xGfcBcNsYUyRcab943fk4kyl73kGhN5ZifYnKDSR2gzwd7vQF8+MtFjwtBORkhwfGdN0ybTOkkaQW00x56fFTl0nPlDocOL3+ccU2Vcqd4M48+sTcUW8IlQM1mOxlv5Mp92PWaTA84L61s6rxt01sjYPYcXzCgLrlPlbSGQqdophtOJy3ihVnB5N8T6rnInesLpIVg2w2En66remg0J0sC+qfZSmuw5542XKigRf59rMfunKDKvlZkjFIR2+dhHPoeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762084516; c=relaxed/relaxed;
	bh=Vcn5YhfuF4t7K1kibWgnrQYZ7A/175cmbfMddMBLI4E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBJT6s0vmTUVfrJq+Z4OuivXyLB177Y6S7Rur8EZXxpuzj3AwGey7VUCNI+ViMWfStUWAmLE6+t/+Bg2zXikI1tBGeDuCfAxd7bKVQ72AXn8BxQQ2A781chJgHXQZxyLvp9N3mKTTsL04p/+/JW4gkTaS/bQP+UHgGqkDHspo+4tlFKc5qrDLKIEjcCZfa1q7Bztyrps+TT7IDbzDAwrVT44fqaZKzLLFJMLlghb8X36avfI4Tmspgj5NHn6IGNxlM+VHQEVCvNR8jskm3muG1lZjwF5MgQ0+bEWB+ER6/XLTihElxaCqm9XIywDZfS8ewCRptpSwFeKq/Vymz92Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fs98qkUe; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fs98qkUe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cztSh0bHRz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 22:55:15 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2BhQPL025609;
	Sun, 2 Nov 2025 11:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Vcn5YhfuF4t7K1kib
	WgnrQYZ7A/175cmbfMddMBLI4E=; b=fs98qkUeae07epnvU45eNnkJMaXoVw9mc
	vyNIXf3S5ZbvSTWs6reORKgYTF6aEG05FojZLIuC07nSQEQ4S7WDFycxo2gq6SYV
	53vG/Pj3pRPAkJvLZgykgsinaVzwpWXIDL094HYJrUOdoeBPvwuiVlfNjP6JYto8
	mBd0mwrHvW3EXKSeQztIBqkBO6mEwNE/KtZ5SWbyThk1fbRgUcwI7nCWMcOkExgR
	X/liaRdOjEWtDvBGZ0IhWDh0tNqCnOzITzNnhv8XH2Nq8RX4hH6YvJhfBKt/Twr0
	GEjHbDp/egG1PLgVd5FG340bfgh3VXatVR2URhoqITZ3S20TEbiVw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59v1k99y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:35 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A2BsYfd011762;
	Sun, 2 Nov 2025 11:54:34 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59v1k99v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:34 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A26JlDb025569;
	Sun, 2 Nov 2025 11:54:33 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vhs9jm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A2BsTiY32571840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Nov 2025 11:54:29 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3B0C2004D;
	Sun,  2 Nov 2025 11:54:29 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DC0520040;
	Sun,  2 Nov 2025 11:54:24 +0000 (GMT)
Received: from li-ce33bfcc-25cf-11b2-a85c-dc105c39188e.ibm.com.com (unknown [9.124.213.75])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Nov 2025 11:54:24 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, akpm@linux-foundation.org,
        macro@orcam.me.uk, ldv@strace.io, deller@gmx.de, charlie@rivosinc.com,
        bigeasy@linutronix.de, segher@kernel.crashing.org,
        thomas.weissschuh@linutronix.de, menglong8.dong@gmail.com,
        ankur.a.arora@oracle.com, peterz@infradead.org, namcao@linutronix.de,
        tglx@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        coltonlewis@google.com, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] powerpc: Introduce syscall exit arch functions
Date: Sun,  2 Nov 2025 17:23:54 +0530
Message-ID: <20251102115358.1744304-5-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
References: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
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
X-Proofpoint-GUID: o_s57pYvtXustJmijauvjNt0K2hFxCX9
X-Proofpoint-ORIG-GUID: 078XkDle0pLOtcfocJ2HlN7U42nTkLxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX6V4K+4cZurDu
 YAo/I0/r1QR6j89kQkFR1jCFj0ISW7hbT9N8QJkVDgTXG3s+Iyxz0OarQElJvfsk0r61EuYMHjq
 NQ8THpIDXZvkDXN2JUo0xdldXgez7t6mjWlk7xzYdvaIUBfJby8eCBhyOxjyVkNW7xHDVj4Qj53
 b2SB8gL4mFh9GcPhWuQZMRu7EH2HT5V+9/oPPo4lsMxSHBAwj9jMLAFSl9dSnDA5ESD2QeJLBaT
 c64SVL8+Vzz3MVLZCYHoJsf8Yipf+FNmdU5+WerXieUSuE0yOnifkN2ehV1OzB+jVMUAJvHJr1h
 Sd+fhTdU3zYVC+H8R5BDbgUvJOxrwxSCq3FFdqVw5oH5Bvc69NcShtqaPclJuHO6rSjEO/wP4BG
 QsmLO3VAZY/Y1ov8ejAoEQrxqyYKfQ==
X-Authority-Analysis: v=2.4 cv=H8HWAuYi c=1 sm=1 tr=0 ts=6907467b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=1zgF-uAQnxabbVpijEgA:9 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
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
2.51.0


