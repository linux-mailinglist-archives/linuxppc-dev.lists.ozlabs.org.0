Return-Path: <linuxppc-dev+bounces-12707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9245BC3EDE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 10:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chRYj5smSz3057;
	Wed,  8 Oct 2025 19:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759913465;
	cv=none; b=fDc/w4oaFihF/bdNCXfemZYRMgInaVBfMLyDlsMVCtdo/ooLoZ+0r5Rs7qcRottkDafthTrw5pA8wigIx+254jaTiuV/DtMvRzmkS7s553Q1C00GUM+Sxoevt5mOtRx4Qjurth5s5c0KYtgZwBn1urjPMLlvgi8zqbgB8D162mf5e2crhlegppB7lBiKUcQzQKzbiqM2L1b9OCBwRhVc/TGuMPZY26CUlxiCDk9JpoLJ+io6OIp0cWMPMDYohNC/O2iD6eEQPoS7QddPBvdhQ7sMamgyk3xKeKlYGzu+FPLExMrdXELSunt5VuZ/8eVSXY8oSlAgFIm3DDhk1p3/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759913465; c=relaxed/relaxed;
	bh=Ji+Z2s11diIXNL8bVho8bc/Lj4yhx19+I6xuhIPEgg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XCEFReh58OFl+HVkoOQC+4NUnwCr2clbCtUjjXvILySI308Ascos5dlqAgtagk9/+FY0IU5dxW41szIHT3QhCsJqaxpY4uz+kx9QC9YQjBS4iW5Za9M88uyWTCnMy+dTiKmEiOX3HmLlHu0pOkRSydOvP4GuBAA4QH0RVKBCrS/h80u0BtseRFosGYkcIKLbdT7uJyJFiWqbgA8acZLyMQmkSV2yVBw2RnyLzgDqIhx5H1PPLHr/H1lJZJhnR6O1ucs0qZAE+8G4G1jjblEIjhyy3rIrBoN/rHlX+y3jaX0XHcdXlaLsRQ2BETIU08i3OsFFoGPU+YswI4IcbfdO+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DY7zfr5C; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DY7zfr5C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chRYd2swTz300F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 19:51:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597IxLqQ009447;
	Wed, 8 Oct 2025 08:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Ji+Z2s11diIXNL8bVho8bc/Lj4yhx19+I6xuhIPEg
	g0=; b=DY7zfr5CkRx8eOvWT6tR/Cav0LD36FfhHCFcuF0jtfs2TsxbaWYjdsbJE
	eY2JCEGw2SMfZ53THvzybG72oYVZs7UbR+ZpLZ9YQZViIBqbWvZfJoRfzUdIOqOz
	PR5zs5n/F6fj2L/Xgr3dGjsrtCxb5yREBnf/7RoQzX9oyJz3DOj3hpMUXTC4Xb0G
	QJaKRMyg/vc4MHJnnaQY7jJT29NjmnfSisxBGbr8cOnUVzBArLyxeTzseXDnbO8s
	5gaMynpa6GeZAvkp8NncuG1ZrHXD2+vF8BE9tjcMS5DO7Lelzm42esh+Ixaifh0c
	gqI45aR17s8tXQXuaMN7+dDcFdzHQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49jt0pkeap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 08:50:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5988W8Tq023328;
	Wed, 8 Oct 2025 08:50:30 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49jt0pkeak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 08:50:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5986PJUD013252;
	Wed, 8 Oct 2025 08:50:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49kg4jqfd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 08:50:29 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5988oRCO40960410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Oct 2025 08:50:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A93120043;
	Wed,  8 Oct 2025 08:50:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBA472004B;
	Wed,  8 Oct 2025 08:50:22 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.240])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Oct 2025 08:50:22 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
        Jiri Olsa <jolsa@kernel.org>, Viktor Malik <vmalik@redhat.com>,
        live-patching@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
        Joe Lawrence <joe.lawrence@redhat.com>, Jiri Kosina <jikos@kernel.org>,
        linux-trace-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: [PATCH v2] powerpc64/bpf: support direct_call on livepatch function
Date: Wed,  8 Oct 2025 14:20:21 +0530
Message-ID: <20251008085021.69988-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Authority-Analysis: v=2.4 cv=XvT3+FF9 c=1 sm=1 tr=0 ts=68e625d7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=VnNF1IyMAAAA:8
 a=-2KXX0oJnJaVn1jAxeUA:9 a=WzC6qhA0u3u7Ye7llzcV:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: aVLkeNntDDRU3oDNk64bu7aj32lp8oY8
X-Proofpoint-GUID: dckqDDY1isTMTHDC6BxD5swLUFjKf_Eq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwOSBTYWx0ZWRfX6/irdvjJUQVK
 GvxR7NfpFB+r1oX4aa4oXlMW9+4NiwYsPN/joqI3bAdje6ytFhij8dOhQoAiikqDZdF3Q8isTnY
 RItEuKhoVwS2GP/1ifRb8Pb/ouKILt+cV9KZ+BuauWXTniFCoJAsEyNQkBP2Huvekc1xHACFcOu
 tpfOyyxhdOS+ivDqLaCyPYFMzybeU4IJ0IBUtm49NAqIHB50HKuGKSHk0uZf5sCnes3wY7UPJ0m
 jnrSDJiAUlFgV58c+RRBCejqz6idJwnpBkgojfWFoQ9yh/5rLo49NygMqfWJldjR9xHXC11P/8O
 aWVlG5gsLusB9ph63Wqwec36ehAfEdqSjx+8ATohArZyOQm+vt7maD7b1N9EvytaLdIHa49PJS2
 rpC3Zx/ZVvuCzwyVLPIP84AcTP+NdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Today, livepatch takes precedence over direct_call. Instead, save the
state and make direct_call before handling livepatch. This change
inadvertly skips livepatch stack restore, when an attached fmod_ret
program fails. To handle this scenario, set cr0.eq bit to indicate
livepatch is active while making the direct_call, save the expected
livepatch stack state on the trampoline stack and restore it, if and
when required, during do_fexit in the trampoline code.

Reported-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Closes: https://lore.kernel.org/all/rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr/
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Fixed compile error reported by kernel test bot for !CONFIG_LIVEPATCH


 arch/powerpc/include/asm/livepatch.h     | 15 +++++
 arch/powerpc/kernel/trace/ftrace_entry.S | 74 +++++++++++++++++++----
 arch/powerpc/net/bpf_jit_comp.c          | 75 ++++++++++++++++++++++++
 3 files changed, 154 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/livepatch.h b/arch/powerpc/include/asm/livepatch.h
index d044a1fd4f44..356c1eb46f5d 100644
--- a/arch/powerpc/include/asm/livepatch.h
+++ b/arch/powerpc/include/asm/livepatch.h
@@ -7,6 +7,20 @@
 #ifndef _ASM_POWERPC_LIVEPATCH_H
 #define _ASM_POWERPC_LIVEPATCH_H
 
+#ifdef CONFIG_LIVEPATCH_64
+#define LIVEPATCH_STACK_MAGIC_OFFSET	8
+#define LIVEPATCH_STACK_LR_OFFSET	16
+#define LIVEPATCH_STACK_TOC_OFFSET	24
+
+#if defined(CONFIG_PPC_FTRACE_OUT_OF_LINE) && defined(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS)
+#define LIVEPATCH_STACK_FRAME_SIZE	32	/* Allocate 4 x 8 bytes (to save new NIP as well) */
+#define LIVEPATCH_STACK_NIP_OFFSET	32
+#else
+#define LIVEPATCH_STACK_FRAME_SIZE	24	/* Allocate 3 x 8 bytes */
+#endif
+#endif
+
+#ifndef __ASSEMBLY__
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 
@@ -20,4 +34,5 @@ static inline void klp_init_thread_info(struct task_struct *p)
 static inline void klp_init_thread_info(struct task_struct *p) { }
 #endif
 
+#endif /* !__ASSEMBLY__ */
 #endif /* _ASM_POWERPC_LIVEPATCH_H */
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 6599fe3c6234..b98f12f378b1 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -8,6 +8,7 @@
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/ftrace.h>
+#include <asm/livepatch.h>
 #include <asm/ppc-opcode.h>
 #include <asm/thread_info.h>
 #include <asm/bug.h>
@@ -244,6 +245,8 @@
 	/* jump after _mcount site */
 #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* For direct_call, set cr0.eq bit only if livepatch is active */
+	crclr	4*cr0+eq
 	bnectr	cr1
 #endif
 	/*
@@ -306,10 +309,14 @@ ftrace_no_trace:
 	mtctr	r12
 	REST_GPRS(11, 12, r1)
 	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	/* For direct_call, set cr0.eq bit only if livepatch is active */
+	crclr	4*cr0+eq
 	bctr
 .Lftrace_direct_call:
 	mtctr	r12
 	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	/* For direct_call, set cr0.eq bit only if livepatch is active */
+	crclr	4*cr0+eq
 	bctr
 SYM_FUNC_START(ftrace_stub_direct_tramp)
 	blr
@@ -340,25 +347,72 @@ SYM_FUNC_END(ftrace_stub_direct_tramp)
 livepatch_handler:
 	ld	r12, PACA_THREAD_INFO(r13)
 
-	/* Allocate 3 x 8 bytes */
 	ld	r11, TI_livepatch_sp(r12)
-	addi	r11, r11, 24
+	/* Allocate stack to save LR, TOC & optionally NIP (in case of direct_call) */
+	addi	r11, r11, LIVEPATCH_STACK_FRAME_SIZE
 	std	r11, TI_livepatch_sp(r12)
 
 	/* Store stack end marker */
 	lis     r12, STACK_END_MAGIC@h
 	ori     r12, r12, STACK_END_MAGIC@l
-	std	r12, -8(r11)
+	std	r12, -LIVEPATCH_STACK_MAGIC_OFFSET(r11)
 
 	/* Save toc & real LR on livepatch stack */
-	std	r2,  -24(r11)
+	std	r2,  -LIVEPATCH_STACK_TOC_OFFSET(r11)
 #ifndef CONFIG_PPC_FTRACE_OUT_OF_LINE
 	mflr	r12
-	std	r12, -16(r11)
+	std	r12, -LIVEPATCH_STACK_LR_OFFSET(r11)
 	mfctr	r12
 #else
-	std	r0, -16(r11)
+	std	r0, -LIVEPATCH_STACK_LR_OFFSET(r11)
 	mflr	r12
+
+	/* Also, save new NIP on livepatch stack before the direct_call */
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	std	r12, -LIVEPATCH_STACK_NIP_OFFSET(r11)
+
+	/* For direct_call, set cr0.eq bit to indicate livepatch is active */
+	crset	4*cr0+eq
+	/* Jump to the direct_call */
+	bnectrl	cr1
+
+	/*
+	 * The address to jump after direct call is deduced based on ftrace OOL stub sequence.
+	 * The seemingly insignificant couple of instructions below is to mimic that here to
+	 * jump back to the livepatch handler code below.
+	 */
+	nop
+	b	1f
+
+	/*
+	 * Restore the state for livepatching from the livepatch stack.
+	 * Before that, check if livepatch stack is intact. Use r0 for it.
+	 */
+1:	mtctr	r0
+	ld	r12, PACA_THREAD_INFO(r13)
+	ld	r11, TI_livepatch_sp(r12)
+	lis     r0,  STACK_END_MAGIC@h
+	ori     r0,  r0, STACK_END_MAGIC@l
+	ld	r12, -LIVEPATCH_STACK_MAGIC_OFFSET(r11)
+1:	tdne	r12, r0
+	EMIT_BUG_ENTRY 1b, __FILE__, __LINE__ - 1, 0
+	mfctr	r0
+
+	/*
+	 * A change in r0 implies the direct_call is not done yet. The direct_call
+	 * will take care of calling the original LR. Update r0 in livepatch stack
+	 * with the new LR in the direct_call.
+	 */
+	ld	r12, -LIVEPATCH_STACK_LR_OFFSET(r11)
+	cmpd	r12, r0
+	beq	1f
+	mflr	r0
+	std	r0, -LIVEPATCH_STACK_LR_OFFSET(r11)
+
+	/* Put new NIP back in r12 to proceed with livepatch handling */
+1:	ld	r12, -LIVEPATCH_STACK_NIP_OFFSET(r11)
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
+
 	/* Put ctr in r12 for global entry and branch there */
 	mtctr	r12
 #endif
@@ -377,18 +431,18 @@ livepatch_handler:
 	/* Check stack marker hasn't been trashed */
 	lis     r2,  STACK_END_MAGIC@h
 	ori     r2,  r2, STACK_END_MAGIC@l
-	ld	r12, -8(r11)
+	ld	r12, -LIVEPATCH_STACK_MAGIC_OFFSET(r11)
 1:	tdne	r12, r2
 	EMIT_BUG_ENTRY 1b, __FILE__, __LINE__ - 1, 0
 
 	/* Restore LR & toc from livepatch stack */
-	ld	r12, -16(r11)
+	ld	r12, -LIVEPATCH_STACK_LR_OFFSET(r11)
 	mtlr	r12
-	ld	r2,  -24(r11)
+	ld	r2,  -LIVEPATCH_STACK_TOC_OFFSET(r11)
 
 	/* Pop livepatch stack frame */
 	ld	r12, PACA_THREAD_INFO(r13)
-	subi	r11, r11, 24
+	subi	r11, r11, LIVEPATCH_STACK_FRAME_SIZE
 	std	r11, TI_livepatch_sp(r12)
 
 	/* Return to original caller of live patched function */
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 88ad5ba7b87f..9b90acb1ea5f 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -19,6 +19,7 @@
 
 #include <asm/kprobes.h>
 #include <asm/text-patching.h>
+#include <asm/livepatch.h>
 
 #include "bpf_jit.h"
 
@@ -684,6 +685,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
 	struct codegen_context codegen_ctx, *ctx;
+	int __maybe_unused livepatch_sp_off = 0;
+	bool __maybe_unused handle_lp = false;
 	u32 *image = (u32 *)rw_image;
 	ppc_inst_t branch_insn;
 	u32 *branches = NULL;
@@ -716,6 +719,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 * dummy frame for unwind       [ back chain 1      ] --
 	 *                              [ padding           ] align stack frame
 	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
+	 *                              [ *current.TI.lp_sp ]
+	 *    livepatch_sp_off          [ current.TI.lp_sp  ] optional - livepatch stack info
 	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
 	 *                              [ r26               ]
 	 *       nvr_off                [ r25               ] nvr save area
@@ -780,11 +785,23 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	nvr_off = bpf_frame_size;
 	bpf_frame_size += 2 * SZL;
 
+
 	/* Optional save area for actual LR in case of ool ftrace */
 	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
 		alt_lr_off = bpf_frame_size;
 		bpf_frame_size += SZL;
+		if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS)) {
+			handle_lp = (func_ptr_is_kernel_text(func_addr) && fmod_ret->nr_links &&
+				     (flags & BPF_TRAMP_F_CALL_ORIG));
+		}
+	}
+
+#ifdef CONFIG_LIVEPATCH_64
+	if (handle_lp) {
+		livepatch_sp_off = bpf_frame_size;
+		bpf_frame_size += 2 * SZL;
 	}
+#endif
 
 	if (IS_ENABLED(CONFIG_PPC32)) {
 		if (nr_regs < 2) {
@@ -822,6 +839,32 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	if (IS_ENABLED(CONFIG_PPC32) && nr_regs < 2)
 		EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
 
+#ifdef CONFIG_LIVEPATCH_64
+	/* Save expected livepatch stack state on the trampoline stack */
+	if (handle_lp) {
+		/*
+		 * The caller is expected to set cr0.eq bit, if livepatch was active on it.
+		 *
+		 * If livepatch is active, save address & the expected value of
+		 * livepatch stack pointer on the trampoline stack.
+		 * Else, set both of them to 0.
+		 */
+		PPC_BCC_SHORT(COND_EQ, (ctx->idx + 5) * 4);
+		EMIT(PPC_RAW_LI(_R12, 0));
+		EMIT(PPC_RAW_STL(_R12, _R1, livepatch_sp_off));
+		EMIT(PPC_RAW_STL(_R12, _R1, livepatch_sp_off + SZL));
+		PPC_JMP((ctx->idx + 7) * 4);
+
+		EMIT(PPC_RAW_LL(_R12, _R13, offsetof(struct paca_struct, __current) +
+					    offsetof(struct task_struct, thread_info)));
+		EMIT(PPC_RAW_ADDI(_R12, _R12, offsetof(struct thread_info, livepatch_sp)));
+		EMIT(PPC_RAW_STL(_R12, _R1, livepatch_sp_off));
+		EMIT(PPC_RAW_LL(_R12, _R12, 0));
+		EMIT(PPC_RAW_ADDI(_R12, _R12, -LIVEPATCH_STACK_FRAME_SIZE));
+		EMIT(PPC_RAW_STL(_R12, _R1, livepatch_sp_off + SZL));
+	}
+#endif
+
 	bpf_trampoline_save_args(image, ctx, func_frame_offset, nr_regs, regs_off);
 
 	/* Save our return address */
@@ -932,6 +975,38 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		image[branches[i]] = ppc_inst_val(branch_insn);
 	}
 
+#ifdef CONFIG_LIVEPATCH_64
+	/*
+	 * Restore livepatch stack state if livepatch was active & an attached
+	 * fmod_ret program failed.
+	 */
+	if (handle_lp) {
+		EMIT(PPC_RAW_LL(_R12, _R1, livepatch_sp_off + SZL));
+		EMIT(PPC_RAW_CMPLI(_R12, 0));
+
+		/*
+		 * If expected value (_R12) of livepatch stack pointer saved on the
+		 * trampoline stack is 0, livepatch was not active. Skip the rest.
+		 */
+		PPC_BCC_SHORT(COND_EQ, (ctx->idx + 7) * 4);
+
+		EMIT(PPC_RAW_LL(_R25, _R1, livepatch_sp_off));
+		EMIT(PPC_RAW_LL(_R25, _R25, 0));
+
+		/*
+		 * If the expected value (_R12) of livepatch stack pointer saved on the
+		 * trampoline stack is not the same as actual value (_R25), it implies
+		 * fmod_ret program failed and skipped calling the traced/livepatch'ed
+		 * function. The livepatch'ed function did not get a chance to tear down
+		 * the livepatch stack it setup. Take care of that here in do_fexit.
+		 */
+		EMIT(PPC_RAW_CMPD(_R12, _R25));
+		PPC_BCC_SHORT(COND_EQ, (ctx->idx + 3) * 4);
+		EMIT(PPC_RAW_LL(_R25, _R1, livepatch_sp_off));
+		EMIT(PPC_RAW_STL(_R12, _R25, 0));
+	}
+#endif
+
 	for (i = 0; i < fexit->nr_links; i++)
 		if (invoke_bpf_prog(image, ro_image, ctx, fexit->links[i], regs_off, retval_off,
 				    run_ctx_off, false)) {
-- 
2.51.0


