Return-Path: <linuxppc-dev+bounces-7516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B1AA7F5F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 09:21:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDc55Vzz3069;
	Tue,  8 Apr 2025 17:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744096880;
	cv=none; b=MXLoMDkyrN2hlGEBIv4oWjkavB2syiJrdbpxRHXYf002AuSxTu5VfVJB/ZOdf7phxv+/WKPN327Rvmj0EIjWRp6gL8xk9DzVy+HFxkMyLXGa3kMlKPf+0l485xHYh8YKoepM/yuexOH0b2vw7rGzHlBuAqCPjrOFEkLDy3UiUJi08JeoO9H5YlUETA1cMBUXIGQ85Na4444aK/6b6IXOjgx+TBbCcmjNjsYmgcP1XhsEPZWYBRBoQwCeZ161xPQ3+MU+C9fbFSZ346xzKyQvuksbkQ2HL+3YWkxwfS3J1g1i6Tklzg+0Ukm6qZhX0928gkqud0JWAO4waarITM60dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744096880; c=relaxed/relaxed;
	bh=A0cSllrBnTQSAVrux+ZYY4miSWlQmvTzHbS9nTbIcjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozDa5iYl3EBv06iw3v6a0zhhCrbqSe9lMqsTvwcsvOzc5aMMDRL5zoHq9TwqOEYMD1Uk1PsgWCGKZ19eH7JUudci8bYKY4kPzG/64KwY4hCwM/isyWPf55GoExqkfzJahTX5n3QpbPFnELvyzpA+dKZU+kr35zheS+gsMmlmrFGwhou8ST8iFcDUMTjvgFhWl5O88uMMF9TJLlVxK9Uo555YLYrWgr52fv6DdiBjwwO99+SkY9wH4T743FhObV8xmvMw8QqF9XvMQPtYZp1ZL+1EULGPTEOWukdJ3Lzrm7jhcIqu7uT9VWKrylBSkr5E7AFLt2pe4GANyaAUjBLmDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MFBESFl2; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MFBESFl2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWyDb5cWbz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 17:21:19 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso56469915e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 00:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096877; x=1744701677; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0cSllrBnTQSAVrux+ZYY4miSWlQmvTzHbS9nTbIcjU=;
        b=MFBESFl2tIGRFEl+hFsa8z3R3vTd25GKtf9ywVUGxLPJC4xdvBCoKHoKH51p5jfxta
         nUT4oeyTSqwkeXZVWe55Wpf/OaahqugEwp9wQqxy89lhWE/WOwww5xLSd0SsHQAXGOdI
         CiH0wtj07hqFJleRmEGLTgu6Qj6h9DiOe9ocnWVm1Omlpb0gEfWuYwTIv1xi6zcboY64
         HlGstrUbS+2UAK6/SHBTb21YzbuckAA8ZBl8PxPt9gm6GrIAlJzS/luabegyV1WOYd5o
         1NxpiFxHBFuYnc1iUOecuonNTwxL3Gf0Bw0yXc12xAdhPNIkrx6z8TtujWeKg5HSgYQW
         dM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096877; x=1744701677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0cSllrBnTQSAVrux+ZYY4miSWlQmvTzHbS9nTbIcjU=;
        b=jzU0Ipot7SkgRGRptq9FDkq/z0emJhaZIRlPPiE43Lt14NZg+D/d/spPz3E6Lw2ACy
         rX0h6zPcMwUU+75q1rKVo84zvwG4zm0ms5eQ8/dh86TPOGiEVq3VXvVS29dutCkzbMC6
         DcWw3E4SDV0y9wvVl3ilLyWlNTyQkv8XvwUIbkyiSyXzeikYR4QjuQodXan3ksynCOz0
         TExj70sK40zyv/ZD6d0rqe+sQ2iMf9GkOQwnwn6wBYGWsNlpzqI/8xIgjGRz7ADIhTj8
         MNhJHtXH4PYKH0nN9bqR06FBLkuHMvDZt8pqyadr5UK88y39rBzv9k/kwTBMykGLG51e
         NSlg==
X-Gm-Message-State: AOJu0Yz06+R9cUgDssAL6f1QMldf8YAtbZ5SQrbVvN+sXcaC/ItcfE0g
	cdPuSVzXFSUlvqpTQ7lhWHSOvwK4ji6qFMuaxHuA5LV5m4dng52aCOoqj7Yc/40=
X-Gm-Gg: ASbGncvyYSYcN5Y3j/KaoRRG0ErtCM1yoYyjm2UTuFdLWRx3pQw2zwjH+UD1tT4UVtt
	5wcqDn4FLPX1gEs/eY3jyGSWbUI/NFUH+BulYH0L47wsK2uLozYFdIi/muPUfI61bPGy+hwgWtg
	8ZFCH3q7SX9tNRaVeUYRt23zmmVLAmWd4x0Atr6EfD94Wg4X7c064KzgdlfBgtJq2qTxD3OoTwO
	JH2gsP4rJ9ORh80cExhP2kDVilM0YBbTCr4+5xtWZOwSR2890f4w3jKLzHSA108LEIkcz4AmAMh
	wtMkztRLVHBag1GAf7nEANRusX1pto/KHo4OaQ==
X-Google-Smtp-Source: AGHT+IHxFkxaFTSuHg6XALBk3AAm7ho5zuZR9ashDUFieaG7O18TykGWwZO57XfJMNPuLDY705cc5A==
X-Received: by 2002:a05:600c:350b:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43ed0d6b07cmr111746535e9.20.1744096876732;
        Tue, 08 Apr 2025 00:21:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:12 +0200
Subject: [PATCH 4/5] powerpc: 52xx/gpio: use new line value setter
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
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-4-73dc1ebc6ef1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bkSnAWn1tiNFi+Tzj5ivTeMtlGuzsIZFtgns6Zf14Mg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5nMXBRd9uglf1v9JiIXSvv4QhJX+qgqtx4m
 oLBvLI77c6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZwAKCRARpy6gFHHX
 crylEADOeJxsWbM8Qlpy6KWQ5pDNGZ3Sy1k7KSHEPtibqX4pDvTT+rvmj+q5af7AgQhGAUKw60n
 LoN2ym6kJ2RXpauVosz5GOIuD6As//tXeflYzn4L4q7tSQ1ZA6iCGZbGotMwSu8NwBHyXTh7iGw
 p8nDWS/nYvlDuiCHYxbe2WCCbgybgMj3XcjObVtwCetpjsE+CoTEj3zOrqTngJegY0UbSin12eq
 HVwyU7f+GzY8meh7nWc0FgPtjEShmVm8VVoumvIt/q2ZxUFoHRFLJEGd9MfiGlbKxV1T+bg8nbD
 9YWAAOGffBxFue29AEjZ0S0Ciw/B1mdJZ6/1E+gGLsmkOv5QL/olUtd3VKu0KHupILfFpI7ShzA
 DY3Z8pr4rM0WucQgr3md7/4ypm8sDejAmXmQxYioeJBqzn5ZGltf27cA2fKUUv85ErtlArU70dc
 JZVpZGrzOGFpjN7DkjE7ooUKnLrJOdnupdTN9vttPO4e2wmkOrxUci/Uz3v/bFK9oK68mRF9TxY
 V9Vx9GoLXc/b328iPklYO+jI3w94HroEu9u1NozvlDnMhdQ84NGOqO0s/pP18LzdQYUofYogx7u
 ysTM4W+pb8qN2owxenJroMDNUulxqeU/BQIJSEUv9vrmVSjZlU0jRwFaf/GsJpgZeEIR3RpQf/l
 49lOQDFjVUPv1kw==
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
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 1ea591ec6083..c96af6b0eab4 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -280,7 +280,7 @@ static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return (in_be32(&gpt->regs->status) >> 8) & 1;
 }
 
-static void
+static int
 mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 {
 	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
@@ -293,6 +293,8 @@ mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 	raw_spin_lock_irqsave(&gpt->lock, flags);
 	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_GPIO_MASK, r);
 	raw_spin_unlock_irqrestore(&gpt->lock, flags);
+
+	return 0;
 }
 
 static int mpc52xx_gpt_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -334,7 +336,7 @@ static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt)
 	gpt->gc.direction_input  = mpc52xx_gpt_gpio_dir_in;
 	gpt->gc.direction_output = mpc52xx_gpt_gpio_dir_out;
 	gpt->gc.get = mpc52xx_gpt_gpio_get;
-	gpt->gc.set = mpc52xx_gpt_gpio_set;
+	gpt->gc.set_rv = mpc52xx_gpt_gpio_set;
 	gpt->gc.base = -1;
 	gpt->gc.parent = gpt->dev;
 

-- 
2.45.2


