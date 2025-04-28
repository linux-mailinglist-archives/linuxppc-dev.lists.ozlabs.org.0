Return-Path: <linuxppc-dev+bounces-8104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BD0A9F44D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 17:23:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmS0B6mPNz307q;
	Tue, 29 Apr 2025 01:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745853834;
	cv=none; b=SjIyXHzSWazE8fJ8PKbwNsUA/i3JtQKE5JCRDxDHvJmY5X9jWBDescqp2zKNy4E2d5Zd3mN1ofzDM+RZrZyi53MGIuOKf4+3HgTWG3521lAP1UR0hqKeQ9wTrnFQFmxnjoO7Ur6oDGhcvAmkMp195ClOqAGBLk6jDndMtPS0crUtkstISvyeZRzrScVDFwp4tlJH5hKmO2MDAGskQqrgAxpOU/dU70iZOv8kAONa0VgRyDpq/KdR30aFaMPT04EQ3hnUN4aF3iwqzYqqDOhrafAlix6Q61BSybq5lla8exPM4shstsP7e7b42QEp+01Tf9Zpayt8RLgwz2Wc0bP1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745853834; c=relaxed/relaxed;
	bh=hOcX4nhokUj/XD7KKxzPC558HBJyVxV/1KUKt3QLAPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+5PTGFfuHNIN3XSNYWT/VdH3iECbLJrEjKdkDrHVSmO2VnRoIwrK0LwfLeetU6bzUya2YW8diIgcTaybR7I7e1Nm+R5TbyoVb2SCPjr8AFKevAqwbu0+dH9DWBkvbxJzcpPfG/fVfvbjO6l//e0GGIP+H8UZVMol+oyH7YfTYxcel0TLXcFnm69y/gEYpZDL593+9UmrpHpswvZUoO1O/+x/tTPhcgaJ8WeHwdaEAvq5wnEm4BM7xW+uC2z2pvaWKvRDzpkGeU5MaZOVWNn2VhKs3W6fz5LtkIEkFUi+95njrOer68OTeVm7kX2nJzvAnUJspkUu+tfDkyanldpgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fv4RO+s6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fv4RO+s6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmS0B1jMZz307K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 01:23:54 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAIGer011888;
	Mon, 28 Apr 2025 15:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hOcX4nhokUj/XD7KK
	xzPC558HBJyVxV/1KUKt3QLAPA=; b=Fv4RO+s6JWUF/wbZz18XwYZBlIp86B7rV
	Xxkz0hVBC4BrZKBw6ctPIYxrj8Ykv2wxvoAIfhgjx11QcW+7p8fSP6Ukd4dQAbKA
	av71ULy+ZevnBC+FxxH+suou5prE+xQINh2g4HdmY345omQNUxVJbqcz7VfsXG0F
	dCuHKIjbyJbCjONtbYnxN5uZ85yKFTwpWZin4JjN7gtUnme8xO/Zqdn73W8SzNKH
	2xZUiA+/L+dafC5hS28dKfNLFV8GUjM8rXnuG9Okhp/ClkJbFxebyFh/wC6n+GH5
	bppZ7lpM8nNDDMsbX1WeZD493bz5M7ZgB2Q2H/F4LD5RJJ3xJ3OEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469v5km2a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:39 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SFNcZE009968;
	Mon, 28 Apr 2025 15:23:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469v5km2a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SFGcaE000700;
	Mon, 28 Apr 2025 15:23:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atp71na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SFNXAp40698320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 15:23:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 576A320043;
	Mon, 28 Apr 2025 15:23:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51B0520040;
	Mon, 28 Apr 2025 15:23:27 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.30.54])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 15:23:27 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, ankur.a.arora@oracle.com, sshegde@linux.ibm.com,
        bigeasy@linutronix.de, kees@kernel.org, oleg@redhat.com,
        peterz@infradead.org, tzimmermann@suse.de, namcao@linutronix.de,
        kan.liang@linux.intel.com, mcgrof@kernel.org, rppt@kernel.org,
        atrajeev@linux.vnet.ibm.com, anjalik@linux.ibm.com,
        coltonlewis@google.com, linuxppc-dev@lists.ozlabs.org,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Subject: [RFC V1 2/6] powerpc: Prepare to build with genreic entry/exit framework
Date: Mon, 28 Apr 2025 20:52:23 +0530
Message-ID: <20250428152225.66044-5-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428152225.66044-2-mchauras@linux.ibm.com>
References: <20250428152225.66044-2-mchauras@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: jdiVkyYOrWhumrnl6A6egDEBZc2SqGUr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNCBTYWx0ZWRfX5L/iFVCtT24C WM5xsxO71ulqfyyuLPGCJ3o64992KI/gM8Ldzw87BQjTirj78uiIxHCaXILnQkxolyTdJ0RF8DC bibkkb7/1fyrx0OOd0xXDUYGxB0MdEmMQLOMP4yP6g6P/Hd/jjiUn3z/MEFThdwVB2j1YY3oQ8q
 OlhRfb3388m+WMb1Cp2rVplmwvi0u7/O5y+pE87s41z759fUVceetRRTB/Nqb+gxU6m9qnmXZFb Nl0Emx8zx6SIvr2SbTyiZjYhkzEioJ8lABPh+EWYaEIqBxEDE+g3+XshEjRc2H89fIxGxTg3p1n CG8P6D0hgRik0nWbS88EDhzboQwVmJseUusAhl1NRk9AHy80h7CMKmXZKEbseHkl2rrdqmdoRn9
 izWmuRF6PN5q4aWfsU3B6OlPxGNFliuLwHIW46NjRZ9R5MfePAMEtATk58PlzZ++bfeQAPbQ
X-Proofpoint-GUID: 6eKnF0yz9C1iX_p2ei_SOvCrNKHiZ-S2
X-Authority-Analysis: v=2.4 cv=DvxW+H/+ c=1 sm=1 tr=0 ts=680f9d7b cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=d-Ijs9cN_SKXjrDOqSQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=748 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280124
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enabling build with generic entry/exit framework for powerpc
architecture requires few necessary steps. This patch just takes care
of the preparation.

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
index 0000000000000..e9e4220a1d225
--- /dev/null
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_PPC_ENTRY_COMMON_H
+#define _ASM_PPC_ENTRY_COMMON_H
+
+#ifdef CONFIG_GENERIC_ENTRY
+
+#include <asm/stacktrace.h>
+
+#endif /* CONFIG_GENERIC_ENTRY */
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
index 3dd36c5e334a9..0e94806c7bfe6 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -119,4 +119,9 @@ static inline int syscall_get_arch(struct task_struct *task)
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
2.49.0


