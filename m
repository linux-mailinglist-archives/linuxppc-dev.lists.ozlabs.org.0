Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A188D5578
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:35:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m7TwUBgo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1Kc4Wk0z3frL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:35:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m7TwUBgo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=marilene.agarcia@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqL0t3S1xz79cN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 06:03:26 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-681919f89f2so121929a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 13:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717013003; x=1717617803; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Yw+tyisOoQIVKsFGGfntBjZv+48Mnl1871MjZUM50o=;
        b=m7TwUBgoxvX8SHCzuFkVdWflmPXvwrfVVafdAIYPApOAqW06z7zi6fl/js5Mh3c9V8
         yc4tVoUGovVDN8ln4+AVo6EhEajDt1DX4FCs/+7+ajxMJP1vYOFOLU0phu5NRrgqdp3S
         g6DY4y+uZc/wD6zSLggxeJGdco+Op1Ycx4B/oJ0dVKy/TqeemRyB6rkB3NzhsRGnvkCw
         ZxDgUoOumAv74HbWQGQh5Eieoqe+trb9+WQWlQR0H4rBzqG2f0fpxw+J7uNhxN7Ategs
         QaEjaGEPvc3qA1H3OdHVhLhbhjiCWhj/UOPoQtF3e84f+JxcaNEtejMFjHx7gG0E6c2B
         YPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717013003; x=1717617803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yw+tyisOoQIVKsFGGfntBjZv+48Mnl1871MjZUM50o=;
        b=TgJrxrbgEfHZ3scIAWvmWF9hygapJNsc2jL8YU2Z5xl2uUtD24qyNonr/lmhDcaSoN
         uZ3m6igCnyKLsFYGzrzNvbGbm8c8o3/S6orheCMSCTz7/L/lAneC7UyEUYWzHesKEu7T
         RIQ18n89JloPEPduW3fqE9fqaKaBscUd2igwW/3Byioe13KPQTTXjNOjFkjlZ2hyXPSJ
         JJ20U+vLjjrxFN1O79RPCAV6JT50IKeSKpGsHVwDaNJBNqNiFWqIwr8JUo7q68//lRTG
         ypF6CMmKn6VtpZwC/XgBodQElVbd0lGPHw3vTFGSZ4hSd1OaLkAYFroUbRL5H6qTi11f
         jWng==
X-Forwarded-Encrypted: i=1; AJvYcCWaQhjojVmo2C9VfWUdNpf616C9rhIjxaZAA2VLQU00a7cY8NW38+gk3og6hdPhhAi5s3lVZgokSFvjOYTfpKMf62pB2/5sM3fqQ2dHzg==
X-Gm-Message-State: AOJu0YzLgMzzioM2QZYXRgVgnptTztor9iIqmn3o3soAbj+yVhTc5Plg
	75FmsclTPkoE8oiBTsm4qWW4IgV2hHlj9dllngdo54o6ZmFNlMMFJsLkbyQL
X-Google-Smtp-Source: AGHT+IG7IdKzoHGQCcegnZ5ZEN+4I3xWMqeAiyKe7kepJv5SgpccOmkronM5R/00B3eceGnBZkfXoA==
X-Received: by 2002:a17:90b:1883:b0:2c0:1fe6:b10f with SMTP id 98e67ed59e1d1-2c1ab9d9e45mr170095a91.7.1717013003271;
        Wed, 29 May 2024 13:03:23 -0700 (PDT)
Received: from mari.. ([2804:431:cfd2:68a4:d1e5:41de:6992:6d45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a779e835sm192127a91.48.2024.05.29.13.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 13:03:22 -0700 (PDT)
From: MarileneGarcia <marilene.agarcia@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v2 linux-next] leds: powernv: replace of_node_put to __free
Date: Wed, 29 May 2024 17:02:33 -0300
Message-Id: <20240529200233.1188228-1-marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Changes v2:
It was missing a blank line.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
---
 drivers/leds/leds-powernv.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 4f01acb75727..8f94d2efed9f 100644
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
+	struct device_node *led_node __free(device_node) =
+							of_find_node_by_path("/ibm,opal/leds");
 
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

