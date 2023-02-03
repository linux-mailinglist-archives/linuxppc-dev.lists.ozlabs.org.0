Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32A6897E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:40:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Ycy15K2z3f6p
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:40:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JWnRZsCt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JWnRZsCt;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Yb305nPz3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:39:10 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id u9so672108plf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ma0wbLtCFYB5ylQTg157Oylqmn66Hh9pwai7hOvvLGY=;
        b=JWnRZsCtAfLoXF5irEYgp4viFfcf41LM4OJhhAiK/yrpeedNyogFWICLxY1fd3ke4m
         PQh2acM79oy706oVNkHGzVM67t2xnpVMVw/7Ayyj721XAjbLDj4Hk7SgNk6l/yIyM68l
         NsjFTRFVCbQXG7RPyH0wOhl70JYNtoh6e5AjomcNUO9ZboUnTWyxoDPfzXmbk+3fM/Kr
         gIiDln//Nt3F4kTC8eFhzzCdRTOEMc/0MpRtJqIuFr1tnayFYo3oNA1QCIguEggIMaWI
         4H4l0cxJAfcVr1mUFukQcnA72Ju+s6Y34AAL4QfxcUXBIbYCIYJ7wJmbYrk1AfwLBYRt
         VO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ma0wbLtCFYB5ylQTg157Oylqmn66Hh9pwai7hOvvLGY=;
        b=hlPvq4IOu/jkzuE2ULAVn6dc2fjb9GYUH/a6BjBlEaqysmePO7fue8bHp7NF8EX0IG
         4vBGkqQSjcnFGP8qvNdbciO7fGzykOhvzszPRiuidRN7MlLNwBY0bXFqx5N+ewrRqXW3
         6tBWmsL+uYx7f8wDCZjFQnpFLw13TUFd2g8/V4yrSbd1wwtg29mdQ3vEmwgiVdEhKDNp
         /REEIruH7UR6GoiFd37vz61Yp9NYPCKZnP/MIJ2Ir1orumbDiQXDV1StPmXx6QFs8PUo
         KIFFm5F/sTILrkJPDlt2cVOlZls+z2OmsYMZwpQ0xw6uViHfsL6Mt8qQFoKglbEbcE91
         ouHg==
X-Gm-Message-State: AO0yUKW4El3+bU6kIwJHHIgesLpd3L1XsFVvMM4LHk384sRaonpqnYxf
	EHZ5OBmTwvf+PysIsm/G+5ZanJDzNFE=
X-Google-Smtp-Source: AK7set9FIHPe+XWZ6OEkeWhTZRywaA4pQmTFzgxLo4RCZ5ZDHq/y/WEms45m9QBVq4znfTEI+/scfQ==
X-Received: by 2002:a17:90b:1b4b:b0:22c:4d85:1725 with SMTP id nv11-20020a17090b1b4b00b0022c4d851725mr10377813pjb.9.1675424348074;
        Fri, 03 Feb 2023 03:39:08 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a4ce500b0022bf4d0f912sm4792964pjh.22.2023.02.03.03.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:39:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] crypto: powerpc - Use address generation helper for asm
Date: Fri,  3 Feb 2023 21:38:56 +1000
Message-Id: <20230203113858.1152093-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203113858.1152093-1-npiggin@gmail.com>
References: <20230203113858.1152093-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace open-coded toc-relative address calculation with helper macros,
commit dab3b8f4fd09 ("powerpc/64: asm use consistent global variable
declaration and access") made similar conversions already but missed
this one.

This allows data addressing model to be changed more easily.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/crypto/crc32-vpmsum_core.S | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/crypto/crc32-vpmsum_core.S b/arch/powerpc/crypto/crc32-vpmsum_core.S
index a16a717c809c..b0f87f595b26 100644
--- a/arch/powerpc/crypto/crc32-vpmsum_core.S
+++ b/arch/powerpc/crypto/crc32-vpmsum_core.S
@@ -113,9 +113,7 @@ FUNC_START(CRC_FUNCTION_NAME)
 #endif
 
 #ifdef BYTESWAP_DATA
-	addis	r3,r2,.byteswap_constant@toc@ha
-	addi	r3,r3,.byteswap_constant@toc@l
-
+	LOAD_REG_ADDR(r3, .byteswap_constant)
 	lvx	byteswap,0,r3
 	addi	r3,r3,16
 #endif
@@ -150,8 +148,7 @@ FUNC_START(CRC_FUNCTION_NAME)
 	addi	r7,r7,-1
 	mtctr	r7
 
-	addis	r3,r2,.constants@toc@ha
-	addi	r3,r3,.constants@toc@l
+	LOAD_REG_ADDR(r3, .constants)
 
 	/* Find the start of our constants */
 	add	r3,r3,r8
@@ -506,8 +503,7 @@ FUNC_START(CRC_FUNCTION_NAME)
 
 .Lbarrett_reduction:
 	/* Barrett constants */
-	addis	r3,r2,.barrett_constants@toc@ha
-	addi	r3,r3,.barrett_constants@toc@l
+	LOAD_REG_ADDR(r3, .barrett_constants)
 
 	lvx	const1,0,r3
 	lvx	const2,off16,r3
@@ -610,8 +606,7 @@ FUNC_START(CRC_FUNCTION_NAME)
 	cmpdi	r5,0
 	beq	.Lzero
 
-	addis	r3,r2,.short_constants@toc@ha
-	addi	r3,r3,.short_constants@toc@l
+	LOAD_REG_ADDR(r3, .short_constants)
 
 	/* Calculate where in the constant table we need to start */
 	subfic	r6,r5,256
-- 
2.37.2

