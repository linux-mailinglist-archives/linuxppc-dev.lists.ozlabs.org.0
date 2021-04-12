Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC335C58C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJn4S56vwz3cbx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 21:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJn373ZJyz30Gj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 21:44:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJn2Q0gGYz9tyR4;
 Mon, 12 Apr 2021 13:44:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8X7oulgFcNTh; Mon, 12 Apr 2021 13:44:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJn2P6xdzz9tyQT;
 Mon, 12 Apr 2021 13:44:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F32198B78E;
 Mon, 12 Apr 2021 13:44:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2ATv1BrskHTA; Mon, 12 Apr 2021 13:44:18 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 727708B78D;
 Mon, 12 Apr 2021 13:44:18 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3FF8E67A06; Mon, 12 Apr 2021 11:44:18 +0000 (UTC)
Message-Id: <74944a1e3e5cfecc141e440a6ccd37920e186b70.1618227846.git.christophe.leroy@csgroup.eu>
In-Reply-To: <34d12a4f75cb8b53a925fada5e7ddddd3b145203.1618227846.git.christophe.leroy@csgroup.eu>
References: <34d12a4f75cb8b53a925fada5e7ddddd3b145203.1618227846.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/3] powerpc/ebpf32: Use standard function call for functions
 within 32M distance
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@chromium.org, naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com
Date: Mon, 12 Apr 2021 11:44:18 +0000 (UTC)
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

If the target of a function call is within 32 Mbytes distance, use a
standard function call with 'bl' of the 'lis/ori/mtlr/blrl' sequence.

In the first pass, no memory has been allocated yet and the code
position is not known yet (image pointer is NULL). This pass is there
to calculate the amount of memory to allocate for the EBPF code, so
assume the 4 instructions sequence is required, so that enough memory
is allocated.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/net/bpf_jit.h            |  3 +++
 arch/powerpc/net/bpf_jit_comp32.c     | 16 +++++++++++-----
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 5b60020dc1f4..ac41776661e9 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -265,6 +265,7 @@
 #define PPC_INST_ORI			0x60000000
 #define PPC_INST_ORIS			0x64000000
 #define PPC_INST_BRANCH			0x48000000
+#define PPC_INST_BL			0x48000001
 #define PPC_INST_BRANCH_COND		0x40800000
 
 /* Prefixes */
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 776abef4d2a0..99fad093f43e 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -26,6 +26,9 @@
 /* Long jump; (unconditional 'branch') */
 #define PPC_JMP(dest)		EMIT(PPC_INST_BRANCH |			      \
 				     (((dest) - (ctx->idx * 4)) & 0x03fffffc))
+/* blr; (unconditional 'branch' with link) to absolute address */
+#define PPC_BL_ABS(dest)	EMIT(PPC_INST_BL |			      \
+				     (((dest) - (unsigned long)(image + ctx->idx)) & 0x03fffffc))
 /* "cond" here covers BO:BI fields. */
 #define PPC_BCC_SHORT(cond, dest)	EMIT(PPC_INST_BRANCH_COND |	      \
 					     (((cond) & 0x3ff) << 16) |	      \
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index ef21b09df76e..bbb16099e8c7 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -187,11 +187,17 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 
 void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func)
 {
-	/* Load function address into r0 */
-	EMIT(PPC_RAW_LIS(__REG_R0, IMM_H(func)));
-	EMIT(PPC_RAW_ORI(__REG_R0, __REG_R0, IMM_L(func)));
-	EMIT(PPC_RAW_MTLR(__REG_R0));
-	EMIT(PPC_RAW_BLRL());
+	s32 rel = (s32)func - (s32)(image + ctx->idx);
+
+	if (image && rel < 0x2000000 && rel >= -0x2000000) {
+		PPC_BL_ABS(func);
+	} else {
+		/* Load function address into r0 */
+		EMIT(PPC_RAW_LIS(__REG_R0, IMM_H(func)));
+		EMIT(PPC_RAW_ORI(__REG_R0, __REG_R0, IMM_L(func)));
+		EMIT(PPC_RAW_MTLR(__REG_R0));
+		EMIT(PPC_RAW_BLRL());
+	}
 }
 
 static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
-- 
2.25.0

