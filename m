Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BE686372
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:09:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6HhG6n21z3fmn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:09:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6Hbr5LgVz3f5S
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 21:05:28 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4P6HbQ2ZYXz9sgg;
	Wed,  1 Feb 2023 11:05:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5m__HYuD5NIn; Wed,  1 Feb 2023 11:05:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4P6HbJ6gk5z9sgl;
	Wed,  1 Feb 2023 11:05:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CB85D8B778;
	Wed,  1 Feb 2023 11:05:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OspMit-H_ptD; Wed,  1 Feb 2023 11:05:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 388A58B776;
	Wed,  1 Feb 2023 11:05:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 311A4qJG3908578
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 11:04:52 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 311A4qcM3908577;
	Wed, 1 Feb 2023 11:04:52 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v2 4/9] powerpc/bpf/32: BPF prog is never called with more than one arg
Date: Wed,  1 Feb 2023 11:04:26 +0100
Message-Id: <89a200fb45048601475c092c5775294dee3886de.1675245773.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <4fd69ef7945518c3e27f96b95046a5c1468d35bf.1675245773.git.christophe.leroy@csgroup.eu>
References: <4fd69ef7945518c3e27f96b95046a5c1468d35bf.1675245773.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675245868; l=1258; s=20211009; h=from:subject:message-id; bh=T+mfwIuIvKUyKceW/3BtwxWlU5bDITOeY/saRNrXVhg=; b=MLH9faCY59Xk6hw6VCHZMw4YxGkdS967/ySIcSUvxRv73rgO5x6D/4sVlzXF5QklMS8Xs3Mauyu7 aVj9N4mpCSCWp9SfUb6rFBZmylh0BgNj1oFPqtInOLIiF+ypPlTL
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
2.39.1

