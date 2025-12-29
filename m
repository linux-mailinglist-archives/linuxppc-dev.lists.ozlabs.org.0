Return-Path: <linuxppc-dev+bounces-15080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5883FCE5ECA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 05:56:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfkSY3wLbz2yFW;
	Mon, 29 Dec 2025 15:55:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766984157;
	cv=none; b=FXgl9ZORFjOxpN+jqNTZeXEz77NIXWAEZJ/laNip4YwgW8TvsW1FFOXVPPJltm/QIwX0hiGCHfm15YfVV2birEuu4qOXPcF0aA5dcCXgBiYrdlV/jUaV7WMwNd88DuELBLhdCDwIRvdAY5l+pyRt3Lw1ejB4ilzcKXaqrDdiflCvyapmx8JWz5EdqSqq1YqzBpT0sYlaPZqoySlfNEyB2mN656mIsWRy5Z56H/QR/Zfo86++KiEWKAZwWl2cJgTdTIQtpRRT6QacTRGK73kQYFTikYVwLNVE1Y9aDTkVqfLu0BH5mvmAKUy8/pP36d3UPBX/U071F6Bz0prmFauf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766984157; c=relaxed/relaxed;
	bh=3/4eib+xpLvUzfwQLFLDzDvh/omm20aA/cPzLNpHvRY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEgeRDA1NgIaW+hT4v+wFwTS2H6p1SMUDRJ5m+U/72twixstXhmt4THmdCloPMPtz9Js2DGAu8dCkvn+Q1MQV9Md+lj3nEwT9KVwFqS61uNDFNdm40WcIbEf10FXezHmTr1KveO5qE+hsgvDMJ4NDizA9LYeWIDbCwo32x5xMNAVyMTVPwNCaooDOSJwQI7xxbcvmHvKy5MTfob00jR1rH+fvCy9Q+2yJ4NH14B7CzIHtTAM55E4L7+pmVeodnRsLBpbjoHbEX55vWrO61ruo3+h4xKdeqm1A4arhXk/WRW3pDvirv8iIdeN0QGcZ/auGeE8LG8W1QbJQPTekxodew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QzdpiWc0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QzdpiWc0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfkSX06lCz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 15:55:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BSMoTbk006180;
	Mon, 29 Dec 2025 04:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3/4eib
	+xpLvUzfwQLFLDzDvh/omm20aA/cPzLNpHvRY=; b=QzdpiWc0iJFgpiSHp3YEzF
	1uU+JtZiSpjxsjzrqoetvLy5R8BT/IjEcDEM3favVxfGzK0xCoB9cxdDbWEuF1yL
	v/nsaw3MKdPNJR23l0mrU1Z++JGUgu3RkY47r44fHQyIiQnNeQCNcZftildm7FwF
	lzXZkI+Pm9j8xau4IWFS+W8nYoxGGuwODhssnMZqGPIcz1nIiygDfQHg3p2Xf7c8
	XevPti3VRLzHvQnV7iJiNNwGPuQqlwe+hAWKRDe7wUZ8Kr3EblPDthjA+A4aDztH
	zQd802v+XE0WHJNtK8ehs17MzO4wfZaFZCsrWysBbcnDAYVQsREXJ7jAmtb4WCSg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vn43d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:13 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BT4tDKI027509;
	Mon, 29 Dec 2025 04:55:13 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73vn43b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BT3OUkG008042;
	Mon, 29 Dec 2025 04:55:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bav0jksgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:12 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BT4t8Ue13107560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 04:55:08 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15F5F20043;
	Mon, 29 Dec 2025 04:55:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39AF420040;
	Mon, 29 Dec 2025 04:55:03 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.39.24.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Dec 2025 04:55:03 +0000 (GMT)
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
Subject: [PATCH v3 2/8] powerpc: Prepare to build with generic entry/exit framework
Date: Mon, 29 Dec 2025 10:24:10 +0530
Message-ID: <20251229045416.3193779-3-mkchauras@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tXvM3qWWtQ-SsrpvLlFyO4cnUp74BbFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MSBTYWx0ZWRfXxdn2qULKcZWA
 MHzin1KWATdrKrL+fAzxnsOo5EQdC5dxTjNILY590JsGSEeW1YfYMu/cHqwWKiYY1Cae8qLy0HD
 TzEti1AdDqfzXZ+fv8cc+HEQBPu+VoHS/qhJOA8JlkkcujrSfUbcm3/R5AniizlphC1v1GXz5FU
 H8y82XVDGFyWfJ+1V6DhiyrpV0uOF8VWRyAB5Y+tZQEMT5TyXICnxoIMC5yEcoEEEmW2v+zM1t4
 1yKFWunOYWvuncaa5HwHjaRdq73u22yTekkukO8lm9ezx8XZuoSyjhJ6BvPpdmxZju4KfbALA5Y
 pcjFyW5blgc5vIRXidpFGeONxJCrciCBNndMERuxPFjpnCpMY6+teodR7Dl77z4i+3/7MQhatYf
 vbI7jxVXckRpYKVfcb0tvoMCOfza27ScJRLHBMjwaHlqDkjuxs21seTZtKeMa8yklbI6Bhm15xr
 qCZy3yrF8R9CGrJMPvA==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=695209b1 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=-TJU0OSysTv48yDGXSgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LayJDhpx6hVlcfI8ezg91mxRAdxLPOCf
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
 arch/powerpc/include/asm/entry-common.h | 8 ++++++++
 arch/powerpc/include/asm/stacktrace.h   | 6 ++++++
 arch/powerpc/include/asm/syscall.h      | 5 +++++
 arch/powerpc/include/asm/thread_info.h  | 1 +
 4 files changed, 20 insertions(+)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
new file mode 100644
index 000000000000..05ce0583b600
--- /dev/null
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_PPC_ENTRY_COMMON_H
+#define _ASM_PPC_ENTRY_COMMON_H
+
+#include <asm/stacktrace.h>
+
+#endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/stacktrace.h b/arch/powerpc/include/asm/stacktrace.h
index 6149b53b3bc8..987f2e996262 100644
--- a/arch/powerpc/include/asm/stacktrace.h
+++ b/arch/powerpc/include/asm/stacktrace.h
@@ -10,4 +10,10 @@
 
 void show_user_instructions(struct pt_regs *regs);
 
+static __always_inline bool on_thread_stack(void)
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
2.52.0


