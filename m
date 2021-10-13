Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDDF42B16B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 02:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTYy21Lf5z3c4g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:56:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SjY12js7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SjY12js7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTYwl3lt1z2xt2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 11:55:19 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E0E6610CC;
 Wed, 13 Oct 2021 00:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634086517;
 bh=H3YRdcB2uDuK1KXN3MRUvcpcFRbKcHa6DXGKcKE/lQ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SjY12js7+RsS5DtgLnG2l31KTgCz+RJp30eUU7aNyHhwjp3dhuo/X4saowj1rDWHe
 AOdBwh8n9xwKYKPBkEyp2NiEq6PJv2cnzPDc6mosJ1b6dRjf/4ChzfaiP299xtLNkl
 pCR6MOrlM3krQySQQbrpXWe2QpfyiRVmULuaPrVqEKaQEaXwj2zBynOoF9EgM0XImQ
 ytoXYd5Jac6/uXI7JahLN77j016RZRbYmfpaYE1AYtIky35qYx132O+08136Cy1xmC
 ZLe19iFdrZyE8U0XxTEqVIsc+qoZHDNSpMZCrcx7bmowSujDNbk3gvO7LJ6MsO3TE6
 CnqnTHMa0WXXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 14/17] powerpc/bpf: Validate branch ranges
Date: Tue, 12 Oct 2021 20:54:38 -0400
Message-Id: <20211013005441.699846-14-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013005441.699846-1-sashal@kernel.org>
References: <20211013005441.699846-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Song Liu <songliubraving@fb.com>,
 daniel@iogearbox.net, Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 ast@kernel.org, andrii@kernel.org, netdev@vger.kernel.org,
 naveen.n.rao@linux.ibm.com, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

[ Upstream commit 3832ba4e283d7052b783dab8311df7e3590fed93 ]

Add checks to ensure that we never emit branch instructions with
truncated branch offsets.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Song Liu <songliubraving@fb.com>
Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/71d33a6b7603ec1013c9734dd8bdd4ff5e929142.1633464148.git.naveen.n.rao@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/net/bpf_jit.h        | 26 ++++++++++++++++++++------
 arch/powerpc/net/bpf_jit_comp.c   |  6 +++++-
 arch/powerpc/net/bpf_jit_comp32.c |  8 ++++++--
 arch/powerpc/net/bpf_jit_comp64.c |  8 ++++++--
 4 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 935ea95b6635..7e9b978b768e 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -24,16 +24,30 @@
 #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
 
 /* Long jump; (unconditional 'branch') */
-#define PPC_JMP(dest)		EMIT(PPC_INST_BRANCH |			      \
-				     (((dest) - (ctx->idx * 4)) & 0x03fffffc))
+#define PPC_JMP(dest)							      \
+	do {								      \
+		long offset = (long)(dest) - (ctx->idx * 4);		      \
+		if (!is_offset_in_branch_range(offset)) {		      \
+			pr_err_ratelimited("Branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);			\
+			return -ERANGE;					      \
+		}							      \
+		EMIT(PPC_INST_BRANCH | (offset & 0x03fffffc));		      \
+	} while (0)
+
 /* blr; (unconditional 'branch' with link) to absolute address */
 #define PPC_BL_ABS(dest)	EMIT(PPC_INST_BL |			      \
 				     (((dest) - (unsigned long)(image + ctx->idx)) & 0x03fffffc))
 /* "cond" here covers BO:BI fields. */
-#define PPC_BCC_SHORT(cond, dest)	EMIT(PPC_INST_BRANCH_COND |	      \
-					     (((cond) & 0x3ff) << 16) |	      \
-					     (((dest) - (ctx->idx * 4)) &     \
-					      0xfffc))
+#define PPC_BCC_SHORT(cond, dest)					      \
+	do {								      \
+		long offset = (long)(dest) - (ctx->idx * 4);		      \
+		if (!is_offset_in_cond_branch_range(offset)) {		      \
+			pr_err_ratelimited("Conditional branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);		\
+			return -ERANGE;					      \
+		}							      \
+		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));					\
+	} while (0)
+
 /* Sign-extended 32-bit immediate load */
 #define PPC_LI32(d, i)		do {					      \
 		if ((int)(uintptr_t)(i) >= -32768 &&			      \
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 53aefee3fe70..fcbf7a917c56 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -210,7 +210,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 		/* Now build the prologue, body code & epilogue for real. */
 		cgctx.idx = 0;
 		bpf_jit_build_prologue(code_base, &cgctx);
-		bpf_jit_build_body(fp, code_base, &cgctx, addrs, extra_pass);
+		if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, extra_pass)) {
+			bpf_jit_binary_free(bpf_hdr);
+			fp = org_fp;
+			goto out_addrs;
+		}
 		bpf_jit_build_epilogue(code_base, &cgctx);
 
 		if (bpf_jit_enable > 1)
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index beb12cbc8c29..a74d52204f8d 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -200,7 +200,7 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 	}
 }
 
-static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
+static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
 {
 	/*
 	 * By now, the eBPF program has already setup parameters in r3-r6
@@ -261,7 +261,9 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	EMIT(PPC_RAW_BCTR());
+
 	/* out: */
+	return 0;
 }
 
 /* Assemble the body code between the prologue & epilogue */
@@ -1090,7 +1092,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		case BPF_JMP | BPF_TAIL_CALL:
 			ctx->seen |= SEEN_TAILCALL;
-			bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
+			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
+			if (ret < 0)
+				return ret;
 			break;
 
 		default:
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index b87a63dba9c8..f06c62089b14 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -206,7 +206,7 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 	EMIT(PPC_RAW_BCTRL());
 }
 
-static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
+static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
 {
 	/*
 	 * By now, the eBPF program has already setup parameters in r3, r4 and r5
@@ -267,7 +267,9 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	EMIT(PPC_RAW_BCTR());
+
 	/* out: */
+	return 0;
 }
 
 /* Assemble the body code between the prologue & epilogue */
@@ -993,7 +995,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		case BPF_JMP | BPF_TAIL_CALL:
 			ctx->seen |= SEEN_TAILCALL;
-			bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
+			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
+			if (ret < 0)
+				return ret;
 			break;
 
 		default:
-- 
2.33.0

