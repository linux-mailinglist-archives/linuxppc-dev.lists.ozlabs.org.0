Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51A8327A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 11:29:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=zX9YQCKd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGbTB6mx6z3cVW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=zX9YQCKd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGbRP5D7Sz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 21:28:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:To:Subject:From:References:
	In-Reply-To:Message-Id:Sender:Reply-To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BOaABhzYi5OdB2y/VFOWaruGn1nPKBoUwMfC0Diy0bM=; b=zX9YQCKd6OeXtrZrLnrsll+wUn
	r6fmEomGQbKYpBYLH/NDaC1MUkMj/7l+IUUSS7/csdX7kNep50JwlQDoQaeqL/kPVXVR5lXZm6UkK
	POHQuoB1SouE2Ej7IOlvSsDSvv0YB+6JQHyQfuxJIeyx36IWsRwA2bMsAdAClB2Bm+MVn70O+ySt6
	FWLMZCS3eWFJ7w3mahy4OGqf9hXj69vSE0VPGqFAYy2+M/Vw61GJIwVdyLDUDG+ChRFEoIjVr2XjH
	fw4ERAtN2aknl1hCJCvIDp1LXsjKDh+ENS8z/p3ksCtBNHoC1n0Lqs70aJdLqTE08Is72H3NAxe95
	8qJS1ghQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQm6K-00000000FA1-1jG9;
	Fri, 19 Jan 2024 10:27:52 +0000
Message-Id: <0d9c158b1076b2bcaa23bc894e84b9f018619d06.1705654669.git.geoff@infradead.org>
In-Reply-To: <cover.1705654669.git.geoff@infradead.org>
References: <cover.1705654669.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Wed, 27 Dec 2023 17:24:04 +1000
Subject: [PATCH 2/4] powerpc/ps3: lv1 hcall code use symbolic constant for
 LR save offset
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

The LRSAVE constant is required for assembly compiled for both 32-bit
and 64-bit, because the value differs there. PS3 is 64-bit only so
this is a noop, but it is nice to abstract stack frame offsets.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/platforms/ps3/hvcall.S | 128 ++++++++++++++--------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/hvcall.S b/arch/powerpc/platforms/ps3/hvcall.S
index 59ea569debf4..b854675f6113 100644
--- a/arch/powerpc/platforms/ps3/hvcall.S
+++ b/arch/powerpc/platforms/ps3/hvcall.S
@@ -16,12 +16,12 @@
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -38,7 +38,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu    r3, -8(r1);			\
 						\
@@ -49,7 +49,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -57,7 +57,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r3, -8(r1);			\
 	stdu	r4, -16(r1);			\
@@ -71,7 +71,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -79,7 +79,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r3, -8(r1);			\
 	std	r4, -16(r1);			\
@@ -96,7 +96,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -24(r1);			\
 	std	r6, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -104,7 +104,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r3, -8(r1);			\
 	std	r4, -16(r1);			\
@@ -133,7 +133,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -56(r1);			\
 	std	r10, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -141,7 +141,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu    r4, -8(r1);			\
 						\
@@ -152,7 +152,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -160,7 +160,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r4, -8(r1);			\
 	stdu	r5, -16(r1);			\
@@ -174,7 +174,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -182,7 +182,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r4, -8(r1);			\
 	std	r5, -16(r1);			\
@@ -199,7 +199,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -24(r1);			\
 	std	r6, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -207,7 +207,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r4, -8(r1);			\
 	std	r5, -16(r1);			\
@@ -227,7 +227,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -32(r1);			\
 	std	r7, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -235,7 +235,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r4, -8(r1);			\
 	std	r5, -16(r1);			\
@@ -258,7 +258,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -40(r1);			\
 	std	r8, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -266,7 +266,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r4, -8(r1);			\
 	std	r5, -16(r1);			\
@@ -292,7 +292,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -48(r1);			\
 	std	r9, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -300,7 +300,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r4, -8(r1);			\
 	std	r5, -16(r1);			\
@@ -329,7 +329,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -56(r1);			\
 	std	r10, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -337,7 +337,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu	r5, -8(r1);			\
 						\
@@ -348,7 +348,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -356,7 +356,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r5, -8(r1);			\
 	stdu	r6, -16(r1);			\
@@ -370,7 +370,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -378,7 +378,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r5, -8(r1);			\
 	std	r6, -16(r1);			\
@@ -395,7 +395,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -24(r1);			\
 	std	r6, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -403,7 +403,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r5, -8(r1);			\
 	std	r6, -16(r1);			\
@@ -423,7 +423,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -32(r1);			\
 	std	r7, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -431,7 +431,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r5, -8(r1);			\
 	std	r6, -16(r1);			\
@@ -454,7 +454,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -40(r1);			\
 	std	r8, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -462,7 +462,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu	r6, -8(r1);			\
 						\
@@ -473,7 +473,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -481,7 +481,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r6, -8(r1);			\
 	stdu	r7, -16(r1);			\
@@ -495,7 +495,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -503,7 +503,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r6, -8(r1);			\
 	std	r7, -16(r1);			\
@@ -520,7 +520,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -24(r1);			\
 	std	r6, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -528,7 +528,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu    r7, -8(r1);			\
 						\
@@ -539,7 +539,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -547,7 +547,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r7, -8(r1);			\
 	stdu	r8, -16(r1);			\
@@ -561,7 +561,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -569,7 +569,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r7, -8(r1);			\
 	std	r8, -16(r1);			\
@@ -586,7 +586,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -24(r1);			\
 	std	r6, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -594,7 +594,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu    r8, -8(r1);			\
 						\
@@ -605,7 +605,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -613,7 +613,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r8, -8(r1);			\
 	stdu	r9, -16(r1);			\
@@ -627,7 +627,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -635,7 +635,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r8, -8(r1);			\
 	std	r9, -16(r1);			\
@@ -652,7 +652,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -24(r1);			\
 	std	r6, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -660,7 +660,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu    r9, -8(r1);			\
 						\
@@ -671,7 +671,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -679,7 +679,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r9, -8(r1);			\
 	stdu    r10, -16(r1);			\
@@ -693,7 +693,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -16(r1);			\
 	std	r5, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -701,7 +701,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std     r9, -8(r1);			\
 	stdu    r10, -16(r1);			\
@@ -717,7 +717,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r6, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -725,7 +725,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	stdu    r10, -8(r1);			\
 						\
@@ -736,7 +736,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, -8(r1);			\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -744,7 +744,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	std	r10, STK_PARAM_AREA+8*7(r1);	\
 						\
@@ -764,7 +764,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, STK_PARAM_AREA+8*12(r1);	\
 	std	r9, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
@@ -772,7 +772,7 @@ _GLOBAL(_##API_NAME)				\
 _GLOBAL(_##API_NAME)				\
 						\
 	mflr	r0;				\
-	std	r0, 16(r1);			\
+	std	r0, LRSAVE(r1);			\
 						\
 	li      r11, API_NUMBER;		\
 	lv1call;				\
@@ -780,7 +780,7 @@ _GLOBAL(_##API_NAME)				\
 	ld	r11, STK_PARAM_AREA+8*8(r1);	\
 	std	r4, 0(r11);			\
 						\
-	ld	r0, 16(r1);			\
+	ld	r0, LRSAVE(r1);			\
 	mtlr	r0;				\
 	blr
 
-- 
2.34.1


