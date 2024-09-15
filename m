Return-Path: <linuxppc-dev+bounces-1397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C219798E8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 22:59:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6L3v5sp7z2yxf;
	Mon, 16 Sep 2024 06:58:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726433899;
	cv=none; b=Mc9D/BeCTrBVXe3udXjwYnN4bYz5IZY9bRr7JPxKQAO/WZI5bN/sdaLNcofEWTU56j1XEuSA/N8J//iJ2FcecQ390zpdUbRDBnRhxzqgcWL9dx6Oo7kU7uc5zdfJ77GyqNwA3FM/b8Fp0AP5Oo1V/UbbSKH8RzMA2rqwvCdEdY8IZq4YsFAEBvPWzdsc5rs9N7x/snPcAYY1fWEqCd8yxqBuKbe5D+8EHZrthzSUA/UQJxQ08ylFisS7Ix3ZF6qccOCcyEINSUp8QguF/CNipWfLUAasNw01fxENiE5aV6++IlfIqwtbx1j+85zzB5JkRctFlrOKFypLkOsAeX2zcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726433899; c=relaxed/relaxed;
	bh=yhOZV4EM3Mx5FaWvPgIyf9Hk7zNkV/eJ6Yj7izNHZPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mx1qJgrOiXbG9qdwoZYzT3kwqVFuERJVFdEx4jKNipABIf8RjPeEPnfewVpWlRnWE6SBLi6gU51+gohnqTSymqWGZKE9m12qwTSUiYriaQpIgfFUZmWcYgN/N1GMgi3vKUSZny/8epAXh7Ajukk7hur5kr9WkRIdSViksO/L4lW+RdRHuuF4oh8f0TdGezL0Fy25HNPOW2xuSY3kQ1TiklsrcNcwuKQ134myvjUJVMijxAjwNl7jK4vk9d7U0gvyrWPI+blT1+PjbxvIGtY4sxTTZwDdt5cvvfuYeKTdcRMoqzav2Dxz3MAnyPCFvCZVDeVntLw7uUT4wIN0yxrKWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fcnqGPFr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fcnqGPFr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6L3v2r8hz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 06:58:19 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48F5t5Z4012136;
	Sun, 15 Sep 2024 20:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=yhOZV4EM3Mx5F
	aWvPgIyf9Hk7zNkV/eJ6Yj7izNHZPo=; b=fcnqGPFruSJhVUiL6Scfw75hNd+Xl
	Z2CKqkMTCJBEYolRXwHl1rKO9BzQyUVLQniAj75ye/Y0YXVL7bLOl9tRbmQnOyVi
	Fu6nzLvJwiXlFWs63pvNf3tmhwoKMt5VkUx2p/WLSE2Lj665YIjxQCXDINnAjXQ1
	2buVG42QIP/B5ElxmOhGb7+/nUo3ysyi1CI0WnBy6Z1BTPB+pmAsgzWUy0G2ql6P
	r40/JzX8VhiVVpyVAMzqPTLpAMbGke6RziPukq+DlRO7y5TbjpSq7oU3k/PDJbwu
	hFlzOXHfeJ3hJPhNKZCAbErMRaV4cYspNLVAD34rpeF7njjaHIgxwm57Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uvp8pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:58:01 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48FKw05l002938;
	Sun, 15 Sep 2024 20:58:00 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uvp8pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:58:00 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48FGwiqm001860;
	Sun, 15 Sep 2024 20:57:59 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nqh3bc1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48FKvuJB19136774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Sep 2024 20:57:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2231220049;
	Sun, 15 Sep 2024 20:57:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B48B820040;
	Sun, 15 Sep 2024 20:57:52 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.68.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Sep 2024 20:57:52 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v5 15/17] powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
Date: Mon, 16 Sep 2024 02:26:46 +0530
Message-ID: <20240915205648.830121-16-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915205648.830121-1-hbathini@linux.ibm.com>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wP-3zFypPYgDMsDExtAts0IRQ8uJuBFJ
X-Proofpoint-ORIG-GUID: E079cOQKyZQxmDTtRUt56hSP7zPet0Mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=707 suspectscore=0 impostorscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409150159

From: Naveen N Rao <naveen@kernel.org>

Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS similar to the arm64
implementation.

ftrace direct calls allow custom trampolines to be called into directly
from function ftrace call sites, bypassing the ftrace trampoline
completely. This functionality is currently utilized by BPF trampolines
to hook into kernel function entries.

Since we have limited relative branch range, we support ftrace direct
calls through support for DYNAMIC_FTRACE_WITH_CALL_OPS. In this
approach, ftrace trampoline is not entirely bypassed. Rather, it is
re-purposed into a stub that reads direct_call field from the associated
ftrace_ops structure and branches into that, if it is not NULL. For
this, it is sufficient if we can ensure that the ftrace trampoline is
reachable from all traceable functions.

When multiple ftrace_ops are associated with a call site, we utilize a
call back to set pt_regs->orig_gpr3 that can then be tested on the
return path from the ftrace trampoline to branch into the direct caller.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                     |   1 +
 arch/powerpc/include/asm/ftrace.h        |  16 ++++
 arch/powerpc/kernel/asm-offsets.c        |   3 +
 arch/powerpc/kernel/trace/ftrace.c       |  11 +++
 arch/powerpc/kernel/trace/ftrace_entry.S | 114 +++++++++++++++++------
 5 files changed, 116 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f1a0adedeb8e..ef845ea4dd27 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -235,6 +235,7 @@ config PPC
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if PPC_FTRACE_OUT_OF_LINE || (PPC32 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
+	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS if HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 1ad1328cf4e3..5eb7631355a1 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -148,6 +148,22 @@ extern unsigned int ftrace_ool_stub_text_end_count, ftrace_ool_stub_text_count,
 #endif
 void ftrace_free_init_tramp(void);
 unsigned long ftrace_call_adjust(unsigned long addr);
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+/*
+ * When an ftrace registered caller is tracing a function that is also set by a
+ * register_ftrace_direct() call, it needs to be differentiated in the
+ * ftrace_caller trampoline so that the direct call can be invoked after the
+ * other ftrace ops. To do this, place the direct caller in the orig_gpr3 field
+ * of pt_regs. This tells ftrace_caller that there's a direct caller.
+ */
+static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs, unsigned long addr)
+{
+	struct pt_regs *regs = &fregs->regs;
+
+	regs->orig_gpr3 = addr;
+}
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 #else
 static inline void ftrace_free_init_tramp(void) { }
 static inline unsigned long ftrace_call_adjust(unsigned long addr) { return addr; }
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 60d1e388c2ba..dbd56264a8bc 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -680,6 +680,9 @@ int main(void)
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
 	OFFSET(FTRACE_OPS_FUNC, ftrace_ops, func);
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	OFFSET(FTRACE_OPS_DIRECT_CALL, ftrace_ops, direct_call);
+#endif
 #endif
 
 	return 0;
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 9090d1a21600..051f3db14606 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -150,6 +150,17 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
 	else
 		ip = rec->ip;
 
+	if (!is_offset_in_branch_range(addr - ip) && addr != FTRACE_ADDR &&
+	    addr != FTRACE_REGS_ADDR) {
+		/* This can only happen with ftrace direct */
+		if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS)) {
+			pr_err("0x%lx (0x%lx): Unexpected target address 0x%lx\n",
+			       ip, rec->ip, addr);
+			return -EINVAL;
+		}
+		addr = FTRACE_ADDR;
+	}
+
 	if (is_offset_in_branch_range(addr - ip))
 		/* Within range */
 		stub = addr;
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index ff376c990308..2c1b24100eca 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -33,14 +33,38 @@
  * and then arrange for the ftrace function to be called.
  */
 .macro	ftrace_regs_entry allregs
-	/* Save the original return address in A's stack frame */
-	PPC_STL		r0, LRSAVE(r1)
 	/* Create a minimal stack frame for representing B */
 	PPC_STLU	r1, -STACK_FRAME_MIN_SIZE(r1)
 
 	/* Create our stack frame + pt_regs */
 	PPC_STLU	r1,-SWITCH_FRAME_SIZE(r1)
 
+	.if \allregs == 1
+	SAVE_GPRS(11, 12, r1)
+	.endif
+
+	/* Get the _mcount() call site out of LR */
+	mflr	r11
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Load the ftrace_op */
+	PPC_LL	r12, -(MCOUNT_INSN_SIZE*2 + SZL)(r11)
+
+	/* Load direct_call from the ftrace_op */
+	PPC_LL	r12, FTRACE_OPS_DIRECT_CALL(r12)
+	PPC_LCMPI r12, 0
+	.if \allregs == 1
+	bne	.Lftrace_direct_call_regs
+	.else
+	bne	.Lftrace_direct_call
+	.endif
+#endif
+
+	/* Save the previous LR in pt_regs->link */
+	PPC_STL	r0, _LINK(r1)
+	/* Also save it in A's stack frame */
+	PPC_STL	r0, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE+LRSAVE(r1)
+
 	/* Save all gprs to pt_regs */
 	SAVE_GPR(0, r1)
 	SAVE_GPRS(3, 10, r1)
@@ -54,7 +78,7 @@
 
 	.if \allregs == 1
 	SAVE_GPR(2, r1)
-	SAVE_GPRS(11, 31, r1)
+	SAVE_GPRS(13, 31, r1)
 	.else
 #if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)
 	SAVE_GPR(14, r1)
@@ -67,20 +91,15 @@
 
 	.if \allregs == 1
 	/* Load special regs for save below */
+	mfcr	r7
 	mfmsr   r8
 	mfctr   r9
 	mfxer   r10
-	mfcr	r11
 	.else
 	/* Clear MSR to flag as ftrace_caller versus frace_regs_caller */
 	li	r8, 0
 	.endif
 
-	/* Get the _mcount() call site out of LR */
-	mflr	r7
-	/* Save the read LR in pt_regs->link */
-	PPC_STL	r0, _LINK(r1)
-
 #ifdef CONFIG_PPC64
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, STK_GOT(r1)
@@ -88,8 +107,8 @@
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
-	/* r7 points to the instruction following the call to ftrace */
-	PPC_LL	r5, -(MCOUNT_INSN_SIZE*2 + SZL)(r7)
+	/* r11 points to the instruction following the call to ftrace */
+	PPC_LL	r5, -(MCOUNT_INSN_SIZE*2 + SZL)(r11)
 	PPC_LL	r12, FTRACE_OPS_FUNC(r5)
 	mtctr	r12
 #else /* !CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS */
@@ -105,45 +124,51 @@
 	/* Save special regs */
 	PPC_STL	r8, _MSR(r1)
 	.if \allregs == 1
+	PPC_STL	r7, _CCR(r1)
 	PPC_STL	r9, _CTR(r1)
 	PPC_STL	r10, _XER(r1)
-	PPC_STL	r11, _CCR(r1)
 	.endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Clear orig_gpr3 to later detect ftrace_direct call */
+	li	r7, 0
+	PPC_STL	r7, ORIG_GPR3(r1)
+#endif
+
 #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
 	/* Save our real return address in nvr for return */
 	.if \allregs == 0
 	SAVE_GPR(15, r1)
 	.endif
-	mr	r15, r7
+	mr	r15, r11
 	/*
-	 * We want the ftrace location in the function, but our lr (in r7)
+	 * We want the ftrace location in the function, but our lr (in r11)
 	 * points at the 'mtlr r0' instruction in the out of line stub.  To
 	 * recover the ftrace location, we read the branch instruction in the
 	 * stub, and adjust our lr by the branch offset.
 	 *
 	 * See ftrace_init_ool_stub() for the profile sequence.
 	 */
-	lwz	r8, MCOUNT_INSN_SIZE(r7)
+	lwz	r8, MCOUNT_INSN_SIZE(r11)
 	slwi	r8, r8, 6
 	srawi	r8, r8, 6
-	add	r3, r7, r8
+	add	r3, r11, r8
 	/*
 	 * Override our nip to point past the branch in the original function.
 	 * This allows reliable stack trace and the ftrace stack tracer to work as-is.
 	 */
-	addi	r7, r3, MCOUNT_INSN_SIZE
+	addi	r11, r3, MCOUNT_INSN_SIZE
 #else
 	/* Calculate ip from nip-4 into r3 for call below */
-	subi    r3, r7, MCOUNT_INSN_SIZE
+	subi    r3, r11, MCOUNT_INSN_SIZE
 #endif
 
 	/* Save NIP as pt_regs->nip */
-	PPC_STL	r7, _NIP(r1)
+	PPC_STL	r11, _NIP(r1)
 	/* Also save it in B's stackframe header for proper unwind */
-	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
+	PPC_STL	r11, LRSAVE+SWITCH_FRAME_SIZE(r1)
 #if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)
-	mr	r14, r7		/* remember old NIP */
+	mr	r14, r11	/* remember old NIP */
 #endif
 
 	/* Put the original return address in r4 as parent_ip */
@@ -154,14 +179,32 @@
 .endm
 
 .macro	ftrace_regs_exit allregs
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Check orig_gpr3 to detect ftrace_direct call */
+	PPC_LL	r3, ORIG_GPR3(r1)
+	PPC_LCMPI cr1, r3, 0
+	mtctr	r3
+#endif
+
+	/* Restore possibly modified LR */
+	PPC_LL	r0, _LINK(r1)
+
 #ifndef CONFIG_PPC_FTRACE_OUT_OF_LINE
 	/* Load ctr with the possibly modified NIP */
 	PPC_LL	r3, _NIP(r1)
-	mtctr	r3
-
 #ifdef CONFIG_LIVEPATCH_64
 	cmpd	r14, r3		/* has NIP been altered? */
 #endif
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	beq	cr1,2f
+	mtlr	r3
+	b	3f
+#endif
+2:	mtctr	r3
+	mtlr	r0
+3:
+
 #else /* !CONFIG_PPC_FTRACE_OUT_OF_LINE */
 	/* Load LR with the possibly modified NIP */
 	PPC_LL	r3, _NIP(r1)
@@ -185,12 +228,6 @@
 #endif
 	.endif
 
-	/* Restore possibly modified LR */
-	PPC_LL	r0, _LINK(r1)
-#ifndef CONFIG_PPC_FTRACE_OUT_OF_LINE
-	mtlr	r0
-#endif
-
 #ifdef CONFIG_PPC64
 	/* Restore callee's TOC */
 	ld	r2, STK_GOT(r1)
@@ -203,8 +240,12 @@
         /* Based on the cmpd above, if the NIP was altered handle livepatch */
 	bne-	livepatch_handler
 #endif
+
 	/* jump after _mcount site */
 #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	bnectr	cr1
+#endif
 	/*
 	 * Return with blr to keep the link stack balanced. The function profiling sequence
 	 * uses 'mtlr r0' to restore LR.
@@ -260,6 +301,21 @@ ftrace_no_trace:
 #endif
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+.Lftrace_direct_call_regs:
+	mtctr	r12
+	REST_GPRS(11, 12, r1)
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	bctr
+.Lftrace_direct_call:
+	mtctr	r12
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	bctr
+SYM_FUNC_START(ftrace_stub_direct_tramp)
+	blr
+SYM_FUNC_END(ftrace_stub_direct_tramp)
+#endif
+
 #ifdef CONFIG_LIVEPATCH_64
 	/*
 	 * This function runs in the mcount context, between two functions. As
-- 
2.46.0


