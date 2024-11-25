Return-Path: <linuxppc-dev+bounces-3539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91B9D7ABF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 05:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxXcp5bqFz2yVd;
	Mon, 25 Nov 2024 15:23:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732508586;
	cv=none; b=FDI3AxehDvR4sdf93D+8CPdGMx36v9OtvRMjHE9HxCPXdt8KWavQQyS0c5LWfkLuLd9AziV9BUQ5xuKIzzTu/jA1ET+M5HNWMB80PJAlvzZz/G7La0tG0YZyLvzqQ5oQpdphJIGFJCF3VXI1xj2k18XYna/UFAZK+ba+P6hynqITNWS4IH2wFTpXObvRlOOBeGjYEVn7rCXGJ3DeWAJEHXfCW0mOuEYJY7wkN34L7yFpXcWTvlk2h5j6HALmTUEqFQFSCbhD6NWqVY3NkU9TxJT5P8/XL7hCAuK35qPscvjq53Q9ajtyQmhz033fLw7BhNAj3HuAA8R1a5xBuyPa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732508586; c=relaxed/relaxed;
	bh=vwZfMzqjn+yG2tmRVpCX/O0QbIUyvcViSEdTodFdAXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnLv4F871so5DVaQiYKfaAA3E88tqpfwpCbZoM8g11aTll4IBnd99Y222YQtqXtN2rFu2mkx9/ala9GEEqNrss8EBW09fzZg5BoWuxrpAMc6DDZmM2Lwm9+GOD9eS432M0dyPwwyqJEUHgOVKC1j5q+UZrX8FGn6Of3H1VCOeGt+ZWIOMo/0ijKSlHe2bZjZ5xYaZW4YRSPY//CuVWULQTs8DffUfxM6ea8Udp4ifaqXJtgXBrMaeG8BwHPWZwt3TfrhTq+9RyPp1yzx0Eq4hbPaLq41HGYkYG9EF29bv9t3Y9K2UvsabICASNqdP5hV9Bf7+DyhyCn/lmz9c4iqlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lOU1wEwM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lOU1wEwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxXcm5N1Pz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 15:23:04 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP1qdwb023382;
	Mon, 25 Nov 2024 04:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vwZfMzqjn+yG2tmRV
	pCX/O0QbIUyvcViSEdTodFdAXc=; b=lOU1wEwMUefOCkvHLW1qv0dqvLxx6K5MJ
	rfVnF1qxBg42C8rzViGpo13VQZp+/rZHyD08MIS8BFkG5XWyRNweD91WZoj8j9E7
	S1Hjz3brE09GU3auuGGuFLBwbwDJCVLa1DEtn60V1E2vzi+QI/IjFMC6y0/CFmcb
	M7snL7RD2JxIwMIlDXcAkRHPif8g3wvUfyVESY0DSZChKEt/EW5ZONMTQUl4B6QJ
	BG8ux8uuK5ZZYr2SbpNVRVwB6oNOZAidJFFCB+vTN5AD/kkp1OQMroKpsql1UVXq
	bDGn8/ZoFqFQBeLGXiuPMVCkuLvtqJxTnmtiUNQUOrK0cOx2yrDoQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4338a7643s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:40 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AP4EPaZ004972;
	Mon, 25 Nov 2024 04:22:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4338a7643p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP334oM000691;
	Mon, 25 Nov 2024 04:22:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 433srxu2xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AP4MZSv49414532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Nov 2024 04:22:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C97420043;
	Mon, 25 Nov 2024 04:22:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72F0220040;
	Mon, 25 Nov 2024 04:22:33 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Nov 2024 04:22:33 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, bigeasy@linutronix.de, ankur.a.arora@oracle.com,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        vschneid@redhat.com, peterz@infradead.org
Subject: [PATCH 2/3] powerpc: support dynamic preemption
Date: Mon, 25 Nov 2024 09:52:11 +0530
Message-ID: <20241125042212.1522315-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241125042212.1522315-1-sshegde@linux.ibm.com>
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -74QK4YVcdR4kW-OOxNeUzH1zbCftcWc
X-Proofpoint-ORIG-GUID: tm4aJ4WkJCNpCh_0O9SzAvk_bbVOwYXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Once the lazy preemption is supported, it would be desirable to change
the preemption models at runtime. So this change adds support for dynamic
preemption using DYNAMIC_KEY.

In irq-exit to kernel path, use preempt_model_preemptible for decision.
Other way would be using static key based decision. Keeping it
simpler since key based change didn't show performance improvement.

Tested lightly on Power10 LPAR. Performance numbers indicate that,
preempt=none(no dynamic) and preempt=none(dynamic) are similar.
Only hackbench pipe shows a regression. There is slight overhead of code
check if it is preemptible kernel. hackbench pipe is prone to such 
patterns[1]

cat /sys/kernel/debug/sched/preempt
(none) voluntary full lazy
perf stat -e probe:__cond_resched -a sleep 1
 Performance counter stats for 'system wide':
             1,253      probe:__cond_resched

echo full > /sys/kernel/debug/sched/preempt
cat /sys/kernel/debug/sched/preempt
none voluntary (full) lazy
perf stat -e probe:__cond_resched -a sleep 1
 Performance counter stats for 'system wide':
                 0      probe:__cond_resched

echo lazy > /sys/kernel/debug/sched/preempt
cat /sys/kernel/debug/sched/preempt
none voluntary full (lazy)
perf stat -e probe:__cond_resched -a sleep 1
 Performance counter stats for 'system wide':
                 0      probe:__cond_resched

[1]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/Kconfig               | 1 +
 arch/powerpc/include/asm/preempt.h | 1 +
 arch/powerpc/kernel/interrupt.c    | 6 +++++-
 arch/powerpc/lib/vmx-helper.c      | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6d6bbd93abab..01c58f5258c9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -270,6 +270,7 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_RETHOOK			if KPROBES
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
index 51f8f3881523..c0a19ff3f78c 100644
--- a/arch/powerpc/include/asm/preempt.h
+++ b/arch/powerpc/include/asm/preempt.h
@@ -84,6 +84,7 @@ extern asmlinkage void preempt_schedule_notrace(void);
 
 #if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 
+DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
 void dynamic_preempt_schedule(void);
 void dynamic_preempt_schedule_notrace(void);
 #define __preempt_schedule()		dynamic_preempt_schedule()
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8f4acc55407b..0fb01019d7e0 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -38,6 +38,10 @@ static inline bool exit_must_hard_disable(void)
 }
 #endif
 
+#ifdef CONFIG_PREEMPT_DYNAMIC
+DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+#endif
+
 /*
  * local irqs must be disabled. Returns false if the caller must re-enable
  * them, check for new work, and try again.
@@ -396,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (IS_ENABLED(CONFIG_PREEMPTION)) {
+		if (preempt_model_preemptible()) {
 			/* Return to preemptible kernel context */
 			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
 				if (preempt_count() == 0)
diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index 58ed6bd613a6..7b069c832ce2 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -45,7 +45,7 @@ int exit_vmx_usercopy(void)
 	 * set and we are preemptible. The hack here is to schedule a
 	 * decrementer to fire here and reschedule for us if necessary.
 	 */
-	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
+	if (preempt_model_preemptible() && need_resched())
 		set_dec(1);
 	return 0;
 }
-- 
2.39.3


