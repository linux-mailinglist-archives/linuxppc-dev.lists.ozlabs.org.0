Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 355746568D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:27:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8SN0Yvhz3bdr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:27:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M27ak8/3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M27ak8/3;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8RP12RKz2xdx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:23 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id s7so12735881plk.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEvZpc8V4n8LtFetKERiURbNFUbYOYjnBPcEmlFUuhk=;
        b=M27ak8/3zGQ0scrDQnr/Vbd2em8iVhY3uFHUMEScBU+4v8aViY2QSLeedi1weDwLlv
         pxFfA0Yx3Bcn+2drAsRhdVfadu3Egi4CmrbPsDLK+5fJchRO3UZDEeqFAudO7PBHmXfV
         z4HY/h3NzKXgqR4L/B54E94aCc7gauwXQ+JCh78sulBVu5DiiRhWtA2ZGbL7wwYZMt6U
         oVIOzNXWksD02gYuuf/FDUUVj1W1WlXvMaW3BMioTfvZhTSECpt+M1RjJKP2nddANAlX
         OYjk9/yThYw9W5nl2OCRFNwGGbxLDcwn8Ih0wrJrKzUmmfpQmpxtnYo4lj04zS18R8rb
         svHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEvZpc8V4n8LtFetKERiURbNFUbYOYjnBPcEmlFUuhk=;
        b=BVInr0E37fkt+Vwy+JwSxqaCZ14bZ/XIJgvyKkhuNQRA2WBw1l5Lo3Wocn/of4oxEL
         8rlAPDlJ5j2YrFxn5EwIxclkBR0JJCngVPWNRekH9uFF+BQesyAo7cs6ra/+chxOlv8g
         +xGLCqnkt2ov12V/jeV8sq9I28ToxHSNyO+qqivOKa0Yb4zWkaEJGfxNv0MN+aBaDHKK
         +Tp4jGO1nAKtdngsrsrNI0CQ3ozWs/G3bYy5cihEy+iVn9+7uZceG/RZOlSoAimLVob3
         6cYGcsJfjydb/cRwdyHqOeegJwTa0NCyQzPdxgMckI/u5cKqRNFoe12vzaxN9daOzScz
         pjZg==
X-Gm-Message-State: AFqh2kombH4rzPnwgwzybN2Gh5Z5hBRre/1+tnFYJU/RAz/r77XOdCMf
	eJ8QIqGBDO5JlzSxZpGD7Kn8Sw5uV0M=
X-Google-Smtp-Source: AMrXdXtMGgwLE+C1KWu4MF93CnGwrlMzYXiccqMGfyMaviKAic240fjj6DIHlz8o1lY/RzGjZMZ1jQ==
X-Received: by 2002:a17:902:6b4b:b0:189:8790:73b1 with SMTP id g11-20020a1709026b4b00b00189879073b1mr30737894plt.65.1672133181341;
        Tue, 27 Dec 2022 01:26:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/9] crypto: powerpc - Use address generation helper for asm
Date: Tue, 27 Dec 2022 19:26:01 +1000
Message-Id: <20221227092609.2078908-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221227092609.2078908-1-npiggin@gmail.com>
References: <20221227092609.2078908-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

