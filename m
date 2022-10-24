Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7860A55A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 14:23:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MwvPW4PWPz3bgh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 23:23:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DBx9J7RT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DBx9J7RT;
	dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MwvNZ01ylz2xfV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 23:22:52 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id z24so2524640ljn.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2dftzokVagW1NbsihVeFfV7KhU75z+A9+bOluSjCvY=;
        b=DBx9J7RTxs4jDAz7lRIoDNqosSvctOg1QPzn7FV2aLWeproz1aCaQMKhCB0IC3hflk
         NkBK2x75an1lKBdpdpEXOFGo1nSZZ8ixYHtLX5Y97Ka4rNU5VVoNmNJCNO5cJqjJFigh
         a3kVBbm7RGEg8m4dSmaDxAxR5jvwzF0I4+5gRZ/hDu9LEYi1WEteZ+1mSTgB9JxaMrEj
         y0tUaV5eSigbbQmN1B5fNYYjAgZ+57/ayq/i825n21I9+nNQHL5QjY45JssqSXvH//0a
         zPX6svt7+vfiE3kC+ETFbQb5Z+KonMp6d1BSctq0aPQux6wvxK8sgqGuTmNjCR+eHyca
         xwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2dftzokVagW1NbsihVeFfV7KhU75z+A9+bOluSjCvY=;
        b=nznk0M66UB1asHl7iHQOnGy7WdXCueeREIbNwrSrmTUoVBFpZBOPGnnQ9Q0EdAs9bh
         4dUwcAaSU1GdO7uTgMzdOYh0dECyfNB+3w3HGpZn9MQN2Fgse+KOaq14iS3mCJD+6zer
         Wf64+/tMrIiNvmcqgUxwDjrzKSeqOvfcqmDS1AjGUDGWDj9fiawjDaNbOWw7h8HuORet
         oNjL9Dt04vkYQI+TcqGVAP0TI/7BbvoOjbNVYNrk145TArygBTMIPXuWCI/bdHB8iuut
         m2SNbvTUzVTa5x6MUKL1W4pE9nlPVeeUz0PVlUogZeTKIxm2ZWhsJdPJm4EprL/UccNy
         A9Fw==
X-Gm-Message-State: ACrzQf36ZzzwzBHMEq4H8JoORPDjvpzYYlza8ijwNMcHMTh4lzGGqpqa
	GsRu8lVGJl/oCDZNMAJeuFETWQ==
X-Google-Smtp-Source: AMsMyM41L8nLr9Hx51j7f3hQp+pQCT+pio/X+snwW/xqXDxG7Hix8S7fRMaXs9FJJRTFfMPF0garoQ==
X-Received: by 2002:a05:651c:1590:b0:26c:4311:9b84 with SMTP id h16-20020a05651c159000b0026c43119b84mr12835020ljq.152.1666614166054;
        Mon, 24 Oct 2022 05:22:46 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id 6-20020ac24846000000b0048a9b197863sm1858671lfy.235.2022.10.24.05.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 05:22:45 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH] soc: fsl: qe: Avoid using gpio_to_desc()
Date: Mon, 24 Oct 2022 14:22:41 +0200
Message-Id: <20221024122241.9463-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We want to get rid of the old GPIO numberspace, so instead of
calling gpio_to_desc() we get the gpio descriptor for the requested
line from the device tree directly without passing through the
GPIO numberspace, and then we get the gpiochip from the descriptor.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/soc/fsl/qe/gpio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..cc5602b679fe 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,10 +13,8 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-/* FIXME: needed for gpio_to_chip() get rid of this */
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
@@ -161,6 +159,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
 	struct qe_gpio_chip *qe_gc;
+	struct gpio_desc *gpiod;
 	int err;
 	unsigned long flags;
 
@@ -170,14 +169,21 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	err = of_get_gpio(np, index);
-	if (err < 0)
+	gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), NULL, index, GPIOD_ASIS, "qe");
+	if (IS_ERR(gpiod)) {
+		err = PTR_ERR(gpiod);
 		goto err0;
-	gc = gpio_to_chip(err);
+	}
+	if (!gpiod) {
+		err = -EINVAL;
+		goto err0;
+	}
+	gc = gpiod_to_chip(gpiod);
 	if (WARN_ON(!gc)) {
 		err = -ENODEV;
 		goto err0;
 	}
+	gpiod_put(gpiod);
 
 	if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
 		pr_debug("%s: tried to get a non-qe pin\n", __func__);
-- 
2.34.1

