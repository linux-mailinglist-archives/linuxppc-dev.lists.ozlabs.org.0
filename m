Return-Path: <linuxppc-dev+bounces-13671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E69C28E99
	for <lists+linuxppc-dev@lfdr.de>; Sun, 02 Nov 2025 12:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cztSX5V8pz3c8h;
	Sun,  2 Nov 2025 22:55:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762084508;
	cv=none; b=ghAXd2gD0nNUwioGK1M6ua+br8vA4pytwcA73jZN1xxreuNhRmoFnmk6+kiouvLs00yDYVdcb767pYLjvk4FIambuFCuCT4K9+4wUuSyiEEBHTQT36ylWUobHVlY/1TDKcW+PBXT0qGmD/Lb1RUYRtCjKPf8UWbO5//essi00hhjVss8TcYCCYu3RsaLSLI3ls3KaowDLVpjss7N2S7YxjDk1eUuu4wqwQ9f4W8Tg6q1ReN2mAWl+WPmGMPPA4GEXdtNQ8fTPS7aWl1eqge94vECCIvA3BRZ9G6viSjB+4uFLpCBvLE2Z9knmHhlKq8VsEihPeUsFf+l9cgh6nhb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762084508; c=relaxed/relaxed;
	bh=V8ZTfX+3o8Mz6houpgo/67hOLWBlvWmPuwprek574zg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgkGKWXbaeGdm1+qvsYS24OdSfwNsbvJE3nSd8BM2g6AvWOE0bpzdrvfzx4aXRgnS2z3sXbnE25wA2PPIfU44nFy8uPwVX/bX4cEYC7bMQA5fD74TZ3MaX2dVZvoPlP+M1uvJ5JjEWY8n6LvAl9VtG2NUOe7u3m51o3vi7nuVzcksgvZRq4OjXc7XuGxvdyecPeKofqadpUkP9utE7d1w81/6c9krK68Nx9vr/2aPS5dDtzw6Ntn2HMd/9i51SmMB9eSF+VyMunqKD6zTLPKszP9whA7aUhHBJb2MOB7o28QiHfdNWjlVW/2PHuB0t8LXGw2sgP7LIUXgOIHd3uHWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p0Ud0iY0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p0Ud0iY0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cztSW2w2pz3bsb
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 22:55:07 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A28EIKE008542;
	Sun, 2 Nov 2025 11:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=V8ZTfX
	+3o8Mz6houpgo/67hOLWBlvWmPuwprek574zg=; b=p0Ud0iY0NDm68LSYtdRVe1
	LKGbrt+h9hAsMR4FVaCAnre4YyrZQqKJ76w4eHk2zv4plXo4V+qoCN8p/i/jVdRD
	bF7hznFOznGMixnz3eusZUsY0eb5OHiSDxJ/IgUt3Mqd+akN+EUP8UxJORg+icdv
	yzThlH14hIvpSmLWEWWrFRWo0/6XDXdiUACxWLeFpX5ozZhQAHJXFqX+6WJHmixd
	YOx0EycYhFOjhsHTkKlQd/ro28ZpEmRP/ffXKraLjuzxy9DXEfXQer37iODta0UM
	/y53hmNEgSjpwVx2F0x66JhGB5LaWT0PZ3Sg0qRMpGCa2i6GCXxnKWCRexDjCM8Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59q8kbm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:24 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A2BsOHq024004;
	Sun, 2 Nov 2025 11:54:24 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59q8kbkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:24 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A26bW1S025582;
	Sun, 2 Nov 2025 11:54:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vhs9jkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A2BsING31064556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Nov 2025 11:54:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0EBA20043;
	Sun,  2 Nov 2025 11:54:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD72920040;
	Sun,  2 Nov 2025 11:54:13 +0000 (GMT)
Received: from li-ce33bfcc-25cf-11b2-a85c-dc105c39188e.ibm.com.com (unknown [9.124.213.75])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Nov 2025 11:54:13 +0000 (GMT)
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
Subject: [PATCH 2/8] powerpc: Prepare to build with generic entry/exit framework
Date: Sun,  2 Nov 2025 17:23:52 +0530
Message-ID: <20251102115358.1744304-3-mkchauras@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=StmdKfO0 c=1 sm=1 tr=0 ts=69074670 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=-TJU0OSysTv48yDGXSgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: xDS46Zjlt-Xc99E7_BW-ob4Pp73cUbPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAxOCBTYWx0ZWRfX+weY3N0vLFcY
 eP1LHAbyKqg/g5pD4mbfx1nniuj5iJv0P85QQkrcO0y3AxsqSBIXXyZRzCMfegsEEq1eUfekIDl
 wBtaanWKs7LGp0ASAeFrRfk42vzJvJz58uLY22arSjCzIGo05siboWx7S0X2b+wBAkbzSoaSOW2
 UvGsL1UAylzUzVBGBJZ5bf6N3BwnS83yjOzF81N3Szn0lDa4WhV5r0MgYD4WSf7U3zBX7DQd93o
 kAjhNx5EaXSqrff5JH03o/FzhxgzUGjzLKtAyNUu4jyGh354QPHLovzCOw1hauXWYrkMhgr+aI8
 An+jDCewbwJhwip85atGkwBc9rRRdSHlVOp47mtikyLdVncGa9zP2ZKDHs/ZGDveXAuBdfjKx0n
 BZIhfhYMUklCP5RhnEwFbljMOroP4Q==
X-Proofpoint-GUID: Q9X2xcTDhy3r4Cq4_n4m3n6ZG8khVjqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

This patch introduces preparatory changes needed to support building
PowerPC with the generic entry/exit (irqentry) framework.

The following infrastructure updates are added:
 - Add a syscall_work field to struct thread_info to hold SYSCALL_WORK_* flags.
 - Provide a stub implementation of arch_syscall_is_vdso_sigreturn(),
   returning false for now.
 - Introduce on_thread_stack() helper to detect if the current stack pointer
   lies within the task’s kernel stack.

These additions enable later integration with the generic entry/exit
infrastructure while keeping existing PowerPC behavior unchanged.

No functional change is intended in this patch.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 11 +++++++++++
 arch/powerpc/include/asm/stacktrace.h   |  6 ++++++
 arch/powerpc/include/asm/syscall.h      |  5 +++++
 arch/powerpc/include/asm/thread_info.h  |  1 +
 4 files changed, 23 insertions(+)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
new file mode 100644
index 000000000000..3af16d821d07
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
index 6149b53b3bc8..a81a9373d723 100644
--- a/arch/powerpc/include/asm/stacktrace.h
+++ b/arch/powerpc/include/asm/stacktrace.h
@@ -10,4 +10,10 @@
 
 void show_user_instructions(struct pt_regs *regs);
 
+static inline bool on_thread_stack(void)
+{
+	return !(((unsigned long)(current->stack) ^ current_stack_pointer)
+			& ~(THREAD_SIZE - 1));
+}
+
 #endif /* _ASM_POWERPC_STACKTRACE_H */
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 4b3c52ed6e9d..834fcc4f7b54 100644
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
index b0f200aba2b3..9c8270354f0b 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -57,6 +57,7 @@ struct thread_info {
 #ifdef CONFIG_SMP
 	unsigned int	cpu;
 #endif
+	unsigned long	syscall_work;		/* SYSCALL_WORK_ flags */
 	unsigned long	local_flags;		/* private flags for thread */
 #ifdef CONFIG_LIVEPATCH_64
 	unsigned long *livepatch_sp;
-- 
2.51.0


