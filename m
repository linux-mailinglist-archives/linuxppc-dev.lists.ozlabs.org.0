Return-Path: <linuxppc-dev+bounces-8250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B8AA6D4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 11:00:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZplHN2rGVz2ySk;
	Fri,  2 May 2025 19:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746176400;
	cv=none; b=VGpGwJvfNBzSKnNt19etLIOCqxz1el9rnrNfZTM/Ytc/55Sm2Ij50sMkykvnM6xujJKbE+Z8NeOvIE9JnOWIOkply/xLffwOkRmwo3761B1yd6qxb4ydTV3m4CxsXkxFjcyByNx6pokoWBNGab64KI5yyNLRYlgtbvjVNwJyNnzfT6eg2SI0VQgYOBOOMte2Q6VzSD2RbuhLc/1d5/HSKXgwQEQqvjrsfXvA/ZqmCf5pTIz3bhJHZMtXdMmEww/fs+cIXDLPs389XfRByzMzJ1p0v3W3QoJu5lNbZJKMyCw9GCYyZ+E4LsjplnM0aSarsYUiJYsuCwAQC3DLqyKJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746176400; c=relaxed/relaxed;
	bh=c6w8Ny2qh7Oi2mCqCFAeltSr0IHxTHSshWp0NZpEQtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGNITH8oP5mjcD/BhAFIl4SZf6sdE6kPChVpJsUS7OefRRbzLkuTP3JVgSreX4Fg9YEmFyNuwMjObH798zwwIbPt5DOrAMvPLQoobbrmwaEmL9J/A1qJeI/bipsZS8BdVuah2Bl5XIUrflpyWYkhzO0DstcpEziM6Hw16KYZlZchnluFgHcdxcU/wACqN0CsEcKm/rG0EHoKSdT2tHVYSugmqh7C4EKTWwBAUMSFG68vP4GJYUtb81Uwl5HP8g6sz3TaaThA5uGEDwX02MaH5s8h6TbJxBE/oUgCdWZAbY91CaXx61gla03qaxN5QVqsEtxjmbkkQvhk9kIMLcq3aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tWk2CrHN; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tWk2CrHN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZplHL5KXpz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:59:58 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso1508530f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176395; x=1746781195; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6w8Ny2qh7Oi2mCqCFAeltSr0IHxTHSshWp0NZpEQtQ=;
        b=tWk2CrHNBmgAOb29FGWLPfeUSyuupPkNN6i4JjJrsMjG+14XuOIcWn3G8Nf1fT8c9a
         1p/HUNz8I4ayUcSPAPLyYD2Y3I2XJChEA1O+s8HyiUI7W9IMhFBfAPr5mmivRi1koHJm
         Oeqyfu32B8s1HxhvXkd3B2iU37SLOAf6Se4dpnsq9UdLYBAmotIsSeZPnNjunK19MiHn
         p/vc6Jt8/SY+etFEBGVaJ/BcN5hexaORiVNGjmb52huyYt/tVqAUgmhN7nkxbx6OCFf3
         DlSgS3UTP/8Rzm0vU/ih+YijrTgmZb/Cr4k2VSEg5qWd5JK77kMSTj5rx1z3OXt+xgBk
         3n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176395; x=1746781195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6w8Ny2qh7Oi2mCqCFAeltSr0IHxTHSshWp0NZpEQtQ=;
        b=gxi9K+wWZjqP7yo6ifWoQu/wJ18v/zLm9CvWGOVDJ59hsH2GPBDwksnXT4MYtlerj/
         Nw5WD/cQR3THrxTuvsoG5a9ltJ5RMsxtymJXUgqW7Y39QFnV/U6nh1HFNvUesG4RToRM
         GttFS8x4/vCIdOAKTRy2nNKIJiMRab6ojWOMw/s3b8iv3RYR1L7BgGZnBOddOgwPXWqp
         MQ1+z2QqzZ09ubOplugGK1y88RwQa6yjCHCQ4Dj9DAJymBSuO9RE1zfiBdUESN8VCOjk
         oeVtkOc/t5mkybyyYnN8BYcyqk+8zh/P+twDnVlf6dJ6Fr3ohNVvQrPlrfyoYcJ5/Tj/
         wbOg==
X-Gm-Message-State: AOJu0YylcYYsZaCAQJf7C7OIznOXkUKVD6cTijMh01S2iWHv2+6RXbev
	5aFxi833q7b9c9KMTh8B8QcD/IuBl1Pu+0Haz1bvFfHC1KIS4I8pWwJWR6LQqaQ=
X-Gm-Gg: ASbGnctL7rCjPMPqXChBnzNf+j6xf+o39kAYasoS+BSbTOez19K2y34lF6h1Xl+eBXI
	h0eTdYPeFa1NqEfO7uHC3exf77yjr2+qQ7LIdT1zduF/OS7NR73bKUc1nhvK2tfo1avr0bvTok2
	87/PLDtIvXIBPogViuRY1VrOKBhBU2/Uqda7Ji1Ypl48BfyhFiyIEqdKgPHIyyoww4THJY9wsua
	S1sSKFSnJ1BvRNHkj4VCALqjHYv1Bnw9OF1F397ATke+aJuIYdURQeC4kzFQjWv6reKcKzT8mtH
	C4QZZ4FDp2UqkDvvzQfy2lxpsieWwkv7ZrY=
X-Google-Smtp-Source: AGHT+IGnuPzW0KsZuoafr0ut25yVUAE58QEXlIHKEBz/4ug3rf9GaFjAL3GjFqvtw7oASpIUZZCL/w==
X-Received: by 2002:a05:6000:2ad:b0:3a0:7af3:be8f with SMTP id ffacd0b85a97d-3a099ad31cemr1489449f8f.5.1746176395349;
        Fri, 02 May 2025 01:59:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:50 +0200
Subject: [PATCH v2 4/5] powerpc: 52xx/gpio: use new line value setter
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
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-4-488e43e325bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NUv/Cv/Ma42p5cVqxLaXY/iK8aY4ZJdMZfYarvprRRM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImFEUTAydQAnqUBWcSczhRxoDxw1FtPObvJO
 Cps9EWCTzaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 ctNvEADegI0ahN7DjfRK70i+3mbHNjJm9hEqWx3KvwVKsoM5dD/Lkpn2urM861oMuobssDB/gcE
 DbA2cu+7NDPR0b+KaYiEU8JJ5BvmUpmTg09PVE/paQdwKat4HoV6icBYsyMHJI9ZZg9Vbo2EQav
 FoMnIzOGzWzbrqdUg6jyaaiQFMqhkbafZz1QVXvN2ZKuYbkwTLxLyq48nKWRTJUlsOTpmLY9kAv
 DCCAzdjB8yk8zEXXdAaEKLsoXZwjR6cwdBa54HDS6vPGP8iioKYpI0sOxcsxIAyX3woKy10zuGf
 tJuGP1S7Nw3/HmrBmtsVe1yTgdnQYY9te4AtsrBPo7A+Qe8FbkiUJcbbwG1qQc1sB0nO5kn5Cj2
 9o/m/6lcqCxlfcVcTenPlKMlyIMMVbJ9j9qV/gDFhDxnKHZwY4rtTo/8C3TcgqxobElqQuEK65O
 BIcVEJUqyvLGwd3JPg21ifkC8tQ++TuyrXzYGTnjdwm5bMWWkyKpOiC0W762gmVviUqRHG1x9aA
 zYw9pfUPGHaAQLTeDArAu40iBit+zJBYbkA3kfchXECSfhyTBGacRZZrgbfq/M55mbahzq1kFtA
 8gWJE/qAD8A2LLIlIugop7WeyKiehQIs2Ox+gKZA0/PxIaVU0RhyHAvi5AJDBvWuN7YMXvDSGik
 ecRAgo8SfaYFF9A==
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
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 1ea591ec60833..c96af6b0eab42 100644
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


