Return-Path: <linuxppc-dev+bounces-8249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3BAA6D49
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 11:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZplHM2NQjz2yRn;
	Fri,  2 May 2025 18:59:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746176399;
	cv=none; b=keCqyzjRxeHFGKVPPoMm41vDbaSxCkCHiRX1xMf3GOZD1UPz8n12y11KB+ZYjQYcHJVOT5dM2weXjk/IX5oui+YDX6+NtMfzCPiyGnDxT2JXFQd6CjFowlAiBViUdzlzhxJW31zhnuRfUT2zMxSf03WNooLPYuLoYspjQjfIrTf2W3X0l+yGJMcPGMBMtroigZDFLWIMAOD+cPmiRBIt7IBB8vR7vzG0o5IiLm3XvQnYU3Q+xCV0nr8qt68kkTxCzNvdPWppHqXcAxDzyr+zb/U7BP6cKeoym1DLjQtUbkapgwFxlwOhhAWMSrfHQvKBo5pQFQci/yDDlT59IZ9IOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746176399; c=relaxed/relaxed;
	bh=EN+18LA857SctMCPq7PChnoB5bYuEFe9lArdedXnm4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/jv94B6L+kMsSKuDX2qLPOI22Z6r7kEq3sGN4mBbvKiRy1I0iv+uu3UAUp/I87c8S+m+p41Gy/0BDWz+k3GA3433973rSv95euzT5h6LI6eRnlMdBQsk2QGpTBTs+oooeL5LvKEQEvSkgzzlgGmHzD6pFBnUJ9k2gwZXw9HRRddrKUOUBmHxecTNdIFRMbs7iHAJ9Lh5bS5SAOoQ2xG+o8zRTAAd886vyPAolEGsOAP6VzdChNAKpINdygQEyIaenaS/79OahA5lESAok+Bst6NAbQwdFlIv9Z0Zs65t34avq3YP354xS70d2CCqpXZ3up9IcuON020kFAAQiNo8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vZKDmSgi; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=vZKDmSgi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZplHJ58fGz2ySk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:59:56 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso1029614f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176393; x=1746781193; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN+18LA857SctMCPq7PChnoB5bYuEFe9lArdedXnm4g=;
        b=vZKDmSgiw9GFJ5JgV3NJjaDwuEpQ9Hdt5XRJBpTGP28VCtkD0EC7/ner385E+18DUC
         4GJ4H0s4AtRYQdk/JiGjn+o2Db4I7ZOuH3kuSm52wFceHavrgTCEGDqDu0mzeBjBJKZZ
         RyIV3SvqkKfde1L5Y6Mh9UpaloFCHUQA1/SrtTDTVCcbrFivBqlKRkWbUKfJJN5DXrN/
         OGHWnZvqj2nf4pO+Gfyp28bamn0oJaEtQ/8RHIEwmMML/ClH76OaJnZvLkDKVTpe8+fT
         6GECirSvT8R7hjWsFm2XuxkwkGB6gRiIeeTvb+EPYIStR2+NrUDjrl5l35SJgOw03b/y
         F5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176393; x=1746781193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+18LA857SctMCPq7PChnoB5bYuEFe9lArdedXnm4g=;
        b=jkjoY6XNy54MbmelzyLjg7U3dd9NM5a8vkzr0B5B6lmT/HRd4wGQHXZ1X3x8t17dW0
         PuaEM//Wh+LU8WqxmY2EP9mbKCyhc1KXAs2sOaNzIeke7OKsUvyWV3FVNKzB7/pqTwLd
         gUKT9IMOcEscf7l3acuIsCHhbiOWVHcYxHdwQxtGLoOLsveaPhlkcuVCsFrVd3aK/wno
         h1NlfPjZSKffI6PfGqxkdm+SHjc3qtQhDVXmUjWhXeMLr7QOo/ArDrswui7rcMgtYOBH
         t5zAPk0UOoAgZLhi4YQ8MweUTKcESE4Mmo7rntZdqAnC1mC/g4FTwdui13w8SZKqwfDH
         xNoA==
X-Gm-Message-State: AOJu0YzUrFaoZzxKGF1IdXWeJUhKLtEv1QDdj0Ctlo2EgUiZ/RSXl7B9
	QVUtFKGtcJ3bWmoX/CmeUtdzDY/D7EFjMDOVGjLD8jiRrtZDSlkz4uASZiKyF6Y=
X-Gm-Gg: ASbGncsX5aUux2vUZQIqk7X6nw5PzCVkMGrRiqrjylcbKdoEXM17bP+h4i16NXXR7zf
	LPdSRbYGtLLyy0VouHMIVsuSODGf2Ru85FXq23KjGx1T3kWzBovfpD1noq7PfDNNfPVPdmsYGXA
	ApjxQPI4uKn0e2e14S9mmjNVHBNerBNJnDK7cUNpgE7dnrJnGIXifsjX9r/aqxtcweYLA2mdcdt
	UBqJE/jsNVOLAbRWfeCCUxgLwHQGjvSCJowJc5NhcYTY2K+DLOypO2NByeYZEgfyPkeOTbGWtTE
	55eFkvPT8DLqt1rbnhon2aTjqruik8s4mUY=
X-Google-Smtp-Source: AGHT+IHdDxSM/FWZRtGoOZpkx03AgkDUaEUG/u3se1MxfUPpvgHvDAXIO8mVc8mZr+ucaQ37xObY0A==
X-Received: by 2002:a05:6000:4210:b0:3a0:8020:8aed with SMTP id ffacd0b85a97d-3a09846404dmr1749548f8f.21.1746176393327;
        Fri, 02 May 2025 01:59:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:48 +0200
Subject: [PATCH v2 2/5] powerpc: 83xx/gpio: use new line value setter
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
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-2-488e43e325bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N5uZ2gnFZdQj3L5KTNtg0bPlLnvDhqttnz7x8ZTZmpM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImF1uingLTiEjC1c1U5yBJ6QKL/UetAJDwss
 2MfnCf+vDuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 chpaD/9ia9Dv5hQRbtr0XBXvr4ParzZnQUg3MfXxDNrXszqdEGfJSGKw7ZvkKLFOajdDIdiP21F
 +/oHoYCMeHqai/Kp0EB22ZbR64mqrJb5+FHSI2uD4cpAVDggq0ypV9agRCKnY+kLuo7k1RWF32+
 TGXMRWRnzBsHLR/kYMPJEIFr2i6eCZbmIPSM9MpYmNJEZDAhljJRCPR2nC1MAmEqwLKBVOTOb/s
 R5l1OjrR9qkcE4K24qYfSI5/FD8ZMwvYF6EMz5jq9QdoNhwDTuiRmviA5wInU28fRNGpMJDHRGY
 Yf+k152e4dGm2edm9Q24ifx376enSdleBwyLbMXNo30+zTBDE58cuVqq95N0VruBoCfRXCs1wgI
 tR0VRALJdNnJaPtcNLT/Mo+8TJDEUIjg2Ok0MDlPe24Y2qA6AEpfAjTgs8YWY0VHsbDKxSfPQeb
 cjcP8Za1icbhGvpGdEHCZf9s2TWCU8eiwblsP/ggElw9wyxKIV4wwgLgphcmcXniWawlIlz4ehE
 Idwbmu8vIXSEuRuX0B2qXxPcejaNsg7jGA2i285fXa3api1N8J7QZS/pSVT3/AybJBRYqNLKCzO
 +BwMIxr4BUlUej+Kgchh8Qfu5MurvtggZLBy1KKI1EhoiMgoezZzWOfS1rvZDVDkJ7GUZZraHi/
 wlE0XEJAUuwQByA==
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 4d8fa9ed1a678..6e37dfc6c5c9e 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -92,10 +92,11 @@ static void mcu_power_off(void)
 	mutex_unlock(&mcu->lock);
 }
 
-static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mcu *mcu = gpiochip_get_data(gc);
 	u8 bit = 1 << (4 + gpio);
+	int ret;
 
 	mutex_lock(&mcu->lock);
 	if (val)
@@ -103,14 +104,16 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		mcu->reg_ctrl |= bit;
 
-	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
+	ret = i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL,
+					mcu->reg_ctrl);
 	mutex_unlock(&mcu->lock);
+
+	return ret;
 }
 
 static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	mcu_gpio_set(gc, gpio, val);
-	return 0;
+	return mcu_gpio_set(gc, gpio, val);
 }
 
 static int mcu_gpiochip_add(struct mcu *mcu)
@@ -123,7 +126,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	gc->can_sleep = 1;
 	gc->ngpio = MCU_NUM_GPIO;
 	gc->base = -1;
-	gc->set = mcu_gpio_set;
+	gc->set_rv = mcu_gpio_set;
 	gc->direction_output = mcu_gpio_dir_out;
 	gc->parent = dev;
 

-- 
2.45.2


