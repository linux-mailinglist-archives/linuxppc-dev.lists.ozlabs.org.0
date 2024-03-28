Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB08722EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 16:37:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq06f73lPz3vhj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 02:36:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq06C51Bkz3cgk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 02:36:33 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Tq0630yD9z9sjy;
	Tue,  5 Mar 2024 16:36:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DltTjW7pf-_T; Tue,  5 Mar 2024 16:36:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Tq0625hhNz9skH;
	Tue,  5 Mar 2024 16:36:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BBEC68B768;
	Tue,  5 Mar 2024 16:36:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5SxgdYpgz1jO; Tue,  5 Mar 2024 16:36:26 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.92])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A29F8B763;
	Tue,  5 Mar 2024 16:36:25 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH] powerpc/bpf/32: Fix failing test_bpf tests
Date: Tue,  5 Mar 2024 16:36:23 +0100
Message-ID: <91de862dda99d170697eb79ffb478678af7e0b27.1709652689.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709652984; l=14181; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=a2cP4IwLv9TwWLAliWqUJOt/vktd/DzInthdJrbCz4o=; b=M2w+oFqYrtXWG3kSrFfDVZoqtLRhLV+qC82MRh0GsalUxQnPfgKCJ6BpyLh9+ceLbe03IufK1 p6Vc+BEHhYzB38t3bcoED0vGbYd0aO3aw9yoXXM+32S9LeIAXJSwjUl
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recent additions in BPF like cpu v4 instructions, test_bpf module
exhibits the following failures:

	test_bpf: #82 ALU_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
	test_bpf: #83 ALU_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
	test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
	test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
	test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)

	test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
	test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)

	test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
	test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)

	test_bpf: #172 ALU64_SMOD_K: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)

	test_bpf: #313 BSWAP 16: 0x0123456789abcdef -> 0xefcd
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 301 PASS
	test_bpf: #314 BSWAP 32: 0x0123456789abcdef -> 0xefcdab89
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 555 PASS
	test_bpf: #315 BSWAP 64: 0x0123456789abcdef -> 0x67452301
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 268 PASS
	test_bpf: #316 BSWAP 64: 0x0123456789abcdef >> 32 -> 0xefcdab89
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 269 PASS
	test_bpf: #317 BSWAP 16: 0xfedcba9876543210 -> 0x1032
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 460 PASS
	test_bpf: #318 BSWAP 32: 0xfedcba9876543210 -> 0x10325476
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 320 PASS
	test_bpf: #319 BSWAP 64: 0xfedcba9876543210 -> 0x98badcfe
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 222 PASS
	test_bpf: #320 BSWAP 64: 0xfedcba9876543210 >> 32 -> 0x10325476
	eBPF filter opcode 00d7 (@2) unsupported
	jited:0 273 PASS

	test_bpf: #344 BPF_LDX_MEMSX | BPF_B
	eBPF filter opcode 0091 (@5) unsupported
	jited:0 432 PASS
	test_bpf: #345 BPF_LDX_MEMSX | BPF_H
	eBPF filter opcode 0089 (@5) unsupported
	jited:0 381 PASS
	test_bpf: #346 BPF_LDX_MEMSX | BPF_W
	eBPF filter opcode 0081 (@5) unsupported
	jited:0 505 PASS

	test_bpf: #490 JMP32_JA: Unconditional jump: if (true) return 1
	eBPF filter opcode 0006 (@1) unsupported
	jited:0 261 PASS

	test_bpf: Summary: 1040 PASSED, 10 FAILED, [924/1038 JIT'ed]

Fix them by adding missing processing.

Fixes: daabb2b098e0 ("bpf/tests: add tests for cpuv4 instructions")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h |   4 +
 arch/powerpc/net/bpf_jit_comp32.c     | 137 ++++++++++++++++++++------
 2 files changed, 110 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 005601243dda..076ae60b4a55 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -510,6 +510,7 @@
 #define PPC_RAW_STB(r, base, i)		(0x98000000 | ___PPC_RS(r) | ___PPC_RA(base) | IMM_L(i))
 #define PPC_RAW_LBZ(r, base, i)		(0x88000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_L(i))
 #define PPC_RAW_LDX(r, base, b)		(0x7c00002a | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
+#define PPC_RAW_LHA(r, base, i)		(0xa8000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_L(i))
 #define PPC_RAW_LHZ(r, base, i)		(0xa0000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_L(i))
 #define PPC_RAW_LHBRX(r, base, b)	(0x7c00062c | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
 #define PPC_RAW_LWBRX(r, base, b)	(0x7c00042c | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
@@ -532,6 +533,7 @@
 #define PPC_RAW_MULW(d, a, b)		(0x7c0001d6 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_MULHWU(d, a, b)		(0x7c000016 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_MULI(d, a, i)		(0x1c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_DIVW(d, a, b)		(0x7c0003d6 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_DIVWU(d, a, b)		(0x7c000396 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_DIVDU(d, a, b)		(0x7c000392 | ___PPC_RT(d) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_DIVDE(t, a, b)		(0x7c000352 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
@@ -550,6 +552,8 @@
 #define PPC_RAW_XOR(d, a, b)		(0x7c000278 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_XORI(d, a, i)		(0x68000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
 #define PPC_RAW_XORIS(d, a, i)		(0x6c000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_EXTSB(d, a)		(0x7c000774 | ___PPC_RA(d) | ___PPC_RS(a))
+#define PPC_RAW_EXTSH(d, a)		(0x7c000734 | ___PPC_RA(d) | ___PPC_RS(a))
 #define PPC_RAW_EXTSW(d, a)		(0x7c0007b4 | ___PPC_RA(d) | ___PPC_RS(a))
 #define PPC_RAW_SLW(d, a, s)		(0x7c000030 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(s))
 #define PPC_RAW_SLD(d, a, s)		(0x7c000036 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(s))
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 2f39c50ca729..43b97032a91c 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -450,10 +450,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			}
 			break;
 		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
-			EMIT(PPC_RAW_DIVWU(dst_reg, src2_reg, src_reg));
+			if (off)
+				EMIT(PPC_RAW_DIVW(dst_reg, src2_reg, src_reg));
+			else
+				EMIT(PPC_RAW_DIVWU(dst_reg, src2_reg, src_reg));
 			break;
 		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
-			EMIT(PPC_RAW_DIVWU(_R0, src2_reg, src_reg));
+			if (off)
+				EMIT(PPC_RAW_DIVW(_R0, src2_reg, src_reg));
+			else
+				EMIT(PPC_RAW_DIVWU(_R0, src2_reg, src_reg));
 			EMIT(PPC_RAW_MULW(_R0, src_reg, _R0));
 			EMIT(PPC_RAW_SUB(dst_reg, src2_reg, _R0));
 			break;
@@ -467,10 +473,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			if (imm == 1) {
 				EMIT(PPC_RAW_MR(dst_reg, src2_reg));
 			} else if (is_power_of_2((u32)imm)) {
-				EMIT(PPC_RAW_SRWI(dst_reg, src2_reg, ilog2(imm)));
+				if (off)
+					EMIT(PPC_RAW_SRAWI(dst_reg, src2_reg, ilog2(imm)));
+				else
+					EMIT(PPC_RAW_SRWI(dst_reg, src2_reg, ilog2(imm)));
 			} else {
 				PPC_LI32(_R0, imm);
-				EMIT(PPC_RAW_DIVWU(dst_reg, src2_reg, _R0));
+				if (off)
+					EMIT(PPC_RAW_DIVW(dst_reg, src2_reg, _R0));
+				else
+					EMIT(PPC_RAW_DIVWU(dst_reg, src2_reg, _R0));
 			}
 			break;
 		case BPF_ALU | BPF_MOD | BPF_K: /* (u32) dst %= (u32) imm */
@@ -480,11 +492,19 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			if (!is_power_of_2((u32)imm)) {
 				bpf_set_seen_register(ctx, tmp_reg);
 				PPC_LI32(tmp_reg, imm);
-				EMIT(PPC_RAW_DIVWU(_R0, src2_reg, tmp_reg));
+				if (off)
+					EMIT(PPC_RAW_DIVW(_R0, src2_reg, tmp_reg));
+				else
+					EMIT(PPC_RAW_DIVWU(_R0, src2_reg, tmp_reg));
 				EMIT(PPC_RAW_MULW(_R0, tmp_reg, _R0));
 				EMIT(PPC_RAW_SUB(dst_reg, src2_reg, _R0));
 			} else if (imm == 1) {
 				EMIT(PPC_RAW_LI(dst_reg, 0));
+			} else if (off) {
+				EMIT(PPC_RAW_SRAWI(_R0, src2_reg, ilog2(imm)));
+				EMIT(PPC_RAW_ADDZE(_R0, _R0));
+				EMIT(PPC_RAW_SLWI(_R0, _R0, ilog2(imm)));
+				EMIT(PPC_RAW_SUB(dst_reg, src2_reg, _R0));
 			} else {
 				imm = ilog2((u32)imm);
 				EMIT(PPC_RAW_RLWINM(dst_reg, src2_reg, 0, 32 - imm, 31));
@@ -497,11 +517,21 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				imm = -imm;
 			if (!is_power_of_2(imm))
 				return -EOPNOTSUPP;
-			if (imm == 1)
+			if (imm == 1) {
 				EMIT(PPC_RAW_LI(dst_reg, 0));
-			else
+				EMIT(PPC_RAW_LI(dst_reg_h, 0));
+			} else if (off) {
+				EMIT(PPC_RAW_SRAWI(dst_reg_h, src2_reg_h, 31));
+				EMIT(PPC_RAW_XOR(dst_reg, src2_reg, dst_reg_h));
+				EMIT(PPC_RAW_SUBFC(dst_reg, dst_reg_h, dst_reg));
+				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 32 - ilog2(imm), 31));
+				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg_h));
+				EMIT(PPC_RAW_SUBFC(dst_reg, dst_reg_h, dst_reg));
+				EMIT(PPC_RAW_SUBFE(dst_reg_h, dst_reg_h, dst_reg_h));
+			} else {
 				EMIT(PPC_RAW_RLWINM(dst_reg, src2_reg, 0, 32 - ilog2(imm), 31));
-			EMIT(PPC_RAW_LI(dst_reg_h, 0));
+				EMIT(PPC_RAW_LI(dst_reg_h, 0));
+			}
 			break;
 		case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /= imm */
 			if (!imm)
@@ -727,15 +757,30 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 * MOV
 		 */
 		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
-			if (dst_reg == src_reg)
-				break;
-			EMIT(PPC_RAW_MR(dst_reg, src_reg));
-			EMIT(PPC_RAW_MR(dst_reg_h, src_reg_h));
+			if (off == 8) {
+				EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));
+				EMIT(PPC_RAW_SRAWI(dst_reg_h, dst_reg, 31));
+			} else if (off == 16) {
+				EMIT(PPC_RAW_EXTSH(dst_reg, src_reg));
+				EMIT(PPC_RAW_SRAWI(dst_reg_h, dst_reg, 31));
+			} else if (off == 32 && dst_reg == src_reg) {
+				EMIT(PPC_RAW_SRAWI(dst_reg_h, src_reg, 31));
+			} else if (off == 32) {
+				EMIT(PPC_RAW_MR(dst_reg, src_reg));
+				EMIT(PPC_RAW_SRAWI(dst_reg_h, src_reg, 31));
+			} else if (dst_reg != src_reg) {
+				EMIT(PPC_RAW_MR(dst_reg, src_reg));
+				EMIT(PPC_RAW_MR(dst_reg_h, src_reg_h));
+			}
 			break;
 		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
 			/* special mov32 for zext */
 			if (imm == 1)
 				EMIT(PPC_RAW_LI(dst_reg_h, 0));
+			else if (off == 8)
+				EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));
+			else if (off == 16)
+				EMIT(PPC_RAW_EXTSH(dst_reg, src_reg));
 			else if (dst_reg != src_reg)
 				EMIT(PPC_RAW_MR(dst_reg, src_reg));
 			break;
@@ -751,6 +796,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 * BPF_FROM_BE/LE
 		 */
 		case BPF_ALU | BPF_END | BPF_FROM_LE:
+		case BPF_ALU64 | BPF_END | BPF_FROM_LE:
 			switch (imm) {
 			case 16:
 				/* Copy 16 bits to upper part */
@@ -785,6 +831,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				EMIT(PPC_RAW_MR(dst_reg_h, tmp_reg));
 				break;
 			}
+			if (BPF_CLASS(code) == BPF_ALU64 && imm != 64)
+				EMIT(PPC_RAW_LI(dst_reg_h, 0));
 			break;
 		case BPF_ALU | BPF_END | BPF_FROM_BE:
 			switch (imm) {
@@ -918,11 +966,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 * BPF_LDX
 		 */
 		case BPF_LDX | BPF_MEM | BPF_B: /* dst = *(u8 *)(ul) (src + off) */
+		case BPF_LDX | BPF_MEMSX | BPF_B:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_B:
+		case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 		case BPF_LDX | BPF_MEM | BPF_H: /* dst = *(u16 *)(ul) (src + off) */
+		case BPF_LDX | BPF_MEMSX | BPF_H:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_H:
+		case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 		case BPF_LDX | BPF_MEM | BPF_W: /* dst = *(u32 *)(ul) (src + off) */
+		case BPF_LDX | BPF_MEMSX | BPF_W:
 		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
+		case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
 		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
 		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
 			/*
@@ -931,7 +985,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
 			 * set dst_reg=0 and move on.
 			 */
-			if (BPF_MODE(code) == BPF_PROBE_MEM) {
+			if (BPF_MODE(code) == BPF_PROBE_MEM || BPF_MODE(code) == BPF_PROBE_MEMSX) {
 				PPC_LI32(_R0, TASK_SIZE - off);
 				EMIT(PPC_RAW_CMPLW(src_reg, _R0));
 				PPC_BCC_SHORT(COND_GT, (ctx->idx + 4) * 4);
@@ -953,30 +1007,48 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				 * as there are two load instructions for dst_reg_h & dst_reg
 				 * respectively.
 				 */
-				if (size == BPF_DW)
+				if (size == BPF_DW ||
+				    (size == BPF_B && BPF_MODE(code) == BPF_PROBE_MEMSX))
 					PPC_JMP((ctx->idx + 3) * 4);
 				else
 					PPC_JMP((ctx->idx + 2) * 4);
 			}
 
-			switch (size) {
-			case BPF_B:
-				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
-				break;
-			case BPF_H:
-				EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
-				break;
-			case BPF_W:
-				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
-				break;
-			case BPF_DW:
-				EMIT(PPC_RAW_LWZ(dst_reg_h, src_reg, off));
-				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off + 4));
-				break;
-			}
+			if (BPF_MODE(code) == BPF_MEMSX || BPF_MODE(code) == BPF_PROBE_MEMSX) {
+				switch (size) {
+				case BPF_B:
+					EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
+					EMIT(PPC_RAW_EXTSB(dst_reg, dst_reg));
+					break;
+				case BPF_H:
+					EMIT(PPC_RAW_LHA(dst_reg, src_reg, off));
+					break;
+				case BPF_W:
+					EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
+					break;
+				}
+				if (!fp->aux->verifier_zext)
+					EMIT(PPC_RAW_SRAWI(dst_reg_h, dst_reg, 31));
 
-			if (size != BPF_DW && !fp->aux->verifier_zext)
-				EMIT(PPC_RAW_LI(dst_reg_h, 0));
+			} else {
+				switch (size) {
+				case BPF_B:
+					EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
+					break;
+				case BPF_H:
+					EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
+					break;
+				case BPF_W:
+					EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
+					break;
+				case BPF_DW:
+					EMIT(PPC_RAW_LWZ(dst_reg_h, src_reg, off));
+					EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off + 4));
+					break;
+				}
+				if (size != BPF_DW && !fp->aux->verifier_zext)
+					EMIT(PPC_RAW_LI(dst_reg_h, 0));
+			}
 
 			if (BPF_MODE(code) == BPF_PROBE_MEM) {
 				int insn_idx = ctx->idx - 1;
@@ -1068,6 +1140,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_JMP | BPF_JA:
 			PPC_JMP(addrs[i + 1 + off]);
 			break;
+		case BPF_JMP32 | BPF_JA:
+			PPC_JMP(addrs[i + 1 + imm]);
+			break;
 
 		case BPF_JMP | BPF_JGT | BPF_K:
 		case BPF_JMP | BPF_JGT | BPF_X:
-- 
2.43.0

