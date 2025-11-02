Return-Path: <linuxppc-dev+bounces-13668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D31CEC28E8A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 02 Nov 2025 12:55:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cztSW4yfBz3bt7;
	Sun,  2 Nov 2025 22:55:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762084507;
	cv=none; b=OsyYYEThetZuFuLvtz2Nm97dRi6m2chwuGnA2BVY6iRyiXPUdby1iKuOQFh06ifoPXE8rRkdbAmpM2vL8gk6t8Aomnefk/qbHdS9Zv8maAFRJFovqzIvc4Wh6m0LnpXCKA7Hplw/L3a2N2EybFy17J0jPxk9QgoGCI+xM/Xk1BEkXSrDA+DvmvS7vlW0NfRMS4ehJaqakOKHxbMmxkPdnWSeMipJMeRgLbSm5s2QpLD3FZ7Y1DbpaHAjIlasp57SUEyW481ch9EFNgo1Luezffeo9seDRtozUrJak2k527AJUsBEDh/JLe3+BU5R2J+hIPCgB5pJ28CS/+ZFyVGOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762084507; c=relaxed/relaxed;
	bh=ut52stePIOg2XiXxgSjdwZtVxB268WidU50nRM53hLc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MaxdeU7WFCxS64TIEs6rk8UgyG+R7wbuQaMkVBA60uxiv9HSHdKcK///ZkruYeBIKoMI1cjEdhqQ/WA8M/qAzihkNLxHHi8kYHXbSXke2QhEWHAibol3fUq/x0a/f4rSrNLx9YM0W+dh0LFdiFmfnarFxwndCFgilAvlBVXSVS11FD6ii/VhDG1n8X9InKJPwawIBoACeKPxsSPRtZkREj5f+n+ibqYmtTzvRPS/81hKrAOrGPO//uH7cf95w6Mj0UUo72mxTZgj6xSbZmsDS78J++eqGdGXxbBYqCcL+bDJN9rZU5+6nhM9ZsIanLgAQyrtsALAiX/6cMzlGcIUYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BjTKqD8t; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BjTKqD8t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cztSV2vlWz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 22:55:06 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A25v6Vt009805;
	Sun, 2 Nov 2025 11:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ut52stePIOg2XiXxg
	SjdwZtVxB268WidU50nRM53hLc=; b=BjTKqD8twUOTcHaxa4LbpZUUUIfSr6q0m
	aMaCf6QFYZbttJN9vwcNT2OxK33ruXSVd/49xcMotgLNaTwfgv0+TdjQNohVcrgS
	i8Avqq47vrMW9LJOw8Q1xRueANY8FasEJYN6PxArQMS6CDuqB9VNjJ2S95oBhKCt
	tFUqUlCIRLyO+X1P+PmMT8pKARjK5z6ABvovqovvYuThN/4ZYJlRhSTZZyzO7SiO
	65iiKHPHGhBSVfAcldwQSZTyfRo0GBuQUJym+rRA7weHq6v0kSauqRCN8+JHHrmU
	I5y5KtbJ+9yA4U1fIy67dipXO/0F+DO0aQAhhf9YoDg6Fw88jNB7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vu3b4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:40 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A2Bse1L032040;
	Sun, 2 Nov 2025 11:54:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59vu3b4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A26koB4025588;
	Sun, 2 Nov 2025 11:54:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vhs9jm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A2BsZQO57606452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Nov 2025 11:54:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 787F320043;
	Sun,  2 Nov 2025 11:54:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBBF120040;
	Sun,  2 Nov 2025 11:54:29 +0000 (GMT)
Received: from li-ce33bfcc-25cf-11b2-a85c-dc105c39188e.ibm.com.com (unknown [9.124.213.75])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Nov 2025 11:54:29 +0000 (GMT)
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
Subject: [PATCH 5/8] powerpc: add exit_flags field in pt_regs
Date: Sun,  2 Nov 2025 17:23:55 +0530
Message-ID: <20251102115358.1744304-6-mkchauras@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mJM0JM27faqjWj0c1AJKLasSnLV7kjrV
X-Proofpoint-GUID: 6b5O4sV8hysWuGLv9qK8bWJN9oeJZT-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfXy1+23QNkzIDK
 TlHfmIG90d5EvVbfjtaiGjz1QUuQuu2jh4hNen2fpx0E7YwDGVbMZXioVTxTtBLjMvGGNaHjKHJ
 0FMg/u0EllOW3jj7uI1FgvD9wHR2cbnnnFmkHtqG+zBS48byt7rTF5HCmIeXI4Jd+rrCQjC5/7J
 CdlRwpVdrFH2xh4kgnU+IdwfVmTZYTj9X3mmTe3lLkzY0GtYtrqChzSeCeDEHp0No9Bb/u6qo+L
 cyIuNt7yacyLsJn5kHAbQHU0vwY+f8YKdKKeKO49XlCP9oW/Z3onN7XjwA6wUWVD/X3kv1XrQKj
 p7JTrjqaRs+CuwOZf6eN/q4TdvkSxMgv1nJX59vs62gBgzUrobt4vHarYHzOlTN4q00Y5vfRqmq
 dcPM+pRrLFg0N+tNQt+TOLfCMzbNEQ==
X-Authority-Analysis: v=2.4 cv=U6qfzOru c=1 sm=1 tr=0 ts=69074680 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=mnynasnECEr2HgeGZQUA:9 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Add a new field `exit_flags` in the pt_regs structure. This field will hold
the flags set during interrupt or syscall execution that are required during
exit to user mode.

Specifically, the `TIF_RESTOREALL` flag, stored in this field, helps the
exit routine determine if any NVGPRs were modified and need to be restored
before returning to userspace.

This addition ensures a clean and architecture-specific mechanism to track
per-syscall or per-interrupt state transitions related to register restore.

Changes:
 - Add `exit_flags` and `__pt_regs_pad` to maintain 16-byte stack alignment
 - Update asm-offsets.c and ptrace.c for offset and validation
 - Update PT_* constants in uapi header to reflect the new layout

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/ptrace.h      |  3 +++
 arch/powerpc/include/uapi/asm/ptrace.h | 14 +++++++++-----
 arch/powerpc/kernel/asm-offsets.c      |  1 +
 arch/powerpc/kernel/ptrace/ptrace.c    |  1 +
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 94aa1de2b06e..3af8a5898fe3 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -53,6 +53,9 @@ struct pt_regs
 				unsigned long esr;
 			};
 			unsigned long result;
+			unsigned long exit_flags;
+			/* Maintain 16 byte interrupt stack alignment */
+			unsigned long __pt_regs_pad[1];
 		};
 	};
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_KUAP)
diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
index 01e630149d48..de56b216c9c5 100644
--- a/arch/powerpc/include/uapi/asm/ptrace.h
+++ b/arch/powerpc/include/uapi/asm/ptrace.h
@@ -55,6 +55,8 @@ struct pt_regs
 	unsigned long dar;		/* Fault registers */
 	unsigned long dsisr;		/* on 4xx/Book-E used for ESR */
 	unsigned long result;		/* Result of a system call */
+	unsigned long exit_flags;	/* System call exit flags */
+	unsigned long __pt_regs_pad[1];	/* Maintain 16 byte interrupt stack alignment */
 };
 
 #endif /* __ASSEMBLER__ */
@@ -114,10 +116,12 @@ struct pt_regs
 #define PT_DAR	41
 #define PT_DSISR 42
 #define PT_RESULT 43
-#define PT_DSCR 44
-#define PT_REGS_COUNT 44
+#define PT_EXIT_FLAGS 44
+#define PT_PAD 45
+#define PT_DSCR 46
+#define PT_REGS_COUNT 46
 
-#define PT_FPR0	48	/* each FP reg occupies 2 slots in this space */
+#define PT_FPR0	(PT_REGS_COUNT + 4)	/* each FP reg occupies 2 slots in this space */
 
 #ifndef __powerpc64__
 
@@ -129,7 +133,7 @@ struct pt_regs
 #define PT_FPSCR (PT_FPR0 + 32)	/* each FP reg occupies 1 slot in 64-bit space */
 
 
-#define PT_VR0 82	/* each Vector reg occupies 2 slots in 64-bit */
+#define PT_VR0	(PT_FPSCR + 2)	/* <82> each Vector reg occupies 2 slots in 64-bit */
 #define PT_VSCR (PT_VR0 + 32*2 + 1)
 #define PT_VRSAVE (PT_VR0 + 33*2)
 
@@ -137,7 +141,7 @@ struct pt_regs
 /*
  * Only store first 32 VSRs here. The second 32 VSRs in VR0-31
  */
-#define PT_VSR0 150	/* each VSR reg occupies 2 slots in 64-bit */
+#define PT_VSR0	(PT_VRSAVE + 2)	/* each VSR reg occupies 2 slots in 64-bit */
 #define PT_VSR31 (PT_VSR0 + 2*31)
 #endif /* __powerpc64__ */
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a4bc80b30410..c0bb09f1db78 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -292,6 +292,7 @@ int main(void)
 	STACK_PT_REGS_OFFSET(_ESR, esr);
 	STACK_PT_REGS_OFFSET(ORIG_GPR3, orig_gpr3);
 	STACK_PT_REGS_OFFSET(RESULT, result);
+	STACK_PT_REGS_OFFSET(EXIT_FLAGS, exit_flags);
 	STACK_PT_REGS_OFFSET(_TRAP, trap);
 #ifdef CONFIG_PPC64
 	STACK_PT_REGS_OFFSET(SOFTE, softe);
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index c6997df63287..2134b6d155ff 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -432,6 +432,7 @@ void __init pt_regs_check(void)
 	CHECK_REG(PT_DAR, dar);
 	CHECK_REG(PT_DSISR, dsisr);
 	CHECK_REG(PT_RESULT, result);
+	CHECK_REG(PT_EXIT_FLAGS, exit_flags);
 	#undef CHECK_REG
 
 	BUILD_BUG_ON(PT_REGS_COUNT != sizeof(struct user_pt_regs) / sizeof(unsigned long));
-- 
2.51.0


