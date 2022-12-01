Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F383B63EAC0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 09:01:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN7nr5yPfz3fZ9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 19:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN7hy72Wdz3bfZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:57:38 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NN7hM5MFCz9sZb;
	Thu,  1 Dec 2022 08:57:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fi5NXFaCiC1k; Thu,  1 Dec 2022 08:57:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NN7hD4Pqzz9sZm;
	Thu,  1 Dec 2022 08:57:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 82C578B781;
	Thu,  1 Dec 2022 08:57:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7OCGxiDEj4Hh; Thu,  1 Dec 2022 08:57:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBCE08B783;
	Thu,  1 Dec 2022 08:56:59 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2B17uvHa130872
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Dec 2022 08:56:57 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2B17uvZZ130871;
	Thu, 1 Dec 2022 08:56:57 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v1 10/10] powerpc/bpf/32: perform three operands ALU operations
Date: Thu,  1 Dec 2022 08:56:35 +0100
Message-Id: <f3a39308117cddfb98103ccde9acf772e9f2ed36.1669881248.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <fa025537f584599c0271fc129c5cf4f57fbe7505.1669881248.git.christophe.leroy@csgroup.eu>
References: <fa025537f584599c0271fc129c5cf4f57fbe7505.1669881248.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669881391; l=2064; s=20211009; h=from:subject:message-id; bh=x9e4wsb7bwKsXC6S+KcXmVuzQBBX7AhIURwS3dX/rR4=; b=XsN+vrNJB5stqWsxL7BjReZg+9Ci3BiT40M67fhpNUf77tkXWOUxpOfPm8CKFXMi9eyiYb3IVTok HDoMyJP3CSO/U9BCU4ujNUEnj3SkVPGu4o3qJAHEzf2u9z5CzwmD
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

When an ALU instruction is preceded by a MOV instruction
that just moves a source register into the destination register of
the ALU, replace that MOV+ALU instructions by an ALU operation
taking the source of the MOV as second source instead of using its
destination.

Before the change, code could look like the following, with
superfluous separate register move (mr) instructions.

  70:	7f c6 f3 78 	mr      r6,r30
  74:	7f a5 eb 78 	mr      r5,r29
  78:	30 c6 ff f4 	addic   r6,r6,-12
  7c:	7c a5 01 d4 	addme   r5,r5

With this commit, addition instructions take r30 and r29 directly.

  70:	30 de ff f4 	addic   r6,r30,-12
  74:	7c bd 01 d4 	addme   r5,r29

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit_comp32.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index c45db3d280b2..4b8d3634dc04 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -290,6 +290,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 
 	for (i = 0; i < flen; i++) {
 		u32 code = insn[i].code;
+		u32 prevcode = i ? insn[i - 1].code : 0;
 		u32 dst_reg = bpf_to_ppc(insn[i].dst_reg);
 		u32 dst_reg_h = dst_reg - 1;
 		u32 src_reg = bpf_to_ppc(insn[i].src_reg);
@@ -308,6 +309,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 tmp_idx;
 		int j;
 
+		if (i && (BPF_CLASS(code) == BPF_ALU64 || BPF_CLASS(code) == BPF_ALU) &&
+		    (BPF_CLASS(prevcode) == BPF_ALU64 || BPF_CLASS(prevcode) == BPF_ALU) &&
+		    BPF_OP(prevcode) == BPF_MOV && BPF_SRC(prevcode) == BPF_X &&
+		    insn[i - 1].dst_reg == insn[i].dst_reg && insn[i - 1].imm != 1) {
+			src2_reg = bpf_to_ppc(insn[i - 1].src_reg);
+			src2_reg_h = src2_reg - 1;
+			ctx->idx = addrs[i - 1] / 4;
+		}
+
 		/*
 		 * addrs[] maps a BPF bytecode address into a real offset from
 		 * the start of the body code.
-- 
2.38.1

