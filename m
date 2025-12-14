Return-Path: <linuxppc-dev+bounces-14747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D1CBBAD2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:04:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1L0mqkz2yFw;
	Mon, 15 Dec 2025 00:04:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717477;
	cv=none; b=friHicjIxCe8rj8tpJfSer7sqZFjfQMPn8+cqv2Y4hyQ9nAuYC0hsP4j+Nukq8gDJJtTVxrmoX45YwIcrXCR6FrmU+k77JaU+FSSIKHO++cBfJIHp5GcEmPTx1CYB5x7KQkf2G+6qPpc+EPuKEuS8e8TdFML+iAcx4j0sOVKR7UpepvOrMk023sz8lxxk44lYd0vygMmeZHo3V469B1teaZpQu19LgUGulReQeGZ92n0fZUd0+c1X2wLu3PZeF/NFEm9Cf03SaKeKa5QQextepn/UioFdSh367viGdoa3Zwa+bJv9rVVxJ4uoUG6gQtF59DBhd8tcP4WCt7fNE2YUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717477; c=relaxed/relaxed;
	bh=/jolJW2+gPI8y5Y7GktU+5onYW2QD73ha480rK6MPRc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hvm0i0Hk76u+SCERAifFRXOjCT+wKJfaC82W+8XFZB4zCVrhSgxuhsAHld2X9tB7me8weUkmQySqdXc9vjxv4xmzW7gz9NAjfQmi41j7x6R8TwDlslCFOCPZWT9tROc8mMK2KgcS3qW7Kj2SNgsgyHalY2J5tTftYsNRGPP4zQkGSTi6i/1EsFX0VgFVK2Uy7/GAjCSnNx31ItJEvi11a/grV4ey+4gg9RJoUyc4wh2PyHWrcJtBzfsYD5RP8KDmIVS+t+IYZwA25IO3XKcx3AzqXR1gMpH7WBI8NW5HezNknQAdj+Jh/cSyB7bNRvC3YTETLKKDaCNqYmZbTflVNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QuIcfnYr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QuIcfnYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1K0KD0z2y7c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:04:36 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BE21xWG016594;
	Sun, 14 Dec 2025 13:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/jolJW
	2+gPI8y5Y7GktU+5onYW2QD73ha480rK6MPRc=; b=QuIcfnYrrBYa3629GPPCD6
	+zZ+tF11SZRKIyBkfmUEYE2YA/KzFROtF2FPHQBESvt12+2JosHFv0OB6CUie8iv
	VYPPsm+I76CPzyOLvEog0V+LEpVP8v4C/f0fJJjzqdZQycS/+2yuanpvB9AkCIqM
	yWoFJ4GodIBO0QfMzi1nhrryD7UNFtVl2IzlqVQGx/vpwOcCzY2R7UuhIscx+/bk
	6H+F2rHc+88xnCnebngx6EJO9Y8K0DMnSMlZXnebw4axglbITX03hMPwMhA04rQi
	3GK6H23mSqw4giK1NDbzGniDDm3klIKvajVsuL0wJLRdC/rUnCNbx7cGJKT8JMUg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:57 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED3uIg003470;
	Sun, 14 Dec 2025 13:03:56 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BE7wNTQ014420;
	Sun, 14 Dec 2025 13:03:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpjhmcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:03:55 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED3pij53477836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:03:52 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C212F20043;
	Sun, 14 Dec 2025 13:03:51 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39FF320040;
	Sun, 14 Dec 2025 13:03:45 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:03:44 +0000 (GMT)
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
Subject: [PATCH v2 2/8] powerpc: Prepare to build with generic entry/exit framework
Date: Sun, 14 Dec 2025 18:32:38 +0530
Message-ID: <20251214130245.43664-3-mkchauras@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HQF4MCtKodlE19YNhWVVl_IXddETPB89
X-Proofpoint-ORIG-GUID: yMzPNLPaALQQzuwyrR_Y58gyZRYa5wa-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX3qFLpDjphYBA
 hBPV+n7/aPOnGcYxEs6oLxtBMu7aQ/M2MLjhnOxhf5FCr7h/9hMMnSopj4AO5vlx9caBwYzzJyI
 s5Sis5BCqwpAzQ4drtXTjz60oSXyC8/rQUh6dFFTdjoHb+Jk9T9oWxf1qW9LGHfYqygelKTCUcj
 Qolv6ozcfXPOs2Jg9l1mbVXfR+cMRAkK7Z52cNEDqPg3ZhINjA1pRe749bjVfrx85IwBE9zzeYf
 Z8EQJWGBlb/Nt0JQbMkU8Jgao/FVM7zhT7OZCT5gQEUcuEfT0dYBqVBBigJ9iBTNY/S3mEqaFjh
 do9R6cyfdHLU/HQayKkESfI5Reu6vpdGddg/CiAR/FsCKRQq9bnIG2jgombwmFuoZYQOqjiK/QD
 cVGsW85jSHXAUAnDiaVslftoH44IkQ==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=693eb5bd cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=-TJU0OSysTv48yDGXSgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
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
2.52.0


