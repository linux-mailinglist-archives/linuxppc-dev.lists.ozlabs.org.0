Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E38D5577
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:34:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dW10up0t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1Jl4GR3z3fnV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:34:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dW10up0t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=marilene.agarcia@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqKqf2n0cz794Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 05:55:24 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f4a52b94c3so1121785ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 12:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012516; x=1717617316; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeUDyLz07Yf4A3ibn/qcJdcShL7dSWLOCdG8yEpv21E=;
        b=dW10up0tFIJwDlS0nJwrQtMPNX4moj+QHf2bhNfzlEn8+yUN2IoZA7eairgnOfDgS5
         /rYIWDyfKE/1XOn9+qq/UMNKLGnN4LlJikOyZ6Ea3G4W584f+/Dau/G6WYYRPOosE+Oi
         MnmyAqRhUmAiKwbev/5rvT9pvpHTfDnSIMsTTlhdXDzHvcKUDMdhDXY3S6qnqbzYHcmz
         +1d8WlVeIqQ7Iyj3ryfQrVwJkWdCuf9tiS2ihwB7G+m8FgyP6/iClMj4zZBlNSiGmwpr
         Ts1dNwq5TgvmqbfsOySVw8KhlaO7j5N3CqJnJJE1Yzg0oSsTIZ8rcdMp7gc5+UoyatMC
         FUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012516; x=1717617316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeUDyLz07Yf4A3ibn/qcJdcShL7dSWLOCdG8yEpv21E=;
        b=Sm053677yL7E4z9x192C5vzJXEn0MA/T42o89JU/JzcVAL4KvD+Jymh2cmjygDwMZe
         iHu3uoL9lT52KE609VjzkWQBKzw8Jebzle0imH6dtCUd36CZ46zzIWavEa1nqVEwiB5Y
         H17B8UfmGF2/KZquD77ru9tRwTQ1A5z4TNvfW7RizL/NewQi1o38Fbij/LsCQ9BHUZC8
         +ZC2opcZLf7zhoKAix6CsxcGFRX6dUjgex7J1PIApArB/7RXO4Ejkf//wvxvMmw5u/5I
         Z1xFk/474lvaSWeATbXzSPyiCMHLXVZkTtgm+Cb9ZK14V5c4+Vf3VrA7Cz+0h4Op1daI
         9SFA==
X-Forwarded-Encrypted: i=1; AJvYcCXB+2DgmTPZIrKRZJ+bT1I/0cGVEVDKaa4Mmn0IgBQ0yr+qYFeUY2YS7kTepUgRK4hll86WUpw4LUJ4ofYU/IeUB489yjXy9/Klazxahg==
X-Gm-Message-State: AOJu0YwuPuEyiIl//l24BLBrjoewi3JaRN+wBLeHUM7Fsv5B6GzvWEL0
	sU7RnvCf/atU1kLPMxBidUEg1BjAiXSEbhbvDKZx/dumAkQHk0Xk
X-Google-Smtp-Source: AGHT+IHhMDqWPEjxt7r+Lc3nVAdOtTDOEBn2i6vof9omWzEupAsWiqDbTT3kDVtrCqWogGRWHq5S4A==
X-Received: by 2002:a17:903:184:b0:1f4:8bb7:6842 with SMTP id d9443c01a7336-1f6193faa4bmr422435ad.8.1717012516258;
        Wed, 29 May 2024 12:55:16 -0700 (PDT)
Received: from mari.. ([2804:431:cfd2:68a4:d1e5:41de:6992:6d45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9684bfsm103990195ad.140.2024.05.29.12.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 12:55:15 -0700 (PDT)
From: MarileneGarcia <marilene.agarcia@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH] leds: powernv: replace of_node_put to __free
Date: Wed, 29 May 2024 16:53:54 -0300
Message-Id: <20240529195354.1187882-1-marilene.agarcia@gmail.com>
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
Changes:
These changes intend to add the new __free cleanup handler 
to device_node initialisations, which ensures that the resource is 
freed as soon as the variable goes out of scope. Thus removing the 
need to manually free up the resource using of_node_put

Thank you.

 drivers/leds/leds-powernv.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 4f01acb75727..68fe47cd1a4f 100644
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
 
@@ -278,12 +274,10 @@ static int powernv_led_classdev(struct platform_device *pdev,
 /* Platform driver probe */
 static int powernv_led_probe(struct platform_device *pdev)
 {
-	struct device_node *led_node;
 	struct powernv_led_common *powernv_led_common;
 	struct device *dev = &pdev->dev;
-	int rc;
-
-	led_node = of_find_node_by_path("/ibm,opal/leds");
+	struct device_node *led_node __free(device_node) =
+							of_find_node_by_path("/ibm,opal/leds");
 	if (!led_node) {
 		dev_err(dev, "%s: LED parent device node not found\n",
 			__func__);
@@ -292,20 +286,15 @@ static int powernv_led_probe(struct platform_device *pdev)
 
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

