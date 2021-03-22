Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CB2344BCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 17:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F40Yx71JQz3byd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:38:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F40Xw3dh7z301W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:37:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F40Xl3QDHz9txkQ;
 Mon, 22 Mar 2021 17:37:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DydMdxa-iIWM; Mon, 22 Mar 2021 17:37:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F40Xl2b0Gz9txkL;
 Mon, 22 Mar 2021 17:37:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D8CF8B7A3;
 Mon, 22 Mar 2021 17:37:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0U9w0ynyvXqF; Mon, 22 Mar 2021 17:37:48 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A67708B79C;
 Mon, 22 Mar 2021 17:37:48 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8A7AC675F4; Mon, 22 Mar 2021 16:37:48 +0000 (UTC)
Message-Id: <28e8d5a75e64807d7e9d39a4b52658755e259f8c.1616430991.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616430991.git.christophe.leroy@csgroup.eu>
References: <cover.1616430991.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/8] powerpc/bpf: Move common helpers into bpf_jit.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@chromium.org, naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com
Date: Mon, 22 Mar 2021 16:37:48 +0000 (UTC)
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

Move functions bpf_flush_icache(), bpf_is_seen_register() and
bpf_set_seen_register() in order to reuse them in future
bpf_jit_comp32.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit.h        | 35 +++++++++++++++++++++++++++++++
 arch/powerpc/net/bpf_jit64.h      | 19 -----------------
 arch/powerpc/net/bpf_jit_comp64.c | 16 --------------
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index d0a67a1bbaf1..b8fa6908fc5e 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -108,6 +108,41 @@ static inline bool is_nearbranch(int offset)
 #define COND_LT		(CR0_LT | COND_CMP_TRUE)
 #define COND_LE		(CR0_GT | COND_CMP_FALSE)
 
+#define SEEN_FUNC	0x1000 /* might call external helpers */
+#define SEEN_STACK	0x2000 /* uses BPF stack */
+#define SEEN_TAILCALL	0x4000 /* uses tail calls */
+
+struct codegen_context {
+	/*
+	 * This is used to track register usage as well
+	 * as calls to external helpers.
+	 * - register usage is tracked with corresponding
+	 *   bits (r3-r10 and r27-r31)
+	 * - rest of the bits can be used to track other
+	 *   things -- for now, we use bits 16 to 23
+	 *   encoded in SEEN_* macros above
+	 */
+	unsigned int seen;
+	unsigned int idx;
+	unsigned int stack_size;
+};
+
+static inline void bpf_flush_icache(void *start, void *end)
+{
+	smp_wmb();	/* smp write barrier */
+	flush_icache_range((unsigned long)start, (unsigned long)end);
+}
+
+static inline bool bpf_is_seen_register(struct codegen_context *ctx, int i)
+{
+	return ctx->seen & (1 << (31 - i));
+}
+
+static inline void bpf_set_seen_register(struct codegen_context *ctx, int i)
+{
+	ctx->seen |= 1 << (31 - i);
+}
+
 #endif
 
 #endif
diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
index 2e33c6673ff9..b05f2e67bba1 100644
--- a/arch/powerpc/net/bpf_jit64.h
+++ b/arch/powerpc/net/bpf_jit64.h
@@ -86,25 +86,6 @@ static const int b2p[] = {
 				} while(0)
 #define PPC_BPF_STLU(r, base, i) do { EMIT(PPC_RAW_STDU(r, base, i)); } while(0)
 
-#define SEEN_FUNC	0x1000 /* might call external helpers */
-#define SEEN_STACK	0x2000 /* uses BPF stack */
-#define SEEN_TAILCALL	0x4000 /* uses tail calls */
-
-struct codegen_context {
-	/*
-	 * This is used to track register usage as well
-	 * as calls to external helpers.
-	 * - register usage is tracked with corresponding
-	 *   bits (r3-r10 and r27-r31)
-	 * - rest of the bits can be used to track other
-	 *   things -- for now, we use bits 16 to 23
-	 *   encoded in SEEN_* macros above
-	 */
-	unsigned int seen;
-	unsigned int idx;
-	unsigned int stack_size;
-};
-
 #endif /* !__ASSEMBLY__ */
 
 #endif
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 51b3f440288c..111451bc5cc0 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -23,22 +23,6 @@ static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
 	memset32(area, BREAKPOINT_INSTRUCTION, size/4);
 }
 
-static inline void bpf_flush_icache(void *start, void *end)
-{
-	smp_wmb();
-	flush_icache_range((unsigned long)start, (unsigned long)end);
-}
-
-static inline bool bpf_is_seen_register(struct codegen_context *ctx, int i)
-{
-	return ctx->seen & (1 << (31 - i));
-}
-
-static inline void bpf_set_seen_register(struct codegen_context *ctx, int i)
-{
-	ctx->seen |= 1 << (31 - i);
-}
-
 static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 {
 	/*
-- 
2.25.0

