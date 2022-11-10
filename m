Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A83F6249E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 19:47:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7W6R6MJTz3f8X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 05:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gRSSI69c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gRSSI69c;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7W2R3S5kz3cWl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 05:43:59 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAIBr87012663;
	Thu, 10 Nov 2022 18:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ip8ytpLaYIaHj8XG/6nSOQLlseTMoi6yybEV/OLlZHY=;
 b=gRSSI69cu1ekKb0laILIcwSmOrHWKIGUs16FgsHAj7nWpe8xZqYnIVQvbvwp/JM+eLsP
 IDn4N0PXv7oJr/DBpA7uIEnXCLsG0aHj+SPaE2Z7dUlida7FIuE5tuhGUbo9XyDmLBE1
 iGH6GzgymJm+0zk9s1eQR4luq/oY2GWvhVWH+iMHJ6LlCDuWkDO1ON17fR23dGr8aSS5
 puX7z2yeObrxnbBqgLdOb84uNa9jdRax7CNGKfmJ2QE1BQDEqiWHo2R9te/brRGkrc42
 WtebMFs+L5ZQxndlzGIlyqp7gqtuXBXAjYL2dtEZ+b+AErw/kcDl1vPI2aFKshikycvu fQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ks6c1h106-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:43:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AAIaXjb000794;
	Thu, 10 Nov 2022 18:43:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqgfp91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Nov 2022 18:43:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AAIhYBA3211816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Nov 2022 18:43:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D590A404D;
	Thu, 10 Nov 2022 18:43:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC472A4040;
	Thu, 10 Nov 2022 18:43:29 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.72.10])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 10 Nov 2022 18:43:29 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [RFC PATCH 3/3] powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
Date: Fri, 11 Nov 2022 00:13:03 +0530
Message-Id: <20221110184303.393179-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221110184303.393179-1-hbathini@linux.ibm.com>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FLup-9iK6iBBvea89SerjMUkId0NAXnk
X-Proofpoint-ORIG-GUID: FLup-9iK6iBBvea89SerjMUkId0NAXnk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100129
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
 arch/powerpc/net/bpf_jit.h        |  18 +++--
 arch/powerpc/net/bpf_jit_comp.c   | 123 +++++++++++++++++++++---------
 arch/powerpc/net/bpf_jit_comp32.c |  26 +++----
 arch/powerpc/net/bpf_jit_comp64.c |  32 ++++----
 4 files changed, 128 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index a4f7880f959d..e314d6a23bce 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -21,7 +21,7 @@
 
 #define PLANT_INSTR(d, idx, instr)					      \
 	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
-#define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
+#define EMIT(instr)		PLANT_INSTR(rw_image, ctx->idx, instr)
 
 /* Long jump; (unconditional 'branch') */
 #define PPC_JMP(dest)							      \
@@ -167,16 +167,18 @@ static inline void bpf_clear_seen_register(struct codegen_context *ctx, int i)
 }
 
 void bpf_jit_init_reg_mapping(struct codegen_context *ctx);
-int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func);
-int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
+int bpf_jit_emit_func_call_rel(u32 *image, u32 *rw_image, struct codegen_context *ctx, u64 func);
+int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *rw_image, struct codegen_context *ctx,
 		       u32 *addrs, int pass);
-void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
-void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
+void bpf_jit_build_prologue(u32 *image, u32 *rw_image, struct codegen_context *ctx);
+void bpf_jit_build_epilogue(u32 *image, u32 *rw_image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
-int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
+int bpf_jit_emit_exit_insn(u32 *image, u32 *rw_image, struct codegen_context *ctx,
+			   int tmp_reg, long exit_addr);
 
-int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct codegen_context *ctx,
-			  int insn_idx, int jmp_off, int dst_reg);
+int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *rw_image, int pass,
+			  struct codegen_context *ctx, int insn_idx,
+			  int jmp_off, int dst_reg);
 
 #endif
 
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index f925755cd249..c4c1f7a21d89 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -83,7 +83,7 @@ static void *bpf_patch_instructions(void *addr, void *opcode, size_t len)
 }
 
 /* Fix updated addresses (for subprog calls, ldimm64, et al) during extra pass */
-static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
+static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image, u32 *rw_image,
 				   struct codegen_context *ctx, u32 *addrs)
 {
 	const struct bpf_insn *insn = fp->insnsi;
@@ -118,7 +118,7 @@ static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
 			 */
 			tmp_idx = ctx->idx;
 			ctx->idx = addrs[i] / 4;
-			ret = bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+			ret = bpf_jit_emit_func_call_rel(image, rw_image, ctx, func_addr);
 			if (ret)
 				return ret;
 
@@ -150,7 +150,8 @@ static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
 	return 0;
 }
 
-int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr)
+int bpf_jit_emit_exit_insn(u32 *image, u32 *rw_image, struct codegen_context *ctx,
+			   int tmp_reg, long exit_addr)
 {
 	if (!exit_addr || is_offset_in_branch_range(exit_addr - (ctx->idx * 4))) {
 		PPC_JMP(exit_addr);
@@ -160,13 +161,14 @@ int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg,
 		PPC_JMP(ctx->alt_exit_addr);
 	} else {
 		ctx->alt_exit_addr = ctx->idx * 4;
-		bpf_jit_build_epilogue(image, ctx);
+		bpf_jit_build_epilogue(image, rw_image, ctx);
 	}
 
 	return 0;
 }
 
-struct powerpc64_jit_data {
+struct powerpc_jit_data {
+	struct bpf_binary_header *rw_header;
 	struct bpf_binary_header *header;
 	u32 *addrs;
 	u8 *image;
@@ -181,22 +183,25 @@ bool bpf_jit_needs_zext(void)
 
 struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 {
-	u32 proglen;
-	u32 alloclen;
-	u8 *image = NULL;
-	u32 *code_base;
-	u32 *addrs;
-	struct powerpc64_jit_data *jit_data;
-	struct codegen_context cgctx;
-	int pass;
-	int flen;
+	struct bpf_binary_header *rw_header = NULL;
+	struct powerpc_jit_data *jit_data;
 	struct bpf_binary_header *bpf_hdr;
+	struct codegen_context cgctx;
 	struct bpf_prog *org_fp = fp;
 	struct bpf_prog *tmp_fp;
 	bool bpf_blinded = false;
 	bool extra_pass = false;
+	u8 *rw_image = NULL;
+	u32 *rw_code_base;
+	u8 *image = NULL;
 	u32 extable_len;
+	u32 *code_base;
 	u32 fixup_len;
+	u32 alloclen;
+	u32 proglen;
+	u32 *addrs;
+	int pass;
+	int flen;
 
 	if (!fp->jit_requested)
 		return org_fp;
@@ -227,6 +232,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		image = jit_data->image;
 		bpf_hdr = jit_data->header;
 		proglen = jit_data->proglen;
+		rw_header = jit_data->rw_header;
+		rw_image = (void *)rw_header + ((void *)image - (void *)bpf_hdr);
 		extra_pass = true;
 		goto skip_init_ctx;
 	}
@@ -244,7 +251,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
 
 	/* Scouting faux-generate pass 0 */
-	if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0)) {
+	if (bpf_jit_build_body(fp, 0, 0, &cgctx, addrs, 0)) {
 		/* We hit something illegal or unsupported. */
 		fp = org_fp;
 		goto out_addrs;
@@ -259,7 +266,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 */
 	if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
 		cgctx.idx = 0;
-		if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0)) {
+		if (bpf_jit_build_body(fp, 0, 0, &cgctx, addrs, 0)) {
 			fp = org_fp;
 			goto out_addrs;
 		}
@@ -271,9 +278,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 * update ctgtx.idx as it pretends to output instructions, then we can
 	 * calculate total size from idx.
 	 */
-	bpf_jit_build_prologue(0, &cgctx);
+	bpf_jit_build_prologue(0, 0, &cgctx);
 	addrs[fp->len] = cgctx.idx * 4;
-	bpf_jit_build_epilogue(0, &cgctx);
+	bpf_jit_build_epilogue(0, 0, &cgctx);
 
 	fixup_len = fp->aux->num_exentries * BPF_FIXUP_LEN * 4;
 	extable_len = fp->aux->num_exentries * sizeof(struct exception_table_entry);
@@ -281,7 +288,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	proglen = cgctx.idx * 4;
 	alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
 
-	bpf_hdr = bpf_jit_binary_alloc(alloclen, &image, 4, bpf_jit_fill_ill_insns);
+	bpf_hdr = bpf_jit_binary_pack_alloc(alloclen, &image, 4, &rw_header, &rw_image,
+					    bpf_jit_fill_ill_insns);
 	if (!bpf_hdr) {
 		fp = org_fp;
 		goto out_addrs;
@@ -292,6 +300,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 
 skip_init_ctx:
 	code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
+	rw_code_base = (u32 *)(rw_image + FUNCTION_DESCR_SIZE);
 
 	if (extra_pass) {
 		/*
@@ -303,7 +312,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		 * call instruction sequences and hence, the size of the JITed
 		 * image as well.
 		 */
-		bpf_jit_fixup_addresses(fp, code_base, &cgctx, addrs);
+		bpf_jit_fixup_addresses(fp, code_base, rw_code_base, &cgctx, addrs);
 
 		/* There is no need to perform the usual passes. */
 		goto skip_codegen_passes;
@@ -314,13 +323,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		/* Now build the prologue, body code & epilogue for real. */
 		cgctx.idx = 0;
 		cgctx.alt_exit_addr = 0;
-		bpf_jit_build_prologue(code_base, &cgctx);
-		if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, pass)) {
-			bpf_jit_binary_free(bpf_hdr);
+		bpf_jit_build_prologue(code_base, rw_code_base, &cgctx);
+		if (bpf_jit_build_body(fp, code_base, rw_code_base, &cgctx, addrs, pass)) {
+			bpf_arch_text_copy(&bpf_hdr->size, &rw_header->size,
+					   sizeof(rw_header->size));
+			bpf_jit_binary_pack_free(bpf_hdr, rw_header);
 			fp = org_fp;
 			goto out_addrs;
 		}
-		bpf_jit_build_epilogue(code_base, &cgctx);
+		bpf_jit_build_epilogue(code_base, rw_code_base, &cgctx);
 
 		if (bpf_jit_enable > 1)
 			pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
@@ -337,17 +348,26 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 
 #ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* Function descriptor nastiness: Address + TOC */
-	((u64 *)image)[0] = (u64)code_base;
-	((u64 *)image)[1] = local_paca->kernel_toc;
+	((u64 *)rw_image)[0] = (u64)code_base;
+	((u64 *)rw_image)[1] = local_paca->kernel_toc;
 #endif
 
 	fp->bpf_func = (void *)image;
 	fp->jited = 1;
 	fp->jited_len = proglen + FUNCTION_DESCR_SIZE;
 
-	bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + bpf_hdr->size);
 	if (!fp->is_func || extra_pass) {
-		bpf_jit_binary_lock_ro(bpf_hdr);
+		/*
+		 * bpf_jit_binary_pack_finalize fails in two scenarios:
+		 *   1) header is not pointing to proper module memory;
+		 *   2) the arch doesn't support bpf_arch_text_copy().
+		 *
+		 * Both cases are serious bugs that justify WARN_ON.
+		 */
+		if (WARN_ON(bpf_jit_binary_pack_finalize(fp, bpf_hdr, rw_header))) {
+			fp = org_fp;
+			goto out_addrs;
+		}
 		bpf_prog_fill_jited_linfo(fp, addrs);
 out_addrs:
 		kfree(addrs);
@@ -359,6 +379,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		jit_data->proglen = proglen;
 		jit_data->image = image;
 		jit_data->header = bpf_hdr;
+		jit_data->rw_header = rw_header;
 	}
 
 out:
@@ -372,12 +393,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
  * The caller should check for (BPF_MODE(code) == BPF_PROBE_MEM) before calling
  * this function, as this only applies to BPF_PROBE_MEM, for now.
  */
-int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct codegen_context *ctx,
-			  int insn_idx, int jmp_off, int dst_reg)
+int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *rw_image, int pass,
+			  struct codegen_context *ctx, int insn_idx,
+			  int jmp_off, int dst_reg)
 {
-	off_t offset;
+	struct exception_table_entry *ex, *rw_extable;
 	unsigned long pc;
-	struct exception_table_entry *ex;
+	off_t offset;
 	u32 *fixup;
 
 	/* Populate extable entries only in the last pass */
@@ -388,9 +410,16 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
 	    WARN_ON_ONCE(ctx->exentry_idx >= fp->aux->num_exentries))
 		return -EINVAL;
 
-	pc = (unsigned long)&image[insn_idx];
+	/*
+	 * Program is firt written to rw_image before copying to the
+	 * final location. Accordingly, update in the rw_image first.
+	 * As all offsets used are relative, copying as is to the
+	 * final location should be alright.
+	 */
+	pc = (unsigned long)&rw_image[insn_idx];
+	rw_extable = (void *)fp->aux->extable - (void *)image + (void *)rw_image;
 
-	fixup = (void *)fp->aux->extable -
+	fixup = (void *)rw_extable -
 		(fp->aux->num_exentries * BPF_FIXUP_LEN * 4) +
 		(ctx->exentry_idx * BPF_FIXUP_LEN * 4);
 
@@ -401,7 +430,7 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
 	fixup[BPF_FIXUP_LEN - 1] =
 		PPC_RAW_BRANCH((long)(pc + jmp_off) - (long)&fixup[BPF_FIXUP_LEN - 1]);
 
-	ex = &fp->aux->extable[ctx->exentry_idx];
+	ex = &rw_extable[ctx->exentry_idx];
 
 	offset = pc - (long)&ex->insn;
 	if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
@@ -426,3 +455,27 @@ int bpf_arch_text_invalidate(void *dst, size_t len)
 {
 	return IS_ERR(bpf_patch_ill_insns(dst, len));
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
+			bpf_jit_binary_pack_finalize(fp, jit_data->header, jit_data->rw_header);
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
index 43f1c76d48ce..047ef627c2aa 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -109,7 +109,7 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 	}
 }
 
-void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
+void bpf_jit_build_prologue(u32 *image, u32 *rw_image, struct codegen_context *ctx)
 {
 	int i;
 
@@ -162,7 +162,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_STW(_R0, _R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
 }
 
-static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
+static void bpf_jit_emit_common_epilogue(u32 *image, u32 *rw_image, struct codegen_context *ctx)
 {
 	int i;
 
@@ -172,11 +172,11 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 			EMIT(PPC_RAW_LWZ(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
 }
 
-void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
+void bpf_jit_build_epilogue(u32 *image, u32 *rw_image, struct codegen_context *ctx)
 {
 	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(BPF_REG_0)));
 
-	bpf_jit_emit_common_epilogue(image, ctx);
+	bpf_jit_emit_common_epilogue(image, rw_image, ctx);
 
 	/* Tear down our stack frame */
 
@@ -191,7 +191,7 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	EMIT(PPC_RAW_BLR());
 }
 
-int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
+int bpf_jit_emit_func_call_rel(u32 *image, u32 *rw_image, struct codegen_context *ctx, u64 func)
 {
 	s32 rel = (s32)func - (s32)(image + ctx->idx);
 
@@ -211,7 +211,7 @@ int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func
 	return 0;
 }
 
-static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
+static int bpf_jit_emit_tail_call(u32 *image, u32 *rw_image, struct codegen_context *ctx, u32 out)
 {
 	/*
 	 * By now, the eBPF program has already setup parameters in r3-r6
@@ -269,7 +269,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(BPF_REG_1)));
 
 	/* tear restore NVRs, ... */
-	bpf_jit_emit_common_epilogue(image, ctx);
+	bpf_jit_emit_common_epilogue(image, rw_image, ctx);
 
 	EMIT(PPC_RAW_BCTR());
 
@@ -278,7 +278,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 }
 
 /* Assemble the body code between the prologue & epilogue */
-int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
+int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *rw_image, struct codegen_context *ctx,
 		       u32 *addrs, int pass)
 {
 	const struct bpf_insn *insn = fp->insnsi;
@@ -954,8 +954,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 					jmp_off += 4;
 				}
 
-				ret = bpf_add_extable_entry(fp, image, pass, ctx, insn_idx,
-							    jmp_off, dst_reg);
+				ret = bpf_add_extable_entry(fp, image, rw_image, pass, ctx,
+							    insn_idx, jmp_off, dst_reg);
 				if (ret)
 					return ret;
 			}
@@ -986,7 +986,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * we'll just fall through to the epilogue.
 			 */
 			if (i != flen - 1) {
-				ret = bpf_jit_emit_exit_insn(image, ctx, _R0, exit_addr);
+				ret = bpf_jit_emit_exit_insn(image, rw_image, ctx, _R0, exit_addr);
 				if (ret)
 					return ret;
 			}
@@ -1009,7 +1009,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_STW(bpf_to_ppc(BPF_REG_5), _R1, 12));
 			}
 
-			ret = bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+			ret = bpf_jit_emit_func_call_rel(image, rw_image, ctx, func_addr);
 			if (ret)
 				return ret;
 
@@ -1231,7 +1231,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		case BPF_JMP | BPF_TAIL_CALL:
 			ctx->seen |= SEEN_TAILCALL;
-			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
+			ret = bpf_jit_emit_tail_call(image, rw_image, ctx, addrs[i + 1]);
 			if (ret < 0)
 				return ret;
 			break;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 29ee306d6302..f15bc20909d8 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -122,7 +122,7 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
 }
 
-void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
+void bpf_jit_build_prologue(u32 *image, u32 *rw_image, struct codegen_context *ctx)
 {
 	int i;
 
@@ -171,7 +171,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 				STACK_FRAME_MIN_SIZE + ctx->stack_size));
 }
 
-static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
+static void bpf_jit_emit_common_epilogue(u32 *image, u32 *rw_image, struct codegen_context *ctx)
 {
 	int i;
 
@@ -190,9 +190,9 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 	}
 }
 
-void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
+void bpf_jit_build_epilogue(u32 *image, u32 *rw_image, struct codegen_context *ctx)
 {
-	bpf_jit_emit_common_epilogue(image, ctx);
+	bpf_jit_emit_common_epilogue(image, rw_image, ctx);
 
 	/* Move result to r3 */
 	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(BPF_REG_0)));
@@ -200,7 +200,8 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	EMIT(PPC_RAW_BLR());
 }
 
-static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u64 func)
+static int bpf_jit_emit_func_call_hlp(u32 *image, u32 *rw_image, struct codegen_context *ctx,
+				      u64 func)
 {
 	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
 	long reladdr;
@@ -222,7 +223,7 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 	return 0;
 }
 
-int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
+int bpf_jit_emit_func_call_rel(u32 *image, u32 *rw_image, struct codegen_context *ctx, u64 func)
 {
 	unsigned int i, ctx_idx = ctx->idx;
 
@@ -254,7 +255,7 @@ int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func
 	return 0;
 }
 
-static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
+static int bpf_jit_emit_tail_call(u32 *image, u32 *rw_image, struct codegen_context *ctx, u32 out)
 {
 	/*
 	 * By now, the eBPF program has already setup parameters in r3, r4 and r5
@@ -311,7 +312,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_1)));
 
 	/* tear down stack, restore NVRs, ... */
-	bpf_jit_emit_common_epilogue(image, ctx);
+	bpf_jit_emit_common_epilogue(image, rw_image, ctx);
 
 	EMIT(PPC_RAW_BCTR());
 
@@ -342,7 +343,7 @@ asm (
 );
 
 /* Assemble the body code between the prologue & epilogue */
-int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
+int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *rw_image, struct codegen_context *ctx,
 		       u32 *addrs, int pass)
 {
 	enum stf_barrier_type stf_barrier = stf_barrier_type_get();
@@ -921,8 +922,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				addrs[++i] = ctx->idx * 4;
 
 			if (BPF_MODE(code) == BPF_PROBE_MEM) {
-				ret = bpf_add_extable_entry(fp, image, pass, ctx, ctx->idx - 1,
-							    4, dst_reg);
+				ret = bpf_add_extable_entry(fp, image, rw_image, pass, ctx,
+							    ctx->idx - 1, 4, dst_reg);
 				if (ret)
 					return ret;
 			}
@@ -954,7 +955,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * we'll just fall through to the epilogue.
 			 */
 			if (i != flen - 1) {
-				ret = bpf_jit_emit_exit_insn(image, ctx, tmp1_reg, exit_addr);
+				ret = bpf_jit_emit_exit_insn(image, rw_image, ctx,
+							     tmp1_reg, exit_addr);
 				if (ret)
 					return ret;
 			}
@@ -973,9 +975,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				return ret;
 
 			if (func_addr_fixed)
-				ret = bpf_jit_emit_func_call_hlp(image, ctx, func_addr);
+				ret = bpf_jit_emit_func_call_hlp(image, rw_image, ctx, func_addr);
 			else
-				ret = bpf_jit_emit_func_call_rel(image, ctx, func_addr);
+				ret = bpf_jit_emit_func_call_rel(image, rw_image, ctx, func_addr);
 
 			if (ret)
 				return ret;
@@ -1184,7 +1186,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		case BPF_JMP | BPF_TAIL_CALL:
 			ctx->seen |= SEEN_TAILCALL;
-			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
+			ret = bpf_jit_emit_tail_call(image, rw_image, ctx, addrs[i + 1]);
 			if (ret < 0)
 				return ret;
 			break;
-- 
2.37.3

