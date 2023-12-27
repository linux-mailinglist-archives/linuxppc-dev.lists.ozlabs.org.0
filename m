Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3281ECF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 08:26:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eHOL1bPg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0NVh2plJz30fn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 18:26:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eHOL1bPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0NS45YH3z2xcq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 18:24:20 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3881818a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 23:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703661858; x=1704266658; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHmHOpFodr0fwFEMVqx8wmGIgl4KNpNNeR2euZSXqf4=;
        b=eHOL1bPg7qOp8WLlk8FHU316zBWuzAx6SJoxpGwfQNlkDQ2Xg6HEe/syVeD/LXiVL7
         V/GrAJ1v5NY5SOAi3esnyT9L4Zlbd9KsQKHN+gBRJqfs6O6dwgRxmUlJ/ZALwxSxsNkf
         FDaiZn3rOQVQgfoVsfZ5x7XvCW1OGGFnIngiQpzgvr33Tk2MfGO38NCvqpSwg+YjUph8
         13xdYMCDTmKh3f+n4LZj0uOfjlyn08uHAHq9XkF8RswXvpHN38VLhJ31uSA1QgwZvXmF
         WKcc7CVN3QCSy2wlKZ3PXbnwsmx7R5DvTYY6kGJzz9DwAfy3GQB2s8QnFSNyIam/8GXS
         f+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703661858; x=1704266658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHmHOpFodr0fwFEMVqx8wmGIgl4KNpNNeR2euZSXqf4=;
        b=GNNIDbRaLIx6BGZP77l4YemrV7N/IzKzsC0XTx63lTy9WM9zZlQ0yBynXIsa4zBLpG
         E9INZQ0lYkeDfmuJCJn3YXUFR8t64c3j8B5YO3FsbYZ8RlZKygc0kT2hIWz9rHpXu/7J
         yDVgA6AXJ6jkz20zhhtIEUURit0rsAZRd/dD2cQ4+iqNHPrWTcBzFA5NtL8UreQ5HYWd
         wwcBVnOdr5e2/5zDKlLbT9ssA41aVfQMuPs3MiHhtHZl8/Twlme4S8pM9zAgioBFyqUN
         Tw1/+0cLDJYZ78/c1fESIo40+sPZKF7+QxJrLD+cdwcv0n2afMOWdYYyiStBlJcLg3tK
         raTg==
X-Gm-Message-State: AOJu0Yxo9HeMxe8fhJ0rukblXRFFtgUZmvjqsm7MvowrWHBxgWPZASSW
	QZhp2+QrQqSx/4P3pom7IaPzHmNfG+w=
X-Google-Smtp-Source: AGHT+IFy0d8qGJoJsTIqsGQCLUM2rdKQ8E15BCd5v8+zxB0SPXyNZLeUZzhvxOysIoJyIqTbkHlKNw==
X-Received: by 2002:a05:6a20:914f:b0:18b:92b3:7c80 with SMTP id x15-20020a056a20914f00b0018b92b37c80mr11612215pzc.22.1703661857835;
        Tue, 26 Dec 2023 23:24:17 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id px9-20020a17090b270900b0028c952fd855sm261074pjb.52.2023.12.26.23.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 23:24:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/ps3: lv1 hcall code use symbolic constant for LR save offset
Date: Wed, 27 Dec 2023 17:24:04 +1000
Message-ID: <20231227072405.63751-3-npiggin@gmail.com>
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

The LRSAVE constant is required for assembly compiled for both 32-bit
and 64-bit, because the value differs there. PS3 is 64-bit only so
this is a noop, but it is nice to abstract stack frame offsets.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
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
2.42.0

