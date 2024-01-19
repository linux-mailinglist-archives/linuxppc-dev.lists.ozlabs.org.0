Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A88327B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 11:31:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=VqYGOC4r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGbWv2r8Dz3cJ9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=VqYGOC4r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGbRP5Wk0z3brC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 21:28:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:To:Subject:From:References:
	In-Reply-To:Message-Id:Sender:Reply-To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=11SKhQMEZoDRCKFL2Ja8TpJCJ8wG+h6T3tsb9G83I5E=; b=VqYGOC4rLkXKO+iyz+YZCrsJbB
	JxnDRLnHZ6jZnZVIkfd4ktDFAkY+acsqr3bO49BbIq5hstcKX3e73H3cCqiGR3nRrWxQPaNz+ndU0
	wIxqumfb4rA1aMZwbzaw7KKvJQna6UJvpiCw9fYMqDhz+nCU61PB53lm0sDQDSMBSBwUBtkGZ24uM
	I9OHg+5JOFXKZR9raXe9cHvggdKtqITigDpLOP/wp72/FwkjUZ5vsuiDB3Jr7YobdLtnP/y1fW0hB
	yrvB4fI3NF5VC7chaVe0FEmUyRRfuK71uTVLSDRjKzCUCkD9E1d4Jxr8eHGzzp3UjzoA0AfWdWbKI
	+qO0FeQQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQm6K-00000000FA9-3Cpf;
	Fri, 19 Jan 2024 10:27:53 +0000
Message-Id: <3fb877221f857f81056174fcf52e2f923991ae1f.1705654669.git.geoff@infradead.org>
In-Reply-To: <cover.1705654669.git.geoff@infradead.org>
References: <cover.1705654669.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Wed, 27 Dec 2023 17:24:05 +1000
Subject: [PATCH 3/4] powerpc/ps3: Make real stack frames for LV1 hcalls
To: Michael Ellerman <mpe@ellerman.id.au>,
    Nicholas Piggin <npiggin@gmail.com>,
    linuxppc-dev@lists.ozlabs.org
Date: Fri, 19 Jan 2024 10:27:52 +0000
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

The PS3 hcall assembly code makes ad-hoc stack frames that don't have
a back-chain pointer or meet other requirements like minimum frame size.
This probably confuses stack unwinders. Give all hcalls a real stack
frame.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/platforms/ps3/hvcall.S | 152 +++++++++++++++++-----------
 1 file changed, 94 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/hvcall.S b/arch/powerpc/platforms/ps3/hvcall.S
index b854675f6113..b6454d476962 100644
--- a/arch/powerpc/platforms/ps3/hvcall.S
+++ b/arch/powerpc/platforms/ps3/hvcall.S
@@ -9,6 +9,7 @@
 
 #include <asm/processor.h>
 #include <asm/ppc_asm.h>
+#include <asm/ptrace.h>
 
 #define lv1call .long 0x44000022; extsw r3, r3
 
@@ -18,8 +19,10 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
+	stdu    r1, -STACK_FRAME_MIN_SIZE(r1);	\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE;	\
 						\
 	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
@@ -40,12 +43,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu    r3, -8(r1);			\
+	std	r3, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -60,12 +64,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r3, -8(r1);			\
-	stdu	r4, -16(r1);			\
+	std	r4, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -83,12 +88,13 @@ _GLOBAL(_##API_NAME)				\
 						\
 	std     r3, -8(r1);			\
 	std	r4, -16(r1);			\
-	stdu	r5, -24(r1);			\
+	std	r5, -24(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-24(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 24;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+24; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -112,12 +118,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r6, -32(r1);			\
 	std	r7, -40(r1);			\
 	std	r8, -48(r1);			\
-	stdu	r9, -56(r1);			\
+	std	r9, -56(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-56(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 56;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+56; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -143,12 +150,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu    r4, -8(r1);			\
+	std	r4, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -163,12 +171,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r4, -8(r1);			\
-	stdu	r5, -16(r1);			\
+	std	r5, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -186,12 +195,13 @@ _GLOBAL(_##API_NAME)				\
 						\
 	std     r4, -8(r1);			\
 	std	r5, -16(r1);			\
-	stdu	r6, -24(r1);			\
+	std	r6, -24(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-24(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 24;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+24; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -212,12 +222,13 @@ _GLOBAL(_##API_NAME)				\
 	std     r4, -8(r1);			\
 	std	r5, -16(r1);			\
 	std	r6, -24(r1);			\
-	stdu	r7, -32(r1);			\
+	std	r7, -32(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-32(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 32;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+32; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -241,12 +252,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r5, -16(r1);			\
 	std	r6, -24(r1);			\
 	std	r7, -32(r1);			\
-	stdu	r8, -40(r1);			\
+	std	r8, -40(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-40(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 40;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+40; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -273,12 +285,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r6, -24(r1);			\
 	std	r7, -32(r1);			\
 	std	r8, -40(r1);			\
-	stdu	r9, -48(r1);			\
+	std	r9, -48(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-48(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 48;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+48; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -308,12 +321,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r7, -32(r1);			\
 	std	r8, -40(r1);			\
 	std	r9, -48(r1);			\
-	stdu	r10, -56(r1);			\
+	std	r10, -56(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-56(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 56;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+56; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -339,12 +353,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu	r5, -8(r1);			\
+	std	r5, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -359,12 +374,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r5, -8(r1);			\
-	stdu	r6, -16(r1);			\
+	std	r6, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -382,12 +398,13 @@ _GLOBAL(_##API_NAME)				\
 						\
 	std     r5, -8(r1);			\
 	std	r6, -16(r1);			\
-	stdu	r7, -24(r1);			\
+	std	r7, -24(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-24(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 24;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+24; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -408,12 +425,13 @@ _GLOBAL(_##API_NAME)				\
 	std     r5, -8(r1);			\
 	std	r6, -16(r1);			\
 	std	r7, -24(r1);			\
-	stdu	r8, -32(r1);			\
+	std	r8, -32(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-32(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 32;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+32; 
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -437,12 +455,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r6, -16(r1);			\
 	std	r7, -24(r1);			\
 	std	r8, -32(r1);			\
-	stdu	r9, -40(r1);			\
+	std	r9, -40(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-40(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 40;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+40; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -464,12 +483,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu	r6, -8(r1);			\
+	std	r6, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -484,12 +504,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r6, -8(r1);			\
-	stdu	r7, -16(r1);			\
+	std	r7, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -507,12 +528,13 @@ _GLOBAL(_##API_NAME)				\
 						\
 	std     r6, -8(r1);			\
 	std	r7, -16(r1);			\
-	stdu	r8, -24(r1);			\
+	std	r8, -24(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-24(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 24;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+24; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -530,12 +552,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu    r7, -8(r1);			\
+	std	r7, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -550,12 +573,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r7, -8(r1);			\
-	stdu	r8, -16(r1);			\
+	std	r8, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -573,12 +597,13 @@ _GLOBAL(_##API_NAME)				\
 						\
 	std     r7, -8(r1);			\
 	std	r8, -16(r1);			\
-	stdu	r9, -24(r1);			\
+	std	r9, -24(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-24(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 24;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+24; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -596,12 +621,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu    r8, -8(r1);			\
+	std	r8, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -616,12 +642,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r8, -8(r1);			\
-	stdu	r9, -16(r1);			\
+	std	r9, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -639,12 +666,13 @@ _GLOBAL(_##API_NAME)				\
 						\
 	std     r8, -8(r1);			\
 	std	r9, -16(r1);			\
-	stdu	r10, -24(r1);			\
+	std	r10, -24(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-24(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 24;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+24; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -662,12 +690,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu    r9, -8(r1);			\
+	std	r9, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -682,12 +711,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r9, -8(r1);			\
-	stdu    r10, -16(r1);			\
+	std	r10, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -704,12 +734,13 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std     r9, -8(r1);			\
-	stdu    r10, -16(r1);			\
+	std	r10, -16(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-16(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 16;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+16; \
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 	ld	r11, -16(r1);			\
@@ -727,12 +758,13 @@ _GLOBAL(_##API_NAME)				\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
 						\
-	stdu    r10, -8(r1);			\
+	std	r10, -8(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE-8(r1); \
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	addi	r1, r1, 8;			\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE+8;	\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
@@ -747,10 +779,12 @@ _GLOBAL(_##API_NAME)				\
 	std	r0, LRSAVE(r1);			\
 						\
 	std	r10, STK_PARAM_AREA+8*7(r1);	\
+	stdu    r1, -STACK_FRAME_MIN_SIZE(r1);	\
 						\
 	li	r11, API_NUMBER;		\
 	lv1call;				\
 						\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE;	\
 	ld	r11, STK_PARAM_AREA+8*7(r1);	\
 	std	r4, 0(r11);			\
 	ld	r11, STK_PARAM_AREA+8*8(r1);	\
@@ -773,10 +807,12 @@ _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
 	std	r0, LRSAVE(r1);			\
+	stdu    r1, -STACK_FRAME_MIN_SIZE(r1);	\
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
+	addi	r1, r1, STACK_FRAME_MIN_SIZE;	\
 	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r4, 0(r11);			\
 						\
-- 
2.34.1


