Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B416B4731
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 15:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY88B3c7Yz3fcL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 01:49:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.44; helo=mail-oa1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY86Y55rVz3fD0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 01:47:49 +1100 (AEDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-176261d7f45so6035823fac.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ID/16gZQInzWcaBs1M1mfptd9VSUgb+tugMOzAC8KsU=;
        b=6koDFyqtLYcXcQ8pMUligGYPDvv7mMD1SVzww6Y1Xdfksup/IoJl4GUGhUwSLUtP9g
         /f8lOdVEIXIuKnh+ZeGTWMQpCMtOr9ntmEnu1cGoyiQ9xTLe4UkQku3ngFQLOTZ6FvR/
         wPGSQ4eaM/aa4nD/OmEKqKJeuVwoq+Nw1lrjK5f7zJ971DU0rjdSyLS4pb6JJW69JLbe
         95ecd9EhCFANFVqEhI6AkE48gF82WP3F7eC5qN8iIQsKC7U9Y/BfpLQ4GEV/QJstjpMo
         FBAViGX3yH53xmRX6uJfm7s/5tKydzLowUkoXPZbhCZTEWISGT3bHendkt1ePwqq9kAt
         jsTA==
X-Gm-Message-State: AO0yUKUvsege2cCj0LJqsCp47bryrIGMKgZko6/mokpN9nTJ+zBDfUvB
	svApXYzaot8bT0HvxA8h7Q==
X-Google-Smtp-Source: AK7set8iMdxoxX6e9GXoSjEAewkax5Eq5eSgzgKfIZDW+mCXcojVeKDYzqPeei2DVVH2V2SRVlMzRw==
X-Received: by 2002:a05:6870:e0c6:b0:176:8f34:2609 with SMTP id a6-20020a056870e0c600b001768f342609mr13990149oab.58.1678459666806;
        Fri, 10 Mar 2023 06:47:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p10-20020a4ae14a000000b00500c1100651sm823158oot.45.2023.03.10.06.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:46 -0800 (PST)
Received: (nullmailer pid 1542482 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:06 -0000
From: Rob Herring <robh@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] hwmon: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:06 -0600
Message-Id: <20230310144706.1542434-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/hwmon/ibmpowernv.c | 4 ++--
 drivers/hwmon/pwm-fan.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 8e3724728cce..594254d6a72d 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -456,9 +456,9 @@ static int populate_attr_groups(struct platform_device *pdev)
 		 */
 		if (!of_property_read_string(np, "label", &label))
 			sensor_groups[type].attr_count++;
-		if (of_find_property(np, "sensor-data-min", NULL))
+		if (of_property_present(np, "sensor-data-min"))
 			sensor_groups[type].attr_count++;
-		if (of_find_property(np, "sensor-data-max", NULL))
+		if (of_property_present(np, "sensor-data-max"))
 			sensor_groups[type].attr_count++;
 	}
 
diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 83a347ca35da..57928d270015 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -427,7 +427,7 @@ static int pwm_fan_of_get_cooling_data(struct device *dev,
 	struct device_node *np = dev->of_node;
 	int num, i, ret;
 
-	if (!of_find_property(np, "cooling-levels", NULL))
+	if (!of_property_present(np, "cooling-levels"))
 		return 0;
 
 	ret = of_property_count_u32_elems(np, "cooling-levels");
-- 
2.39.2

