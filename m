Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DC59399
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:45:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zm2J1jKNzDqsw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:45:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lzyUFx0I"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmh5XcbzDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:40 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n2so2055880pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfEIlwXx6F6bO0HpcQvr/mHFWa/zM1x4FOPiJd0WQsQ=;
 b=lzyUFx0IdJ01gqDN9lZJs4GInyonyz7sB1sF9TZeg/MHZSLHV8jE0rgxYhxQQSjFRm
 iFgTbfqNcrdhuG22l02M9zznQV6fe+0EUDs1Hq/0os4Izzu1dKA3NQZYvxeikGLDGTxk
 KXBK9Ix/wwiVVGdP2wQb9uH7y8tRtddA6U3PgBi1zx8dvbX5/AYoFzfyIVOCCTPcwETS
 CLeiI2cXFyvym8gLegrfRLDk9utzCVBb1nyDJfj6HmVkw4dw8i8gJzrlZl/B8c7yZXAq
 VeIsW46HYUel6IgoJhfSvjxhIa7VbJSy28Y4QcnooNb7oMWzTRFja/voLqS54DSy0kFG
 2YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfEIlwXx6F6bO0HpcQvr/mHFWa/zM1x4FOPiJd0WQsQ=;
 b=rCEDAlQpwyW+tPlioHmbjJaZP8bZRzFG9iB06fZqZK3b20XYAyhymfDpnRUx+3JCtl
 FwKu0hHsGGz1GuPQa5JnpDHIXJpR5+RsgnAc4Y4kP6/+BL/Ogc/Aodeg//nSRzDBlhrM
 O7aZvY+Dx7XpL6Up8CuHOyZou8sZUuMgozeVuLUKFEqN5wXIicxSDrgwz/9+tx/mzkmJ
 wJv8n0Ik0e2krnSkb8W44dbsjLtU7gggF0jNjNyecgWtCYnrtcaU0TcuIoNBWq7EfHCJ
 ztSBrJqGrTcXfN0gaPtBVsmZdFeIXxFlZ7NjkFVkx+40xNAgpJYcWE00wWjoaCfLBI4o
 zCgA==
X-Gm-Message-State: APjAAAW1bQl+HNu3eYAtmuDxgQ0URwA/h3bGmjVT+7Z6rZxLHrPt7h8D
 hbtta8x4kQ+M5GWjoVMX56jA0usk
X-Google-Smtp-Source: APXvYqyNn8Zz8Dpygzx5LCmQPvCoPsf0Xa7ggNEYQscWU97B+LNRaTrJnzjPvtyk9ghwPUkJxIXsNg==
X-Received: by 2002:a17:90a:ba93:: with SMTP id
 t19mr10619842pjr.139.1561700018392; 
 Thu, 27 Jun 2019 22:33:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/13] powerpc/64s/exception: shuffle windup code around
Date: Fri, 28 Jun 2019 15:33:26 +1000
Message-Id: <20190628053332.22366-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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
index 17bc0166e0e6..228fa51b9050 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -917,13 +917,11 @@ EXC_COMMON_BEGIN(system_reset_common)
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
@@ -1095,13 +1093,11 @@ EXC_COMMON_BEGIN(machine_check_common)
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
 
@@ -1795,13 +1791,11 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
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
 
@@ -1816,13 +1810,11 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
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

