Return-Path: <linuxppc-dev+bounces-10337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9DB0C4F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 15:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bm19D6C2Kz2xRq;
	Mon, 21 Jul 2025 23:15:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753103728;
	cv=none; b=PAr/ng5EBNfBgdP0H5jYT79GA8dj9GwjcPCOMTu5xNVytYRbFMrwlLrf+vaI8uUMS11O6E7dZB+o4sLzwb1fAZov5tkAU1yLyBPSw6SPOKFyVTv0Xx2PgSAEb6Wzq3W3/xaJc/9YF3S4db59mrd6In8GtPnnF6jRNS9uUlwv2lw5KIXEBicRGPzUahurDPHW3K4lbtzV48g3abmSdjj2K8Ym0BQ7Z5iHOuBluq0Om2Zwc11YMkEUOcVhjUC/W2YK1rh/6HJ5yClOeG5yXEj7bxsPQQmkoEzxLra1D51uX4R1hgrkJ4NS1ZjKRn2yF6h8GunxBXc4PEgWL/e+dGBuQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753103728; c=relaxed/relaxed;
	bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lomRpfFa5+5dAKMUxE/9s7qVmQwMJS9FKrjYCDKctAcEKNs/Hmp/KPMfRyM7/xaOcBTxmtW98Y/0g278AHtNe4gI3gZ6v7F5v7D1gGXga5OKv777Scm4egIwCG3nI7co/q+ccYk6gz4St08+rSY4jdDXesN9zKyd/cIBcw99WF2UD/wtt1O697t20O62wLB/R6nwUTSmkxeOO19AsobikaOrtwyGnN+LFHJ8QWrOpJ3aAvZnwoZxNZtpb5Ys++d7qQ4intku6HF3QeKv8uQxk2onybF0hP11K5YgTvKUoqFd63utXn6CkICiLVhvcWklxi44bWCwmLR2HSgPsUTsNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=oOUq57+v; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=oOUq57+v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bm19B24tsz2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 23:15:24 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso21280235e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753103719; x=1753708519; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=;
        b=oOUq57+vCmG9GEp1bbx+GyoO7uve42GtyeT0u6kBnp3g8bxQ/bqIz3DQxrRKgvL9we
         D37/bDOSj92PQjOgwEcF4vd6UFKASYxtfQN65f0wsrnQ6uO7s4C/CeUSU8QURVTQf4NK
         DyteQi2UkRREfox31WkcqJwkpujR1lExsi5i+ZOivSdchzaaSrKHyBfJtVQOrLdFXBTN
         OmnY3Hx6HYkkzUDXTJmDZTvzw3aVwxBY2MuyVDBfEarr3b25XP921iu6egUBeQXjSFp3
         0JOPeHubo5i6yfZvDDLlHvEjBplqeZLpE95blTVMapYPO7WsCKL60085KUieMwHkvwME
         phVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103719; x=1753708519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=;
        b=TkhFJV++3hV1JZa7I+zKQJOwaJbn/U0W12aWsoAkwbYtdoaZwYck1AsvYDedB2Xic4
         MulRFj500RtTas0rmXWZQ0qcftq6uSPt+7pyHZl49PL2bJ5K2M83VN6pqpqDpAVG20Pj
         9CDn8agPte8LbqtkUrv8edigC0epjyYfP/ETK2vqcPDodMaOZgJYthp+RvAO9PBVSPVo
         cpgFYmagfHc0mQf115I44lsnGLe1lHEdAG1pFioahB4jJlyJDF2pqQ24GrbGnPlLnuPU
         DkHFXjhftGcGSf8XBKwdDmSMhs+FBwuALFOnjPZyDArT5GMIrP0NubxaMYjta3G6g9xw
         BCxQ==
X-Gm-Message-State: AOJu0Yy17/wlvpeKJkAWJZvIrQOOA7iAQiMk587teDa8MvWwsOlKw6PG
	fgat07HVzrdRuT6PvU3za3czOSlngeZFfO4dGITZZ9/H+zWsQOkhoOVzXGeCtHlPj4k=
X-Gm-Gg: ASbGnctk5q1ajXZQPPHzO0iAkEbEwVh+c78vS7J1hLsroV7Dh5F5Xk2yVcyT/4vk0Yg
	0/nG6D+1sa0v43JsxdTsshQYqeT7Vn2R+uhvwNt1FdtQMcOVPt70vOFYHug4Yzcj/BejYma6JQD
	H5lhGR3j6yh/onsMg6ApRfPgkUA7EM/siI5Ll9dEJaU+ceZoDmpVnu6XJxoGakN7ZlxnbBn5j8z
	IR0PTI2jm7T3UX34fQJbe03PLyi7gkF/HZLz6MyYNrl5oqq7I6UUqasd/9UzeJgwi0uDP0O2dyf
	0aGWOxSQdLtEAw749Fl3r4atz/w/xe+5OUV90td0JDAy54f0XWN7urZlaMG9Ibc5m9Nsj50u95m
	3/5qOW8iAIh3ZuQjrO/NIRuo=
X-Google-Smtp-Source: AGHT+IE6hSA6IgSYZzhjcHqll782tZfplfgYxnmAitmMV8tqIpsaPAw0Kw0vQ/HRkVaESo1pggEX6Q==
X-Received: by 2002:a05:6000:430c:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3b613e984ccmr12169355f8f.32.1753103718407;
        Mon, 21 Jul 2025 06:15:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a0b1:7516:7c6d:ded5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e818525sm159556685e9.16.2025.07.21.06.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] soc: fsl: qe: convert set_multiple() to returning an integer
Date: Mon, 21 Jul 2025 15:15:11 +0200
Message-ID: <20250721131511.75316-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The conversion to using the new GPIO line setter callbacks missed the
set_multiple() in this file. Convert it to using the new callback.

Fixes: 52ccf19527fd ("soc: fsl: qe: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This is a follow-up to commit 52ccf19527fd ("soc: fsl: qe: use new GPIO
line value setter callbacks") in which I did not convert the second GPIO
callback. Could you please apply it on top of Christophe's
pull-request[1] and queue it for v6.17?

[1] https://patchwork.kernel.org/project/linux-soc/patch/c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu/

 drivers/soc/fsl/qe/gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 5391cce4e6ef..710a3a03758b 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -79,8 +79,8 @@ static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static void qe_gpio_set_multiple(struct gpio_chip *gc,
-				 unsigned long *mask, unsigned long *bits)
+static int qe_gpio_set_multiple(struct gpio_chip *gc,
+				unsigned long *mask, unsigned long *bits)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
@@ -104,6 +104,8 @@ static void qe_gpio_set_multiple(struct gpio_chip *gc,
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	return 0;
 }
 
 static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -320,7 +322,7 @@ static int __init qe_add_gpiochips(void)
 		gc->direction_output = qe_gpio_dir_out;
 		gc->get = qe_gpio_get;
 		gc->set_rv = qe_gpio_set;
-		gc->set_multiple = qe_gpio_set_multiple;
+		gc->set_multiple_rv = qe_gpio_set_multiple;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
 		if (ret)
-- 
2.48.1


