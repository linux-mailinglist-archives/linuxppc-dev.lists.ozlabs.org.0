Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB94845E3F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 18:14:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IPh3ASp2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQlqw65Psz3dJn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 04:14:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IPh3ASp2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQlq718bFz3btc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 04:13:22 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 411HCfMi024842;
	Thu, 1 Feb 2024 17:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=waiZalQ/WWrtDXAogipyKX7+HT7+pJ9RGL/6cPf3018=;
 b=IPh3ASp2BD0/7TUMdwZGLcYM1akAVWaWNzkHqqHwtXPng4GTeaYktxfl8hxxjwsSAlKr
 etQeB8maSC23Dmgwds71v5Sr3rE3YIi0qQs7/hZbZ/6L4spxHl6LQMamAK1xtHJRlOlP
 MB6pWKxO1bsWpcYs9sw3Un6FDwt4Elxs8wudMWaKaYvhb7TgMDroHpMTnk/Q+kjg2TVx
 JlJbcGcbT/XUEYyP9iR8uyxaDNFAl2MFtsPJ0a+cfyar1gP7mpEjOSaf3hcVO+Kg81gG
 ftjLV0hSe5qgpfqhYnhNTQjZr8S4UU63OoM+b4BL5KMEggUXSjYg27h4k8SbEj4K7PJV Rw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w0fg580bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 17:12:57 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 411Ft7fa010833;
	Thu, 1 Feb 2024 17:12:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vwd5p5qwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 17:12:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 411HCssD39649548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Feb 2024 17:12:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 412432004B;
	Thu,  1 Feb 2024 17:12:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C974A20043;
	Thu,  1 Feb 2024 17:12:50 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.104.224])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Feb 2024 17:12:50 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v2 1/2] powerpc/bpf: ensure module addresses are supported
Date: Thu,  1 Feb 2024 22:42:48 +0530
Message-ID: <20240201171249.253097-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QPYnn2J9A3UfFTFmwY1_y1L-LXg92KEn
X-Proofpoint-ORIG-GUID: QPYnn2J9A3UfFTFmwY1_y1L-LXg92KEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402010134
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, bpf jit code on powerpc assumes all the bpf functions and
helpers to be kernel text. This is false for kfunc case, as function
addresses are mostly module addresses in that case. Ensure module
addresses are supported to enable kfunc support.

Assume kernel text address for programs with no kfunc call to optimize
instruction sequence in that case. Add a check to error out if this
assumption ever changes in the future.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Using bpf_prog_has_kfunc_call() to decide whether to use optimized
  instruction sequence or not as suggested by Naveen.


 arch/powerpc/net/bpf_jit.h        |   5 +-
 arch/powerpc/net/bpf_jit_comp.c   |   4 +-
 arch/powerpc/net/bpf_jit_comp32.c |   8 ++-
 arch/powerpc/net/bpf_jit_comp64.c | 109 ++++++++++++++++++++++++------
 4 files changed, 97 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index cdea5dccaefe..fc56ee0ee9c5 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -160,10 +160,11 @@ static inline void bpf_clear_seen_register(struct codegen_context *ctx, int i)
 }
 
 void bpf_jit_init_reg_mapping(struct codegen_context *ctx);
-int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func);
+int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func,
+			       bool has_kfunc_call);
 int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
 		       u32 *addrs, int pass, bool extra_pass);
-void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
+void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx, bool has_kfunc_call);
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
 int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 0f9a21783329..7b4103b4c929 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -163,7 +163,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 * update ctgtx.idx as it pretends to output instructions, then we can
 	 * calculate total size from idx.
 	 */
-	bpf_jit_build_prologue(NULL, &cgctx);
+	bpf_jit_build_prologue(NULL, &cgctx, bpf_prog_has_kfunc_call(fp));
 	addrs[fp->len] = cgctx.idx * 4;
 	bpf_jit_build_epilogue(NULL, &cgctx);
 
@@ -192,7 +192,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		/* Now build the prologue, body code & epilogue for real. */
 		cgctx.idx = 0;
 		cgctx.alt_exit_addr = 0;
-		bpf_jit_build_prologue(code_base, &cgctx);
+		bpf_jit_build_prologue(code_base, &cgctx, bpf_prog_has_kfunc_call(fp));
 		if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx, addrs, pass,
 				       extra_pass)) {
 			bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 2f39c50ca729..447747e51a58 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -123,7 +123,7 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 	}
 }
 
-void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
+void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx, bool has_kfunc_call)
 {
 	int i;
 
@@ -201,7 +201,8 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 }
 
 /* Relative offset needs to be calculated based on final image location */
-int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
+int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func,
+			       bool has_kfunc_call)
 {
 	s32 rel = (s32)func - (s32)(fimage + ctx->idx);
 
@@ -1054,7 +1055,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				EMIT(PPC_RAW_STW(bpf_to_ppc(BPF_REG_5), _R1, 12));
 			}
 
-			ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
+			ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr,
+							 bpf_prog_has_kfunc_call(fp));
 			if (ret)
 				return ret;
 
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 79f23974a320..385a5df1670c 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -122,12 +122,17 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
 }
 
-void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
+void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx, bool has_kfunc_call)
 {
 	int i;
 
 #ifndef CONFIG_PPC_KERNEL_PCREL
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
+	/*
+	 * If the program doesn't have a kfunc call, all BPF helpers are part of kernel text
+	 * and all BPF programs/functions utilize the kernel TOC. So, optimize the
+	 * instruction sequence by using kernel toc in r2 for that case.
+	 */
+	if (!has_kfunc_call && IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
 #endif
 
@@ -202,12 +207,17 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	EMIT(PPC_RAW_BLR());
 }
 
-static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u64 func)
+static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u64 func,
+				      bool has_kfunc_call)
 {
 	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
 	long reladdr;
 
-	if (WARN_ON_ONCE(!core_kernel_text(func_addr)))
+	/*
+	 * If the program doesn't have a kfunc call, all BPF helpers are assumed to be part of
+	 * kernel text. Don't proceed if that assumption ever changes in future.
+	 */
+	if (!has_kfunc_call && WARN_ON_ONCE(!core_kernel_text(func_addr)))
 		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
@@ -225,30 +235,55 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 		EMIT(PPC_RAW_BCTR());
 
 	} else {
-		reladdr = func_addr - kernel_toc_addr();
-		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-			pr_err("eBPF: address of %ps out of range of kernel_toc.\n", (void *)func);
-			return -ERANGE;
-		}
+		if (has_kfunc_call) {
+#ifdef PPC64_ELF_ABI_v1
+			/* func points to the function descriptor */
+			PPC_LI64(b2p[TMP_REG_2], func);
+			/* Load actual entry point from function descriptor */
+			PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_2], 0);
+			/* ... and move it to CTR */
+			EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
+			/*
+			 * Load TOC from function descriptor at offset 8.
+			 * We can clobber r2 since we get called through a
+			 * function pointer (so caller will save/restore r2)
+			 * and since we don't use a TOC ourself.
+			 */
+			PPC_BPF_LL(2, b2p[TMP_REG_2], 8);
+#else
+			/* We can clobber r12 */
+			PPC_LI64(12, func);
+			EMIT(PPC_RAW_MTCTR(12));
+#endif
+		} else {
+			reladdr = func_addr - kernel_toc_addr();
+			if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
+				pr_err("eBPF: address of %ps out of range of kernel_toc.\n",
+				       (void *)func);
+				return -ERANGE;
+			}
 
-		EMIT(PPC_RAW_ADDIS(_R12, _R2, PPC_HA(reladdr)));
-		EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
-		EMIT(PPC_RAW_MTCTR(_R12));
+			EMIT(PPC_RAW_ADDIS(_R12, _R2, PPC_HA(reladdr)));
+			EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
+			EMIT(PPC_RAW_MTCTR(_R12));
+		}
 		EMIT(PPC_RAW_BCTRL());
 	}
 
 	return 0;
 }
 
-int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
+int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func,
+			       bool has_kfunc_call)
 {
 	unsigned int i, ctx_idx = ctx->idx;
 
-	if (WARN_ON_ONCE(func && is_module_text_address(func)))
+	if (WARN_ON_ONCE(func && !has_kfunc_call && is_module_text_address(func)))
 		return -EINVAL;
 
 	/* skip past descriptor if elf v1 */
-	func += FUNCTION_DESCR_SIZE;
+	if (!has_kfunc_call)
+		func += FUNCTION_DESCR_SIZE;
 
 	/* Load function address into r12 */
 	PPC_LI64(_R12, func);
@@ -267,13 +302,28 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *
 		for (i = ctx->idx - ctx_idx; i < 5; i++)
 			EMIT(PPC_RAW_NOP());
 
+#ifdef PPC64_ELF_ABI_v1
+	if (has_kfunc_call) {
+		/*
+		 * Load TOC from function descriptor at offset 8.
+		 * We can clobber r2 since we get called through a
+		 * function pointer (so caller will save/restore r2)
+		 * and since we don't use a TOC ourself.
+		 */
+		PPC_BPF_LL(2, 12, 8);
+		/* Load actual entry point from function descriptor */
+		PPC_BPF_LL(12, 12, 0);
+	}
+#endif
+
 	EMIT(PPC_RAW_MTCTR(_R12));
 	EMIT(PPC_RAW_BCTRL());
 
 	return 0;
 }
 
-static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
+static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out,
+				  bool has_kfunc_call)
 {
 	/*
 	 * By now, the eBPF program has already setup parameters in r3, r4 and r5
@@ -285,7 +335,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	int b2p_index = bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size = 8;
 
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
+	if (!has_kfunc_call && IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		bpf_tailcall_prologue_size += 4; /* skip past the toc load */
 
 	/*
@@ -325,8 +375,20 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 
 	/* goto *(prog->bpf_func + prologue_size); */
 	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), offsetof(struct bpf_prog, bpf_func)));
-	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
-			FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
+	if (has_kfunc_call) {
+#ifdef PPC64_ELF_ABI_v1
+		/* skip past the function descriptor */
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
+				FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
+#else
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
+				bpf_tailcall_prologue_size));
+#endif
+	} else {
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
+				FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
+	}
+
 	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_1)));
 
 	/* tear down stack, restore NVRs, ... */
@@ -365,6 +427,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		       u32 *addrs, int pass, bool extra_pass)
 {
 	enum stf_barrier_type stf_barrier = stf_barrier_type_get();
+	bool has_kfunc_call = bpf_prog_has_kfunc_call(fp);
 	const struct bpf_insn *insn = fp->insnsi;
 	int flen = fp->len;
 	int i, ret;
@@ -993,9 +1056,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				return ret;
 
 			if (func_addr_fixed)
-				ret = bpf_jit_emit_func_call_hlp(image, ctx, func_addr);
+				ret = bpf_jit_emit_func_call_hlp(image, ctx, func_addr,
+								 has_kfunc_call);
 			else
-				ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
+				ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr,
+								 has_kfunc_call);
 
 			if (ret)
 				return ret;
@@ -1204,7 +1269,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 */
 		case BPF_JMP | BPF_TAIL_CALL:
 			ctx->seen |= SEEN_TAILCALL;
-			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
+			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1], has_kfunc_call);
 			if (ret < 0)
 				return ret;
 			break;
-- 
2.43.0

