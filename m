Return-Path: <linuxppc-dev+bounces-8247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13791AA6D45
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 11:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZplHL3Q9Wz2yrt;
	Fri,  2 May 2025 18:59:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746176398;
	cv=none; b=YMeHusqVHUXe6yYXnT10/EoF/E/O+fVFlVcehfjocH2/huoWpItevyQdl4PlrnoBHGYZs+BvZA+NfDMuZS9tk1kFluLVQd8Ta9W7FnAJq2sPBnU06KAMCsYGZaWdOJnCCYPnFwzXtTrwXcjED3pe/c6AC+Aw0r2v3orDfR5ztCNxIclkPL1f3gDT8BUziKHYKHa4VRoV85BxXPazK69o5HN66OA4byvTPPOutK1VOdcJ2KdFIYk/IX56VpbGyfTDQ+VOuvTaCYsuwgugPCNdJArDiy2O9TVuXQ+/lC5g5DqvY1b8/azkXjDFm1MpIKf+KPIIT2uA15qy3NchhPBUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746176398; c=relaxed/relaxed;
	bh=+ctFdlWFJvdPBkAi1+fMGSkHP97NEJ9/Q0ezwvzkbus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n66A6hMm3NAHNZcOrolQ1PkFSnmM+bCc8Ot1MkigidOm2vQh7AjfUOp+2iqDsMl0TvhQj5TB6idzOSCTTe1zvJaCfU7Er2Q0v1H+q7CK9rU7bKICQ5/KiXUcxHgQ2h2Oa2EBLNjW8n5IwIC2yVWTCgY6XnQzkWRq1JL+RXm+gIDGY+B+iYdNreC5KUrzTAA2xzzsCTGA1smDh9ekIj9y3g881HwS2NsxICnO3mZkBJTFlG7YdWvOL8NyHf1cF1RRIC+sQTeCdSnDUeOWkOQ3KEWMxa1QXy21zaHLz31GstaN2Usd6IaCTn6uDaQkpBsujlCA/CFHNtcQDkcitV+bSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EY1VRF0z; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EY1VRF0z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZplHJ1k3wz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:59:56 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a064a3e143so734655f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 May 2025 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176393; x=1746781193; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ctFdlWFJvdPBkAi1+fMGSkHP97NEJ9/Q0ezwvzkbus=;
        b=EY1VRF0zUdRTUnckMQBkeDFD7TDZ3JhaDPnS1fAKikGcPb/9pMmzkP89csizCtCmCx
         Rti6FHWiFYEO4umL2mMcLXTBNjsWS5Hnu56IGWNkGmEcyxIFzX8EAVmCIRIRnH0+fVGt
         /T73wsTxIMFVKwyCsDZyCa5au3RJCjWZ534VCk2pUS8sUlDhHAeGCca3GdihF/Cf8wVU
         MXJCiXmqW0hU14HfwtrUHLvRENXnNnwueXPQ2I0zYExv++98J9koSXGv4/LmneR60YT4
         m+xsu4hS3gGNhrFu2T3Fv/L5alrARPkG2ndRXNvZGva6bnSjrT7k7bgxLNJXN4cytgTZ
         HTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176393; x=1746781193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ctFdlWFJvdPBkAi1+fMGSkHP97NEJ9/Q0ezwvzkbus=;
        b=G6XqdcdypVBnjNvz9DrMYKhhd1sW9oc5um+iIfZ4HqwWiRKt22x7MvCZnuYfz11+7d
         2xwHxH51yoiAaZzGKfCWdMZ/D1txL/Zjo7uj5Kjkte5tJ1NcRyJECwb453kwKJuQ9Qh0
         gFQ7TUaGsE6NCBBeELh+qnXTQBULza0Exi2gKC4UB9eEEZpTWH+gxa0gm7eeiFc107i2
         khTKLNsQupp6oumGcFIqUTAZjidHk8Nd+SkYrpezJtjrNMkTujryJ67JZ75gaz9tKowz
         K9jQgYSDAWrUMkgVJwTtoMszwYaqEgNaYSIFQ7naQIKSZfQia88YvhMSJDBJlSMsEED7
         1xZQ==
X-Gm-Message-State: AOJu0YzOqSufHs770+hxQvdLhiiGVr6Ux+aPPuz0f5lnNaK1cKHLrs+N
	dh0vZ/9DH6ON7LCHTz6znE9oO/U8uRJvnrUyUpK68anmNhHMwdmMCu+c8VO7sXA=
X-Gm-Gg: ASbGncv4F1bS7t5Bf3D9wQ1mnp0jqnRcC4csTYjaa01EyK5E6cbSMoUczJm8HUYhw0P
	nBqnMcaaFDraqB/1e88AVqACwew6JEXsDCvEwxLu9rVna6tL8gtqvpRI+4mv9eO3Sqtmf+lxWqy
	NouXVX0OFhHyjS9/JEwfO+OEIuw2yhS/CswSJavBknBrA9B1IO3WThE+E3WfWKDN39glNZT/6cY
	gsgolZY+klU4za8sd3hPp3RIgmMYc9M2qvtmiHSpp/gWEaz73LP7UNsEWE9s4v0La6SKHyN8Ozv
	t1EuG+Y269hzhZWz1AqysReU1++kUZrQZIc=
X-Google-Smtp-Source: AGHT+IEEQYczV66unx0kPiJW+nrPEeBzFXGbGRagIzFOWe+h/OKFXs1Aax+0KalaeWUyKNcJAnCWjA==
X-Received: by 2002:a05:6000:1a8c:b0:3a0:8492:e493 with SMTP id ffacd0b85a97d-3a099ad2772mr1416698f8f.6.1746176392472;
        Fri, 02 May 2025 01:59:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:47 +0200
Subject: [PATCH v2 1/5] powerpc: sysdev/gpio: use new line value setter
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
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-1-488e43e325bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=unub8yX667IH17idZRyuiKjEw23zeZPtyjlcM+1WGx8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImEg2NIMAwbx3dl41TeaZx3sbL3vCBOIk0Gn
 +tM9lO2DySJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhAAKCRARpy6gFHHX
 clAnEADEb6k81gHxYU30oVcF3o5XKWH5s1upUtZc76+5BwdbhRCyIYBnQ/QP3vpRCFKdaOvmHG5
 lVmTUY4I2EI68GzfZWu1nUzlGDpmHxrvFZUvrFJGy6L9vtcJARterMUF0V9Eye77Tp47QNN9Oyt
 AFchM5NCrOcqS2FGeBjEj+H5NBVMniaSOl1ANPLPGoUZgi0knV0q8VWAA9XIQagdBiVhePe4O9U
 pv0CSeY9toXhZBTawevU+L9OrVxsuraffDTIm5T8I/sdU808agYCxUb81VhEX4Xeg2VU2vbD19C
 wSb6b7QWwBxBbDm/9JDfM38Jdb3u5PqltOJuXIbFirTdrwuJbex9CoTrvSlLuyhVXLMDx7IriGL
 gmdX73bMQ1DyKDx4BPe6suEFXTUiVDG9xnv592SZHsYwZqi0TnXO2XpOHk56NMwcuIHi9DVhuQ5
 wRqNyGjx5EzAwS+A9tdt8KtTokNSfTjOqYWJBZMnmbdX4wUIZd9uAuRzeCJQ3n5x5ukITNUHY83
 +31cKS/MQfRt9UPk7n68YwazZrVqecoEevbiScE3zb4sbnKCZlGC+XEPG4rjMGBfbApTO8Z7Eoh
 kr54j18umaXDf6u0GTtw8EXpg1uFAgA1x5stvQMydbMTOdSOOXExCNO/HlvlkNjzyEGCnt/UgpA
 rr6ajzkeTTumccg==
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
 arch/powerpc/sysdev/cpm_common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index 47db732981a8b..e22fc638dbc7c 100644
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


