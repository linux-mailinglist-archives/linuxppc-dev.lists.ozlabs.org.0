Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FC4CC1F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8b9x5by7z3c94
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 02:53:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hpCU71GD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hpCU71GD; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8b9D6nWBz3bYZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 02:52:47 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id j15so9210905lfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Mar 2022 07:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yC1JsxwKRkTkat6RGqvj7iumhirf2LX4rUgPRch1A3U=;
 b=hpCU71GDl+I4m+CMK1S581Y0RRpukP1UQNeqYjAhIgdBXkA36siD0K6Vt3yiIrZpz6
 I6+5GCluNEZtgKuMoliPtpvVa7808qFadK/R68AAkrueHjax6zGkkB0Jh3QJb7aljfcp
 eUDA02+nlvbo7AFpJPvLFYXpvPj46XZHVjD/Ib9BGzucB1B69cGfSynFAA9N6gks6I7v
 gAO84I5PHVM+EocQnYuDW1IxVWfyMsFpDYSiPArIL1OQ+ImkoW+wrSFbWswcCvGB/r88
 bfOo2niKOmvdxT9ZhwP2G87IkLtMcFr1TeQDh+r1q7eCY45y437FV5lPqlx71Kja/W5T
 XW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yC1JsxwKRkTkat6RGqvj7iumhirf2LX4rUgPRch1A3U=;
 b=s+QRkOVEwAJaEDrk7TAgYNWvFzg9/unFOztPEFLnLEGJ/TkDXhRRmF3pZ2asiJstjm
 +6Qi8CUYjiL4ZfSEnEDW/Ga30925liKoep+ziZyVn69Zc3EIHu8vmkCBKVEtDRR8OkWO
 NsJkDBuRg1MneVZosc4XQg04H7rfsEXQqAGapn65awRsgucJ9dGlhawVRa5uXVlqGqrf
 8pVxEkurXVhUuxO3WOeh7b4OILJJgsIQhBdePkxH48881oPRltC1NjoZVsC8WKQNw3da
 lodE/xMfagk5ezqLQUKyvocCbb1+bNNvPVaCizgL0AhhP2tq8JoHg+L2blY3KvEcio9b
 iUJA==
X-Gm-Message-State: AOAM530X45q9OzJMWMg5gYGjhqIhVdIuzzKRyO8o9JMYXmFHldZisZ/7
 QJF3W4aRZ6QtuG9CPn78oMXyUg==
X-Google-Smtp-Source: ABdhPJwW2HoABV/uj/rFfX/E6UpnfYrqHjNKdUn4HMXvb9VPhOcB2J3ZAxUicBozLnGmoRYGOVx/WA==
X-Received: by 2002:a05:6512:33ba:b0:445:7cdd:3a4d with SMTP id
 i26-20020a05651233ba00b004457cdd3a4dmr19066255lfg.315.1646322761320; 
 Thu, 03 Mar 2022 07:52:41 -0800 (PST)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id
 g23-20020ac25397000000b0044331de4945sm495801lfh.54.2022.03.03.07.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:52:40 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] RFC: powerpc: wii.dts: Fix up GPIO I2C bus
Date: Thu,  3 Mar 2022 16:50:38 +0100
Message-Id: <20220303155038.54709-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Albert Herranz <albert_herranz@yahoo.es>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This portion of the device tree just looks weird to me.
We have a standard way of doing I2C-over-GPIO and it is
a separate device tree node outside of the SoC node, not
inside the GPIO node.

Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Cc: Albert Herranz <albert_herranz@yahoo.es>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/powerpc/boot/dts/wii.dts | 43 ++++++++++++++---------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index e46143c32308..2e51100d2dab 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -192,31 +192,6 @@ GPIO: gpio@d8000c0 {
 			#interrupt-cells = <2>;
 			interrupts = <10>;
 			interrupt-parent = <&PIC1>;
-
-			/*
-			 * This is commented out while a standard binding
-			 * for i2c over gpio is defined.
-			 */
-			/*
-			i2c-video {
-				#address-cells = <1>;
-				#size-cells = <0>;
-			        compatible = "i2c-gpio";
-
-			        gpios = <&GPIO 15 0
-			                 &GPIO 14 0>;
-			        clock-frequency = <250000>;
-				no-clock-stretching;
-			        scl-is-open-drain;
-			        sda-is-open-drain;
-			        sda-enforce-dir;
-
-			        AVE: audio-video-encoder@70 {
-			                compatible = "nintendo,wii-audio-video-encoder";
-			                reg = <0x70>;
-			        };
-			};
-			*/
 		};
 
 		control@d800100 {
@@ -268,5 +243,21 @@ eject {
 			linux,code = <KEY_EJECTCD>;
 		};
 	};
-};
 
+	i2c-video {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "i2c-gpio";
+
+		sda-gpios = <&GPIO 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&GPIO 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		clock-frequency = <250000>;
+		no-clock-stretching;
+		sda-enforce-dir;
+
+		AVE: audio-video-encoder@70 {
+			compatible = "nintendo,wii-audio-video-encoder";
+			reg = <0x70>;
+		};
+	};
+};
-- 
2.35.1

