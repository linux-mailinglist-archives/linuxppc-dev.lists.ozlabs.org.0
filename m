Return-Path: <linuxppc-dev+bounces-9244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B79E3AD36A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 14:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGpJ10TsHz3bmS;
	Tue, 10 Jun 2025 22:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749559137;
	cv=none; b=gUcdSyjbJ41ukVxUQxmOZjlTDcjXB+cdkzmexfCzPKqXIAe6g33rUDGy2jtuEAn6mTB9wsdT5jqmfYcFE61M/hBaOMhLpyHP2/vFE2CRH9WTLbRHH+2mfcdZ/4RtTXCCGGDpTpqE1E3M10NB8DS/p123oFQme7IObXCDJmGlG+2RdHHMSLmXiDgZQvtEppJEyfD3toJVEsmrJV3wFK3i6ZvkZa2JAIjGuVVKhHhl1UkagGMwWM680CwSM98cBGt09hmxvy/QejmDLsqlAPcZa5ra5KbLMc3vFW51X8B9nJQs31al8W7YaMd/FeDdguSKHaZ9yT6ED6Cs720i3mFUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749559137; c=relaxed/relaxed;
	bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZSOOf2VaNwCN3hig2mFYoIBivy7v1W7iZsT9uDMgBXe2R3DLW76saHUrx+JU6dZr52+81le4+OOX3TiE3GrK5SyNDjp6ctI43dqFuar22azaEk4kl+oxyMDMg3n8En/KLCG+mfLQ6Oca+VNqsbaOHjgLyEfShhI+PqvoncatLDAaeD9/rb3Xwq7RSXhcfq4sqzxfGRoGDr0n/WlsWcBcZNHC7uLKtotBNfAtYNwWZtYQY/LyyysDwSSo6u+KLGKN/n/CO4RKv5G8XMhLauaFLVFn5+dLLezw0oy+q7r40x/ada+y3opetI33vOmMW1akiIDY+1JCpTvAAcPcW+9tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=C6oscups; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=C6oscups;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGpJ00Snjz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 22:38:55 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3397140f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559133; x=1750163933; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=;
        b=C6oscupsr93GKLAMydHVy0TfHYoQkv3cLIpnlkoe5a3taNoWoezEnkbCf0xanRFl2b
         tMq0VKlaxR1L8cduoRBgPrFK7kPPXpduzW53sCB0ST5CIw44kIHBHi/fRzazmMRBKUMe
         JO7LM9ZnHuTgssvmK36yiahMeASBxDTgyqWGtB6hFsyjQNjX26v2fJ/wm1YHh+v6liYc
         1MB+S1lIaGId0uSlD940pPhD0KPBEfPgMEX2/kxZUr8cVVnBBbOlb7IyoiydzIk81E+t
         MtrtMFXNn/IN37VX0BR7FDmWcJ+SAWguq3sKWbJyfLU1lx2UW9q5qsrIZK8b1XCLO8um
         zeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559133; x=1750163933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UED2MPPB6ErGPf9SzqxWrhbWnlHVANSe4cIFIu1q+Q4=;
        b=tShHefelnwRcbXvn1tjUXJEHubChaGkS0VRSmk9udHZP6BAUEgxSK9k/szwx0Z0CYk
         2BECd/IMDjFgPhRdmPUEqTYIbzbWO3WJu8Xww2vrppMshgdM+QSvxie05BH7k2MOU738
         klEz2BFGECjPslRTfbyDOboJ9BVE0bW6LdB/l8bcXhyW3q7FYiaxE5gqUK136bSeaSdD
         7+9+i9hiK6Phe2mxBIOPNUcsk7TRu2hJiyL0bVsF4i5hj5u3NcZq7Q/EJ85B8go+Ba0y
         aN7Daq0BPJLeKewAtLqL3CBkWX4eC+iOwIHc5cG2xzNn3hePDBHM/xdm0UygU0uwcsfX
         hPYw==
X-Gm-Message-State: AOJu0YzitoGmChK+EBwCUy0AtU3mLv0QKZOuFGUXfki2R0uM/6Gsbnvg
	V9HVktqCWtC3cICsJcQ5rk7ZV8gsFCaDJvVxyYkAav6/V2mYS+p8vOhQ6pUqBpuq2Y8=
X-Gm-Gg: ASbGncsbLtfdf3RjJ74sSaOdE9f4N6B53C5RPY52qA6pwsoGttuz3tcD8Bf7fo/3tV5
	fBhKOXUmUFcWeCGZidDYUWxfEkWLg+WMp5Z/yZDtK0rS7FflBBgJ7j76TS3z5lHuuGsKGp5iRe/
	dpLq/pw8yH9d0JllSBFwaYO49B9P6c2ge3BEGPoAbjifdbipFDYLWtATBecByyTUjVnwcCqQYNI
	/H2fEDr3nvoS7WOz2n8VvOEjC0yeuyqevb4IbSrCFC+xp1BFqj6esOoaDd64qpj2HFda4P61uJn
	9kDlg1+GmafYSteiojEDxcOH3ApSGDm8ffwKB8on/9f7kPMtA0+R
X-Google-Smtp-Source: AGHT+IHJRkQOc9mKKTqisqkycJt9sb/TgcpVTi9hUVKLOOQP54qkbtSmSLteeeLcL9Fl+UGpgwdsKw==
X-Received: by 2002:a05:6000:2203:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a552272cccmr2256652f8f.21.1749559133197;
        Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:50 +0200
Subject: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
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
Message-Id: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4MWRLVrsy5tNHMi8wmFGL8LdEv5y9p4ltDubDqUCng8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCdbgSaqAglGw/fi7XTf6vhd7I5rjcyoaZ7sg
 u/b0JAesI+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWwAKCRARpy6gFHHX
 cphAEADbU+UhlxQiORUaofwF5dUuYRA9iVQv3yEvZ+lXlQEGEXL4mX5gYjUS9d/xWjS8CHSJ7Cq
 +UUe2xk0NLgsm1fE9SV5Hp9SGQqqcFdilBX5lGIJE6tLOzFdGjtU7fYNlmPPebz7glzebbg04jE
 ETaOEIJoVn9KS+yaFocnqrbFTt3PqOHhjVGrwcZSxuni3nf4iy9Yn6Gg9RjT4sZD7LbZpvPIu+q
 VSJ+OiSJrKaKNK5BWfpVcUBV9ozDfUURkd8lrj1eN9zVE1/NTQJtKzVkfS2kpgOOq+DQajEzPiL
 9oez1XcOjWsvIfe9qQQSofbZtZz3kG94oqWNrr/VOpx6LGzqwgol7ozx4fGlykaa5QiTn5sjxcV
 zrNQpp0DoIf1xjwAovdNq8vE/SKPAPYAwQNlpG4Xjp7WZEkJxxmN6fbikV2Ob9wkRDAgy3Xo1gG
 yYH2FlibMDX7OGlZ0/QrG0cjBY4OyPJN3UUJUimhaU7SG+orUxraxwl9IA6V2WwLq4NliXgLm5u
 8SwuKGtvYzhiFoyiBDDCnKRrkWFC+s4ZLD+GnjEobklVaxgM2/ctCUotBi/brbm13+YbqYOUiUd
 clq8mYqQHWeM1/nbk74TqSGNVNjSm6iFxQ3CZjMr4FgR0E12kdYKX8d1UgJ6kye0WkNWDRCGsSN
 4YqcJKc35stS1uA==
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
 drivers/soc/fsl/qe/gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 3ef24ba0245b75471ffa10f579bb744c0c3b7e43..5391cce4e6efe6d120db7fdf7509dc5eb840f344 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -57,7 +57,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
 }
 
-static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
@@ -75,6 +75,8 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	return 0;
 }
 
 static void qe_gpio_set_multiple(struct gpio_chip *gc,
@@ -317,7 +319,7 @@ static int __init qe_add_gpiochips(void)
 		gc->direction_input = qe_gpio_dir_in;
 		gc->direction_output = qe_gpio_dir_out;
 		gc->get = qe_gpio_get;
-		gc->set = qe_gpio_set;
+		gc->set_rv = qe_gpio_set;
 		gc->set_multiple = qe_gpio_set_multiple;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

-- 
2.48.1


