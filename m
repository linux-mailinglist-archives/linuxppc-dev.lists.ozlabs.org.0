Return-Path: <linuxppc-dev+bounces-7514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F243A7F5F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 09:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDb0n71z2yyx;
	Tue,  8 Apr 2025 17:21:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744096879;
	cv=none; b=iFHKhIaHlYGl+rDOkGgwJO3/OQcQMKZc82sbFf23oDWYbmFOvy1X6w2bA6VMIYb4xFaNCmMALbbidTq4BtrG03aWDAB/QwYgVswYfsiGcPvBdAHFdPYACGjc1zAbhoVUrde0XJnYuqT8oAKc1mw4wpjitpZidSM1bLGERe6F6n5FcwruD58lQbEmIKpFpSiZBAMw7hVTnN6DV5MqXlfJNe/2Hllf1PzVL02qkmEnY/u6hifPUun8JhJIsLh3PIUwL8ackbhVCf8T9iIVr22RngywdQtJ57eyleseOePfZA5W4IdfttXjcmlgaEoLphtBZjv6AExVyLpZUQIAKf6EHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744096879; c=relaxed/relaxed;
	bh=9EKgQ1cgxpU6DSJVVu3CokqxSFGqHBUMN7AY5XSvKwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O6iY4H3RR8BhPtKUpubCbxsevscUQPqfDwUGbHVV02/EZHWxQ4r62KgHwOmDVpysyQ0ckx2gQqAnMWTbU6/3ggDUo2FXoINPj4bjgs6uQwRMgVd30gVibycVOmU0XR6k8RdfoSQZQ8gsyfYCuIJemmu6AwRetdwCUUu6ZTdVopA88hxCdVzAPe20UbvVwgVqbYYbTYFpK1WICXVdmk3jLtHyQGIdWwGkwQJ1V12vvea8hAsw+cM+45VD2jcHShe1Y8Wc1ruhekWgyS02RkWRvuWY76S3lduIClZkJHYuxPZxEP80DWr2iUPlP786H1B4wKox8BMK1kQaHvFEapJRMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wGTIjxx9; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wGTIjxx9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWyDY4Zhvz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 17:21:17 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-399749152b4so2618628f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096874; x=1744701674; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EKgQ1cgxpU6DSJVVu3CokqxSFGqHBUMN7AY5XSvKwI=;
        b=wGTIjxx9LGRzmuvB3p7S/GClajTfIPxn5mAL79Aoy64vLjZHcNNu961QkpNrDrevai
         CiXFKDCAZq/qxsYEeTyXWf7qLlFtAHZ6hQyl2fVJ557U6DQ5zqHY9wZUOstfvBIRFZFj
         PP/zg9jp+b6E6UIPK6rmZ5y3u5D/5oPma83JHoGBZRq8sfPXeEbX7z045MzoIqIeOOew
         zzsq1C5vv/foDVdI1CSuoBX6H5ZzUsfU3440+GG23QjPq/qlB5I39Wp+M1XxmcPyPgPT
         dTrZcZjUXt9YtZ3W6exCBUfyUEQUrbXfL+GrqLsaNFXt2tnE6xTcCxotTOvl2Dwfjt4D
         a9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096874; x=1744701674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EKgQ1cgxpU6DSJVVu3CokqxSFGqHBUMN7AY5XSvKwI=;
        b=FEZBTDBAJ3hHZXbu7G1xAWfrlTQZdYD4jHgDcE8w+P0BYlr4u337KkwD5sxIBZs65i
         EoGWpVZzs8B2tHsGv9bW1585RSnmUBmAvAF1JFGOSfkQPzdu6Eqx/WZC12w3/N6G0DGq
         9ev9UCa+FI+TDwT2/hXDVqOp5Kcqowyxfh9AMPzE3X9hVtRuBVz5TSVYeF+KtHpZYQoa
         KfJV5OFUHJe//WETilYEc8s5VRf12SXGbtdRRwptPM6IITNB08UiyD84ltV6xqHYGuGb
         bWGbueDm1rwKEFkfYIPxaqKbTknylyik/T0XxmIrSeCKSgwDKAst2UtpPl7+rN8wGEck
         52BA==
X-Gm-Message-State: AOJu0YyRQt5uwhldi9uEPjz9JBOiDb1HNmEKYTZWMBZmAYKpR7cWFC5e
	bF0tLHniUBtE3CJpnpTrQ80mciChcaU2+GTv6KEmD3Y5r5qA4o7cj/iS/7hQEjs=
X-Gm-Gg: ASbGncvsQNJbbtTXnEBYNDuOCJgGrWKr/g5zakm2plfrfyfH5BNfAZ591gapivmUMQw
	Ez7uEkiYFsFc9yw/LVZUM10FNZKAAqzPRHi8xLKzFCqiy/Wion8mUvEAbpGwn5zLwQHUghymQj2
	Zo8JEivgkrmgxAeeKzwdz1tm14GuCNgOBpNUKRY2yXTXokn78M/TkIyTpjt8y1wHmeJ6ZgMnT5/
	vXzjSFCHd584AwwTO3rOclpfYZFkMvR+6a0A4KsLbHXU1GrqBPFSkEY3c36nj1eBLumyIS6yfeH
	Fo/lzfoRbnLl0/6YbfJKtsyaZ4dKjlYYJxqPGw==
X-Google-Smtp-Source: AGHT+IGfBvpH0yFkliZLtXlbOsc/im0FjsnYwDk1DO3Fnkg/Amyk0+BzHkIllruNLf+k0vJRb3h3JA==
X-Received: by 2002:a05:6000:40c8:b0:39c:142d:c0a with SMTP id ffacd0b85a97d-39cb35bda23mr12921572f8f.19.1744096874610;
        Tue, 08 Apr 2025 00:21:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:10 +0200
Subject: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=T4A59REGiz5eXob5HMd6JwbPWhPT8lTp1DmdLIdpCvw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5mXcX7kY466l0OiK8NIg5nd6PegVrBTz5Aa
 R0NwF85CWSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 crwFEACOditebqDnaphThATlEMjgOgAWyDQeAEeb+QxdPhrDCGrM945fOgEEDGXhJGdoD7do5iE
 Hz6qaTwsLtEacAQodx1V+cgO+UD/vFMjHmaZZ3Bg52U+0J/qzYK58L9l4koz+PARYWiDbcNmQIx
 yu5/cZhXO+enA3bpZPQUcKmDtfOujhymNXkYMzBfZVv0sBfALvPPkv7c15AOlCtwVUvLwzubEiJ
 gNYvdIxXjMSzhvV5t+KOVFZpWbv0smNiEp2tNOHU0DAZZ7ogu03DBk9d9AscS9tCGF/1a6pWueM
 fzvvLxDfmPqXTrW1DG4fQ8Y36utZEXUfpiGAPqYsjICMIwmMYaxYBLIHTmuRulXpkrdErKJcwXN
 oM3jjdlHR6TpE4w5cbXxJY+tl1SiGNA0xaZZSQj4WCpTKXxH1qnqeNvImuYdQ7Im8665DuOIcfc
 /OYBh5JBhAZPqe+JlDjrQpQUTqXDT2MM6s/d7JJ1ys8EwTq5KY3EZaZAorGAGCsAmscyuz/uefG
 QTQJS3NFuVkw6wzzSFFHTUm8hz+PVpLWLnhoZOXLx8kP8ljszTFiKp7coboOT4J02tUzkWzQ0Ue
 CM+5pjZQ+VmDEp9OswqiqyPLiMTIGPgCBK7L3F+2CIwHDk/lKvNn6nZd/Ktm805r2AJOItWe44I
 73ElfPLII2F36nA==
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
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 4d8fa9ed1a67..d4ba6dbb86b2 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -92,7 +92,7 @@ static void mcu_power_off(void)
 	mutex_unlock(&mcu->lock);
 }
 
-static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mcu *mcu = gpiochip_get_data(gc);
 	u8 bit = 1 << (4 + gpio);
@@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
 	mutex_unlock(&mcu->lock);
+
+	return 0;
 }
 
 static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -123,7 +125,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	gc->can_sleep = 1;
 	gc->ngpio = MCU_NUM_GPIO;
 	gc->base = -1;
-	gc->set = mcu_gpio_set;
+	gc->set_rv = mcu_gpio_set;
 	gc->direction_output = mcu_gpio_dir_out;
 	gc->parent = dev;
 

-- 
2.45.2


