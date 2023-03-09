Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E46B2C9A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 19:05:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXcY508nXz3fRL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 05:05:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RjLFZOnV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RjLFZOnV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXcS26vKyz3cdG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 05:01:06 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329G9q0U027961;
	Thu, 9 Mar 2023 18:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P98881FbyK+A3Tn+BC5wf435cQ2+7xZl55FdpZ7Y+PM=;
 b=RjLFZOnVuBvUeMzUQdLEM8u+HwdcTOvDqLDyita7vwHWJrwInpABQBqKjwlWwG/tXqBR
 cRywzPYBqkl9TfOMwrvASxeD5x2ddU6gIRSCxg32agEhV11tB2eRoM1ZjpzKow9JiNal
 AsfQHh2O1BCzv9ZhAIkduGwN4gMzDS9pYXWsftz+AY29ABqMKGc1mmDGo9c9LNIMfg9Z
 ncQvVfvjUeF5zeIYs2bIc6JlNmDAmnB7DpvLOzkhvRe9he6rDYRDdUGYxOYPWVaKF/NI
 gas9zd8nG1ZAA7aNLWYkHn1/jx1Rik2aVzNrHEV/0ww4L8V3UQ6USGNyonRFiJfiJLkC 0g== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6sdgbp4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:00:46 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329DSuTn015592;
	Thu, 9 Mar 2023 18:00:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3p6gbwa0fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 18:00:43 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 329I0fSP63045920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Mar 2023 18:00:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 813BB20049;
	Thu,  9 Mar 2023 18:00:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC4B820040;
	Thu,  9 Mar 2023 18:00:38 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.13.46])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Mar 2023 18:00:38 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v2 4/4] powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
Date: Thu,  9 Mar 2023 23:30:28 +0530
Message-Id: <20230309180028.180200-5-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309180028.180200-1-hbathini@linux.ibm.com>
References: <20230309180028.180200-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T_w-D2pMd6QDWcbx7TX4qD_JCBv__wWI
X-Proofpoint-ORIG-GUID: T_w-D2pMd6QDWcbx7TX4qD_JCBv__wWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_09,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090141
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
writes the program to the rw buffer. When the jit is done, the program
is copied to the final location with bpf_jit_binary_pack_finalize.
With multiple jit_subprogs, bpf_jit_free is called on some subprograms
that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
if necessary. While here, correct the misnomer powerpc64_jit_data to
powerpc_jit_data as it is meant for both ppc32 and ppc64.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |   7 +-
 arch/powerpc/net/bpf_jit_comp.c   | 104 +++++++++++++++++++++---------
 arch/powerpc/net/bpf_jit_comp32.c |   4 +-
 arch/powerpc/net/bpf_jit_comp64.c |   6 +-
 4 files changed, 83 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index d767e39d5645..a8b7480c4d43 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -168,15 +168,16 @@ static inline void bpf_clear_seen_register(struct codegen_context *ctx, int i)
 
 void bpf_jit_init_reg_mapping(struct codegen_context *ctx);
 int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func);
-int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
+int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
 		       u32 *addrs, int pass, bool extra_pass);
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
 int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
 
-int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct codegen_context *ctx,
-			  int insn_idx, int jmp_off, int dst_reg);
+int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
+			  struct codegen_context *ctx, int insn_idx,
+			  int jmp_off, int dst_reg);
 
 #endif
 
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index d1794d9f0154..ece75c829499 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -42,10 +42,11 @@ int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg,
 	return 0;
 }
 
-struct powerpc64_jit_data {
-	struct bpf_binary_header *header;
+struct powerpc_jit_data {
+	struct bpf_binary_header *hdr;
+	struct bpf_binary_header *fhdr;
 	u32 *addrs;
-	u8 *image;
+	u8 *fimage;
 	u32 proglen;
 	struct codegen_context ctx;
 };
@@ -62,15 +63,18 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	u8 *image = NULL;
 	u32 *code_base;
 	u32 *addrs;
-	struct powerpc64_jit_data *jit_data;
+	struct powerpc_jit_data *jit_data;
 	struct codegen_context cgctx;
 	int pass;
 	int flen;
-	struct bpf_binary_header *bpf_hdr;
+	struct bpf_binary_header *fhdr = NULL;
+	struct bpf_binary_header *hdr = NULL;
 	struct bpf_prog *org_fp = fp;
 	struct bpf_prog *tmp_fp;
 	bool bpf_blinded = false;
 	bool extra_pass = false;
+	u8 *fimage = NULL;
+	u32 *fcode_base;
 	u32 extable_len;
 	u32 fixup_len;
 
@@ -100,9 +104,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	addrs = jit_data->addrs;
 	if (addrs) {
 		cgctx = jit_data->ctx;
-		image = jit_data->image;
-		bpf_hdr = jit_data->header;
+		fimage = jit_data->fimage;
+		fhdr = jit_data->fhdr;
 		proglen = jit_data->proglen;
+		hdr = jit_data->hdr;
+		image = (void *)hdr + ((void *)fimage - (void *)fhdr);
 		extra_pass = true;
 		goto skip_init_ctx;
 	}
@@ -120,7 +126,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
 
 	/* Scouting faux-generate pass 0 */
-	if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
+	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
 		/* We hit something illegal or unsupported. */
 		fp = org_fp;
 		goto out_addrs;
@@ -135,7 +141,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 */
 	if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
 		cgctx.idx = 0;
-		if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
+		if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
 			fp = org_fp;
 			goto out_addrs;
 		}
@@ -157,17 +163,19 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	proglen = cgctx.idx * 4;
 	alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
 
-	bpf_hdr = bpf_jit_binary_alloc(alloclen, &image, 4, bpf_jit_fill_ill_insns);
-	if (!bpf_hdr) {
+	fhdr = bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &image,
+					      bpf_jit_fill_ill_insns);
+	if (!fhdr) {
 		fp = org_fp;
 		goto out_addrs;
 	}
 
 	if (extable_len)
-		fp->aux->extable = (void *)image + FUNCTION_DESCR_SIZE + proglen + fixup_len;
+		fp->aux->extable = (void *)fimage + FUNCTION_DESCR_SIZE + proglen + fixup_len;
 
 skip_init_ctx:
 	code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
+	fcode_base = (u32 *)(fimage + FUNCTION_DESCR_SIZE);
 
 	/* Code generation passes 1-2 */
 	for (pass = 1; pass < 3; pass++) {
@@ -175,8 +183,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		cgctx.idx = 0;
 		cgctx.alt_exit_addr = 0;
 		bpf_jit_build_prologue(code_base, &cgctx);
-		if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, pass, extra_pass)) {
-			bpf_jit_binary_free(bpf_hdr);
+		if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx, addrs, pass, extra_pass)) {
+			bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
+			bpf_jit_binary_pack_free(fhdr, hdr);
 			fp = org_fp;
 			goto out_addrs;
 		}
@@ -192,21 +201,23 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		 * Note that we output the base address of the code_base
 		 * rather than image, since opcodes are in code_base.
 		 */
-		bpf_jit_dump(flen, proglen, pass, code_base);
+		bpf_jit_dump(flen, proglen, pass, fcode_base);
 
 #ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* Function descriptor nastiness: Address + TOC */
-	((u64 *)image)[0] = (u64)code_base;
+	((u64 *)image)[0] = (u64)fcode_base;
 	((u64 *)image)[1] = local_paca->kernel_toc;
 #endif
 
-	fp->bpf_func = (void *)image;
+	fp->bpf_func = (void *)fimage;
 	fp->jited = 1;
 	fp->jited_len = proglen + FUNCTION_DESCR_SIZE;
 
-	bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + bpf_hdr->size);
 	if (!fp->is_func || extra_pass) {
-		bpf_jit_binary_lock_ro(bpf_hdr);
+		if (bpf_jit_binary_pack_finalize(fp, fhdr, hdr)) {
+			fp = org_fp;
+			goto out_addrs;
+		}
 		bpf_prog_fill_jited_linfo(fp, addrs);
 out_addrs:
 		kfree(addrs);
@@ -216,8 +227,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		jit_data->addrs = addrs;
 		jit_data->ctx = cgctx;
 		jit_data->proglen = proglen;
-		jit_data->image = image;
-		jit_data->header = bpf_hdr;
+		jit_data->fimage = fimage;
+		jit_data->fhdr = fhdr;
+		jit_data->hdr = hdr;
 	}
 
 out:
@@ -231,12 +243,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
  * The caller should check for (BPF_MODE(code) == BPF_PROBE_MEM) before calling
  * this function, as this only applies to BPF_PROBE_MEM, for now.
  */
-int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct codegen_context *ctx,
-			  int insn_idx, int jmp_off, int dst_reg)
+int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
+			  struct codegen_context *ctx, int insn_idx, int jmp_off,
+			  int dst_reg)
 {
 	off_t offset;
 	unsigned long pc;
-	struct exception_table_entry *ex;
+	struct exception_table_entry *ex, *ex_entry;
 	u32 *fixup;
 
 	/* Populate extable entries only in the last pass */
@@ -247,9 +260,16 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
 	    WARN_ON_ONCE(ctx->exentry_idx >= fp->aux->num_exentries))
 		return -EINVAL;
 
+	/*
+	 * Program is firt written to image before copying to the
+	 * final location (fimage). Accordingly, update in the image first.
+	 * As all offsets used are relative, copying as is to the
+	 * final location should be alright.
+	 */
 	pc = (unsigned long)&image[insn_idx];
+	ex = (void *)fp->aux->extable - (void *)fimage + (void *)image;
 
-	fixup = (void *)fp->aux->extable -
+	fixup = (void *)ex -
 		(fp->aux->num_exentries * BPF_FIXUP_LEN * 4) +
 		(ctx->exentry_idx * BPF_FIXUP_LEN * 4);
 
@@ -260,17 +280,17 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
 	fixup[BPF_FIXUP_LEN - 1] =
 		PPC_RAW_BRANCH((long)(pc + jmp_off) - (long)&fixup[BPF_FIXUP_LEN - 1]);
 
-	ex = &fp->aux->extable[ctx->exentry_idx];
+	ex_entry = &ex[ctx->exentry_idx];
 
-	offset = pc - (long)&ex->insn;
+	offset = pc - (long)&ex_entry->insn;
 	if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
 		return -ERANGE;
-	ex->insn = offset;
+	ex_entry->insn = offset;
 
-	offset = (long)fixup - (long)&ex->fixup;
+	offset = (long)fixup - (long)&ex_entry->fixup;
 	if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
 		return -ERANGE;
-	ex->fixup = offset;
+	ex_entry->fixup = offset;
 
 	ctx->exentry_idx++;
 	return 0;
@@ -308,3 +328,27 @@ int bpf_arch_text_invalidate(void *dst, size_t len)
 
 	return ret;
 }
+
+void bpf_jit_free(struct bpf_prog *fp)
+{
+	if (fp->jited) {
+		struct powerpc_jit_data *jit_data = fp->aux->jit_data;
+		struct bpf_binary_header *hdr;
+
+		/*
+		 * If we fail the final pass of JIT (from jit_subprogs),
+		 * the program may not be finalized yet. Call finalize here
+		 * before freeing it.
+		 */
+		if (jit_data) {
+			bpf_jit_binary_pack_finalize(fp, jit_data->fhdr, jit_data->hdr);
+			kvfree(jit_data->addrs);
+			kfree(jit_data);
+		}
+		hdr = bpf_jit_binary_pack_hdr(fp);
+		bpf_jit_binary_pack_free(hdr, NULL);
+		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(fp));
+	}
+
+	bpf_prog_unlock_free(fp);
+}
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 7f91ea064c08..fb2761b54d64 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -278,7 +278,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 }
 
 /* Assemble the body code between the prologue & epilogue */
-int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
+int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
 		       u32 *addrs, int pass, bool extra_pass)
 {
 	const struct bpf_insn *insn = fp->insnsi;
@@ -997,7 +997,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 					jmp_off += 4;
 				}
 
-				ret = bpf_add_extable_entry(fp, image, pass, ctx, insn_idx,
+				ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx, insn_idx,
 							    jmp_off, dst_reg);
 				if (ret)
 					return ret;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 8dd3cabaa83a..37a8970a7065 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -343,7 +343,7 @@ asm (
 );
 
 /* Assemble the body code between the prologue & epilogue */
-int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
+int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
 		       u32 *addrs, int pass, bool extra_pass)
 {
 	enum stf_barrier_type stf_barrier = stf_barrier_type_get();
@@ -922,8 +922,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				addrs[++i] = ctx->idx * 4;
 
 			if (BPF_MODE(code) == BPF_PROBE_MEM) {
-				ret = bpf_add_extable_entry(fp, image, pass, ctx, ctx->idx - 1,
-							    4, dst_reg);
+				ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx,
+							    ctx->idx - 1, 4, dst_reg);
 				if (ret)
 					return ret;
 			}
-- 
2.39.2

