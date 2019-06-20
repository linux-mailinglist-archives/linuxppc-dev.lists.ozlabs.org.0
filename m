Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E01C4C77F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:30:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsPK5dn6zDr4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:29:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZT2Vcxm4"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmK0XtzzDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:16 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id s21so907099pga.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5lVX1opTeM3nBrg/yGjI3fyHHCrRIzFvmYXeIITzf8=;
 b=ZT2Vcxm4LoZ+fKRZT4zRqPBdwhu5/Vf8RpClt9LfKkfE9RSpdANSkZu3gC4or3Z0wI
 wWNPcud8dRroLWNepEAwnpuC93NpDRcewkDk7b+oBl5luc4n5W2Tmki5V4/qfB+fT/75
 BZRxNdIBr8SN1Wt+/JUKcRc4FPj7GHtK75YPq3GRCN08hSJDs87INeZ0zikPfefmI2Xt
 kHN+qJjXRdhpnTAro0lfWxuUgRp4Td5oXbZW5i2jbTxK6CvcU3iLRXZ6owMtrIQB8ihq
 T4fw0yERlXkszF40K2biHA5QV3gzRvtydraNUi4PDVEjt2VdPc/Gd0zksyA4RonGy5G4
 rhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J5lVX1opTeM3nBrg/yGjI3fyHHCrRIzFvmYXeIITzf8=;
 b=bIKGSblZnrkTwCPfuuqUx6pckRz7qbe4idhNkVGEEbHDLDl/58sF3FCHibIOHNLxPl
 8UlJmvX9QY7uWFafbWZqmENzkHBGIufTDqLz4sE2SpvNHjjcdp5ZPMvxeKBcnUZzHcB7
 Qk1hQWC2WcWBrl4LoVpImJq7WOEwwYYZsiVWb6ubFF1JfIDR09DqYxwYFRWiIoWJz/Jf
 x6PDjEf9NZrCDi9TMncH4UV8eskLtA0DdEJRdj3+Wbq5LDlXD8J3DZip1JgKUYS2AL3H
 hwsBgR0ZIdKwYy6IIv7yj5SZX33UCZIJf8+20gRBsceP0kr2vrIOlFTYlhuMszXLBZmT
 yqHA==
X-Gm-Message-State: APjAAAVnwwvFs4GXuYoA1ZiFiJhlFoAxZDPwhxRbvv4a7p1qfI8K6GCY
 l3dBKn1U16Fzl1yzP85p1LE6x0lj
X-Google-Smtp-Source: APXvYqzy+LyK8hX/tJFKvGd28zgsVJycTcSh7t6gkeXnL0/vRR8rp5x5RCRj3RozFy3iaY9DjuLp7A==
X-Received: by 2002:a63:31d1:: with SMTP id x200mr5946757pgx.312.1561007774713; 
 Wed, 19 Jun 2019 22:16:14 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 35/52] powerpc/64s/exception: shuffle windup code around
Date: Thu, 20 Jun 2019 15:14:42 +1000
Message-Id: <20190620051459.29573-36-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Restore all SPRs and CR up-front, these are longer latency
instructions. Move register restore around to maximise pairs of
adjacent loads (e.g., restore r0 next to r1).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 40 +++++++++++-----------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3476cffa21b8..cce75adf2095 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -922,13 +922,11 @@ EXC_COMMON_BEGIN(system_reset_common)
 	mtxer	r9
 	ld	r9,_LINK(r1)
 	mtlr	r9
-	REST_GPR(0, r1)
+	ld	r9,_CCR(r1)
+	mtcr	r9
 	REST_8GPRS(2, r1)
-	REST_GPR(10, r1)
-	ld	r11,_CCR(r1)
-	mtcr	r11
-	REST_GPR(11, r1)
-	REST_2GPRS(12, r1)
+	REST_4GPRS(10, r1)
+	REST_GPR(0, r1)
 	/* restore original r1. */
 	ld	r1,GPR1(r1)
 	RFI_TO_USER_OR_KERNEL
@@ -1087,13 +1085,11 @@ EXC_COMMON_BEGIN(machine_check_common)
 	mtxer	r9;					\
 	ld	r9,_LINK(r1);				\
 	mtlr	r9;					\
-	REST_GPR(0, r1);				\
+	ld	r9,_CCR(r1);				\
+	mtcr	r9;					\
 	REST_8GPRS(2, r1);				\
-	REST_GPR(10, r1);				\
-	ld	r11,_CCR(r1);				\
-	mtcr	r11;					\
-	REST_GPR(11, r1);				\
-	REST_2GPRS(12, r1);				\
+	REST_4GPRS(10, r1);				\
+	REST_GPR(0, r1);				\
 	/* restore original r1. */			\
 	ld	r1,GPR1(r1)
 
@@ -1790,13 +1786,11 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	mtxer	r9
 	ld	r9,_LINK(r1)
 	mtlr	r9
-	REST_GPR(0, r1)
+	ld	r9,_CCR(r1)
+	mtcr	r9
 	REST_8GPRS(2, r1)
-	REST_GPR(10, r1)
-	ld	r11,_CCR(r1)
-	REST_2GPRS(12, r1)
-	mtcr	r11
-	REST_GPR(11, r1)
+	REST_4GPRS(10, r1)
+	REST_GPR(0, r1)
 	ld	r1,GPR1(r1)
 	HRFI_TO_USER_OR_KERNEL
 
@@ -1811,13 +1805,11 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	mtxer	r9
 	ld	r9,_LINK(r1)
 	mtlr	r9
-	REST_GPR(0, r1)
+	ld	r9,_CCR(r1)
+	mtcr	r9
 	REST_8GPRS(2, r1)
-	REST_GPR(10, r1)
-	ld	r11,_CCR(r1)
-	REST_2GPRS(12, r1)
-	mtcr	r11
-	REST_GPR(11, r1)
+	REST_4GPRS(10, r1)
+	REST_GPR(0, r1)
 	ld	r1,GPR1(r1)
 
 	/*
-- 
2.20.1

