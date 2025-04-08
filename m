Return-Path: <linuxppc-dev+bounces-7515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A530FA7F5F5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 09:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDc08cMz303d;
	Tue,  8 Apr 2025 17:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744096879;
	cv=none; b=dXBJkwAlSAb2pxkOaVlzHd4R4P2YZ/Ij0Qj3T+hvicyqPb8nucTCY9NijLLgoQezcxW6jZ2OCT6zRBh3X/Mo/ncFo0QkBgIG49cYbk+kUmSUwIKA+1eddFl80gHCE28Kfmd9AsmsZeSze6jp5TOb8slD5j30C9L4TMTnU/L4p0wa3VhqS2lutqkA/5wIn9GwhMZemiYouvMCkrS94v3q6pHsNIIyaoJapjhx6kEaYuc0gHabZtPLdC4iwcD+WFjAbYSXl87eBdYD3y3w26Vt1tpS2YnCn1sjIM0AFaC5cPcYVMZXEPKyry/kH/w62CF+g659NLLJoEGYl/XMFLmlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744096879; c=relaxed/relaxed;
	bh=k5VNPwmH2aw3WXLnBPncXSTUgUkesspgvkr7nkorUo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT34Lqf80327P5MEqJbcfmnp4NTDHiTn0WriRsttv8iH8QlHTDbfsBZ3xL115ha0yKxgm3BMbtSdmz7+Ic5UsrxYwc7J2rgTjMe7j91KMlymo0E/ReMaGp3d/SSI9hI549HnZZSPIKERbjlByAIaSTshqhkAPSObbUfiGRPoIK6zW0trapiLLPB3cmc+oydVu1KySRVIWRvgACoOSYVnSppm42VklxpGwdRq/VVti3c4FTLvXFmdULcHw3xEk4WVWTUsZrvdbzbdPQ+QIA120FFOR5j7hIGjbnUuS8GKDgd2XUltxLfR4ugOl2jIBKw6Jz5jhazXGk2cIrLJSNsqHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kYmJZnFL; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kYmJZnFL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWyDb0TGcz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 17:21:18 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so47292865e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 00:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096876; x=1744701676; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5VNPwmH2aw3WXLnBPncXSTUgUkesspgvkr7nkorUo4=;
        b=kYmJZnFLh6TpedYzVmcbp/lHrsQEMn1EM94r2fAouSw63F3jLksuOKqmni5gAcldiA
         WVzj6/ZtewoqC71/hp/PZO21ZxV7m0wybjjA4tDZv9fUmgNi+1wh+YHSrtsdb5HirgM6
         3e2AAycsm4n/32rSceC18IVQDLLk3aBRZCinXW/2l+7cEk5ezgITAY4pkTochlTJApgg
         uwJl2GOQcWMadRtSXOkrcebqEdOgRm8U0X1QssFn4lrMPi2IX7+HQzw+0ceRHuVk5nCK
         +dUzMInBJEoeBmhc64K60rqH9oqhXjvVsCdNJCr0kTOgkrrS2DgLv4Od99d4eh8kPRql
         QNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096876; x=1744701676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5VNPwmH2aw3WXLnBPncXSTUgUkesspgvkr7nkorUo4=;
        b=o3RW4xuwKk1vjmzq8B7JC90TBrrXIskKs7/CRdqiJz0j42hu0rkRwkR6SgtqoncCXB
         J17SrMs6Nqfh7Zlq7RbsSwPK85x0OOepgGCERHAKT1A8F95pmtRzZ7ShmGmk53i+BK/X
         JkhRASyxMKagpi3kAkr/NvWuke6kSvSBG37zM6V0/H/XuDaHQyXMMkVvP2CB42NLtZcC
         lqT8Nsx1G8oGTDvrLNIpQNN3+dol8cZ2XbJ2BfqN/xecPsmujg3VzQGKtXnxRRfgDnhe
         HwAdEbD4u5k3/LdjaTCgve85HAUyCZCXwl9/61JxtfNeuHGJl79czSyayHyiCdg73SHv
         vmAQ==
X-Gm-Message-State: AOJu0YzsVwxVsRhrJ+F6VRnbeWbAI+iRfee6x1Qgnejmk8FTBk0aOuho
	AwjWnI3atKFQHZft1dRnbYRmw3Wv4719qMqoTbkRx0zKn2dlWsGjGQ2O6Ta5APw=
X-Gm-Gg: ASbGnct+vmj+8+Z25chHvlEQX5ru2RsjnUAxOWMhBSHyvtismzKwj8t3esBYXAVw/q2
	0S6xG/REWX1HabYBDqZkEznLoWeVwxmUjZwzoLfed9NIVouSpREfzjYwqE4K2sLNC5eIafMfYzy
	QrpBovjxj2qPmAkQV96sJUme/tv0ZggrnURs+9GuwxBiT9/+A6bmmmlkLALs+wFJO4jx6E4QiHT
	QKLdOVSONO5ChOrZn1qVdmT9MGYlsRKel6TcB3KNoeaT4xvTVepx6ih5MA77ce0/BdVw4IiGt3+
	EK0sQR/xf3+IuFKM1eWMc3IAFENJWcGKQGPkRg==
X-Google-Smtp-Source: AGHT+IH4VtW25T5J+PjGlIaZ6M22QPow4uOtnfupdUllT2Fkt12p4tk7DF0T4P47TDZZTHY0VBHcAw==
X-Received: by 2002:a05:600c:3103:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43ecf89dd3emr156314595e9.12.1744096875649;
        Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:11 +0200
Subject: [PATCH 3/5] powerpc: 44x/gpio: use new line value setter callbacks
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
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-3-73dc1ebc6ef1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LL68VEJKE/MtZ6G9TyrymTnHIDLdTmXeqNGFDYstqEM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5msWyg7dgLldXdctL+ZK3AKOwzmS8REEK9k
 9AhwWrSKiaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 cigSD/9n9tAkmdjxn5eCjtFyUMEDYwobZytzV5we7jp4QTTClSMwVsjxPVdAuelo19SzpC5P1u0
 M63rtFA7UKIfwCv0qVMtTIjOfE5qekRqcE3rpWVC57w0YF1CCGAPPzX4gSvo4ldTxlu7j9Olyrg
 ZQn3QFnmn1IZKayoceAC15tLVl/eZ3IIX19k0JbnpHAUOesg3uiENYp7k5EMprGRKfUJp9sVGBi
 jw84x4E9W3dLHqOBTZgyxW8Ro/FZRteiUscoL10ecKjUZZ9toN1tt4dPuJr6U0hoGXZoVudteyo
 QSuCQ0tEqeHw4rm+fcKwwN/uE0U5ytmA3sr/g/eKPGTI487XQvuglX53vuusbrdEv8QlU4d3ReS
 Swe/4oyn+0HH1lqg1HVljkPFwE7PLSiRNCC5zvR2mqieXeCtTGiml4ml3rtCjWSnuwYP31q8ceh
 pDDlxxguynZwDlBEAy0HRpWqynT06o/p2vpwEpHkCKj71/iV/+H/3obtyjiI5e/WfMNvDBjszrg
 fl6TFPIiat950nUVd8hSd5ClC2Q8MY6OaTz6z5BdELRjbZy7cy3TDLR9zL+yfbANqQyfEVoJAWz
 wayOYSs1wPhwIm6pa0PfDng2DFrmIImzJSvnJrJTXLCD6abuuSpjIY7MGu2mTBoj2F5pJQiRBIh
 h/cCOIUgu6sJ2Qg==
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
 arch/powerpc/platforms/44x/gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index e5f2319e5cbe..d540e261d85a 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -75,8 +75,7 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 		clrbits32(&regs->or, GPIO_MASK(gpio));
 }
 
-static void
-ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -88,6 +87,8 @@ ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&chip->lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -179,7 +180,7 @@ static int __init ppc4xx_add_gpiochips(void)
 		gc->direction_input = ppc4xx_gpio_dir_in;
 		gc->direction_output = ppc4xx_gpio_dir_out;
 		gc->get = ppc4xx_gpio_get;
-		gc->set = ppc4xx_gpio_set;
+		gc->set_rv = ppc4xx_gpio_set;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
 		if (ret)

-- 
2.45.2


