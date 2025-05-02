Return-Path: <linuxppc-dev+bounces-8248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB8AA6D48
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 11:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZplHM1rk2z30T9;
	Fri,  2 May 2025 18:59:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746176399;
	cv=none; b=HRq1gK8RLB5GGXGQkxGKDQ4KDBqXShIpgSml8bv49ZnbaW3dRVsZZTLRmeCvhQn+MU3y68WyOhCS19uayYloX7vGLl3fmdUkvngmZ0wpenE4euAv1yh/2TLKdv0ZhaQxSa8SCTyanc7BmpNqtS4LvDZ15Z2lU4uwsgMocqXptVOFgBvNvbKX+0scTKFUU889cYVBTOjze9lf7xO133b2/weBFKuqxG0J1ERbZ1U1sotwP1GbbhayatMNNTtVGo5HKrpmZSsf+Ke8yRQa1h4sxfKNX0/ySNC/cfGvwbfCglfioK9VP71PksZULrPeeayts0kfg1wZ3UaxBEqGEwlawA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746176399; c=relaxed/relaxed;
	bh=7VQVpAhnQOcCRYJ0IuR7EAkGj4zu20WsPxA2gwCBLx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrF4XmQll85Mm1CmN+f59HDZBTf2bYo+RQtkS4R+BV7xQfkes82v8TONpyS1U0v9MWg9rOSKIKawruPr2t7YQtvJpip/5v5fK0w0sqo8FD93ViIrFi9Jbi39sM8DnOAa8deG3cfxP1tjUtp0Vex1pzIj5qNv9wzDbXv9Cj3QRqvV2oP+DJVhMvgnutrnHialNkkNfhai1yUxJ3oUaD3y2xqe9192HGGlFCEBp9M8KlrPP8kvCjWtdUJbyFNfGUNzbA/OfxsfgdxNR0EE9ZY+jjYQzI0yNCJrv1JpWp5t/6/KPVezWxb+bfSajkx5oAP9QOvX1slePMJB5xCCRD+fhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=k5FfmU4k; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=k5FfmU4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZplHK1HmJz2yr1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:59:57 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1053727f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176394; x=1746781194; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VQVpAhnQOcCRYJ0IuR7EAkGj4zu20WsPxA2gwCBLx8=;
        b=k5FfmU4kbCSNY+4s0VhGJpuuqtS1bJMZoG+NQkWf9GY6EuID+2A+0pIVDDOse7ecOl
         kKIcj2FNZwSlj5oi532HbVb3g9Ui/6pKa/vQ0HgmLOifeGTfnLPVfpd5hh6eDRZ6p05r
         s/X05cKPq8zxrcb0GHj5PHZ9gWvpJZWxT5RaBZKdfJzpNTkIXqVMDq34Gb+pExfQHT67
         ST6vyVi9ws3/CsDdIue+aPcuJ+ZRoYXy77OxRw5JyjfqVtMQQzvio65Qu9+Nib+dG+kD
         behxC/WcmYnthWADd0qjLCyiVYfvQKl8CqAPYZN/FZzlwdZVFa8O93QpuGsAxDBA0vWL
         WtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176394; x=1746781194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VQVpAhnQOcCRYJ0IuR7EAkGj4zu20WsPxA2gwCBLx8=;
        b=c504DutO7k3MYqC7ok6M+jXiOPn1dSMwmFVMC2rElvAF7knJGZDK1XxGQvL7gFeQQv
         rJlNgtJvegCeHnG7jnc2lepMsDWVJ6rNLvJk8jNAfxzUTvXO77Rw25m/l1Ikranz0POm
         mDwowZm48sKodPXEXrdd2MDXSGvJ38hYO8G1HcJdNJTVuJcGmb9qoPas2MSawZOg5mV9
         c4C1Xu9Z9kwclxGIGbOYzrvd84yfq6AJtumpa+7GhM8MM/Ib7I5H3bJwzryGyUL/M3rk
         ueTpbWpLng4BfeHH1fLxPcBiC+lA9OwpRwntHVHwVsetZ7lRGTihgthI78iM+vfm0vFy
         M01g==
X-Gm-Message-State: AOJu0Yz+5gTWpgavOxQP/VW8atsPjf3oMOk7RfDBTGW3IUExpd7CRe47
	NwDd8G3rfbSClsW+z6RoaL1PfwaKTiru0acgIw94Cq2VAoewkAQ2dJqkOgdyuu4=
X-Gm-Gg: ASbGncupeOH3Q/s4qU8vLAJDU22TZ2zyhgLwwMb7Q9iL6ERCHtQSMT9OvJiHtK+XfZA
	TkPa4hqDm+e/BHLN7AJ9I8xGxPyFbdq/9pt3tFV7OBYSzuWn+UdQy2GX7PxqV1xAyzSXIfnf4Od
	mauZwlscCz3mcGtZKZl0M8Z/RRKOuSJORm9fgydw4RReMvO/yu2M3tRZUyV+SnDcKJHv5K24qcr
	xpBMlwwkeW8sShQMbnsh9hnxnoBAFtws8oVkaMDpEhLKBihKcUv2/OUyX/mVXlv6vlekOBBpG8o
	8jFI9Fcly7hXPOXsU5IUYGLah1VmXP+9P1bKEP37/fHOHw==
X-Google-Smtp-Source: AGHT+IHQBxxYw4TPkCVhivNKZQXWIM25Cnsq2fJIJFroZbvmM5OL56pj85WS8b3cNucOQHIYyCOoQw==
X-Received: by 2002:a05:6000:40c9:b0:391:b93:c971 with SMTP id ffacd0b85a97d-3a094058683mr4162100f8f.20.1746176394370;
        Fri, 02 May 2025 01:59:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:49 +0200
Subject: [PATCH v2 3/5] powerpc: 44x/gpio: use new line value setter
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
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-3-488e43e325bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=E7Ff3/1EcYz2Nw6QSP2p8LNuROZlM9cH/LUaLu34ItI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImFaUc3gwNuye/ggncACVXaJIT/sGhSnQxG1
 k8BocsYj+eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 cuKeEAClIackuAKdOU+yl0nzsAvzc25o+JND+09tQcnbWh3AsifpuV7rlyzUrzurd+n71xUXbBh
 awXQhZPFM03p2pHjU8sSoe03IWWl/P/iUQFGfK3UFx/dFs6zbSSmvCrUQR43C2zLhN8WmBOwGpD
 vOa4MEAW+pXxdy/M2U8w2OQDBYIknSvZr8q+QNpm3v2aTlKJkXmxQ4s1m8HnsYd/KxgQ5lZ/ooB
 RgdkMP1NOrVNSASt0s+QJVYySccm/6xFXSgfhZPF4QN87mFgRnVxEW6ZMOzJ4SENiWPrKxLGmpz
 tQpB+JIWIs5aOa4fuWDe98rfWqUpHnxJ0jWKMmb1rdmjR8R4QYQq3ygwJXhP6HSxJs0om1niN4/
 SrrDwUSyhNNIp4EicjN3o15Sj8wJ6pIbQ5oDNgSiiiQNq8kTSa6apDB9p/SbZPO1IYe7AgjPtUR
 Finp1+Ml4Xqh45uqDF/rpvHaIdjVuAorJXbcNbLRYJ6MW8cPj6se5CVDixKrvgYH+3oC8MDkxAQ
 wHyyy/EMl2ZtLXCot4mdnb8Da5Nn/0zXT8j0syLnFlsgoEASpOqTT1V2/RYp15J+Oc412XmMnrP
 4qvzerCJIicUdBfX65VXU1iM2RR5zud6VbTmAbqQvm7x4RZyH497DL72cGrNKnipgTI3q1iTaxs
 RutDOCWUZ+MhTSQ==
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/44x/gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index e5f2319e5cbe2..d540e261d85aa 100644
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


