Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8E60DD1D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 10:35:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4My2Dt4b4kz3cFv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 19:35:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RF5f23X3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RF5f23X3;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4My2Cx0STcz3bjQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 19:34:19 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id j16so7543867lfe.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNn3eWuA3AWM0RIAow9RlqRwoa5twz63NOiZnmeo3eQ=;
        b=RF5f23X39jnoHypbuiZJzhbtfAW6XZL6cbsFW1s8Uv7PWpmGdMp/INQMRrzfSmRQ4A
         fSSt7Eu89X1jYp+RZ45VumtDisnkVcHqQQO74X/hVeLbgXhVtSQXiPd6GQd51xBoOy+O
         FlmXkZ10naRWifVjfeulWz8ap+47VkkYoSZfbus9ie8WmyyHojDBhHsv6xVqrrBubnKy
         2zgj70y0L+BazIVI8I3gV4F9HUzGDFtUxu5fM2png+4wPhH/R81/QqU//X2D0C+9maSj
         fbJ55tgRMf4ncBD0oMJ/BlJrRJ4RAqWorPQv6rDJEDhB3cVfU6vBMiqes+UmbI41fD1l
         lyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNn3eWuA3AWM0RIAow9RlqRwoa5twz63NOiZnmeo3eQ=;
        b=PcjqUXQy7RCU5a+4m4DRW7/AYXMej8+beTjVKrFf4r8c/Ax+AWhts3aItl9O06Dfsj
         CFbyS3JxUDGwo9Sfp18YDmcO12yupR0w2vIy3zXSCn5lcKoyO5giJVscFeEHRlkvU/OS
         /FjlSZ67+Lje64fNuuCSXrgOtFYOSWwAjdWkLb3uf1GrKGlgOcqDX6TzFVaomagPJL5X
         vkOeEVapZqNXRR0RLaBLURKXV6J0L1gfMajOx80ID/JOHU7NkWTrpBL0KdTp1bC6+sN/
         MzTzJ0B1hk6j1+9n9R5z79LEBYAj3xwtZvefl7ZaPQgbRM6PPXOTfhnYz56NVf43kLhj
         0Epg==
X-Gm-Message-State: ACrzQf0ettGltT64yXar+6ePOAmoRrR2MZ93wPYOHhuudehFog8OJYCD
	mXawNIO0/BK3XjJ8QFb2uNcdEw==
X-Google-Smtp-Source: AMsMyM7BSY2ZR8CJPxdKa0hNALY8JKlCUFoXG3mwzoQaU+1XeZe6e+usB7xjmYEWbXbXpTlsXWBvlg==
X-Received: by 2002:a05:6512:1289:b0:4a2:61ca:319a with SMTP id u9-20020a056512128900b004a261ca319amr14584527lfs.428.1666773252759;
        Wed, 26 Oct 2022 01:34:12 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651220c500b004a65780e4cfsm761516lfr.106.2022.10.26.01.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 01:34:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v2] soc: fsl: qe: Avoid using gpio_to_desc()
Date: Wed, 26 Oct 2022 10:33:48 +0200
Message-Id: <20221026083348.107431-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Add back the <linux/of_gpio.h> include: we are using the
  mm_of_gpio_chip, which should be fixed, but not now.
---
 drivers/soc/fsl/qe/gpio.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..68d48430ab33 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -14,9 +14,8 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-/* FIXME: needed for gpio_to_chip() get rid of this */
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
@@ -161,6 +160,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
 	struct qe_gpio_chip *qe_gc;
+	struct gpio_desc *gpiod;
 	int err;
 	unsigned long flags;
 
@@ -170,14 +170,21 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
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

