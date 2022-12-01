Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D079A63EAAB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:58:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN7jS5YzMz3bgK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN7hP2TWCz3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:57:09 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NN7hD49LSz9sb0;
	Thu,  1 Dec 2022 08:57:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjg0YCF2gRff; Thu,  1 Dec 2022 08:57:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NN7hD3LP1z9sZm;
	Thu,  1 Dec 2022 08:57:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E6BD8B78F;
	Thu,  1 Dec 2022 08:57:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s1TQuKcu7yMv; Thu,  1 Dec 2022 08:57:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D06018B786;
	Thu,  1 Dec 2022 08:56:59 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2B17uukQ130824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Dec 2022 08:56:57 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2B17uu8O130823;
	Thu, 1 Dec 2022 08:56:56 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v1 05/10] powerpc/bpf/32: BPF prog is never called with more than one arg
Date: Thu,  1 Dec 2022 08:56:30 +0100
Message-Id: <ff9b336d163e4c53c44f2b42166c18f0ad921900.1669881248.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <fa025537f584599c0271fc129c5cf4f57fbe7505.1669881248.git.christophe.leroy@csgroup.eu>
References: <fa025537f584599c0271fc129c5cf4f57fbe7505.1669881248.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669881390; l=1258; s=20211009; h=from:subject:message-id; bh=ZtovIKf+Bs9+YlyJOZZ5XopWCTSLLeOP3s1Uy3d0LfE=; b=D7B8FCrw8H9txBaTo4ZlVMJKLtvYqTkEGDiS/DOKWEVBDop2Z7klOsKfEkxXvNFwbTNvD71cxWtr m2YFo1RWB0EjbtknoQVDqoz7lQ2UISRffDvJ5WtJ77JjYbsJPCoU
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

BPF progs are never called with more than one argument, plus the
tail call count as a second argument when needed.

So, no need to retrieve 9th and 10th argument (5th 64 bits argument)
from the stack in prologue.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit_comp32.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 7f54d37bede6..7c129fe810f5 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -159,12 +159,6 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		if (bpf_is_seen_register(ctx, i))
 			EMIT(PPC_RAW_STW(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
 
-	/* If needed retrieve arguments 9 and 10, ie 5th 64 bits arg.*/
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_5))) {
-		EMIT(PPC_RAW_LWZ(bpf_to_ppc(BPF_REG_5) - 1, _R1, BPF_PPC_STACKFRAME(ctx)) + 8);
-		EMIT(PPC_RAW_LWZ(bpf_to_ppc(BPF_REG_5), _R1, BPF_PPC_STACKFRAME(ctx)) + 12);
-	}
-
 	/* Setup frame pointer to point to the bpf stack area */
 	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP))) {
 		EMIT(PPC_RAW_LI(bpf_to_ppc(BPF_REG_FP) - 1, 0));
-- 
2.38.1

