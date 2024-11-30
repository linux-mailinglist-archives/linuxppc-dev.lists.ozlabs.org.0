Return-Path: <linuxppc-dev+bounces-3620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 808139DF166
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2024 16:02:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0tZl1pXzz2xWT;
	Sun,  1 Dec 2024 02:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732978975;
	cv=none; b=jdZPd6U7S4rXlaswNKiJR2k4ZBAJ1Vh2iipZ5lUmVcOz3m7tIMqcG6b/rYf3mDPvlmUtY1z28PaMcnh35ihBZ+jfL7a1fr5EnuzSgeBiSBkymsS/JepYk+n6KyVcYexcBSmzYq633kjHtgKCejy7X18YC8iaaTkHLmkiVfqJ5611xBOvKAQchYPt3JFR1PRpW3de6fF8VHAhtf25Z+aXbhFczDrGSNLul4BfNjkGSVch1oGOWy3Zo1ZzzoambpwFwgKFwBGDrI5i/m/AEnX6aeBloyJ8ZdNGuT3NFnizozM14pPo8ziVnzkHy3jIaasM71EF+Xsg0OaH/AZb44USmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732978975; c=relaxed/relaxed;
	bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VMLGceKnwLOYzN4d1eL8BliA0DNK0v25qzCFvt/1hmYraJO6f9PyCXs76LxMC7tdEPZnyM6UGFCojW8VEip3DhUQXJO+JbXBRXoSs+2TUKTQZQB+8dsyB3xTlYiQ2z1v7r7BwRM9AuKNsoAF3cL3rKvcG93FxB/U0J7lqXKZUT60+ZfoaNRHaQwNKJlBcvlH81draJO/QbN9Ed8YsJw21Zp2hqeIJwsFoL39sD9wwBHe37pCioLDR9GwPkwkVAZd9WUbcAgN/q7C3i8O3ulXVvOV2pv75wHFUy1UYeUuQZnfxPM0mC7tPA6Dp0UsaEnUtT7Yustv1yxivrJkYnfAQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=IWnmCUrQ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=IWnmCUrQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0tZf66Kpz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2024 02:02:47 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38232cebb0cso2179995f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2024 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732978960; x=1733583760; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=;
        b=IWnmCUrQaTpLpZnpKgdOdi9kw94vPwNSCVUIzLy/dOJOIiC0fH1U+ZY356egDwUN37
         /tmvhNR2VHsXnxm2iInvGvIs/g34sZ1jNgJ9TsDp7BB2/49DT2TpDYLidQPRkfg2mgC2
         sHRS8AHyyQMX0omvITVzSn9ohYCR6laCoFLSGNx52y5yvKtMDstsKv51GXdiTeUnYzEo
         qe4byr8MDze2eSfjiy48MIoEt3oO4TJ6EIJ2JSBLmPOvKhkXepLyulPizBnl6Z+/HLCD
         cgWQXJdLtPeMtzMr/1A5SXeyLNjSlQHIWtNAeH1MA1SOvbHrRPRJvEsjp97by26PSRJe
         ogYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732978960; x=1733583760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIxZuzxWCmBHTdYELBwFpivm3cvG44kmtDreOahc6FI=;
        b=QF3EuGWNlfrH9XIZk4JbbpXHnWVxThkFbEYB3J/4ZZ6YKUAHfIgJaeHvIAO8MNjL2F
         5+YRsyuvllvTaAA4tT4b9yJ2N1cLCHodtLGXrHG8DicansV2mjCKWfycAHcuqaoi++E1
         rsSQmsEKoONFYdb+lTrINmpfV7ls5bS+4IWk3snvGpUqRnHkssEqZ1e/eAAbbcty0Bt4
         ORWGn8B9iQvXY5BnYqEfGD3pbAktNyu5H32CXUyDy/0oKRnfQSrdYv1IhtXkV7d2c4U2
         jZt1cZPyKV0dCFqxJL0CO4p7DZ4pUx5aR7xuMUMLfEqeG+6yey2UPiS+NBMYTZ/kcuPm
         IKiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfbmspuRcxc0xncuhXi7MGomk0+yZ00yE4ftlA6ZVoFRrEnSwbRusrTJt9gfLmkuVvLdeftNsLDzDfHFA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsqUuxLgLMK5D8j4O/oQKOayEvdQRG1VG77dpKXyrFgQakD21i
	Xb/6oZad1nPIQYbf3u/0d3K4YKu5Eh6UdpJ+a8ocyOlcxgMun1I87mbdGT4sBI0=
X-Gm-Gg: ASbGncsBcQAFzWLg9i/5Y05tUuJHa0b0oBU5ED0iJAnexIZheCiYoO19KNnBw0iHM0L
	055tSA+rRwDUas6CczIpEUqKs5THzNIhAo+PaHQ8YWuYr+1EulTRHcSSVJQZdRz6mhgYzMkTxkx
	A70wq+9De/fTDHBffay2tKzY2M8izn73TsKqV6qJXc1xQaa/ZjGBFodwWmvggEuaxr+epqtTehR
	IB5LQJ/LrHsCpkiqv/Uy0njx4+mDW7ACTsNGRVnsNOZFCi9iA==
X-Google-Smtp-Source: AGHT+IG7SmAgqLWpO0w58FJsWRhtR3KnnLD0aUy9Ativ6+ehPD5OdDccednlqkuUW6sKW7TgS9z6Nw==
X-Received: by 2002:a5d:5f56:0:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-385df7330bamr5372688f8f.51.1732978958736;
        Sat, 30 Nov 2024 07:02:38 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:7ca4:5604:f5:65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7611af2sm5979701f8f.22.2024.11.30.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:02:38 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	John Stultz <jstultz@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] misc: Switch back to struct platform_driver::remove()
Date: Sat, 30 Nov 2024 16:02:31 +0100
Message-ID: <20241130150231.900755-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
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
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7078; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=1zRfjh/TbGwcSXp6t+/CfaYBgE6ti0sCaNcOyp9qsIY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnSykIDZe9lqJpeaZD+flWQcLxbEmBh0Sux49lu SV5ovm6vmaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0spCAAKCRCPgPtYfRL+ TtyOB/9YEH0yxGtL0vZKsFbJLnEoT7d0IhAdw1TIS3Tu49473WdlyNzJjlbVk97uJZ5ATzOH3/S RQleqOs5gDX4t53tpB3MtLeAwxz/sfHd0fmKOvAJMxiVANNndwZzNkI1NFsC8qMdwewk2OWvCgc g+rIGbQ6E9n/WnqNFVgbm9tb26AkONi25AuHbk3raB50YQl3S7J+mFFcXaceC1cqMHinsT2wOjW pSbyH+FtZM5vKfi39iZxeH0qf9XaKA+v+5jIxt2yPzS+HRz7Qlw7u7fnPAMUeE07Gb0LsQaXgBo oWlNIHTHc+d9uyGKGhr6BGfKM5YS+f4xXhodbR78ItTZsAoc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/auxdisplay to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on Friday's next, feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

This is merge window material.

Best regards
Uwe

 drivers/misc/atmel-ssc.c           | 2 +-
 drivers/misc/cxl/of.c              | 2 +-
 drivers/misc/fastrpc.c             | 2 +-
 drivers/misc/hisi_hikey_usb.c      | 2 +-
 drivers/misc/mei/platform-vsc.c    | 2 +-
 drivers/misc/open-dice.c           | 2 +-
 drivers/misc/sram.c                | 2 +-
 drivers/misc/tps6594-esm.c         | 2 +-
 drivers/misc/tps6594-pfsm.c        | 2 +-
 drivers/misc/vcpu_stall_detector.c | 2 +-
 drivers/misc/xilinx_sdfec.c        | 2 +-
 drivers/misc/xilinx_tmr_inject.c   | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
index 1d0322dfaf79..35a196341534 100644
--- a/drivers/misc/atmel-ssc.c
+++ b/drivers/misc/atmel-ssc.c
@@ -269,7 +269,7 @@ static struct platform_driver ssc_driver = {
 	},
 	.id_table	= atmel_ssc_devtypes,
 	.probe		= ssc_probe,
-	.remove_new	= ssc_remove,
+	.remove		= ssc_remove,
 };
 module_platform_driver(ssc_driver);
 
diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index 03633cccd043..cf6bd8a43056 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -339,6 +339,6 @@ struct platform_driver cxl_of_driver = {
 		.owner = THIS_MODULE
 	},
 	.probe = cxl_of_probe,
-	.remove_new = cxl_of_remove,
+	.remove = cxl_of_remove,
 	.shutdown = cxl_of_shutdown,
 };
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 74181b8c386b..412683e0ea86 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2215,7 +2215,7 @@ static const struct of_device_id fastrpc_match_table[] = {
 
 static struct platform_driver fastrpc_cb_driver = {
 	.probe = fastrpc_cb_probe,
-	.remove_new = fastrpc_cb_remove,
+	.remove = fastrpc_cb_remove,
 	.driver = {
 		.name = "qcom,fastrpc-cb",
 		.of_match_table = fastrpc_match_table,
diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
index fb9be37057a8..ffe7b945a298 100644
--- a/drivers/misc/hisi_hikey_usb.c
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(of, id_table_hisi_hikey_usb);
 
 static struct platform_driver hisi_hikey_usb_driver = {
 	.probe = hisi_hikey_usb_probe,
-	.remove_new = hisi_hikey_usb_remove,
+	.remove = hisi_hikey_usb_remove,
 	.driver = {
 		.name = DEVICE_DRIVER_NAME,
 		.of_match_table = id_table_hisi_hikey_usb,
diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index 71f9994da2cc..a70e64acf571 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -435,7 +435,7 @@ MODULE_DEVICE_TABLE(platform, mei_vsc_id_table);
 
 static struct platform_driver mei_vsc_drv = {
 	.probe = mei_vsc_probe,
-	.remove_new = mei_vsc_remove,
+	.remove = mei_vsc_remove,
 	.id_table = mei_vsc_id_table,
 	.driver = {
 		.name = MEI_VSC_DRV_NAME,
diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
index e6a61e6d9427..24c29e0f00ef 100644
--- a/drivers/misc/open-dice.c
+++ b/drivers/misc/open-dice.c
@@ -178,7 +178,7 @@ static const struct of_device_id open_dice_of_match[] = {
 };
 
 static struct platform_driver open_dice_driver = {
-	.remove_new = open_dice_remove,
+	.remove = open_dice_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = open_dice_of_match,
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 546eb06a40d0..e40b027a88e2 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -451,7 +451,7 @@ static struct platform_driver sram_driver = {
 		.of_match_table = sram_dt_ids,
 	},
 	.probe = sram_probe,
-	.remove_new = sram_remove,
+	.remove = sram_remove,
 };
 
 static int __init sram_init(void)
diff --git a/drivers/misc/tps6594-esm.c b/drivers/misc/tps6594-esm.c
index b4d67a1a24e4..2fbd3fbdf713 100644
--- a/drivers/misc/tps6594-esm.c
+++ b/drivers/misc/tps6594-esm.c
@@ -135,7 +135,7 @@ static struct platform_driver tps6594_esm_driver = {
 		.pm = pm_sleep_ptr(&tps6594_esm_pm_ops),
 	},
 	.probe = tps6594_esm_probe,
-	.remove_new = tps6594_esm_remove,
+	.remove = tps6594_esm_remove,
 };
 
 module_platform_driver(tps6594_esm_driver);
diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 9bcca1856bfe..0a24ce44cc37 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -314,7 +314,7 @@ static struct platform_driver tps6594_pfsm_driver = {
 		.name = "tps6594-pfsm",
 	},
 	.probe = tps6594_pfsm_probe,
-	.remove_new = tps6594_pfsm_remove,
+	.remove = tps6594_pfsm_remove,
 };
 
 module_platform_driver(tps6594_pfsm_driver);
diff --git a/drivers/misc/vcpu_stall_detector.c b/drivers/misc/vcpu_stall_detector.c
index 41b8c2119e20..f0b1fc87490e 100644
--- a/drivers/misc/vcpu_stall_detector.c
+++ b/drivers/misc/vcpu_stall_detector.c
@@ -233,7 +233,7 @@ MODULE_DEVICE_TABLE(of, vcpu_stall_detect_of_match);
 
 static struct platform_driver vcpu_stall_detect_driver = {
 	.probe  = vcpu_stall_detect_probe,
-	.remove_new = vcpu_stall_detect_remove,
+	.remove = vcpu_stall_detect_remove,
 	.driver = {
 		.name           = KBUILD_MODNAME,
 		.of_match_table = vcpu_stall_detect_of_match,
diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index ea433695f4c4..3135ba3a58ee 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -1444,7 +1444,7 @@ static struct platform_driver xsdfec_driver = {
 		.of_match_table = xsdfec_of_match,
 	},
 	.probe = xsdfec_probe,
-	.remove_new =  xsdfec_remove,
+	.remove = xsdfec_remove,
 };
 
 module_platform_driver(xsdfec_driver);
diff --git a/drivers/misc/xilinx_tmr_inject.c b/drivers/misc/xilinx_tmr_inject.c
index 734fdfac19ef..6284606ffb9f 100644
--- a/drivers/misc/xilinx_tmr_inject.c
+++ b/drivers/misc/xilinx_tmr_inject.c
@@ -164,7 +164,7 @@ static struct platform_driver xtmr_inject_driver = {
 		.of_match_table = xtmr_inject_of_match,
 	},
 	.probe = xtmr_inject_probe,
-	.remove_new = xtmr_inject_remove,
+	.remove = xtmr_inject_remove,
 };
 module_platform_driver(xtmr_inject_driver);
 MODULE_AUTHOR("Advanced Micro Devices, Inc");

base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
-- 
2.45.2


