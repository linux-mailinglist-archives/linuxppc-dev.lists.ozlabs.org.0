Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F9637434
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 09:40:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHrzd0DzVz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 19:40:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHrz55Mj8z3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 19:40:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NHrz12mK7z9shv;
	Thu, 24 Nov 2022 09:39:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WchORCaqqNge; Thu, 24 Nov 2022 09:39:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NHrz06t34z9shP;
	Thu, 24 Nov 2022 09:39:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DAA968B78B;
	Thu, 24 Nov 2022 09:39:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JFZpC7am0SjR; Thu, 24 Nov 2022 09:39:56 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD7C18B763;
	Thu, 24 Nov 2022 09:39:56 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2AO8dkua3221470
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 09:39:46 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2AO8dk7h3221465;
	Thu, 24 Nov 2022 09:39:46 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH] powerpc/bpf: Only update ldimm64 during extra pass when it is an address
Date: Thu, 24 Nov 2022 09:39:38 +0100
Message-Id: <3f6d302a2068d9e357efda2d92c8da99a0f2d0b2.1669278892.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669279174; l=3014; s=20211009; h=from:subject:message-id; bh=+S4KRYqAQ4K62MmHbsCFH4Gyg8GYGcPtfQe/xrukDhE=; b=SGsPF4zlrdXAmx5hZ6L/Mj0KXGgVVQwCQjS+/l1Of/4GO4YL2yDuj2UEB7tQ5hY1YKDXQyhkL9Rz Gx7wHOzjBWFwMfVZbSfDzE0dk1L1fzDXltaKp/0QcuJ/i/BpuLDw
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, Song Liu <song@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ldimm64 is not only used for loading function addresses, and
the NOPs added for padding are impacting performance, so avoid
them when not necessary.

On QEMU mac99, with the patch:

test_bpf: #829 ALU64_MOV_K: all immediate value magnitudes jited:1 167436810 PASS
test_bpf: #831 ALU64_OR_K: all immediate value magnitudes jited:1 170702940 PASS

Without the patch:

test_bpf: #829 ALU64_MOV_K: all immediate value magnitudes jited:1 173012360 PASS
test_bpf: #831 ALU64_OR_K: all immediate value magnitudes jited:1 176424090 PASS

That's a 3.5% performance improvement.

Fixes: f9320c49993c ("powerpc/bpf: Update ldimm64 instructions during extra pass")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit_comp.c   | 3 ++-
 arch/powerpc/net/bpf_jit_comp32.c | 5 +++--
 arch/powerpc/net/bpf_jit_comp64.c | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 43e634126514..206b698723a3 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -68,7 +68,8 @@ static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
 			 * of the JITed sequence remains unchanged.
 			 */
 			ctx->idx = tmp_idx;
-		} else if (insn[i].code == (BPF_LD | BPF_IMM | BPF_DW)) {
+		} else if (insn[i].code == (BPF_LD | BPF_IMM | BPF_DW) &&
+			   insn[i].src_reg == BPF_PSEUDO_FUNC) {
 			tmp_idx = ctx->idx;
 			ctx->idx = addrs[i] / 4;
 #ifdef CONFIG_PPC32
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index a379b0ce19ff..878f8a88d83e 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -960,8 +960,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			PPC_LI32(dst_reg_h, (u32)insn[i + 1].imm);
 			PPC_LI32(dst_reg, (u32)insn[i].imm);
 			/* padding to allow full 4 instructions for later patching */
-			for (j = ctx->idx - tmp_idx; j < 4; j++)
-				EMIT(PPC_RAW_NOP());
+			if (insn[i].src_reg == BPF_PSEUDO_FUNC)
+				for (j = ctx->idx - tmp_idx; j < 4; j++)
+					EMIT(PPC_RAW_NOP());
 			/* Adjust for two bpf instructions */
 			addrs[++i] = ctx->idx * 4;
 			break;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 29ee306d6302..af8bdb5553cd 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -938,8 +938,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			tmp_idx = ctx->idx;
 			PPC_LI64(dst_reg, imm64);
 			/* padding to allow full 5 instructions for later patching */
-			for (j = ctx->idx - tmp_idx; j < 5; j++)
-				EMIT(PPC_RAW_NOP());
+			if (insn[i].src_reg == BPF_PSEUDO_FUNC)
+				for (j = ctx->idx - tmp_idx; j < 5; j++)
+					EMIT(PPC_RAW_NOP());
 			/* Adjust for two bpf instructions */
 			addrs[++i] = ctx->idx * 4;
 			break;
-- 
2.38.1

