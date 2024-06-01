Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23048D6DAA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 05:18:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B7JQVQq1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrlZG6prXz30Wc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 13:18:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B7JQVQq1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=marilene.agarcia@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrlYV4gTDz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 13:18:04 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f630e35a01so13397355ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 20:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717211878; x=1717816678; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJ7GhnPCcc9gG/fPcfKm9hLymSev1LXbQ1e2VPy6a/o=;
        b=B7JQVQq15tu5d+JtYFyXuTE2bHl7E2cmxKvOdKKK0RtAesYQr1V4fywA1tBcliD3gv
         LdJZug1fiFIiEiP41L0WGFrlGsBDlmpEN9BWYrEKiPgBBtdn/KLS4kwVOdR9BaNho6sR
         mDb1z7OEVult9Vrt9OA5fub3xyPX5eZlo0EKP1FwSeUqbfRYWFDQzH+IxebcOjRGLDRA
         78HKE+x56YhRW3BFxoX1snuiFf2CttMX6ZCTsA80RJhXAY6ejOAhrvdWdAlbMfUL/j4K
         eHK8UKQDiM+9EKEJglc8MlPmbcJOjtGDrvfALll9DYnEjCzTKEz/gkJV1k1Ktv/s5M78
         tdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717211878; x=1717816678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJ7GhnPCcc9gG/fPcfKm9hLymSev1LXbQ1e2VPy6a/o=;
        b=btiRMYN8/f8EcZbPeOAJTpebSEO8VnEQDMw82cs/ZZI7CqVGVl/gX+Y12osT45i5/J
         JPBsudpE0tp1ozQND4ZmoO197QmwBbGQrp4ZLCnYFTjx6m9uixAs26ndqm3Wh7NaOA3D
         u9p1eUwMnkYA+BCYWZoWka42n5xgEQecb1QguD5WyM5PHedrIoKFj4tTgg7VWjohnDoQ
         SIT1ZGjK9hklWFt9aku1OmZt+uQMMsCZnXrQdtEZLLIvyutSU6vJSbOcvukVaGfLwY8V
         8RkwoSY2aMlAT6pWtx4oWzREPfrAHYoQUkX+++CWa8afSgFdFwFRdw+bnaY3xq9RFIYe
         YNNA==
X-Forwarded-Encrypted: i=1; AJvYcCVoRcIGzRUSjFOp8zgNmNectvPEOvJdIiHjf5f0k2z8Uaf4Uy8JSzwOpk9hrBvegGduu1Dwv4bfUym8Z2GoJ/f4yxFi5zZX+J4cbXsXyA==
X-Gm-Message-State: AOJu0Yx8wY3GjJr57qviOSA+LwglqU47sDr6Fx6ddgz3t48U4vCfGKZo
	I7vKRheIz7cdDJi/w/K0H1gHYVjY7KaQ6RyhvyyW6JzP7RtS4dbp
X-Google-Smtp-Source: AGHT+IG5jigN++TXRW2Q8TJE0q8aUmrnSUVxfazFZCGbU4Se+asZ6b1Uehd1zrHky24bXUiclsr+ZA==
X-Received: by 2002:a17:902:cec4:b0:1f3:1ca5:9166 with SMTP id d9443c01a7336-1f6370ad6aamr39927445ad.61.1717211877781;
        Fri, 31 May 2024 20:17:57 -0700 (PDT)
Received: from mari.. ([2804:431:cfd2:68a4:85cb:da60:5688:b292])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323e18c7sm23531825ad.177.2024.05.31.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 20:17:57 -0700 (PDT)
From: MarileneGarcia <marilene.agarcia@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v3 linux-next] leds: powernv: replace of_node_put to __free
Date: Sat,  1 Jun 2024 00:17:13 -0300
Message-Id: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, MarileneGarcia <marilene.agarcia@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use __free for device_node values, and thus drop calls to
of_node_put.

The variable attribute __free adds a scope based cleanup to
the device node. The goal is to reduce memory management issues
in the kernel code.

The of_node_put calls were removed, and the
for_each_available_child_of_node was replaced to the equivalent
for_each_available_child_of_node_scoped which use the __free.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
---
Hello, 
Thank you for the feedback.

The line-break strategy was fixed, and now it is according to
the top one suggested.

The __free is a wrapper to __attribute__((__cleanup__())) so 
the variavel definition is needed. And according to Julia, it 
is preferred to combine the declaration and the allocation to 
ensure that there is no return that can occur after the declaration, 
but before the allocation (or more precisely the initialization).  
If there is no other option for the initialization of the variable, 
then it should be NULL.

 drivers/leds/leds-powernv.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 4f01acb75727..49ab8c9a3f29 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -246,29 +246,25 @@ static int powernv_led_classdev(struct platform_device *pdev,
 	const char *cur = NULL;
 	int rc = -1;
 	struct property *p;
-	struct device_node *np;
 	struct powernv_led_data *powernv_led;
 	struct device *dev = &pdev->dev;
 
-	for_each_available_child_of_node(led_node, np) {
+	for_each_available_child_of_node_scoped(led_node, np) {
 		p = of_find_property(np, "led-types", NULL);
 
 		while ((cur = of_prop_next_string(p, cur)) != NULL) {
 			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
 						   GFP_KERNEL);
-			if (!powernv_led) {
-				of_node_put(np);
+			if (!powernv_led)
 				return -ENOMEM;
-			}
 
 			powernv_led->common = powernv_led_common;
 			powernv_led->loc_code = (char *)np->name;
 
 			rc = powernv_led_create(dev, powernv_led, cur);
-			if (rc) {
-				of_node_put(np);
+			if (rc)
 				return rc;
-			}
+
 		} /* while end */
 	}
 
@@ -278,12 +274,11 @@ static int powernv_led_classdev(struct platform_device *pdev,
 /* Platform driver probe */
 static int powernv_led_probe(struct platform_device *pdev)
 {
-	struct device_node *led_node;
 	struct powernv_led_common *powernv_led_common;
 	struct device *dev = &pdev->dev;
-	int rc;
+	struct device_node *led_node
+		__free(device_node) = of_find_node_by_path("/ibm,opal/leds");
 
-	led_node = of_find_node_by_path("/ibm,opal/leds");
 	if (!led_node) {
 		dev_err(dev, "%s: LED parent device node not found\n",
 			__func__);
@@ -292,20 +287,15 @@ static int powernv_led_probe(struct platform_device *pdev)
 
 	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
 					  GFP_KERNEL);
-	if (!powernv_led_common) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	if (!powernv_led_common)
+		return -ENOMEM;
 
 	mutex_init(&powernv_led_common->lock);
 	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
 
 	platform_set_drvdata(pdev, powernv_led_common);
 
-	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
-out:
-	of_node_put(led_node);
-	return rc;
+	return powernv_led_classdev(pdev, led_node, powernv_led_common);
 }
 
 /* Platform driver remove */
-- 
2.34.1

