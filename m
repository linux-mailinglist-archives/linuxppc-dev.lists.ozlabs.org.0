Return-Path: <linuxppc-dev+bounces-15086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6657DCE5EEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 05:56:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfkSn0nVQz2ykV;
	Mon, 29 Dec 2025 15:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766984168;
	cv=none; b=mQYcaao/cFk+nRIRLJPyEazZs7FfP23yLyiPU0fmzjHAfhGMabE6h0jie39lr42SlRMkvEMC10m0VlqzU02ElV2U2/sNMunVhDs+R98k5ohrdzi2sPomNta9KffybisfrbWp/4lqiNJWD+h8SAO3g7sEt/UVGGnQSI1Xm0I4XRV+Jm8E8rWMIIIZM380sG8h5XXsZLPZi5dE5YvPec1bIcTMfblnXxZahIQ8OMM8WQq1OnreJTXlZawjzSrOt1UpFAgqwJfs3+xL3WPgr6yFzZ0yjFJom1taA5Hk04AccvPa+bSQRYwp4vMlMJN8J+MxVbnYCXMvLYIzWlYaLXowxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766984168; c=relaxed/relaxed;
	bh=quUsQN9IvbWoWJ92msbOIv6bnd1O5OGFS6aMqYprN9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDBiqeitp/Z9WD5FiO4tugF1ysnQdguokUQ5SyIy5ZLDPp1jL7o97UOLmVBini3XDJx4dEyr76uAt72/2iaPUqDGrhyz3MEseTK04/tRTq9HDHuJ2k00Wi1beO7waSN1Mvds/MhoZkI09s1E9TBJnsOSFIIjHvnovYkTKGWZhHhICavzErexPaf7F27eWNMHiRLNSllNGtW32Jpdfo6xxrJy5NS2bUzGJn1b3Umhs3uMKoWmv6aAwsXJGDkrCU3yUEujZ8J5oFj8upjnc2BGUFvXVSZ0DzSf5jZs/v8UwcAEmlBRQCEzn3ICcj+9mcall2F61+dUcDY8D+nmL9YJIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r2UUK24c; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r2UUK24c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfkSm0xpDz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 15:56:07 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BSBHZX5026394;
	Mon, 29 Dec 2025 04:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=quUsQN9IvbWoWJ92m
	sbOIv6bnd1O5OGFS6aMqYprN9w=; b=r2UUK24c9kpG4D9F37DmpI+T2aVZBipxq
	Qp2AVaxf4FAx/6sP07n/lup3M/Gc5LpEBUGbFYKW6ikDMXwqj9cvx9/FrCSjq10q
	yqscQ4kbQ0BjSe9Rs5rCwxvhOWgtM5hRDGb18TCrW1url0oYgmNHzIiQAwaSFcqn
	ors4JNSeh/3Px5euma/NLaiqQJiT6M7ra8AEQ26IbJw6PUDRzytagXYTKMAB4Oul
	tSm7bQ9GbPA7wwB9ZAxcXMEgByJJqUG5u9/JMbxtOX+ilxD/vwgUF8tMYfKopMOc
	ncqFHtT4L3vhQv1lmU4rV0E6A7pEJsZSu1ioPe5Kc40xmRFcaYc+w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vn44u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:47 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BT4tlcs028632;
	Mon, 29 Dec 2025 04:55:47 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vn44q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BT2VobL025077;
	Mon, 29 Dec 2025 04:55:46 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bau9k3x3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BT4tgIN41550288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 04:55:42 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E14420043;
	Mon, 29 Dec 2025 04:55:42 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56F1620040;
	Mon, 29 Dec 2025 04:55:37 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.39.24.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Dec 2025 04:55:37 +0000 (GMT)
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
Subject: [PATCH v3 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Date: Mon, 29 Dec 2025 10:24:16 +0530
Message-ID: <20251229045416.3193779-9-mkchauras@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: d88__Eixzo4y4y8PHD5xfDW0dNhYRmlc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MSBTYWx0ZWRfX/SqlemMgIdTU
 mPvXhPQDEgoo7HQawP0UgDO98nhkuTPb+NQZLHVz5JIcQrxeTMlbGuKz5iJctqe0IICVkg98VGE
 KZlnJaQHs5C2hAMzheI369YlFaCA6rW24lCJGZ+1c7bGGMmmHjQ/3AyfL1uo9pI/mjscKtz7GeF
 CzuIAzwHxYx0Dm1boQ+Tum3DKlk8vd8MxCtUg0R7OyCYsLDjUVbuqESS5zZ5JCKnV82Fgqe+iY7
 0+eZyOb7puORTy61iNZKMgK3ZS+h/3fmUFgTrZx3KU0XbOvjyvYqmykgTFb1zqm4zQBhJhol+mG
 97iIB1uXXf5DwIFsCIF4pd+9DtPRW2AdPgfDQ//K6SsBRZxJtLI23B5U2a8mS88IGo72Jb/hI74
 /E5s1vM32NchY2AofQiFk4RmFbwIQFehRM1by2MUYyqjzGadN1xKnuprE8nW65xzgbjgYVKeuWS
 nnt+AMOR7xaC6+h2tvw==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=695209d4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=N1XQQ8_H-WpO_rPlItIA:9
X-Proofpoint-GUID: -3Anup0K1Z9Fy5QeakUenjhZiPrbmtzS
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

| Syscall | Base       | New        | change % |
| ------- | ---------- | ---------- | -------- |
| basic   | 0.173212   | 0.133294   | -23.05   |
| execve  | 363.176190 | 357.148150 | -1.66    |
| fork    | 853.657880 | 840.268800 | -1.57    |
| getpgid | 0.174832   | 0.135372   | -22.57   |

perf bench syscall ops/sec

| Syscall | Base    | New     | change % |
| ------- | ------- | ------- | -------- |
| basic   | 6006021 | 7502236 | +24.91   |
| execve  | 2753    | 2800    | +1.71    |
| fork    | 1171    | 1190    | +1.62    |
| getpgid | 5942117 | 7387040 | +24.32   |

IPI latency benchmark

| Metric         | Base (ns)     | Test (ns)     | change % |
| -------------- | ------------- | ------------- | -------- |
| Dry-run        | 206652.45     | 209317.37     | +1.29    |
| Self-IPI       | 3567895.23    | 3590444.77    | +0.63    |
| Normal IPI     | 148570416.17  | 148564173.40  | -0.00    |
| Broadcast IPI  | 4033489673.38 | 4007319512.62 | -0.65    |
| Broadcast lock | 4011023005.48 | 4010267885.93 | -0.02    |

Thats very close to performance earlier with arch specific handling.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/Kconfig                |   1 +
 arch/powerpc/include/asm/ptrace.h   |   3 -
 arch/powerpc/include/asm/signal.h   |   1 -
 arch/powerpc/kernel/interrupt.c     | 137 +++++++++------------------
 arch/powerpc/kernel/ptrace/ptrace.c | 141 ----------------------------
 arch/powerpc/kernel/signal.c        |  25 ++---
 arch/powerpc/kernel/syscall.c       | 119 +----------------------
 7 files changed, 54 insertions(+), 373 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 398cef868c14..c73aa9c73692 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -204,6 +204,7 @@ config PPC
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 2e741ea57b80..fdeb97421785 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -177,9 +177,6 @@ extern unsigned long profile_pc(struct pt_regs *regs);
 #define profile_pc(regs) instruction_pointer(regs)
 #endif
 
-long do_syscall_trace_enter(struct pt_regs *regs);
-void do_syscall_trace_leave(struct pt_regs *regs);
-
 static inline void set_return_regs_changed(void)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/signal.h b/arch/powerpc/include/asm/signal.h
index 922d43700fb4..21af92cdb237 100644
--- a/arch/powerpc/include/asm/signal.h
+++ b/arch/powerpc/include/asm/signal.h
@@ -7,7 +7,6 @@
 #include <uapi/asm/ptrace.h>
 
 struct pt_regs;
-void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
 
 unsigned long get_min_sigframe_size_32(void);
 unsigned long get_min_sigframe_size_64(void);
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index d202405e4e8e..d94e37c64300 100644
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
@@ -249,8 +185,21 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
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
@@ -292,8 +241,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (need_irq_preemption())
-			irqentry_exit_cond_resched();
 
 		check_return_regs_valid(regs);
 
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
index aa17e62f3754..bb42a8b6c642 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -6,6 +6,7 @@
  *    Extracted from signal_32.c and signal_64.c
  */
 
+#include <linux/entry-common.h>
 #include <linux/resume_user_mode.h>
 #include <linux/signal.h>
 #include <linux/uprobes.h>
@@ -292,23 +293,6 @@ static void do_signal(struct task_struct *tsk)
 	signal_setup_done(ret, &ksig, test_thread_flag(TIF_SINGLESTEP));
 }
 
-void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
-{
-	if (thread_info_flags & _TIF_UPROBE)
-		uprobe_notify_resume(regs);
-
-	if (thread_info_flags & _TIF_PATCH_PENDING)
-		klp_update_patch_state(current);
-
-	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-		BUG_ON(regs != current->thread.regs);
-		do_signal(current);
-	}
-
-	if (thread_info_flags & _TIF_NOTIFY_RESUME)
-		resume_user_mode_work(regs);
-}
-
 static unsigned long get_tm_stackpointer(struct task_struct *tsk)
 {
 	/* When in an active transaction that takes a signal, we need to be
@@ -368,3 +352,10 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
 		printk_ratelimited(regs->msr & MSR_64BIT ? fm64 : fm32, tsk->comm,
 				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
 }
+
+void arch_do_signal_or_restart(struct pt_regs *regs)
+{
+	BUG_ON(regs != current->thread.regs);
+	regs->exit_flags |= _TIF_RESTOREALL;
+	do_signal(current);
+}
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


