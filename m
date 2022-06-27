Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3463055BA3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:05:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqHm15zlz3f5P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:05:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qLaHXbpi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDy4J1pz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qLaHXbpi;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDy0m47z4xYV;
	Tue, 28 Jun 2022 00:02:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338578;
	bh=Vqn8927mPRpqfzQlzkOpeg+4T+3RnGNNMZYmo+YXB8U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qLaHXbpifyJAk04oHdkmDqdzGmH0A3NGLLjLcwYVXmoC5mj/hR+1g4p/oYGTLf9xF
	 M0NJqLk/RhtLx+Ps6s4c2z0xuAjJGY3g2YB7/PccSAC5WC1iuli0cuRdIo9aG1lUn8
	 iP+S+QGEkomxaT6djtowDLWM6pvUdatSYnO86OsMf826JHQMkL/suhojau/QbZ7GEW
	 um4dg7yxIMyBkDm3UQa1DlLUvkTpqp4zxEHRX1A4Zrxbu6JMaQSnqqHAgVI/g681TY
	 kA7k/lE3JwTB+LsLpibsDom79ZV37Mx+xaw3EWxOMWe/tjKf1v+nEBMGNIu6C1TxfS
	 idNevn6MkYiMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 06/13] selftests/powerpc: Add 32-bit support to asm helpers
Date: Tue, 28 Jun 2022 00:02:32 +1000
Message-Id: <20220627140239.2464900-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for 32-bit builds to the asm helpers.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/include/basic_asm.h     | 47 +++++++++++++++----
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/basic_asm.h b/tools/testing/selftests/powerpc/include/basic_asm.h
index be380aa779f8..2d7f6e592dd9 100644
--- a/tools/testing/selftests/powerpc/include/basic_asm.h
+++ b/tools/testing/selftests/powerpc/include/basic_asm.h
@@ -5,6 +5,16 @@
 #include <ppc-asm.h>
 #include <asm/unistd.h>
 
+#ifdef __powerpc64__
+#define PPC_LL		ld
+#define PPC_STL		std
+#define PPC_STLU	stdu
+#else
+#define PPC_LL		lwz
+#define PPC_STL		stw
+#define PPC_STLU	stwu
+#endif
+
 #define LOAD_REG_IMMEDIATE(reg, expr) \
 	lis	reg, (expr)@highest;	\
 	ori	reg, reg, (expr)@higher;	\
@@ -14,16 +24,20 @@
 
 /*
  * Note: These macros assume that variables being stored on the stack are
- * doublewords, while this is usually the case it may not always be the
+ * sizeof(long), while this is usually the case it may not always be the
  * case for each use case.
  */
+#ifdef  __powerpc64__
+
+// ABIv2
 #if defined(_CALL_ELF) && _CALL_ELF == 2
 #define STACK_FRAME_MIN_SIZE 32
 #define STACK_FRAME_TOC_POS  24
 #define __STACK_FRAME_PARAM(_param)  (32 + ((_param)*8))
 #define __STACK_FRAME_LOCAL(_num_params, _var_num)  \
 	((STACK_FRAME_PARAM(_num_params)) + ((_var_num)*8))
-#else
+
+#else // ABIv1 below
 #define STACK_FRAME_MIN_SIZE 112
 #define STACK_FRAME_TOC_POS  40
 #define __STACK_FRAME_PARAM(i)  (48 + ((i)*8))
@@ -34,7 +48,24 @@
  */
 #define __STACK_FRAME_LOCAL(_num_params, _var_num)  \
 	(112 + ((_var_num)*8))
-#endif
+
+
+#endif // ABIv2
+
+// Common 64-bit
+#define STACK_FRAME_LR_POS   16
+#define STACK_FRAME_CR_POS   8
+
+#else // 32-bit below
+
+#define STACK_FRAME_MIN_SIZE 16
+#define STACK_FRAME_LR_POS   4
+
+#define __STACK_FRAME_PARAM(_param)  (STACK_FRAME_MIN_SIZE + ((_param)*4))
+#define __STACK_FRAME_LOCAL(_num_params, _var_num)  \
+	((STACK_FRAME_PARAM(_num_params)) + ((_var_num)*4))
+
+#endif // __powerpc64__
 
 /* Parameter x saved to the stack */
 #define STACK_FRAME_PARAM(var)    __STACK_FRAME_PARAM(var)
@@ -42,8 +73,6 @@
 /* Local variable x saved to the stack after x parameters */
 #define STACK_FRAME_LOCAL(num_params, var)    \
 	__STACK_FRAME_LOCAL(num_params, var)
-#define STACK_FRAME_LR_POS   16
-#define STACK_FRAME_CR_POS   8
 
 /*
  * It is very important to note here that _extra is the extra amount of
@@ -56,13 +85,13 @@
  * preprocessed incorrectly, hence r0.
  */
 #define PUSH_BASIC_STACK(_extra) \
-	mflr	r0; \
-	std	r0, STACK_FRAME_LR_POS(%r1); \
-	stdu	%r1, -(((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE)(%r1);
+	mflr	 r0; \
+	PPC_STL	 r0, STACK_FRAME_LR_POS(%r1); \
+	PPC_STLU %r1, -(((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE)(%r1);
 
 #define POP_BASIC_STACK(_extra) \
 	addi	%r1, %r1, (((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE); \
-	ld	r0, STACK_FRAME_LR_POS(%r1); \
+	PPC_LL	r0, STACK_FRAME_LR_POS(%r1); \
 	mtlr	r0;
 
 #endif /* _SELFTESTS_POWERPC_BASIC_ASM_H */
-- 
2.35.3

