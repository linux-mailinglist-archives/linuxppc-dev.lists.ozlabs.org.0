Return-Path: <linuxppc-dev+bounces-3540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788059D7ABE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 05:23:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxXcp69NMz2yWr;
	Mon, 25 Nov 2024 15:23:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732508586;
	cv=none; b=mUiIqdT2qENlSZuJ//C/pCV++GWCUPjBY7UNXLbqr72iCrWl25YqBtPAcfTF7zsxI+mVd/CFh8+K/jktjygG2WgFJcvKKHZDqH58mAkFAaAJXkuNn3pHrYpSI+YR+xNuGyPXY82aJ5ivTzcDcD/MbDTvlIa8ZKd9KZrakFTQd3GoE5I+G7Dppnrzf/tQRm6PLL4e0o5R+8xoeJIvNxV3DWaWWWsc/Jf2LbNwJPYT2rsOCRvZEjyJLvJ4XTgiqirr1umfS3HcqAVZgE0EP9PQRWIuMCWkGcMGKLCl2vcX0lOHNnu4AWRBUIpN9zNgXZMT+pVEuZveqBVBEyN/zdpzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732508586; c=relaxed/relaxed;
	bh=YNMBgHfy3C4R8Gz6DzO4U9DsMkZI5skWzbBBm0nO8Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtVZPqlSvl3P3iaKoRMlhY3MWVNHv2/8vBhY1rBshrNn7D+gr3HnaZQksQL7Y19rvYMMY3XuIJvxTeiOv7c5V+avHFKSg5X3ovaJ9bohXSLbSadRoC3I3nX8QkkZHnK8jX2npPCQAmg8h6Mc9q+qKO4JZfY1htD3c85+YtywpBLJVQOA82FgWnQSHZjXNjh3vf5aKe3JMxI3fmrhJF6EO+U4ptEcT9e68k+pJSpbi8BjXQPzYZi2Na+8qDTJ3ifJ/XLXq5hYurOLmrDbCb8xZljICGiCyNrTEJOt4ZP8UffE01dGRAQ4Y8UNa7Jx+IQMWqtej1pSmwjZs7IOI3STDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hAQOmotu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hAQOmotu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxXcm3xc1z2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 15:23:04 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOCF6FP005975;
	Mon, 25 Nov 2024 04:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=YNMBgHfy3C4R8Gz6D
	zO4U9DsMkZI5skWzbBBm0nO8Wg=; b=hAQOmotukRPWZQXOSXatuRbFVnB3HNWCJ
	ciyA9L8O65qGszy4bKpzP5Z2IiSzuPRAD04QI3R3wZw8ef31D91Xtggn4mz912mi
	OD5XTyrngQvHTbBr+0ARwiOnuzQtad0+lzn2qW9oZknY4HazJqHST8sHH+ZiihbE
	2OzQ/G+i5x/SCIXhPpadfnWZaP+YpU6wcxoxlDdJNlshsU6lOHcxthFYNzLwegfx
	wZtiDPLqsfPqCgwF52ivd4koixQP8STWI21KNlohFg+BGc0mV37OqEiAd603qB6Q
	eeWkKbQPr86R6Nd6P5E7GzIQqhZ+V4kGvrcaYPxLq5e15RnpudcNA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43386n6at2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:38 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AP4MbHA032729;
	Mon, 25 Nov 2024 04:22:37 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43386n6at0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP4GVX9024897;
	Mon, 25 Nov 2024 04:22:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 433tvjtjuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 04:22:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AP4MWZr11600288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Nov 2024 04:22:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 442F620043;
	Mon, 25 Nov 2024 04:22:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1797420040;
	Mon, 25 Nov 2024 04:22:30 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Nov 2024 04:22:29 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, bigeasy@linutronix.de, ankur.a.arora@oracle.com,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        vschneid@redhat.com, peterz@infradead.org
Subject: [PATCH 1/3] powerpc: copy preempt.h into arch/include/asm
Date: Mon, 25 Nov 2024 09:52:10 +0530
Message-ID: <20241125042212.1522315-2-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: AYPQ7aqJFQcxY3eXWGHJvMw2bpgs55kG
X-Proofpoint-ORIG-GUID: vLONr2_e6HWnYqcbwnVdSOhsocCl1FiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=820 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250031
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PowerPC uses asm-generic preempt definitions as of now.
Copy that into arch/asm so that arch specific changes can be done.
This would help the next patch for enabling dynamic preemption.

No functional changes intended.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/preempt.h | 100 +++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 arch/powerpc/include/asm/preempt.h

diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
new file mode 100644
index 000000000000..51f8f3881523
--- /dev/null
+++ b/arch/powerpc/include/asm/preempt.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_PREEMPT_H
+#define __ASM_PREEMPT_H
+
+#include <linux/thread_info.h>
+
+#define PREEMPT_ENABLED	(0)
+
+static __always_inline int preempt_count(void)
+{
+	return READ_ONCE(current_thread_info()->preempt_count);
+}
+
+static __always_inline volatile int *preempt_count_ptr(void)
+{
+	return &current_thread_info()->preempt_count;
+}
+
+static __always_inline void preempt_count_set(int pc)
+{
+	*preempt_count_ptr() = pc;
+}
+
+/*
+ * must be macros to avoid header recursion hell
+ */
+#define init_task_preempt_count(p) do { \
+	task_thread_info(p)->preempt_count = FORK_PREEMPT_COUNT; \
+} while (0)
+
+#define init_idle_preempt_count(p, cpu) do { \
+	task_thread_info(p)->preempt_count = PREEMPT_DISABLED; \
+} while (0)
+
+static __always_inline void set_preempt_need_resched(void)
+{
+}
+
+static __always_inline void clear_preempt_need_resched(void)
+{
+}
+
+static __always_inline bool test_preempt_need_resched(void)
+{
+	return false;
+}
+
+/*
+ * The various preempt_count add/sub methods
+ */
+
+static __always_inline void __preempt_count_add(int val)
+{
+	*preempt_count_ptr() += val;
+}
+
+static __always_inline void __preempt_count_sub(int val)
+{
+	*preempt_count_ptr() -= val;
+}
+
+static __always_inline bool __preempt_count_dec_and_test(void)
+{
+	/*
+	 * Because of load-store architectures cannot do per-cpu atomic
+	 * operations; we cannot use PREEMPT_NEED_RESCHED because it might get
+	 * lost.
+	 */
+	return !--*preempt_count_ptr() && tif_need_resched();
+}
+
+/*
+ * Returns true when we need to resched and can (barring IRQ state).
+ */
+static __always_inline bool should_resched(int preempt_offset)
+{
+	return unlikely(preempt_count() == preempt_offset &&
+			tif_need_resched());
+}
+
+#ifdef CONFIG_PREEMPTION
+extern asmlinkage void preempt_schedule(void);
+extern asmlinkage void preempt_schedule_notrace(void);
+
+#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+
+void dynamic_preempt_schedule(void);
+void dynamic_preempt_schedule_notrace(void);
+#define __preempt_schedule()		dynamic_preempt_schedule()
+#define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
+
+#else /* !CONFIG_PREEMPT_DYNAMIC || !CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
+
+#define __preempt_schedule() preempt_schedule()
+#define __preempt_schedule_notrace() preempt_schedule_notrace()
+
+#endif /* CONFIG_PREEMPT_DYNAMIC && CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
+#endif /* CONFIG_PREEMPTION */
+
+#endif /* __ASM_PREEMPT_H */
-- 
2.39.3


