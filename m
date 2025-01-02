Return-Path: <linuxppc-dev+bounces-4592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B0E9FFF53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 20:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPGjg2BH4z300g;
	Fri,  3 Jan 2025 06:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735845575;
	cv=none; b=Pugmy37gNWkfbyTZUGtFAT0jZEugQRGFfVNmVkRsni0Ki45xQbdhNNxKmc0ibr7pD1OIAQYz7HFkppr0W8CrTNYlN57gZdcdGYpgDTUmwuoHrmXW5sLjT/U7fcxtgQsIO0WE/f0gn8qPpRW5YcdjvzPQ9ASo6eYn0KW2sz445orb35l8raCP9msDhOdFfhIfVXKhKBuxNcyOkfaPFronL50Y/6G5PbeyJYGtgjkD9/eSehFA4pj29REoxsNTBdlEQIRKEX0C3O4kvz+i+kk99UIz6TYrrHLx9+fhnp551Hh73ZqM9sZHc2pa9v1SQKXa2j7kKa4HwH026dohtlxuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735845575; c=relaxed/relaxed;
	bh=oR63ZeGMVPV0F+sEW27EKOulH5vJd1f3uHfaBI6/69M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMJgIb+/837ju0GABnsWOKDlA6PRaGMxxzTs89bZcX1l1qTP1jn2oOtZJLv3mf3y8PduWCa1pPBHcQqbHEi0zw/swEUL0VDjv1OiKQSERgaRYHN6jaebH3M6MdcobOFTJWceuS6FeMdqAjGSErWJXP0vRQbdfCcwcwZouYWKBr+IXP9KzWIX7AT7YD6CQ0HZrj/qnWdpDeUojBkljpEEArSR1hRnxQX6rSpx0WP0ifPlefgGNQe10ODiMFkydaB/B8quAJF2OPlYrCIjA9AenkslwiMnf6XYWEkWP+VIg0cmVd8pr5I34NZdbWtAjkXDKdb0yQiW9FqFu4AtHmmWGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AZsiJ0qu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AZsiJ0qu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPGjd4kD4z2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 06:19:33 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502EKSho029219;
	Thu, 2 Jan 2025 19:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oR63ZeGMVPV0F+sEW
	27EKOulH5vJd1f3uHfaBI6/69M=; b=AZsiJ0quLK2dY47hOdRasoMMYcUHigHeP
	D6RyuKcLesvM/qizVp2DkoWjCaVi3RlgcLAZcwjjYOKCt+7tEOI/24czVPwjtozo
	YkL4133DafLWTgybQalotcCxLIZNKnmYNtPzfR0DEvhC3QRjk9rHfy1vprsYnm+7
	GVFAvCsan1l0WJIVvhECQv6/P4mkOkiHoNyxkjghMgdLRQQoQI87CcPE74Ft1Lu+
	+wOhE7sKYb4apNMgZY/03WpRl0Fq8gjmztJOzaahtS1+VNx/BhQDbu4vuafIHAVl
	Ir+whJZQywn7S8DIv1kRaw5dMFsuhNPsy46fRT3ChSY7Wy0wFaQUw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43wfhabmhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:19:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 502JJNWP010051;
	Thu, 2 Jan 2025 19:19:23 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43wfhabmh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:19:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 502Iaqf9014028;
	Thu, 2 Jan 2025 19:19:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tv1ybeha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 19:19:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 502JJJ1r30605940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 19:19:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D40620043;
	Thu,  2 Jan 2025 19:19:19 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 732F020040;
	Thu,  2 Jan 2025 19:19:17 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.222.188])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jan 2025 19:19:17 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] powerpc: Enable dynamic preemption
Date: Fri,  3 Jan 2025 00:48:56 +0530
Message-ID: <20250102191856.499424-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250102191856.499424-1-sshegde@linux.ibm.com>
References: <20250102191856.499424-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Cm8n73Zqrm-5DnRa16pN0f_L8S1Og8Ab
X-Proofpoint-ORIG-GUID: YzE4mfE-dR8M13lQrsl3GJ8wpon97rea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501020167
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Once the lazy preemption is supported, it would be desirable to change
the preemption models at runtime. So add support for dynamic preemption 
using DYNAMIC_KEY.

In irq-exit to kernel path, use preempt_model_preemptible for decision.
Other way would be using static key based decision. Keeping it
simpler since key based change didn't show performance improvement.

Also print the right preemption model in __die. 

::Tested lightly on Power10 LPAR
Performance numbers indicate that, preempt=none(no dynamic) and 
preempt=none(dynamic) are similar.

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


Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com> 
---
 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/preempt.h | 11 +++++++++++
 arch/powerpc/kernel/interrupt.c    |  6 +++++-
 arch/powerpc/kernel/traps.c        |  6 +++++-
 arch/powerpc/lib/vmx-helper.c      |  2 +-
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/preempt.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index db9f7b2d07bf..b14218344e74 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -272,6 +272,7 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_PREEMPT_DYNAMIC_KEY
 	select HAVE_RETHOOK			if KPROBES
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
new file mode 100644
index 000000000000..9d2da4846874
--- /dev/null
+++ b/arch/powerpc/include/asm/preempt.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_POWERPC_PREEMPT_H
+#define __ASM_POWERPC_PREEMPT_H
+
+#include <asm-generic/preempt.h>
+
+#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+#endif
+
+#endif /* __ASM_POWERPC_PREEMPT_H */
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8f4acc55407b..8e2400ba208c 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -25,6 +25,10 @@
 unsigned long global_dbcr0[NR_CPUS];
 #endif
 
+#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 static inline bool exit_must_hard_disable(void)
@@ -396,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (IS_ENABLED(CONFIG_PREEMPTION)) {
+		if (preempt_model_preemptible()) {
 			/* Return to preemptible kernel context */
 			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
 				if (preempt_count() == 0)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index edf5cabe5dfd..2556fa8ec019 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -266,7 +266,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
 	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
+	       preempt_model_none()      ? "none" :
+	       preempt_model_voluntary() ? "voluntary" :
+	       preempt_model_full()      ? "full" :
+	       preempt_model_lazy()      ? "lazy" :
+	       "",
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
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


