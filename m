Return-Path: <linuxppc-dev+bounces-8251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E33AA6D52
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 11:00:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZplHP0RCcz30Lt;
	Fri,  2 May 2025 19:00:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746176401;
	cv=none; b=CHM2J2tw/ZrJVeiKK0wX7patc8H6fqA+T7ymm2V9Fxvk7SeMNK1Ac3EIfKZLBU/wzZoa4n/s1rZYwVl/NanvbPyP/nMJmORy3NIaoJb7VJsr64/cMqdBvaEdUb9Y98B+//1ovoyZD1JHOy4dFoCWlauqVZehmzyTS2W/raZR7W6H671mIqKrPV86JySu7v/vz9GtEZwDTNL+P882EgPWNvZoGtxrhF3yvIEb6eEm4wizSzjtXphpjk0c7yysmtZwkEKTgbijJ389doUhEg6IgQ9l6wAYDUYAbXoT7/M4OlFO89KCMv46YhHJRImgFIhZn3R9ovoccu/tanbRI8zS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746176401; c=relaxed/relaxed;
	bh=uSI3W4dK/WwCbr7Lai4Hip7w1X1W5KMNJkBGonHTT7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fl1TM0mC262Q4jMuN0Zvb4Uw5TArfu9ICT0W/OEvF13a7l9z6LF3Q6HxL2oz3FWHLgrPbe/iOCB0u5kE8ZnqIdLnIQPgaf60mleTBUUuXQfGSlG8sQFBv2EoSn4chz53znO4mCBuZZwmnAQoD5U0B/r25UrmhOy2C5SABYQKgtuG9RSVUjyFtQGfl80ko4/j+PJaBLAipT7QC81UyEn0aU28aI2ffe+poZKt6KYBPzInXkT0NsJ9gdnWDTiHkVkZgWhlZBzbMbiKxojhi+3qN9fWIhYm+LyIHoL87RG4CNcJsvcVAl56ZcPySXmcUfE9ICgeRFt2PpBIY/pmVbDh5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l8aDzPdL; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l8aDzPdL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZplHM5b4Yz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:59:59 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1638843f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176396; x=1746781196; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSI3W4dK/WwCbr7Lai4Hip7w1X1W5KMNJkBGonHTT7k=;
        b=l8aDzPdLq+10o0+uBWp0Tx7Ocox535WIevxiixeDZ3YYoR/LBShehvfW/4AjJHSZxM
         5/qsoyf2l3HBVtvX9O55ZwqBgBOONTLcwo4xx3fIKNOa2VI5WaNlQdpBi5ckU/b3U3QY
         Jik0dUDBneZTS4nbgVKuO8CXlCuEa9YWVxdUlpFtZAX4nbP3TSl4KCWpHVscpEAzcgXF
         GdxyleroysopFz0PQM/SdGnNq5Jrmo09QVErGLIhGHqxvJI+5osiDONO8bbfBVXD2mZG
         9cEgT4myDdqpEi7njGELZWaoUJtazkXSNfJD/4FJf68nYTcpLHbZ2skypIeKK/vdDBrs
         nyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176396; x=1746781196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSI3W4dK/WwCbr7Lai4Hip7w1X1W5KMNJkBGonHTT7k=;
        b=eyqmp5LWc6LNYuKzUXG8nuXX7YWcI+HhA1Tep1Vl2bjS5a5bBsH60GxjwhP7RAWfne
         pAG3debjGJCko2R7WAH8jDwJmjFzvSrUpaP3eAn9F3HFPN7VRB19o+04xcyTxS15HJXU
         wW9RgYmJwqtyqtBUZIPtmGnWXGOlzPstr1imiwfSk3aknJfo90VtjKRTZdN5T7/Oisl0
         yhmiYjBomu+oXfa5Jpz2YFwwRWHEGUU+aVSkR4QqEbIuuYApwQSQlHsa9oJMyh4jn/bz
         kUxENDI4urV2zzZLoxPJlB9Nxc19K5dBokZixOS+6tRYwx7cAOxL4HuFH1f2Unx9498X
         9UKA==
X-Gm-Message-State: AOJu0YwFMOIebj6STfvQm2D1u5FXaermFTZFPGRtNjx6EFI+Up+3e6Z4
	nG0BNC0vZQ/JB3gAW/XcQpJ2nnnI3mTd+jpD1v3sFv7VjiAOYnWKjIH0lvn2t9A=
X-Gm-Gg: ASbGncvjVL7ZF+7XdeOL8JpcaexIFerhgVjGB3qn32BDQtMJNTrtMmtbXrKD2nhCs6p
	QsYIocZPR9zdm0bnU83HZ0/incQ87ENwgvEr+/SAo0ERNyLDWyUEdU50zh3PlGl5fUeEEWWdtTq
	H6zF14dQIPq4/HBPLIumqdvmEQOa4APSgegpLptXKKqU1wuslpQbCkj7N3Dva7s6dOh7zAdjb6m
	7qvmhRy959wYg/bXxuaDctgkqgIJonMbfCmh6NjO8VRUwEMyffoZCebp/mxy68xlFlai094/rxo
	KfC1JSvrH1qKiNZp80sCAAQEon6Ot0gJYS4=
X-Google-Smtp-Source: AGHT+IGiehs+dD7NKpB0E1UYkHMJciB0IWOavCbaCxYmeUmt6Jp8ux4E08zw+1Zf98nIRF7Zf+GcJw==
X-Received: by 2002:a05:6000:40db:b0:39c:16a0:fef4 with SMTP id ffacd0b85a97d-3a099ad938amr1319909f8f.24.1746176396315;
        Fri, 02 May 2025 01:59:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:51 +0200
Subject: [PATCH v2 5/5] powerpc: 8xx/gpio: use new line value setter
 callbacks
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-5-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2792;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9v+4cP+N9Ekqaku8fyOt8CZXpH5ZitQiy924EVCXv2U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImFV/zBpGNUkKObJQaO/c0oYX+Tv8vDmyzil
 Ug9qJCMkCaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 cksyD/0X+tJgjUPnAxn6EKf2Z9j6fWFPc1+1uIKAzbRceI+1oKELBb+otB64CIoIihXVwVt+92J
 WeO19V0+Q29RtvslOqkQNdyaazX264hPpEVN8oz1ebZeYkL/64AqoDjaNARKDenLURsrj4U1/pU
 0kWP1TXJbkSzEF7AqAb61kqeUAUwZYly/MdL5dmZ22GLohEG0hswU5X+AdQNTKkE8ttWrDLa6UB
 kXHTvmo2g5VKATg+9ctmhcZVjPTh6V50TbHJjz6gIfiMm8MZ7fgq1nwUnPn3AZ9DmgVWUBSTr+G
 +4w1oBrnlQmLS6+E39xkCSdXzDf4mIsZvk+/hPGjJLuDDRUsq8/J72Ccaf4QdcBEFpu/cRvKqs+
 Yi7STBrE5AgPkb0Qi189KebD0770ZU3saX9T0465ZSptxEPKu6NQSEpNnQLkN0QtIXsdNwo+h0g
 dXwPYZFx8kfep4AaIUcQK7dyk1KxsYlXOX8LazI62jiefMNyZkSll17/le6ayiMq3T+XvP54Jjm
 CB18WGR6nLuckcRgDOrY5pEMBYi1OXrefhwoqGEP2fP0VRRNYKAwMeR08IBkQLSWiGoK+ac+KEY
 Zv9O1H0+iu013fq2RDlItUKlG11ZDRJEcxARbfWkfW86nInRiCQLl8ywo6Ao8toT9XekBZLcwKp
 IzoHr5MPIAiB0ig==
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu> # powerpc 8xx
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/8xx/cpm1.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 1dc095ad48fcf..7462c221115cb 100644
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


