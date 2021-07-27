Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4453D6FC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 08:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYndf3jbzz3bXb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 16:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sHkHClK5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sHkHClK5; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYncm10X7z2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 16:55:51 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id j1so16424133pjv.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 23:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WKkQz5DEp3fMQB/VPRhRivwWVo946O+bpTDHr05TB2E=;
 b=sHkHClK5PRHL1Pwd9boqIRcvL6zHeaz2IiokMFmRSct0p2YTx1MgvjvU9szXcSI1yj
 8Lk9jwKTDBQWQXtliOHGOHZEa9RHaOI2SWywNA0YFBdaIzHQSm4N0bmsDbOIR0bLvryO
 XOBXI5k5voDQnrB7BUok7g2K3EJKbdNgYWdhCQsTHR/GyGVtDkA54vCmwhBH8sz/IZ8+
 hzYLw7fnMd0UaHLObALWkqM0rqfa5Z3LYsVlqlMsXZU5/tLCIt8vTEz/cnxL3NdWupIl
 4ltEmZMkyxf2iN8+C5BEXdiwdLt7FZh5zYFvyEhgrCtLhOOxS1WMdhDAE0iTm8Nut6RT
 wPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WKkQz5DEp3fMQB/VPRhRivwWVo946O+bpTDHr05TB2E=;
 b=UrJsOcMeQO8hkT4S8pdQ9Zx65IBq1T4QBQo8bGvC9933NDkVEQIFyl7B70/qXZY79j
 ZzaxTKjzSwvqswwqk4dbbWTorzOXHublnfvtKcZSZbQPeih07OwjfG7xtf0kK3MwhmJw
 QaHoawQH2XO/zWOVnzqVUMwY/VtPzEuzaSwdMo11ojXtTOvtThkSwdpmHl1BgnbfjA80
 gvL0QtU8g73OGfH6juHdiOccwRLV9/kF2BgJTviISXy0XN+xSy4j0e45CUMFAPf2HxfO
 /qAt/cUL5CKTcMh/NzpgdXwbIQ2SNK096nTkCTgIcgm7wDWY15uK9Gi+oXz3U4MF0gMJ
 Jdug==
X-Gm-Message-State: AOAM530elj2iPX7ErXG0lnBeMZb/Pp3r97jAvW+j0bLoLsmSMx8PuyfO
 Bjlb0F5LmIiKrIsNaINGaq9VKok8Qvo=
X-Google-Smtp-Source: ABdhPJyvHsisZFEtD1zPKD1SbXyJOH/Z19kiRGgUi8UG9C70oxj4kqnhpUrwVNnLdGFDKILGib6IOQ==
X-Received: by 2002:a17:90a:de11:: with SMTP id
 m17mr20338135pjv.5.1627368949589; 
 Mon, 26 Jul 2021 23:55:49 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id f11sm2257891pga.61.2021.07.26.23.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 23:55:49 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/bpf: Use helper for mapping bpf to ppc registers
 on PPC64
Date: Tue, 27 Jul 2021 16:55:38 +1000
Message-Id: <20210727065539.299598-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727065539.299598-1-jniethe5@gmail.com>
References: <20210727065539.299598-1-jniethe5@gmail.com>
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

Prepare for doing commit 40272035e1d0 ("powerpc/bpf: Reallocate BPF
registers to volatile registers when possible on PPC32") on PPC64 in a
later patch. Instead of directly accessing the const b2p[] array for
mapping bpf to ppc registers use bpf_to_ppc() which allows per struct
codegen_context mappings.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/net/bpf_jit.h        |  5 ++
 arch/powerpc/net/bpf_jit64.h      | 30 +++++-----
 arch/powerpc/net/bpf_jit_comp32.c |  5 --
 arch/powerpc/net/bpf_jit_comp64.c | 96 ++++++++++++++++---------------
 4 files changed, 71 insertions(+), 65 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 99fad093f43e..db86fa37f1dd 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -172,6 +172,11 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
 
+static inline int bpf_to_ppc(struct codegen_context *ctx, int reg)
+{
+	return ctx->b2p[reg];
+}
+
 #endif
 
 #endif
diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
index 7b713edfa7e2..89b625d9342b 100644
--- a/arch/powerpc/net/bpf_jit64.h
+++ b/arch/powerpc/net/bpf_jit64.h
@@ -68,23 +68,23 @@ const int b2p[MAX_BPF_JIT_REG + 2] = {
  * WARNING: These can use TMP_REG_2 if the offset is not at word boundary,
  * so ensure that it isn't in use already.
  */
-#define PPC_BPF_LL(r, base, i) do {					      \
-				if ((i) % 4) {				      \
-					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], (i)));\
-					EMIT(PPC_RAW_LDX(r, base,	      \
-							b2p[TMP_REG_2]));     \
-				} else					      \
-					EMIT(PPC_RAW_LD(r, base, i));	      \
+#define PPC_BPF_LL(ctx, r, base, i) do {						  \
+				if ((i) % 4) {						  \
+					EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, TMP_REG_2), (i)));\
+					EMIT(PPC_RAW_LDX(r, base,			  \
+							bpf_to_ppc(ctx, TMP_REG_2)));	  \
+				} else							  \
+					EMIT(PPC_RAW_LD(r, base, i));			  \
 				} while(0)
-#define PPC_BPF_STL(r, base, i) do {					      \
-				if ((i) % 4) {				      \
-					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], (i)));\
-					EMIT(PPC_RAW_STDX(r, base,	      \
-							b2p[TMP_REG_2]));     \
-				} else					      \
-					EMIT(PPC_RAW_STD(r, base, i));	      \
+#define PPC_BPF_STL(ctx, r, base, i) do {						  \
+				if ((i) % 4) {						  \
+					EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, TMP_REG_2), (i)));\
+					EMIT(PPC_RAW_STDX(r, base,			  \
+							bpf_to_ppc(ctx, TMP_REG_2)));	  \
+				} else							  \
+					EMIT(PPC_RAW_STD(r, base, i));			  \
 				} while(0)
-#define PPC_BPF_STLU(r, base, i) do { EMIT(PPC_RAW_STDU(r, base, i)); } while(0)
+#define PPC_BPF_STLU(ctx, r, base, i) do { EMIT(PPC_RAW_STDU(r, base, i)); } while(0)
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 34bb1583fc0c..eaf942075719 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -58,11 +58,6 @@ const int b2p[MAX_BPF_JIT_REG + 1] = {
 	[TMP_REG] = 31,		/* 32 bits */
 };
 
-static int bpf_to_ppc(struct codegen_context *ctx, int reg)
-{
-	return ctx->b2p[reg];
-}
-
 /* PPC NVR range -- update this if we ever use NVRs below r17 */
 #define BPF_PPC_NVR_MIN		17
 #define BPF_PPC_TC		16
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 1dfec85bb03b..f7a668c1e364 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -26,7 +26,7 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 	 * - the bpf program uses its stack area
 	 * The latter condition is deduced from the usage of BPF_REG_FP
 	 */
-	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, b2p[BPF_REG_FP]);
+	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_FP));
 }
 
 /*
@@ -78,9 +78,9 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * invoked through a tail call.
 	 */
 	if (ctx->seen & SEEN_TAILCALL) {
-		EMIT(PPC_RAW_LI(b2p[TMP_REG_1], 0));
+		EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, TMP_REG_1), 0));
 		/* this goes in the redzone */
-		PPC_BPF_STL(b2p[TMP_REG_1], 1, -(BPF_PPC_STACK_SAVE + 8));
+		PPC_BPF_STL(ctx, bpf_to_ppc(ctx, TMP_REG_1), 1, -(BPF_PPC_STACK_SAVE + 8));
 	} else {
 		EMIT(PPC_RAW_NOP());
 		EMIT(PPC_RAW_NOP());
@@ -95,10 +95,10 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		 */
 		if (ctx->seen & SEEN_FUNC) {
 			EMIT(PPC_RAW_MFLR(_R0));
-			PPC_BPF_STL(0, 1, PPC_LR_STKOFF);
+			PPC_BPF_STL(ctx, 0, 1, PPC_LR_STKOFF);
 		}
 
-		PPC_BPF_STLU(1, 1, -(BPF_PPC_STACKFRAME + ctx->stack_size));
+		PPC_BPF_STLU(ctx, 1, 1, -(BPF_PPC_STACKFRAME + ctx->stack_size));
 	}
 
 	/*
@@ -107,13 +107,14 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * in the protected zone below the previous stack frame
 	 */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, b2p[i]))
-			PPC_BPF_STL(b2p[i], 1, bpf_jit_stack_offsetof(ctx, b2p[i]));
+		if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, i)))
+			PPC_BPF_STL(ctx, bpf_to_ppc(ctx, i), 1,
+				    bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ctx, i)));
 
 	/* Setup frame pointer to point to the bpf stack area */
-	if (bpf_is_seen_register(ctx, b2p[BPF_REG_FP]))
-		EMIT(PPC_RAW_ADDI(b2p[BPF_REG_FP], 1,
-				STACK_FRAME_MIN_SIZE + ctx->stack_size));
+	if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_FP)))
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(ctx, BPF_REG_FP), 1,
+				  STACK_FRAME_MIN_SIZE + ctx->stack_size));
 }
 
 static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
@@ -122,14 +123,15 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Restore NVRs */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, b2p[i]))
-			PPC_BPF_LL(b2p[i], 1, bpf_jit_stack_offsetof(ctx, b2p[i]));
+		if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, i)))
+			PPC_BPF_LL(ctx, bpf_to_ppc(ctx, i), 1,
+				   bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ctx, i)));
 
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
 		EMIT(PPC_RAW_ADDI(1, 1, BPF_PPC_STACKFRAME + ctx->stack_size));
 		if (ctx->seen & SEEN_FUNC) {
-			PPC_BPF_LL(0, 1, PPC_LR_STKOFF);
+			PPC_BPF_LL(ctx, 0, 1, PPC_LR_STKOFF);
 			EMIT(PPC_RAW_MTLR(0));
 		}
 	}
@@ -140,7 +142,7 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	/* Move result to r3 */
-	EMIT(PPC_RAW_MR(3, b2p[BPF_REG_0]));
+	EMIT(PPC_RAW_MR(3, bpf_to_ppc(ctx, BPF_REG_0)));
 
 	EMIT(PPC_RAW_BLR());
 }
@@ -150,18 +152,18 @@ static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
 {
 #ifdef PPC64_ELF_ABI_v1
 	/* func points to the function descriptor */
-	PPC_LI64(b2p[TMP_REG_2], func);
+	PPC_LI64(bpf_to_ppc(ctx, TMP_REG_2), func);
 	/* Load actual entry point from function descriptor */
-	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_2], 0);
+	PPC_BPF_LL(ctx, bpf_to_ppc(ctx, TMP_REG_1), bpf_to_ppc(ctx, TMP_REG_2), 0);
 	/* ... and move it to CTR */
-	EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
+	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(ctx, TMP_REG_1)));
 	/*
 	 * Load TOC from function descriptor at offset 8.
 	 * We can clobber r2 since we get called through a
 	 * function pointer (so caller will save/restore r2)
 	 * and since we don't use a TOC ourself.
 	 */
-	PPC_BPF_LL(2, b2p[TMP_REG_2], 8);
+	PPC_BPF_LL(ctx, 2, bpf_to_ppc(ctx, TMP_REG_2), 8);
 #else
 	/* We can clobber r12 */
 	PPC_FUNC_ADDR(12, func);
@@ -197,9 +199,9 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 	 * function pointer (so caller will save/restore r2)
 	 * and since we don't use a TOC ourself.
 	 */
-	PPC_BPF_LL(2, 12, 8);
+	PPC_BPF_LL(ctx, 2, 12, 8);
 	/* Load actual entry point from function descriptor */
-	PPC_BPF_LL(12, 12, 0);
+	PPC_BPF_LL(ctx, 12, 12, 0);
 #endif
 
 	EMIT(PPC_RAW_MTCTR(12));
@@ -214,54 +216,58 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	 * r4/BPF_REG_2 - pointer to bpf_array
 	 * r5/BPF_REG_3 - index in bpf_array
 	 */
-	int b2p_bpf_array = b2p[BPF_REG_2];
-	int b2p_index = b2p[BPF_REG_3];
+	int b2p_bpf_array = bpf_to_ppc(ctx, BPF_REG_2);
+	int b2p_index = bpf_to_ppc(ctx, BPF_REG_3);
 
 	/*
 	 * if (index >= array->map.max_entries)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
+	EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, TMP_REG_1), b2p_bpf_array,
+			 offsetof(struct bpf_array, map.max_entries)));
 	EMIT(PPC_RAW_RLWINM(b2p_index, b2p_index, 0, 0, 31));
-	EMIT(PPC_RAW_CMPLW(b2p_index, b2p[TMP_REG_1]));
+	EMIT(PPC_RAW_CMPLW(b2p_index, bpf_to_ppc(ctx, TMP_REG_1)));
 	PPC_BCC(COND_GE, out);
 
 	/*
 	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
 	 *   goto out;
 	 */
-	PPC_BPF_LL(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx));
-	EMIT(PPC_RAW_CMPLWI(b2p[TMP_REG_1], MAX_TAIL_CALL_CNT));
+	PPC_BPF_LL(ctx, bpf_to_ppc(ctx, TMP_REG_1), 1, bpf_jit_stack_tailcallcnt(ctx));
+	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(ctx, TMP_REG_1), MAX_TAIL_CALL_CNT));
 	PPC_BCC(COND_GT, out);
 
 	/*
 	 * tail_call_cnt++;
 	 */
-	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], 1));
-	PPC_BPF_STL(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx));
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(ctx, TMP_REG_1), bpf_to_ppc(ctx, TMP_REG_1), 1));
+	PPC_BPF_STL(ctx, bpf_to_ppc(ctx, TMP_REG_1), 1, bpf_jit_stack_tailcallcnt(ctx));
 
 	/* prog = array->ptrs[index]; */
-	EMIT(PPC_RAW_MULI(b2p[TMP_REG_1], b2p_index, 8));
-	EMIT(PPC_RAW_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array));
-	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_array, ptrs));
+	EMIT(PPC_RAW_MULI(bpf_to_ppc(ctx, TMP_REG_1), b2p_index, 8));
+	EMIT(PPC_RAW_ADD(bpf_to_ppc(ctx, TMP_REG_1), bpf_to_ppc(ctx, TMP_REG_1), b2p_bpf_array));
+	PPC_BPF_LL(ctx, bpf_to_ppc(ctx, TMP_REG_1), bpf_to_ppc(ctx, TMP_REG_1),
+		   offsetof(struct bpf_array, ptrs));
 
 	/*
 	 * if (prog == NULL)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_CMPLDI(b2p[TMP_REG_1], 0));
+	EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(ctx, TMP_REG_1), 0));
 	PPC_BCC(COND_EQ, out);
 
 	/* goto *(prog->bpf_func + prologue_size); */
-	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_prog, bpf_func));
+	PPC_BPF_LL(ctx, bpf_to_ppc(ctx, TMP_REG_1), bpf_to_ppc(ctx, TMP_REG_1),
+		   offsetof(struct bpf_prog, bpf_func));
 #ifdef PPC64_ELF_ABI_v1
 	/* skip past the function descriptor */
-	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1],
-			FUNCTION_DESCR_SIZE + BPF_TAILCALL_PROLOGUE_SIZE));
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(ctx, TMP_REG_1), bpf_to_ppc(ctx, TMP_REG_1),
+			  FUNCTION_DESCR_SIZE + BPF_TAILCALL_PROLOGUE_SIZE));
 #else
-	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], BPF_TAILCALL_PROLOGUE_SIZE));
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(ctx, TMP_REG_1), bpf_to_ppc(ctx, TMP_REG_1),
+			  BPF_TAILCALL_PROLOGUE_SIZE));
 #endif
-	EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
+	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(ctx, TMP_REG_1)));
 
 	/* tear down stack, restore NVRs, ... */
 	bpf_jit_emit_common_epilogue(image, ctx);
@@ -283,10 +289,10 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 
 	for (i = 0; i < flen; i++) {
 		u32 code = insn[i].code;
-		u32 dst_reg = b2p[insn[i].dst_reg];
-		u32 src_reg = b2p[insn[i].src_reg];
-		u32 tmp1_reg = b2p[TMP_REG_1];
-		u32 tmp2_reg = b2p[TMP_REG_2];
+		u32 dst_reg = bpf_to_ppc(ctx, insn[i].dst_reg);
+		u32 src_reg = bpf_to_ppc(ctx, insn[i].src_reg);
+		u32 tmp1_reg = bpf_to_ppc(ctx, TMP_REG_1);
+		u32 tmp2_reg = bpf_to_ppc(ctx, TMP_REG_2);
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -587,7 +593,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				 * the instructions generated will remain the
 				 * same across all passes
 				 */
-				PPC_BPF_STL(dst_reg, 1, bpf_jit_stack_local(ctx));
+				PPC_BPF_STL(ctx, dst_reg, 1, bpf_jit_stack_local(ctx));
 				EMIT(PPC_RAW_ADDI(tmp1_reg, 1, bpf_jit_stack_local(ctx)));
 				EMIT(PPC_RAW_LDBRX(dst_reg, 0, tmp1_reg));
 				break;
@@ -646,7 +652,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				PPC_LI32(tmp1_reg, imm);
 				src_reg = tmp1_reg;
 			}
-			PPC_BPF_STL(src_reg, dst_reg, off);
+			PPC_BPF_STL(ctx, src_reg, dst_reg, off);
 			break;
 
 		/*
@@ -714,7 +720,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			break;
 		/* dst = *(u64 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_DW:
-			PPC_BPF_LL(dst_reg, src_reg, off);
+			PPC_BPF_LL(ctx, dst_reg, src_reg, off);
 			break;
 
 		/*
@@ -759,7 +765,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			else
 				bpf_jit_emit_func_call_rel(image, ctx, func_addr);
 			/* move return value from r3 to BPF_REG_0 */
-			EMIT(PPC_RAW_MR(b2p[BPF_REG_0], 3));
+			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0), 3));
 			break;
 
 		/*
-- 
2.25.1

