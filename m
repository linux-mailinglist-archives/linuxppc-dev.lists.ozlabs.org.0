Return-Path: <linuxppc-dev+bounces-7517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7BDA7F5FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 09:21:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDd3p1lz2yrl;
	Tue,  8 Apr 2025 17:21:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744096881;
	cv=none; b=XZfwEcJqH4A2rF/5ADP29ZqQ7BxSU7pwlS81fB+07vCWKQpl45Y1kQV9BVasKcAqtMov5d/n0hvRb6ca9ctceWIbgib1Mz+Micr4fMLxYCGjw9IBMOWT8snBbLKA0wH34ilnZrTLI08W4WnrvmtDcvLSgDVpAMpc7ChuXqfYClcKujHwpdUKmB8qTEYZgeNYK5YhYsnyqi51Db96KioTZIyzvNpmV0V+tmphm+aEjjsGdrBNRib70K4J7u7KPqZGEHH4jpSv0GfEaDFkiZG8n/MTJm/xESuoCIeYH9i03z1TuGaW5513NJH9+GOXHmtS7e42nQ2HjoNGDcASR/gvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744096881; c=relaxed/relaxed;
	bh=XvshZe5PSemjV/2XZOVRqNiaOz/McPkdhU5QyFybI6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIaNmwEbQxPmdzTtku6kPppK19MFbHZXOxRowC1eEgKsWnALSStCZNwLa/bygpTBSsKw8TXhAYbiz4HySo/Z0QdBmpbvfLO5MHGJo03oNOok5z3nofmb0j6TsMFeSdKYl3lfWCLVUoMO4YV3Y2nqig5D5yCC6f3kehK+8OGan1Dx3Z8bVZTkQtHE08tiRsR4aHTblgrKRQX50HTQpFKKF6q+4/360yFMH60EaY4rwy90pX9xNhkhJ9YDyafAtzGLFGIeeLaot14t+PgzZEiRwxNrLnBjWJAL5nSuIgTHJa8B3QQPWC0AlZfOfCKWWyethffofZtA4ZNNTq5ul3c07w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZkBALlE+; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZkBALlE+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWyDc3b0Sz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 17:21:20 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so22912055e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 00:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096877; x=1744701677; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvshZe5PSemjV/2XZOVRqNiaOz/McPkdhU5QyFybI6E=;
        b=ZkBALlE+TfGicsqM5DxpElHzLRuOYbdV4ChlXQuDnGgphkqzWxaO6AWb9ke+hZiFU6
         OIcEmXLLx2dA8eM0gmuT9Rh7F7wjyGUIaZk3bT/p5TCyR/K6yynJgGCsZwOi2KofmUfB
         XUcbAvj7uwIMrXGN+jHXrcp7uqJ29sWirNTXQnLfNQNHuTBgD6yLRTpQsk5dOxzruy7+
         +u91cl6tcJkOD5/lKcQe1o8xCcXJO/pVaIdRPstLdtr23wynEsUR2rHGI1npXqnfq8Zg
         qXXhk2Wh98rDRlrMOE9AiWoeHQkaI00R+FH4uMl9Av2WhPrIL3CRcHoqBh8pZhR/PQIv
         c18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096877; x=1744701677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvshZe5PSemjV/2XZOVRqNiaOz/McPkdhU5QyFybI6E=;
        b=RGh25aShrygB2KyyNCi2WamTQWkpXrT0MiMylBjYqr2L6sB6kX1mITCxe9cVEl1Bj3
         2oafdpSKmzKPFJZTc5jNxDomhQxB6cZDmRTFpAs2ea7kVfWWWbC7wRlZKzPcM9o7Bms1
         jhcSHfEpygXSsBK0Vy10cXr2UNRVwKcfpFu2DC3K8i1XUpzV5Jk2H0XQCaz4pDdqzCZw
         rDXuez9oqfP96I7jYy6BY1Wj4hCmdVb7tW8YDsrkvX+eKH1dSNWnkv9EpV9Tb0QPD6DZ
         pOow8L4702qlSj9fTvTRaGkzv8N23Mt9MGUJmNQE+EdV4yLOq4sG3QGxRWDL1zEIr77i
         zRDA==
X-Gm-Message-State: AOJu0YwcBUBy/AfQidgM5+PKtD3ZqQPWuf1stkqNCndBbtuJOVYK8L8K
	nljh4Ljk9xbVoS2uZfGj+vkYmZZDLN7Y09t2yb0O3+pClqfDn48XibVBIegA2Vs=
X-Gm-Gg: ASbGnctMDQEXuP8N5DKAAib4ilpdS9jxtYyye8mafsma+CjXCQDIweSF1i1cHpFOkQd
	66G0H+LSIurG/VcaqfXW+8VCfpI9KbWX7KGlXhTDDG7q0VM26VzgFsmajmjnZL60wNLEYzRwsns
	ZGiFViLC52lPwQPvg0z3ka/ZaZlRthtYHn5ygBw0RT5mJl1zoEaq1g8n0GL+1dJ+19SRWRsWGfb
	f1ZbdnbSePoq3oMiBqLEzBInqRcB7Wo9/pcIfQ2IdVC4wVxqaowX5KDqWiTaqZbDxqR669tpRJf
	oNrqcbVI1ZnET57D82oaXnSEDKX9GySnua60EQ==
X-Google-Smtp-Source: AGHT+IGrW4uYgQjk5NoZkfCg5Q4JZQulnqw+Rx7LKQ7tq7TOQnOVz0pPCRyGYatMVBjG1AXtl+w6yw==
X-Received: by 2002:a05:600c:1553:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43ecf8d24dbmr138973775e9.15.1744096877570;
        Tue, 08 Apr 2025 00:21:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:13 +0200
Subject: [PATCH 5/5] powerpc: 8xx/gpio: use new line value setter callbacks
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-5-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j7/vT2sqk3w0eq9R3JA6vJfjNNyoaO3ADhKnGJw1wQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5nw+RlBM7GRxu/xO7Dk2MaKAuqw17eaEkTq
 XAGkLPLyfuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZwAKCRARpy6gFHHX
 ctefD/9qKiesq1chihFiqBhxfgS5v/Ytom4gLe+8YrTB+nRv7zmH8mj621N8fmJEbmW4PziTnaC
 vseQz//WwbagqW+fKFpYGuCiAkZXD4qUxW1vkLOhI7yt0C56r8TBtz4knXs3tTi/hqp2+ipJWgX
 UVXU9RFrMW0oUnHD2IwDauVEQbv9YoRr3gfIruX2Jfin+8P3yNoHLKEv3t5jQ6ewz8qH8LPwodY
 yCpL0ONxgxBy8fc7de+R6lduiUbdf3fPTwkoWK1QAkR/AUfy+Ni8/XAdJOIw2wdnWgDQRKYF+ER
 cjAWXp/TWSAgCAlZG3yKF1skJJOT6Blym2rjQZ8rrOSppsjkPKZnOeo9Y3x7TBzP7CViN/RA3HG
 bNyL9Ie92Cb4W4sSw51ovD0kquBZmhMSoS0kOhM3ojN36mrccJ80rNzoxdbyXSf7uUqH7/ntBXM
 NPh0rmGrYqwlSh+jhXcsZriiy46/LsMHpY7pQydNt7l8Wo9BGHg9SQAu2J4d4JxMtGb5l5R1UL0
 8/k2a6xn6UmqcZdk/PR6QWHHxARvz3jgR8F/ypWXfvC9nPns2Bf8mJStATofB5n1rDgOKeLvomB
 dV7fXkj7MYSi07D2C+6gI9xd+WtEvQT9lspoQyQEV0Q7eWLUuAeISFqApvAq7AhAWHdcwsXfXgV
 C2BzXkHLmqZ5Ogg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/8xx/cpm1.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 1dc095ad48fc..7462c221115c 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -417,7 +417,7 @@ static void __cpm1_gpio16_set(struct cpm1_gpio16_chip *cpm1_gc, u16 pin_mask, in
 	out_be16(&iop->dat, cpm1_gc->cpdata);
 }
 
-static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -428,6 +428,8 @@ static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	__cpm1_gpio16_set(cpm1_gc, pin_mask, value);
 
 	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
+
+	return 0;
 }
 
 static int cpm1_gpio16_to_irq(struct gpio_chip *gc, unsigned int gpio)
@@ -497,7 +499,7 @@ int cpm1_gpiochip_add16(struct device *dev)
 	gc->direction_input = cpm1_gpio16_dir_in;
 	gc->direction_output = cpm1_gpio16_dir_out;
 	gc->get = cpm1_gpio16_get;
-	gc->set = cpm1_gpio16_set;
+	gc->set_rv = cpm1_gpio16_set;
 	gc->to_irq = cpm1_gpio16_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
@@ -554,7 +556,7 @@ static void __cpm1_gpio32_set(struct cpm1_gpio32_chip *cpm1_gc, u32 pin_mask, in
 	out_be32(&iop->dat, cpm1_gc->cpdata);
 }
 
-static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -565,6 +567,8 @@ static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	__cpm1_gpio32_set(cpm1_gc, pin_mask, value);
 
 	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
+
+	return 0;
 }
 
 static int cpm1_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -618,7 +622,7 @@ int cpm1_gpiochip_add32(struct device *dev)
 	gc->direction_input = cpm1_gpio32_dir_in;
 	gc->direction_output = cpm1_gpio32_dir_out;
 	gc->get = cpm1_gpio32_get;
-	gc->set = cpm1_gpio32_set;
+	gc->set_rv = cpm1_gpio32_set;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 

-- 
2.45.2


