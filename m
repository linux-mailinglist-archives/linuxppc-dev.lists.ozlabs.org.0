Return-Path: <linuxppc-dev+bounces-14752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E8CBBAF6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:05:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1r486xz2yjp;
	Mon, 15 Dec 2025 00:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717504;
	cv=none; b=o3NaXw2yG6ep+3FJA8BsrjKztPR8fkI4sbvWOLgQT2P7LR7H9NMPiQ4kENz6rVrWVhLFCwb4TU+Ge0TQmqxtlVEB5Db6XA+Q1By9JlK+3fTq1smJeJRg+gVq9PoamDoZPDW/9/PIyAei4sle3qDuSHEG/IhWJTMrKAAUpDmoAurNsYaQgZrONOx0poxn53m2/kPif2eImxdztuO+aDboIJw9RmpWnYRwN22XIugqfMAdYa+Zc01skrstDKH7t4YdAzWUHVLSoi3OoCG2eH7U5RPY+t1VXoc+Ko2BeL7nfRGk6WlJnytdWlJpk3tBfpm24CzYRnpOHLbL3Lq90ywgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717504; c=relaxed/relaxed;
	bh=JounO4AU3ddaaTrPRCbQMu2mem15Kc2yqpVjSTS7vpM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8P0nqL5y7ExcGioLyM73/xvk7fjOUDViDvZh8y/QJJQf+HPUC6x5LLTG9x2491oWC+XYHTJEi92AZO9QgHLDubr2uncLP5pKBKmxcaGuhnLMfG90vtc+J9iOGdUhwvxRX4m71HXbzAm38h1BZle2rFYTUrA/oMzS5j54uA5o2LsM3wPS7C/60S/EHnFopkctG7WKeTtSDdB+5xII52lnuhbsE39gLV3ehT/i3+I4WzOFRhOU8LC3wiWn/kaG4pwdo1lE+dh1vr3S45kZdI2EbHP1tyksVTATIPMRhb15IwnApxdY3RH8KeOtKafZw7T9TCl7s2pbjud+ugrGR7S/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A/8Z1sEe; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A/8Z1sEe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1q1G2rz2y7c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:05:02 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BDJxsPv031550;
	Sun, 14 Dec 2025 13:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JounO4AU3ddaaTrPR
	CbQMu2mem15Kc2yqpVjSTS7vpM=; b=A/8Z1sEeGYMnchp6Fhc4O/tpzR+fYslua
	Ake3ZwGMiswY7YFoF8eCJVeJ8FpwFhwM2H+zaLvg4R6V/FF7M4fGGhP3xStz8PQn
	5zrJFDcU+bjhFcKeo/mCav3DYMebg+EPuX/w6UfUT9KJRtTOyZMPl/K6ARz5BsxH
	LWCuMecGYETdQn3L6klmTDd+289iGDUmI/EhSYAPA76t4ZrQeeJmG9MzGG4x/5cD
	5J+WttgsCCoiwcENEqMvLOhEejsuSZfZiWPptv+xOSwqbC1qVOSHCqWZBh+jRFO/
	hw4nHDMgAFzBhuBCkjkQe5da56jLU5A+/qE2mzpJp/3LkGwTRXOfg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:37 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED4aOH003920;
	Sun, 14 Dec 2025 13:04:36 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BEAGXtw026803;
	Sun, 14 Dec 2025 13:04:35 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfs265f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED4WMR42991966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:04:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E43F420043;
	Sun, 14 Dec 2025 13:04:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C000320040;
	Sun, 14 Dec 2025 13:04:25 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:04:25 +0000 (GMT)
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
Subject: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Date: Sun, 14 Dec 2025 18:32:44 +0530
Message-ID: <20251214130245.43664-9-mkchauras@linux.ibm.com>
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
X-Proofpoint-GUID: IKUSDUgTDjFlb6G0CpclGYfjyETjej8C
X-Proofpoint-ORIG-GUID: Kv8K1I1OBoMTCmY46_q-haJoqlrj0Rgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXwzr0CBJV5wmy
 Ysgf7lVWO7oY6u5b/2UYV04Aw2exBXLkgx9+vUwv7MbozjKFSL+Xf9yGsd9TmmWhwpv85fM1N75
 di418o8BUqn3Af5ZyEr30VoTrvU7XI9IMMtSlgfap+pQSsUja/9jEHG7jBd+qRRc0kIc+F4DoDJ
 pi5qSGXB/eMyV7OnvDU4hNcrRQmQNeMXVpa2XyoOEpJ7GkODA1yjLXVK4n+mRwDrtEUsGy17d+A
 7VydArDM9FQKQ668uxltMOup6kifmQlj+33HZBA1QQ6vZMDYi+ZFZbhgG4aW2PKSQMeXuWBpBlv
 0/RrAuEmDIsstrUlloZJAlH3DXaoWFTj3LIiFpBPBrQeS53Q8pgN99oQDbNANxkYNAhkHca+f0Z
 t7CoOBhGUIIVDsvL3gjocatV/lUi2A==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=693eb5e5 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=N1XQQ8_H-WpO_rPlItIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Convert the PowerPC syscall entry and exit paths to use the generic
entry/exit framework by selecting GENERIC_ENTRY and integrating with
the common syscall handling routines.

This change transitions PowerPC away from its custom syscall entry and
exit code to use the generic helpers such as:
 - syscall_enter_from_user_mode()
 - syscall_exit_to_user_mode()

As part of this migration:
 - The architecture now selects GENERIC_ENTRY in Kconfig.
 - Old tracing, seccomp, and audit handling in ptrace.c is removed in
   favor of generic entry infrastructure.
 - interrupt.c and syscall.c are simplified to delegate context
   management and user exit handling to the generic entry path.
 - The new pt_regs field `exit_flags` introduced earlier is now used
   to carry per-syscall exit state flags (e.g. _TIF_RESTOREALL).

This aligns PowerPC with the common entry code used by other
architectures and reduces duplicated logic around syscall tracing,
context tracking, and signal handling.

The performance benchmarks from perf bench basic syscall are below:

perf bench syscall usec/op

| Test            | With Patch | Without Patch | % Change |
| --------------- | ---------- | ------------- | -------- |
| getppid usec/op | 0.207795   | 0.210373      | -1.22%   |
| getpgid usec/op | 0.206282   | 0.211676      | -2.55%   |
| fork usec/op    | 833.986    | 814.809       | +2.35%   |
| execve usec/op  | 360.939    | 365.168       | -1.16%   |

perf bench syscall ops/sec

| Test            | With Patch | Without Patch | % Change |
| --------------- | ---------- | ------------- | -------- |
| getppid ops/sec | 48,12,433  | 47,53,459     | +1.24%   |
| getpgid ops/sec | 48,47,744  | 47,24,192     | +2.61%   |
| fork ops/sec    | 1,199      | 1,227         | -2.28%   |
| execve ops/sec  | 2,770      | 2,738         | +1.16%   |

IPI latency benchmark

| Metric                  | With Patch       | Without Patch    | % Change |
| ----------------------- | ---------------- | ---------------- | -------- |
| Dry-run (ns)            | 206,675.81       | 206,719.36       | -0.02%   |
| Self-IPI avg (ns)       | 1,939,991.00     | 1,976,116.15     | -1.83%   |
| Self-IPI max (ns)       | 3,533,718.93     | 3,582,650.33     | -1.37%   |
| Normal IPI avg (ns)     | 111,110,034.23   | 110,513,373.51   | +0.54%   |
| Normal IPI max (ns)     | 150,393,442.64   | 149,669,477.89   | +0.48%   |
| Broadcast IPI max (ns)  | 3,978,231,022.96 | 4,359,916,859.46 | -8.73%   |
| Broadcast lock max (ns) | 4,025,425,714.49 | 4,384,956,730.83 | -8.20%   |

Thats very close to performance earlier with arch specific handling.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/Kconfig                    |   1 +
 arch/powerpc/include/asm/entry-common.h |   5 +-
 arch/powerpc/kernel/interrupt.c         | 139 +++++++----------------
 arch/powerpc/kernel/ptrace/ptrace.c     | 141 ------------------------
 arch/powerpc/kernel/signal.c            |  10 +-
 arch/powerpc/kernel/syscall.c           | 119 +-------------------
 6 files changed, 49 insertions(+), 366 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b0c602c3bbe1..a4330775b254 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -203,6 +203,7 @@ config PPC
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP
diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index e2ae7416dee1..77129174f882 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -3,7 +3,7 @@
 #ifndef _ASM_PPC_ENTRY_COMMON_H
 #define _ASM_PPC_ENTRY_COMMON_H
 
-#ifdef CONFIG_GENERIC_IRQ_ENTRY
+#ifdef CONFIG_GENERIC_ENTRY
 
 #include <asm/cputime.h>
 #include <asm/interrupt.h>
@@ -217,9 +217,6 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
 
 	if (user_mode(regs)) {
 		kuap_lock();
-		CT_WARN_ON(ct_state() != CT_STATE_USER);
-		user_exit_irqoff();
-
 		account_cpu_user_entry();
 		account_stolen_time();
 	} else {
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 7f67f0b9d627..7d5cd4b5a610 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/context_tracking.h>
+#include <linux/entry-common.h>
 #include <linux/err.h>
 #include <linux/compat.h>
 #include <linux/rseq.h>
@@ -73,79 +74,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 	return true;
 }
 
-static notrace unsigned long
-interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
-{
-	unsigned long ti_flags;
-
-again:
-	ti_flags = read_thread_flags();
-	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
-		local_irq_enable();
-		if (ti_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
-			schedule();
-		} else {
-			/*
-			 * SIGPENDING must restore signal handler function
-			 * argument GPRs, and some non-volatiles (e.g., r1).
-			 * Restore all for now. This could be made lighter.
-			 */
-			if (ti_flags & _TIF_SIGPENDING)
-				ret |= _TIF_RESTOREALL;
-			do_notify_resume(regs, ti_flags);
-		}
-		local_irq_disable();
-		ti_flags = read_thread_flags();
-	}
-
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
-		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-				unlikely((ti_flags & _TIF_RESTORE_TM))) {
-			restore_tm_state(regs);
-		} else {
-			unsigned long mathflags = MSR_FP;
-
-			if (cpu_has_feature(CPU_FTR_VSX))
-				mathflags |= MSR_VEC | MSR_VSX;
-			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
-				mathflags |= MSR_VEC;
-
-			/*
-			 * If userspace MSR has all available FP bits set,
-			 * then they are live and no need to restore. If not,
-			 * it means the regs were given up and restore_math
-			 * may decide to restore them (to avoid taking an FP
-			 * fault).
-			 */
-			if ((regs->msr & mathflags) != mathflags)
-				restore_math(regs);
-		}
-	}
-
-	check_return_regs_valid(regs);
-
-	user_enter_irqoff();
-	if (!prep_irq_for_enabled_exit(true)) {
-		user_exit_irqoff();
-		local_irq_enable();
-		local_irq_disable();
-		goto again;
-	}
-
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	local_paca->tm_scratch = regs->msr;
-#endif
-
-	booke_load_dbcr0();
-
-	account_cpu_user_exit();
-
-	/* Restore user access locks last */
-	kuap_user_restore(regs);
-
-	return ret;
-}
-
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -160,17 +88,12 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 					   long scv)
 {
 	unsigned long ti_flags;
-	unsigned long ret = 0;
 	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
 
-	CT_WARN_ON(ct_state() == CT_STATE_USER);
-
 	kuap_assert_locked();
 
 	regs->result = r3;
-
-	/* Check whether the syscall is issued inside a restartable sequence */
-	rseq_syscall(regs);
+	regs->exit_flags = 0;
 
 	ti_flags = read_thread_flags();
 
@@ -183,7 +106,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
 		if (ti_flags & _TIF_RESTOREALL)
-			ret = _TIF_RESTOREALL;
+			regs->exit_flags = _TIF_RESTOREALL;
 		else
 			regs->gpr[3] = r3;
 		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
@@ -192,18 +115,28 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	}
 
 	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
-		do_syscall_trace_leave(regs);
-		ret |= _TIF_RESTOREALL;
+		regs->exit_flags |= _TIF_RESTOREALL;
 	}
 
-	local_irq_disable();
-	ret = interrupt_exit_user_prepare_main(ret, regs);
+	syscall_exit_to_user_mode(regs);
+
+again:
+	user_enter_irqoff();
+	if (!prep_irq_for_enabled_exit(true)) {
+		user_exit_irqoff();
+		local_irq_enable();
+		local_irq_disable();
+		goto again;
+	}
+
+	/* Restore user access locks last */
+	kuap_user_restore(regs);
 
 #ifdef CONFIG_PPC64
-	regs->exit_result = ret;
+	regs->exit_result = regs->exit_flags;
 #endif
 
-	return ret;
+	return regs->exit_flags;
 }
 
 #ifdef CONFIG_PPC64
@@ -223,13 +156,16 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
 	set_kuap(AMR_KUAP_BLOCKED);
 #endif
 
-	trace_hardirqs_off();
-	user_exit_irqoff();
-	account_cpu_user_entry();
-
-	BUG_ON(!user_mode(regs));
+again:
+	user_enter_irqoff();
+	if (!prep_irq_for_enabled_exit(true)) {
+		user_exit_irqoff();
+		local_irq_enable();
+		local_irq_disable();
+		goto again;
+	}
 
-	regs->exit_result = interrupt_exit_user_prepare_main(regs->exit_result, regs);
+	regs->exit_result |= regs->exit_flags;
 
 	return regs->exit_result;
 }
@@ -241,7 +177,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 
 	BUG_ON(regs_is_unrecoverable(regs));
 	BUG_ON(regs_irqs_disabled(regs));
-	CT_WARN_ON(ct_state() == CT_STATE_USER);
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -250,8 +185,21 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 	kuap_assert_locked();
 
 	local_irq_disable();
+	regs->exit_flags = 0;
+again:
+	check_return_regs_valid(regs);
+	user_enter_irqoff();
+	if (!prep_irq_for_enabled_exit(true)) {
+		user_exit_irqoff();
+		local_irq_enable();
+		local_irq_disable();
+		goto again;
+	}
+
+	/* Restore user access locks last */
+	kuap_user_restore(regs);
 
-	ret = interrupt_exit_user_prepare_main(0, regs);
+	ret = regs->exit_flags;
 
 #ifdef CONFIG_PPC64
 	regs->exit_result = ret;
@@ -293,8 +241,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (need_irq_preemption())
-			irqentry_exit_cond_resched();
 
 		check_return_regs_valid(regs);
 
@@ -364,7 +310,6 @@ notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
 #endif
 
 	trace_hardirqs_off();
-	user_exit_irqoff();
 	account_cpu_user_entry();
 
 	BUG_ON(!user_mode(regs));
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 2134b6d155ff..316d4f5ead8e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -21,9 +21,6 @@
 #include <asm/switch_to.h>
 #include <asm/debug.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/syscalls.h>
-
 #include "ptrace-decl.h"
 
 /*
@@ -195,144 +192,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-#ifdef CONFIG_SECCOMP
-static int do_seccomp(struct pt_regs *regs)
-{
-	if (!test_thread_flag(TIF_SECCOMP))
-		return 0;
-
-	/*
-	 * The ABI we present to seccomp tracers is that r3 contains
-	 * the syscall return value and orig_gpr3 contains the first
-	 * syscall parameter. This is different to the ptrace ABI where
-	 * both r3 and orig_gpr3 contain the first syscall parameter.
-	 */
-	regs->gpr[3] = -ENOSYS;
-
-	/*
-	 * We use the __ version here because we have already checked
-	 * TIF_SECCOMP. If this fails, there is nothing left to do, we
-	 * have already loaded -ENOSYS into r3, or seccomp has put
-	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
-	 */
-	if (__secure_computing())
-		return -1;
-
-	/*
-	 * The syscall was allowed by seccomp, restore the register
-	 * state to what audit expects.
-	 * Note that we use orig_gpr3, which means a seccomp tracer can
-	 * modify the first syscall parameter (in orig_gpr3) and also
-	 * allow the syscall to proceed.
-	 */
-	regs->gpr[3] = regs->orig_gpr3;
-
-	return 0;
-}
-#else
-static inline int do_seccomp(struct pt_regs *regs) { return 0; }
-#endif /* CONFIG_SECCOMP */
-
-/**
- * do_syscall_trace_enter() - Do syscall tracing on kernel entry.
- * @regs: the pt_regs of the task to trace (current)
- *
- * Performs various types of tracing on syscall entry. This includes seccomp,
- * ptrace, syscall tracepoints and audit.
- *
- * The pt_regs are potentially visible to userspace via ptrace, so their
- * contents is ABI.
- *
- * One or more of the tracers may modify the contents of pt_regs, in particular
- * to modify arguments or even the syscall number itself.
- *
- * It's also possible that a tracer can choose to reject the system call. In
- * that case this function will return an illegal syscall number, and will put
- * an appropriate return value in regs->r3.
- *
- * Return: the (possibly changed) syscall number.
- */
-long do_syscall_trace_enter(struct pt_regs *regs)
-{
-	u32 flags;
-
-	flags = read_thread_flags() & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
-
-	if (flags) {
-		int rc = ptrace_report_syscall_entry(regs);
-
-		if (unlikely(flags & _TIF_SYSCALL_EMU)) {
-			/*
-			 * A nonzero return code from
-			 * ptrace_report_syscall_entry() tells us to prevent
-			 * the syscall execution, but we are not going to
-			 * execute it anyway.
-			 *
-			 * Returning -1 will skip the syscall execution. We want
-			 * to avoid clobbering any registers, so we don't goto
-			 * the skip label below.
-			 */
-			return -1;
-		}
-
-		if (rc) {
-			/*
-			 * The tracer decided to abort the syscall. Note that
-			 * the tracer may also just change regs->gpr[0] to an
-			 * invalid syscall number, that is handled below on the
-			 * exit path.
-			 */
-			goto skip;
-		}
-	}
-
-	/* Run seccomp after ptrace; allow it to set gpr[3]. */
-	if (do_seccomp(regs))
-		return -1;
-
-	/* Avoid trace and audit when syscall is invalid. */
-	if (regs->gpr[0] >= NR_syscalls)
-		goto skip;
-
-	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
-		trace_sys_enter(regs, regs->gpr[0]);
-
-	if (!is_32bit_task())
-		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
-				    regs->gpr[5], regs->gpr[6]);
-	else
-		audit_syscall_entry(regs->gpr[0],
-				    regs->gpr[3] & 0xffffffff,
-				    regs->gpr[4] & 0xffffffff,
-				    regs->gpr[5] & 0xffffffff,
-				    regs->gpr[6] & 0xffffffff);
-
-	/* Return the possibly modified but valid syscall number */
-	return regs->gpr[0];
-
-skip:
-	/*
-	 * If we are aborting explicitly, or if the syscall number is
-	 * now invalid, set the return value to -ENOSYS.
-	 */
-	regs->gpr[3] = -ENOSYS;
-	return -1;
-}
-
-void do_syscall_trace_leave(struct pt_regs *regs)
-{
-	int step;
-
-	audit_syscall_exit(regs);
-
-	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
-		trace_sys_exit(regs, regs->result);
-
-	step = test_thread_flag(TIF_SINGLESTEP);
-	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
-		ptrace_report_syscall_exit(regs, step);
-}
-
 void __init pt_regs_check(void);
 
 /*
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 719930cf4ae1..9f1847b4742e 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -6,6 +6,7 @@
  *    Extracted from signal_32.c and signal_64.c
  */
 
+#include <linux/entry-common.h>
 #include <linux/resume_user_mode.h>
 #include <linux/signal.h>
 #include <linux/uprobes.h>
@@ -22,11 +23,6 @@
 
 #include "signal.h"
 
-/* This will be removed */
-#ifdef CONFIG_GENERIC_ENTRY
-#include <linux/entry-common.h>
-#endif /* CONFIG_GENERIC_ENTRY */
-
 #ifdef CONFIG_VSX
 unsigned long copy_fpr_to_user(void __user *to,
 			       struct task_struct *task)
@@ -374,11 +370,9 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
 				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
 }
 
-#ifdef CONFIG_GENERIC_ENTRY
 void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	BUG_ON(regs != current->thread.regs);
-	local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
+	regs->exit_flags |= _TIF_RESTOREALL;
 	do_signal(current);
 }
-#endif /* CONFIG_GENERIC_ENTRY */
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 9f03a6263fb4..df1c9a8d62bc 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -3,6 +3,7 @@
 #include <linux/compat.h>
 #include <linux/context_tracking.h>
 #include <linux/randomize_kstack.h>
+#include <linux/entry-common.h>
 
 #include <asm/interrupt.h>
 #include <asm/kup.h>
@@ -18,124 +19,10 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	long ret;
 	syscall_fn f;
 
-	kuap_lock();
-
 	add_random_kstack_offset();
+	r0 = syscall_enter_from_user_mode(regs, r0);
 
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
-
-	trace_hardirqs_off(); /* finish reconciling */
-
-	CT_WARN_ON(ct_state() == CT_STATE_KERNEL);
-	user_exit_irqoff();
-
-	BUG_ON(regs_is_unrecoverable(regs));
-	BUG_ON(!user_mode(regs));
-	BUG_ON(regs_irqs_disabled(regs));
-
-#ifdef CONFIG_PPC_PKEY
-	if (mmu_has_feature(MMU_FTR_PKEY)) {
-		unsigned long amr, iamr;
-		bool flush_needed = false;
-		/*
-		 * When entering from userspace we mostly have the AMR/IAMR
-		 * different from kernel default values. Hence don't compare.
-		 */
-		amr = mfspr(SPRN_AMR);
-		iamr = mfspr(SPRN_IAMR);
-		regs->amr  = amr;
-		regs->iamr = iamr;
-		if (mmu_has_feature(MMU_FTR_KUAP)) {
-			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
-			flush_needed = true;
-		}
-		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
-			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
-			flush_needed = true;
-		}
-		if (flush_needed)
-			isync();
-	} else
-#endif
-		kuap_assert_locked();
-
-	booke_restore_dbcr0();
-
-	account_cpu_user_entry();
-
-	account_stolen_time();
-
-	/*
-	 * This is not required for the syscall exit path, but makes the
-	 * stack frame look nicer. If this was initialised in the first stack
-	 * frame, or if the unwinder was taught the first stack frame always
-	 * returns to user with IRQS_ENABLED, this store could be avoided!
-	 */
-	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
-
-	/*
-	 * If system call is called with TM active, set _TIF_RESTOREALL to
-	 * prevent RFSCV being used to return to userspace, because POWER9
-	 * TM implementation has problems with this instruction returning to
-	 * transactional state. Final register values are not relevant because
-	 * the transaction will be aborted upon return anyway. Or in the case
-	 * of unsupported_scv SIGILL fault, the return state does not much
-	 * matter because it's an edge case.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
-		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
-
-	/*
-	 * If the system call was made with a transaction active, doom it and
-	 * return without performing the system call. Unless it was an
-	 * unsupported scv vector, in which case it's treated like an illegal
-	 * instruction.
-	 */
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
-	    !trap_is_unsupported_scv(regs)) {
-		/* Enable TM in the kernel, and disable EE (for scv) */
-		hard_irq_disable();
-		mtmsr(mfmsr() | MSR_TM);
-
-		/* tabort, this dooms the transaction, nothing else */
-		asm volatile(".long 0x7c00071d | ((%0) << 16)"
-				:: "r"(TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT));
-
-		/*
-		 * Userspace will never see the return value. Execution will
-		 * resume after the tbegin. of the aborted transaction with the
-		 * checkpointed register state. A context switch could occur
-		 * or signal delivered to the process before resuming the
-		 * doomed transaction context, but that should all be handled
-		 * as expected.
-		 */
-		return -ENOSYS;
-	}
-#endif // CONFIG_PPC_TRANSACTIONAL_MEM
-
-	local_irq_enable();
-
-	if (unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)) {
-		if (unlikely(trap_is_unsupported_scv(regs))) {
-			/* Unsupported scv vector */
-			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-			return regs->gpr[3];
-		}
-		/*
-		 * We use the return value of do_syscall_trace_enter() as the
-		 * syscall number. If the syscall was rejected for any reason
-		 * do_syscall_trace_enter() returns an invalid syscall number
-		 * and the test against NR_syscalls will fail and the return
-		 * value to be used is in regs->gpr[3].
-		 */
-		r0 = do_syscall_trace_enter(regs);
-		if (unlikely(r0 >= NR_syscalls))
-			return regs->gpr[3];
-
-	} else if (unlikely(r0 >= NR_syscalls)) {
+	if (unlikely(r0 >= NR_syscalls)) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-- 
2.52.0


