Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A08281ECF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 08:27:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S9vW7t9v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0NWZ5vvRz3ccX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 18:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S9vW7t9v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0NS75m5Lz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 18:24:23 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3610675a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 23:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703661861; x=1704266661; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzRC8+hLEix8FcekENIF3VjBMsiAFAQUhA/PaV1ZNMc=;
        b=S9vW7t9vFOCf3klhUG1M9D1zNsHlIer1pLTw8hb31jeEf8FBzu6SmSw6Vh8YYkZzLL
         yArcIrETl1EMaf+lLi4QGk5tS6KmMOKX46R4XHRnP8Di4PtjC3l9m7A9AVPuDS6gV6i2
         Dqe3LjvfB9uPrumFdUZCr/jqoXs/DN4zAvdHDAp/lZUEbenVC2uIFE6tcfDlhPrcpKA9
         0ABeekoIEmEzmo5vA7hRTpkrMFQ211FoASYZbQuNrvLCN6rdaDNfhcETx0hwWoTnxgt2
         6jCgAatuWom3B7uxN3CArVvcb78BcpqF80jmwcou49/hnU7DeQWr0U/FglDTgpkZ9jVG
         TDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703661861; x=1704266661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzRC8+hLEix8FcekENIF3VjBMsiAFAQUhA/PaV1ZNMc=;
        b=CXcqPI5NWL57XJW7CjDMk7ihU2O0EtAA6JoWLJP4iwarkfYqYagZgat/AW3cvNUK9d
         UyLx3mwdHCLP/u/mGAGf/XwK5jVz0RqqlMuOftNkAgJhzbNxcRklqCnGbQDvBLc3WODj
         pavyCP1LQHMliI1aw6rYxCQq2dftFfQ+y2Y57TnEyztNU97g4BMyZkixMvt8HWtATDrS
         GEDwpjTVYothTVT7z0rSs9Cd+4zLjfP9OsShtap6ECTKjOWfR/196DRLe3rEeGDdz5YX
         79JFzI09LZwvDVFm8b406HRcwUNMpKCwUVOjuWiBpXEI5GdXaqQyqZoz7iVRliPghEr0
         ZFLA==
X-Gm-Message-State: AOJu0YxWQWOiA064eMtxARYwRcwss6yu5EY5iOQZMwP4gsHr7jfHh3nz
	CDmcUmp+4dlgk40E4fTvBSTNvkzGGuE=
X-Google-Smtp-Source: AGHT+IGUqVWTH6/bYvYW/AaUW9YMAxaiZc/0o/dJeiSKkvCu96pHsUfLxp5mFDQCaQ+M/IXgW9DQ1w==
X-Received: by 2002:a05:6a21:339f:b0:196:1f58:34c9 with SMTP id yy31-20020a056a21339f00b001961f5834c9mr552100pzb.63.1703661860745;
        Tue, 26 Dec 2023 23:24:20 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id px9-20020a17090b270900b0028c952fd855sm261074pjb.52.2023.12.26.23.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 23:24:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/ps3: Make real stack frames for LV1 hcalls
Date: Wed, 27 Dec 2023 17:24:05 +1000
Message-ID: <20231227072405.63751-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231227072405.63751-1-npiggin@gmail.com>
References: <20231227072405.63751-1-npiggin@gmail.com>
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
Cc: Geoff Levand <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PS3 hcall assembly code makes ad-hoc stack frames that don't have
a back-chain pointer or meet other requirements like minimum frame size.
This probably confuses stack unwinders. Give all hcalls a real stack
frame.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
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
2.42.0

