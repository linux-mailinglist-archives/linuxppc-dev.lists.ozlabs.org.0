Return-Path: <linuxppc-dev+bounces-7513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB060A7F5EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 09:21:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDZ5j9bz2yyJ;
	Tue,  8 Apr 2025 17:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744096878;
	cv=none; b=olDUfjze0sAfDqzNfoaARjICjF5gSHexCnsdvH5HNQbdCmr0ycA6VgaeeyeDAXrQ49+zTH5a8M81r8JgBJ9A4gghX8VrPEI8kc/PmYqbWktdtgL7kLKGSQxxzvEZTzu4JjP0kecAwgw7/kN9TXJR9r8G4dcPL1up0v+zO36q9dJgZ69A3tcx5Z8nFo/w//KGGQDn6CzgEUlro2OK23Kdlz5tnQK218rWj3qpyVOdFBVYlWq7po0YiUiMRqhS1YGwIN2zVjo25ezYgTBWuFaXwqm3w61GeGGBOWdsYY45Drui/7nLbP0Y/0t/1J9YrSPuCj3e9v7NKVIp1MDmX3y6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744096878; c=relaxed/relaxed;
	bh=6wE8TQ/kC5Gw6LravAsHxdU7HVea2/Xz35EGN35IBRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9sq0qMXu/jqo/oSM++u1OHXs4pePP8YOt/h1DQV7QToFDYGRtbpZ98EGGgKcFvjwhYkNUJM5q2lnAZeGfaoYKyJOnvBeHj83a4DHkpTVMjUuIuZvG9jRvZFuKICtp6QtJC+EQmJgA1PXMQTpn8a5qGkaDVSg0aYyMwtxyEGQNxWVOwYGCUdMANhpU7AgCJSBUEdsERLSGxrUsr6HC7Q/NntQB7D3uZECfInTcyfEq8xMNWWLY+rcwfWbJI89qbMBaR2uZkYp6HENnu+LsDWZEh2D1zxWoXWNRMZKTTIOQ+/j8SoKTzylVgylqI37JeuTC1AZr8HeWiUfW7CUxMeoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fCURo7OE; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=fCURo7OE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWyDX6RD9z2yrk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 17:21:16 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34152435e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096874; x=1744701674; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wE8TQ/kC5Gw6LravAsHxdU7HVea2/Xz35EGN35IBRE=;
        b=fCURo7OE14SaxSxXXi/eVPMHmuEBDFxN7js70OVolQl+lc/OEaySLCrcPRnEZNxGYG
         z+k+8MOqkU5IPx7Do/sYXdtGWhEHcwwOcrK0vqvCP1smUqY1s8xPYTw6IxEfVYQIlbzW
         q9deZ8HYmpz1zmT1aN/rkLK9mHVAeq5fFZXORqW7SpmFo8ZOrd6VH+JNx+i/n4frEO/2
         fHJhQbxapxAB0NEa4eZk9Ck61gOVhNAVfWaXJ7QCYUDlMNAaSbHy/CNDPA6lSN165lVW
         JzGdSZDNSoevRlvV+MpdOHsyrnmVprpE9Rnrrp/WbLNV6aR6t83fuWoxyusuZBitqUv8
         +D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096874; x=1744701674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wE8TQ/kC5Gw6LravAsHxdU7HVea2/Xz35EGN35IBRE=;
        b=plg5/VtExl7eFbpujAwrPMdulsCcGGtbICyfYNBeEWb8l6Fqswut82r0Wd43O03io8
         cncw6x/PGOWdqBcVZCGuB5iGfmij2xPbMXXyW/19NfoUZP30bvuQRZ5BV6+kauAG1ILQ
         FaFh7XQiq9QZKSnYRfSNPz0WWHFOyfu57GL8QnjG1aYmdYuSQqA3Ew7ts5IhITH99oFB
         pD5sxOGYqe9vpay86/eKtRWW1QviYUL8tkPn4116v1DyFJhPmyv4hXdNmDIJZ8eyTvB7
         XZ+bcGMBiKS42aoFT5AmCn4Wv7OXq89mjkhcvy+NnxyubM/0ktSSxsGRfateavNRgboD
         vhiQ==
X-Gm-Message-State: AOJu0YxPp+tSfwhKyjqP/j3eX3KaNyM7kqN4XhhswbOgFKC8QCqq4aL+
	10viFTJFmmre48bt3/dWTDqkp2JFiNICPJj7e3wJi6mhMqT2/SZF76OWvjGCCD4=
X-Gm-Gg: ASbGncswUVkIteU8oSskmvRO4+P1SmBag1B1DdlDNp6yB5jEtMw5Utusf8SOBqtn1/n
	vAy0pK0bd7br/4OoJyzlO22PTKg0lsLQOR0dRPnTHHlpICHwbSpz3yiWHNpIdWUGyiwJUg92HUT
	2LYNRec21NTGlqyHnmsMdLp5PB5aFQIbY/+MhIg/kkopbFuKxOCqYgiPgVyy30gWqXuu9R+UtrY
	izSEtHKJ6Ld30M/go9SkARJ7kWG39sUjWZjViSmluJCn6sscMqSRNdE8cbnfKg+byi5QAj7Fg3s
	j6BHxkA09fGj/67f/USOWF4PQFRyuxaJKPzTbg==
X-Google-Smtp-Source: AGHT+IGlERrHqVi1qC8FfhdvuV397D2yqL6s1YKuhUH7GEN8bWhP/1UK6ZgmfnUxwxq/O6rNRgufNQ==
X-Received: by 2002:a05:600c:198b:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43ecf9fed70mr120686755e9.25.1744096873779;
        Tue, 08 Apr 2025 00:21:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:09 +0200
Subject: [PATCH 1/5] powerpc: sysdev/gpio: use new line value setter
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
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-1-73dc1ebc6ef1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i76qJt+Prqn6FRHBSKnAuC1THRUFVaV9XqqCXjg0eY0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5mUvt+4lLGPJCp7pGcUJyi3hfa1RzNMiZSk
 SZvUFz9DguJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 ci49EACpix94RiRhas3jBzoubO7P2DaiD1iTemCLusg5lAl2gI8c3y5nVaHmJL1Gjj6vWvQI4Fz
 ifbjRgY/H3TcJ61f9NDS+Rg0PZgEUGamwwyBaUHwh++ghPvV2TQk7sgh843biDJ/svliUX41LFy
 cAWB54sEvynIQ6XKNELIZvx4CHHm5oUdJmLRkRS+EGbcWmmzQMF+/wH6YuZ8B9u4zuGqhuJvyk0
 ygvfj1ao7GWWqOIWex+pJNBhid+tra5Vx8RboCWRFNhS0F4BHjEsin/gCnZNYq3EHfMBEwD5VPs
 qYm1w/Mp0Z/RpgVtT8lj4s7O9BzPRlvbKkqAznjKaS6m0O/8h7WnJMlThB27vCy6FBimgXKax34
 5aDjK+GalcUNKpJDuYQ+2+MzSK1n5X8X+tBBYF4FS7u0UOFIQISgZJ5NcGaYcOgXTww6OSV6EoV
 ryoVFRuGfFpuaA+H203Rq11yvGzYQFUAJPDOkUrzGrLV2aUcahCv+lAXTpwsKn1yuw8YBrz4eqr
 1RfGYuIXMZHdLm01+nyz1/6pFME3V3KXUej4ekjMPuqk9imHyOnFMcs0dQG2GhtBspFHtUNhKO/
 9hy2Ub4uqPQMlrUaQmBxun1yvG/j+y2es37MygmZzk2V+4WDnGOV1S4IatJqadFXi9zc2SQaCxm
 bEe9bf2DxYVQy0w==
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
 arch/powerpc/sysdev/cpm_common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index 47db732981a8..e22fc638dbc7 100644
--- a/arch/powerpc/sysdev/cpm_common.c
+++ b/arch/powerpc/sysdev/cpm_common.c
@@ -138,7 +138,7 @@ static void __cpm2_gpio32_set(struct of_mm_gpio_chip *mm_gc, u32 pin_mask,
 	out_be32(&iop->dat, cpm2_gc->cpdata);
 }
 
-static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct cpm2_gpio32_chip *cpm2_gc = gpiochip_get_data(gc);
@@ -150,6 +150,8 @@ static void cpm2_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	__cpm2_gpio32_set(mm_gc, pin_mask, value);
 
 	spin_unlock_irqrestore(&cpm2_gc->lock, flags);
+
+	return 0;
 }
 
 static int cpm2_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -208,7 +210,7 @@ int cpm2_gpiochip_add32(struct device *dev)
 	gc->direction_input = cpm2_gpio32_dir_in;
 	gc->direction_output = cpm2_gpio32_dir_out;
 	gc->get = cpm2_gpio32_get;
-	gc->set = cpm2_gpio32_set;
+	gc->set_rv = cpm2_gpio32_set;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 

-- 
2.45.2


