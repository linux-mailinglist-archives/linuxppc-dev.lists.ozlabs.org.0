Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B326F35C58B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:45:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJn3x72f3z3cBR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 21:45:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJn3622zqz30BR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 21:44:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJn2N6PHjz9tyR3;
 Mon, 12 Apr 2021 13:44:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hJ_xhjYiOndS; Mon, 12 Apr 2021 13:44:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJn2N5XR7z9tyQT;
 Mon, 12 Apr 2021 13:44:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C589F8B78E;
 Mon, 12 Apr 2021 13:44:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8DnIkpbJZT5P; Mon, 12 Apr 2021 13:44:17 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6AE118B78D;
 Mon, 12 Apr 2021 13:44:17 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3985267A06; Mon, 12 Apr 2021 11:44:17 +0000 (UTC)
Message-Id: <03167350b05b2fe8b741e53363ee37709d0f878d.1618227846.git.christophe.leroy@csgroup.eu>
In-Reply-To: <34d12a4f75cb8b53a925fada5e7ddddd3b145203.1618227846.git.christophe.leroy@csgroup.eu>
References: <34d12a4f75cb8b53a925fada5e7ddddd3b145203.1618227846.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/3] powerpc/ebpf32: Rework 64 bits shifts to avoid tests and
 branches
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@chromium.org, naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com
Date: Mon, 12 Apr 2021 11:44:17 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Re-implement BPF_ALU64 | BPF_{LSH/RSH/ARSH} | BPF_X with branchless
implementation copied from misc_32.S.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit_comp32.c | 39 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index ca6fe1583460..ef21b09df76e 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -548,16 +548,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU64 | BPF_LSH | BPF_X: /* dst <<= src; */
-			EMIT(PPC_RAW_ADDIC_DOT(__REG_R0, src_reg, -32));
-			PPC_BCC_SHORT(COND_LT, (ctx->idx + 4) * 4);
-			EMIT(PPC_RAW_SLW(dst_reg_h, dst_reg, __REG_R0));
-			EMIT(PPC_RAW_LI(dst_reg, 0));
-			PPC_JMP((ctx->idx + 6) * 4);
+			bpf_set_seen_register(ctx, tmp_reg);
 			EMIT(PPC_RAW_SUBFIC(__REG_R0, src_reg, 32));
 			EMIT(PPC_RAW_SLW(dst_reg_h, dst_reg_h, src_reg));
+			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
 			EMIT(PPC_RAW_SRW(__REG_R0, dst_reg, __REG_R0));
-			EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
+			EMIT(PPC_RAW_SLW(tmp_reg, dst_reg, tmp_reg));
 			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, __REG_R0));
+			EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
+			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, tmp_reg));
 			break;
 		case BPF_ALU | BPF_LSH | BPF_K: /* (u32) dst <<= (u32) imm */
 			if (!imm)
@@ -585,16 +584,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU64 | BPF_RSH | BPF_X: /* dst >>= src */
-			EMIT(PPC_RAW_ADDIC_DOT(__REG_R0, src_reg, -32));
-			PPC_BCC_SHORT(COND_LT, (ctx->idx + 4) * 4);
-			EMIT(PPC_RAW_SRW(dst_reg, dst_reg_h, __REG_R0));
-			EMIT(PPC_RAW_LI(dst_reg_h, 0));
-			PPC_JMP((ctx->idx + 6) * 4);
-			EMIT(PPC_RAW_SUBFIC(0, src_reg, 32));
+			bpf_set_seen_register(ctx, tmp_reg);
+			EMIT(PPC_RAW_SUBFIC(__REG_R0, src_reg, 32));
 			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
+			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
 			EMIT(PPC_RAW_SLW(__REG_R0, dst_reg_h, __REG_R0));
-			EMIT(PPC_RAW_SRW(dst_reg_h, dst_reg_h, src_reg));
+			EMIT(PPC_RAW_SRW(tmp_reg, dst_reg_h, tmp_reg));
 			EMIT(PPC_RAW_OR(dst_reg, dst_reg, __REG_R0));
+			EMIT(PPC_RAW_SRW(dst_reg_h, dst_reg_h, src_reg));
+			EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp_reg));
 			break;
 		case BPF_ALU | BPF_RSH | BPF_K: /* (u32) dst >>= (u32) imm */
 			if (!imm)
@@ -622,16 +620,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			EMIT(PPC_RAW_SRAW(dst_reg_h, dst_reg, src_reg));
 			break;
 		case BPF_ALU64 | BPF_ARSH | BPF_X: /* (s64) dst >>= src */
-			EMIT(PPC_RAW_ADDIC_DOT(__REG_R0, src_reg, -32));
-			PPC_BCC_SHORT(COND_LT, (ctx->idx + 4) * 4);
-			EMIT(PPC_RAW_SRAW(dst_reg, dst_reg_h, __REG_R0));
-			EMIT(PPC_RAW_SRAWI(dst_reg_h, dst_reg_h, 31));
-			PPC_JMP((ctx->idx + 6) * 4);
-			EMIT(PPC_RAW_SUBFIC(0, src_reg, 32));
+			bpf_set_seen_register(ctx, tmp_reg);
+			EMIT(PPC_RAW_SUBFIC(__REG_R0, src_reg, 32));
 			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
 			EMIT(PPC_RAW_SLW(__REG_R0, dst_reg_h, __REG_R0));
-			EMIT(PPC_RAW_SRAW(dst_reg_h, dst_reg_h, src_reg));
+			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
 			EMIT(PPC_RAW_OR(dst_reg, dst_reg, __REG_R0));
+			EMIT(PPC_RAW_RLWINM(__REG_R0, tmp_reg, 0, 26, 26));
+			EMIT(PPC_RAW_SRAW(tmp_reg, dst_reg_h, tmp_reg));
+			EMIT(PPC_RAW_SRAW(dst_reg_h, dst_reg_h, src_reg));
+			EMIT(PPC_RAW_SLW(tmp_reg, tmp_reg, __REG_R0));
+			EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp_reg));
 			break;
 		case BPF_ALU | BPF_ARSH | BPF_K: /* (s32) dst >>= imm */
 			if (!imm)
-- 
2.25.0

