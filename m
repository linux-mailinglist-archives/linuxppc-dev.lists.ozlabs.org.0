Return-Path: <linuxppc-dev+bounces-11891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4EB49B6D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 23:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLKFp2wfvz2ySm;
	Tue,  9 Sep 2025 07:04:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757365470;
	cv=none; b=YtHKDw6uBJYeE4EPRdZA0Sta76Ubo95ghujNxqs64eJRBhbruEXy96A9KUtkPPi02mEsz2c/ibKEcXHr0BGJFFyV5NSvotL727dg0QYPae0sWbzrNaOhpgMBX794m1WXj3IJlKSp3Vk6fIA6Jc9wovOLhtwWHpsxCIPhNu6l25R3NfCR17ZKFRCTyVZDgZ3sM1afh70hudM65F/Acvu8kzF6pXKsytVWbU/5P1Rff71F1Vqr3H7ETdt9GGRc9VQfC4ZX+jG//ocVzqXWSyKZj8s/HAZDfvrUW0Jqr2+HxEwXXE9UWf6xk5R5MoFjthHzop59mhr7epJ5p4gKBabySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757365470; c=relaxed/relaxed;
	bh=FDYq3GCRdm74DZWymBGtDLuAvfzrm7RY6xdVgPWNjww=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iUocYFq679bqBJ8jEm1pkMMOjsKDmZ9lpJG/HMWMfNExNBriLRWM1JfN/I9klfKEp764Dw8g8jYbpmDdtfQRIV4zsI1WK+Wnjspf0aByr9PlHA9/rmKbvX7tT0VVbq6JF0gFrnpsOeJaCrKp54iRmv0ctPJ+9/pOnYCclnyx4QET+S+GeHnhy2I14IeCJfaKJo+ZqfoDjD6CmkvQZVbOMONEMjLQKg85xipZ+uCpVV9YAOmp/+Jpl7P23Q4DJH1FiN/G65nBO/3u84usg9zPnYlwAxyuBGua1q2fpDyX+JMCMXltYtiWHOoGPRke/5YhF14OToZecvcyaBRJDIY8iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sWHA+yW/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sWHA+yW/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLKFn4vQlz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 07:04:29 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588IKoPO030930;
	Mon, 8 Sep 2025 21:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FDYq3G
	CRdm74DZWymBGtDLuAvfzrm7RY6xdVgPWNjww=; b=sWHA+yW/pqRIzjt/dJVTsr
	y9DJsy9bNyA4npCVrJXBvbmjtCXvEWR4rXvLBKJozbOxLg1MiOXpkftH1xhbDiBd
	aUjAkKcIc+Te2I1xHLewIbshNP3ZfhwvFve8qMaLfrC5meW4Th8fGLnD2cgvzhRm
	Y6tlGoUaHsKZfQ8zPZlGo0RRPPurNYQY7y9WVfuIof1QU9EoOzXbtPG5PD49CdzK
	WurRyXK3CYTeDk8KC6mJJnToMJM2p7hHNmtjNyn5ZUl+t/GG5aqEwH+BvQVfnvUA
	6ruf/103rhdvpQyH5MRer6Ot5EzU7vt08eZHD/k9SBgGzenkizy0bDH+gKCXI35Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycrv0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:01 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 588KwAlN007017;
	Mon, 8 Sep 2025 21:04:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycrv0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:04:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 588K9OUp020492;
	Mon, 8 Sep 2025 21:03:59 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0r357-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:03:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 588L3t5Y50725180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 21:03:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 005A920049;
	Mon,  8 Sep 2025 21:03:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C0FF20040;
	Mon,  8 Sep 2025 21:03:47 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.29.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 21:03:46 +0000 (GMT)
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
Subject: [RFC V2 2/8] powerpc: Prepare to build with generic entry/exit framework
Date: Tue,  9 Sep 2025 02:32:30 +0530
Message-ID: <20250908210235.137300-4-mchauras@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4wfgnDpBLph_jDuwm8Yrv5N-n4OHqDwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX4WzA5c3Gvj4i
 TDmTnmbM7Q+Rr8X7UOo9eQZaq2Pxiu72v6lSmRyDgHhPyA7HPU2aNydeUbu5qbrVJLQgiCV/wca
 I0ruQFKFB51PA1phLsp/8A4AZLHGgFY1ffBX35SGQPYySP7dKpqDxUHlRandiRIEhw1eFPx9SWd
 yHOTDJQM6BwHa9+Em7AA5H3eqIVW4o6IVjwvcWl4lgdu0l7fRojdRCdDRii/xzua7CqbVbVj7ce
 PzGL+rx44GhuhJs3Gbs1Di0opjKHCFaqis5S2xd1/oopgNMuWXSAJvgJDKiFiBY2BlWKRB+qWC0
 151VEBTivy08Z/D0C7kDaBpOE0MimowHEXkGfLK+I4AvgMXzeOO+B/rAGm0+dfth12PXVwC0R/V
 0B8HOc1Q
X-Proofpoint-GUID: kmjlrILui_QY0F368KmxE_h1tKHVoW0J
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bf44c1 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=d-Ijs9cN_SKXjrDOqSQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
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

Enabling build with generic entry/exit framework for powerpc
architecture requires few necessary steps.

Introducing minor infrastructure updates to prepare for future generic
framework handling:

- Add syscall_work field to struct thread_info for SYSCALL_WORK_* flags.
- Provide arch_syscall_is_vdso_sigreturn() stub, returning false.
- Add on_thread_stack() helper to test whether the current stack pointer
  lies within the task’s kernel stack.

No functional change is intended with this patch.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 11 +++++++++++
 arch/powerpc/include/asm/stacktrace.h   |  8 ++++++++
 arch/powerpc/include/asm/syscall.h      |  5 +++++
 arch/powerpc/include/asm/thread_info.h  |  1 +
 4 files changed, 25 insertions(+)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
new file mode 100644
index 0000000000000..3af16d821d07e
--- /dev/null
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_PPC_ENTRY_COMMON_H
+#define _ASM_PPC_ENTRY_COMMON_H
+
+#ifdef CONFIG_GENERIC_IRQ_ENTRY
+
+#include <asm/stacktrace.h>
+
+#endif /* CONFIG_GENERIC_IRQ_ENTRY */
+#endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/stacktrace.h b/arch/powerpc/include/asm/stacktrace.h
index 6149b53b3bc8e..3f0a242468813 100644
--- a/arch/powerpc/include/asm/stacktrace.h
+++ b/arch/powerpc/include/asm/stacktrace.h
@@ -8,6 +8,14 @@
 #ifndef _ASM_POWERPC_STACKTRACE_H
 #define _ASM_POWERPC_STACKTRACE_H
 
+#include <linux/sched.h>
+
 void show_user_instructions(struct pt_regs *regs);
 
+static inline bool on_thread_stack(void)
+{
+	return !(((unsigned long)(current->stack) ^ current_stack_pointer)
+			& ~(THREAD_SIZE -1));
+}
+
 #endif /* _ASM_POWERPC_STACKTRACE_H */
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 4b3c52ed6e9d2..834fcc4f7b543 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -139,4 +139,9 @@ static inline int syscall_get_arch(struct task_struct *task)
 	else
 		return AUDIT_ARCH_PPC64;
 }
+
+static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
+{
+	return false;
+}
 #endif	/* _ASM_SYSCALL_H */
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 2785c7462ebf7..d0e87c9bae0b0 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -54,6 +54,7 @@
 struct thread_info {
 	int		preempt_count;		/* 0 => preemptable,
 						   <0 => BUG */
+	unsigned long	syscall_work;		/* SYSCALL_WORK_ flags */
 #ifdef CONFIG_SMP
 	unsigned int	cpu;
 #endif
-- 
2.51.0


