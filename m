Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997523D6FC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 08:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYndB5L0Bz3bZv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 16:56:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=b//a6O8R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b//a6O8R; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYncj5jTSz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 16:55:49 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so2761643pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cti+9xh1CQCuVdfi7nDnFSd31tcaiiPvT0SSDMfe1KY=;
 b=b//a6O8RetEzQhBq1L0w5a0lG9K5wSxLr2nLMY+MxCt1aYKjnTmvotbwu/NW+0v9/f
 YOHilor6TuFcgSMUvSkBB3dH+UCvnmSIpr3crbZ+d3sFVcdS+VJNPzH4cZ9yVrKMjFXp
 nkN/a85lLDrUK8kUgxOMdtQYQu6NiitUoZBcfPaV0uHgPPKrAFd0KW+GIRUTcmQKIHp4
 /qpAh559aa3qa2X5zCFuTkckl142JXrkYHZ2zZ7v7FOqVeBKyYfVNBCWFHV4kviuYIMk
 NXloaUfCzXZiJdlK3LxcfHRU86xJTJz3lSKCzEzgqviB8oxvZlWyCoBxXAikKMhFXRwk
 8WHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cti+9xh1CQCuVdfi7nDnFSd31tcaiiPvT0SSDMfe1KY=;
 b=PPAbGKXBYiiYq52wgQATwAk7cTnZQ7pv8XAYiNnUzN+oh1J2NiJZwIaapv6VPEv6vr
 rhyWyy5COwfsiIEAqDrEB+lGkmkWAa2KL43mxNYbyH/PpOpFW3UtLbnEUVfNtMRj/o1m
 S8tJ/4i0t6Q0/edVK+ExkqUEDEt8LR4bjc9wz/lFgrRnhJy3c4RXREKZnrClXn+MMyzf
 E/C8oXIIFd+A3StykPRHZTB25wqtd5VgAeJDXxNJ+MIGPnvGr0hyrXHkE5M+JXVK0gz2
 hrEiIff8ZJG2Ky7CU5Wuy/LlpajFOhQ5AwWF0EVD6BTndyGeSNgllmPkZ/cam0ORaRAh
 l/aQ==
X-Gm-Message-State: AOAM531OC+Pmp5PF0XL/WwpWzy1NFo95ph5J7L+Abw1dDTLrzCX6hvQ8
 MiTfjUJzggUF7ewZvJBlskoinydMJoY=
X-Google-Smtp-Source: ABdhPJzs1JBmFsYyyBnUfFGdDobDkCFhNF1q0x2vfnpGEQS0S2f65tA5Pe+xapmvUbdPClQx5E7ENg==
X-Received: by 2002:a62:1ad2:0:b029:349:f807:129b with SMTP id
 a201-20020a621ad20000b0290349f807129bmr21825260pfa.16.1627368946651; 
 Mon, 26 Jul 2021 23:55:46 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id f11sm2257891pga.61.2021.07.26.23.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 23:55:46 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc64/bpf: Store temp registers' bpf to ppc mapping
Date: Tue, 27 Jul 2021 16:55:37 +1000
Message-Id: <20210727065539.299598-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In bpf_jit_build_body(), the mapping of TMP_REG_1 and TMP_REG_2's bpf
register to ppc register is evalulated at every use despite not
changing. Instead, determine the ppc register once and store the result.
This will be more useful when a later patch introduces a more complex
mapping from bpf registers to ppc registers.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/net/bpf_jit_comp64.c | 163 +++++++++++++-----------------
 1 file changed, 69 insertions(+), 94 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index de8595880fee..1dfec85bb03b 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -285,6 +285,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 code = insn[i].code;
 		u32 dst_reg = b2p[insn[i].dst_reg];
 		u32 src_reg = b2p[insn[i].src_reg];
+		u32 tmp1_reg = b2p[TMP_REG_1];
+		u32 tmp2_reg = b2p[TMP_REG_2];
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -337,8 +339,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				if (imm >= -32768 && imm < 32768)
 					EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
 				else {
-					PPC_LI32(b2p[TMP_REG_1], imm);
-					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
+					PPC_LI32(tmp1_reg, imm);
+					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, tmp1_reg));
 				}
 			}
 			goto bpf_alu32_trunc;
@@ -354,32 +356,28 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (imm >= -32768 && imm < 32768)
 				EMIT(PPC_RAW_MULI(dst_reg, dst_reg, IMM_L(imm)));
 			else {
-				PPC_LI32(b2p[TMP_REG_1], imm);
+				PPC_LI32(tmp1_reg, imm);
 				if (BPF_CLASS(code) == BPF_ALU)
-					EMIT(PPC_RAW_MULW(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_MULW(dst_reg, dst_reg, tmp1_reg));
 				else
-					EMIT(PPC_RAW_MULD(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_MULD(dst_reg, dst_reg, tmp1_reg));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
 		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
 			if (BPF_OP(code) == BPF_MOD) {
-				EMIT(PPC_RAW_DIVWU(b2p[TMP_REG_1], dst_reg, src_reg));
-				EMIT(PPC_RAW_MULW(b2p[TMP_REG_1], src_reg,
-						b2p[TMP_REG_1]));
-				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_DIVWU(tmp1_reg, dst_reg, src_reg));
+				EMIT(PPC_RAW_MULW(tmp1_reg, src_reg, tmp1_reg));
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 			} else
 				EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
 			if (BPF_OP(code) == BPF_MOD) {
-				EMIT(PPC_RAW_DIVDU(b2p[TMP_REG_1], dst_reg, src_reg));
-				EMIT(PPC_RAW_MULD(b2p[TMP_REG_1], src_reg,
-						b2p[TMP_REG_1]));
-				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_DIVDU(tmp1_reg, dst_reg, src_reg));
+				EMIT(PPC_RAW_MULD(tmp1_reg, src_reg, tmp1_reg));
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 			} else
 				EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, src_reg));
 			break;
@@ -392,35 +390,23 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			else if (imm == 1)
 				goto bpf_alu32_trunc;
 
-			PPC_LI32(b2p[TMP_REG_1], imm);
+			PPC_LI32(tmp1_reg, imm);
 			switch (BPF_CLASS(code)) {
 			case BPF_ALU:
 				if (BPF_OP(code) == BPF_MOD) {
-					EMIT(PPC_RAW_DIVWU(b2p[TMP_REG_2],
-							dst_reg,
-							b2p[TMP_REG_1]));
-					EMIT(PPC_RAW_MULW(b2p[TMP_REG_1],
-							b2p[TMP_REG_1],
-							b2p[TMP_REG_2]));
-					EMIT(PPC_RAW_SUB(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVWU(tmp2_reg, dst_reg, tmp1_reg));
+					EMIT(PPC_RAW_MULW(tmp1_reg, tmp1_reg, tmp2_reg));
+					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 				} else
-					EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, tmp1_reg));
 				break;
 			case BPF_ALU64:
 				if (BPF_OP(code) == BPF_MOD) {
-					EMIT(PPC_RAW_DIVDU(b2p[TMP_REG_2],
-							dst_reg,
-							b2p[TMP_REG_1]));
-					EMIT(PPC_RAW_MULD(b2p[TMP_REG_1],
-							b2p[TMP_REG_1],
-							b2p[TMP_REG_2]));
-					EMIT(PPC_RAW_SUB(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVDU(tmp2_reg, dst_reg, tmp1_reg));
+					EMIT(PPC_RAW_MULD(tmp1_reg, tmp1_reg, tmp2_reg));
+					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 				} else
-					EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, tmp1_reg));
 				break;
 			}
 			goto bpf_alu32_trunc;
@@ -442,8 +428,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_ANDI(dst_reg, dst_reg, IMM_L(imm)));
 			else {
 				/* Sign-extended */
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_AND(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_AND(dst_reg, dst_reg, tmp1_reg));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_OR | BPF_X: /* dst = (u32) dst | (u32) src */
@@ -454,8 +440,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_ALU64 | BPF_OR | BPF_K:/* dst = dst | imm */
 			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
 				/* Sign-extended */
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_OR(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp1_reg));
 			} else {
 				if (IMM_L(imm))
 					EMIT(PPC_RAW_ORI(dst_reg, dst_reg, IMM_L(imm)));
@@ -471,8 +457,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_ALU64 | BPF_XOR | BPF_K: /* dst ^= imm */
 			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
 				/* Sign-extended */
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, tmp1_reg));
 			} else {
 				if (IMM_L(imm))
 					EMIT(PPC_RAW_XORI(dst_reg, dst_reg, IMM_L(imm)));
@@ -573,11 +559,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			switch (imm) {
 			case 16:
 				/* Rotate 8 bits left & mask with 0x0000ff00 */
-				EMIT(PPC_RAW_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 16, 23));
+				EMIT(PPC_RAW_RLWINM(tmp1_reg, dst_reg, 8, 16, 23));
 				/* Rotate 8 bits right & insert LSB to reg */
-				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 24, 31));
+				EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 24, 31));
 				/* Move result back to dst_reg */
-				EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
 				break;
 			case 32:
 				/*
@@ -585,12 +571,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				 * 2 bytes are already in their final position
 				 * -- byte 2 and 4 (of bytes 1, 2, 3 and 4)
 				 */
-				EMIT(PPC_RAW_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 0, 31));
+				EMIT(PPC_RAW_RLWINM(tmp1_reg, dst_reg, 8, 0, 31));
 				/* Rotate 24 bits and insert byte 1 */
-				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 0, 7));
+				EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 0, 7));
 				/* Rotate 24 bits and insert byte 3 */
-				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 16, 23));
-				EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 16, 23));
+				EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
 				break;
 			case 64:
 				/*
@@ -602,8 +588,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				 * same across all passes
 				 */
 				PPC_BPF_STL(dst_reg, 1, bpf_jit_stack_local(ctx));
-				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], 1, bpf_jit_stack_local(ctx)));
-				EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_ADDI(tmp1_reg, 1, bpf_jit_stack_local(ctx)));
+				EMIT(PPC_RAW_LDBRX(dst_reg, 0, tmp1_reg));
 				break;
 			}
 			break;
@@ -633,32 +619,32 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_STX | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				EMIT(PPC_RAW_LI(b2p[TMP_REG_1], imm));
-				src_reg = b2p[TMP_REG_1];
+				EMIT(PPC_RAW_LI(tmp1_reg, imm));
+				src_reg = tmp1_reg;
 			}
 			EMIT(PPC_RAW_STB(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				EMIT(PPC_RAW_LI(b2p[TMP_REG_1], imm));
-				src_reg = b2p[TMP_REG_1];
+				EMIT(PPC_RAW_LI(tmp1_reg, imm));
+				src_reg = tmp1_reg;
 			}
 			EMIT(PPC_RAW_STH(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				src_reg = b2p[TMP_REG_1];
+				PPC_LI32(tmp1_reg, imm);
+				src_reg = tmp1_reg;
 			}
 			EMIT(PPC_RAW_STW(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_DW: /* (u64 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_DW: /* *(u64 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				src_reg = b2p[TMP_REG_1];
+				PPC_LI32(tmp1_reg, imm);
+				src_reg = tmp1_reg;
 			}
 			PPC_BPF_STL(src_reg, dst_reg, off);
 			break;
@@ -677,14 +663,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			/* *(u32 *)(dst + off) += src */
 
 			/* Get EA into TMP_REG_1 */
-			EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], dst_reg, off));
+			EMIT(PPC_RAW_ADDI(tmp1_reg, dst_reg, off));
 			tmp_idx = ctx->idx * 4;
 			/* load value from memory into TMP_REG_2 */
-			EMIT(PPC_RAW_LWARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
+			EMIT(PPC_RAW_LWARX(tmp2_reg, 0, tmp1_reg, 0));
 			/* add value from src_reg into this */
-			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
+			EMIT(PPC_RAW_ADD(tmp2_reg, tmp2_reg, src_reg));
 			/* store result back */
-			EMIT(PPC_RAW_STWCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]));
+			EMIT(PPC_RAW_STWCX(tmp2_reg, 0, tmp1_reg));
 			/* we're done if this succeeded */
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 			break;
@@ -697,11 +683,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			}
 			/* *(u64 *)(dst + off) += src */
 
-			EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], dst_reg, off));
+			EMIT(PPC_RAW_ADDI(tmp1_reg, dst_reg, off));
 			tmp_idx = ctx->idx * 4;
-			EMIT(PPC_RAW_LDARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
-			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
-			EMIT(PPC_RAW_STDCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]));
+			EMIT(PPC_RAW_LDARX(tmp2_reg, 0, tmp1_reg, 0));
+			EMIT(PPC_RAW_ADD(tmp2_reg, tmp2_reg, src_reg));
+			EMIT(PPC_RAW_STDCX(tmp2_reg, 0, tmp1_reg));
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 			break;
 
@@ -879,14 +865,10 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			case BPF_JMP | BPF_JSET | BPF_X:
 			case BPF_JMP32 | BPF_JSET | BPF_X:
 				if (BPF_CLASS(code) == BPF_JMP) {
-					EMIT(PPC_RAW_AND_DOT(b2p[TMP_REG_1], dst_reg,
-						    src_reg));
+					EMIT(PPC_RAW_AND_DOT(tmp1_reg, dst_reg, src_reg));
 				} else {
-					int tmp_reg = b2p[TMP_REG_1];
-
-					EMIT(PPC_RAW_AND(tmp_reg, dst_reg, src_reg));
-					EMIT(PPC_RAW_RLWINM_DOT(tmp_reg, tmp_reg, 0, 0,
-						       31));
+					EMIT(PPC_RAW_AND(tmp1_reg, dst_reg, src_reg));
+					EMIT(PPC_RAW_RLWINM_DOT(tmp1_reg, tmp1_reg, 0, 0, 31));
 				}
 				break;
 			case BPF_JMP | BPF_JNE | BPF_K:
@@ -915,14 +897,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 						EMIT(PPC_RAW_CMPLDI(dst_reg, imm));
 				} else {
 					/* sign-extending load */
-					PPC_LI32(b2p[TMP_REG_1], imm);
+					PPC_LI32(tmp1_reg, imm);
 					/* ... but unsigned comparison */
 					if (is_jmp32)
-						EMIT(PPC_RAW_CMPLW(dst_reg,
-							  b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPLW(dst_reg, tmp1_reg));
 					else
-						EMIT(PPC_RAW_CMPLD(dst_reg,
-							  b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPLD(dst_reg, tmp1_reg));
 				}
 				break;
 			}
@@ -947,13 +927,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 					else
 						EMIT(PPC_RAW_CMPDI(dst_reg, imm));
 				} else {
-					PPC_LI32(b2p[TMP_REG_1], imm);
+					PPC_LI32(tmp1_reg, imm);
 					if (is_jmp32)
-						EMIT(PPC_RAW_CMPW(dst_reg,
-							 b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPW(dst_reg, tmp1_reg));
 					else
-						EMIT(PPC_RAW_CMPD(dst_reg,
-							 b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPD(dst_reg, tmp1_reg));
 				}
 				break;
 			}
@@ -962,19 +940,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				/* andi does not sign-extend the immediate */
 				if (imm >= 0 && imm < 32768)
 					/* PPC_ANDI is _only/always_ dot-form */
-					EMIT(PPC_RAW_ANDI(b2p[TMP_REG_1], dst_reg, imm));
+					EMIT(PPC_RAW_ANDI(tmp1_reg, dst_reg, imm));
 				else {
-					int tmp_reg = b2p[TMP_REG_1];
-
-					PPC_LI32(tmp_reg, imm);
+					PPC_LI32(tmp1_reg, imm);
 					if (BPF_CLASS(code) == BPF_JMP) {
-						EMIT(PPC_RAW_AND_DOT(tmp_reg, dst_reg,
-							    tmp_reg));
+						EMIT(PPC_RAW_AND_DOT(tmp1_reg, dst_reg,
+								     tmp1_reg));
 					} else {
-						EMIT(PPC_RAW_AND(tmp_reg, dst_reg,
-							tmp_reg));
-						EMIT(PPC_RAW_RLWINM_DOT(tmp_reg, tmp_reg,
-							       0, 0, 31));
+						EMIT(PPC_RAW_AND(tmp1_reg, dst_reg, tmp1_reg));
+						EMIT(PPC_RAW_RLWINM_DOT(tmp1_reg, tmp1_reg,
+									0, 0, 31));
 					}
 				}
 				break;
-- 
2.25.1

