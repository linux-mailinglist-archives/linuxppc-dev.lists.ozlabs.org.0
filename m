Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D043AAC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 05:34:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdcqr5Pw6z3036
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 14:34:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Io3oA2TN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=maahiuzeon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Io3oA2TN; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdcq66lPfz2xsy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 14:33:22 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id oa4so9867326pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 20:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mkq3aea+NCXE9zaVj4MupeFeuH4eRueS9CDWO70cBHg=;
 b=Io3oA2TNwgqt2KOVh19dDB40d3zTv1EmwhDyaeSJlPW+jCTF3ZUxoLzx3sx+dAgzA2
 tkpHVVD/ng2yLaWu1SzihCEkNT41LTXcm0348rNqF4kuPepBXdw3kvdM5EvXh8gSZSX/
 MFEGKVPoaDA/P8p216qFNx7+UO68jh/c+ptXyVsj+veRayu/MpkMLeKBU9dzzXfozTMZ
 wqSXsUebMtVWf4A/RvdrHj4hw0+w0kkf+NWOnxK2Uird7mZ8g/eEokqdSe5cMiHj572W
 p+0TQsBm/P7mX9WTNQUaxYI/ysn3QD1eueHkoQWLiMle2FgHPH4sJfSbbDYhPBrujcZc
 pFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mkq3aea+NCXE9zaVj4MupeFeuH4eRueS9CDWO70cBHg=;
 b=b93b4ouD/gMPJy6NE84z+G+HeRtXnMT9ytit1vIwDSSxxKOK6ap1ncPt1pGFw1G3Jx
 mlV6UT5lGBBGzBlHcEqqrG0qnQnh/2TJ18EozaLeqCZ8FZ3nBfAhtk09RTmUkqII7IAi
 m9+Grb9eD1Fr0Sq6HIiYgM1drk4o2ypIM66Les/MUfOEaBNSJlvEUPmLqtoL9pMlLFGi
 LLVHdbeGuYyBsNSM9x9bjA5JOL4cjYb6jQvHxTbZhNelBicNUz0YJO6x+k8WLSgwjOZ7
 XJ7WECrKC/sD8ajoQqWHGvQbwWBj7oXakln9CL0WcXLaJuFxAUMZXHGjaWssRvLLCk5u
 DZmw==
X-Gm-Message-State: AOAM530nTzVSE+CHd5/7BukgqWEWswzuIGri0Neb5GXAkXuuvr/ug03R
 adJXtI6uFhUQuLBQIQ3TvAkl+XEPDPMoNevm
X-Google-Smtp-Source: ABdhPJw1/vCijhY8xut2g+W8TLMDs7p7jzHYjrF94y5AKv57S5LiwNiOF6aS3TQOXDqfE55gVELcqg==
X-Received: by 2002:a17:90b:1a87:: with SMTP id
 ng7mr40993753pjb.69.1635219200489; 
 Mon, 25 Oct 2021 20:33:20 -0700 (PDT)
Received: from localhost.localdomain (c-73-222-199-61.hsd1.ca.comcast.net.
 [73.222.199.61])
 by smtp.googlemail.com with ESMTPSA id ng5sm20091129pjb.51.2021.10.25.20.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 20:33:20 -0700 (PDT)
From: Hill Ma <maahiuzeon@gmail.com>
To: benh@kernel.crashing.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] macintosh/via-pmu-led: make disk activity usage a
 parameter.
Date: Mon, 25 Oct 2021 20:32:54 -0700
Message-Id: <20211026033254.1052-1-maahiuzeon@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Hill Ma <maahiuzeon@gmail.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Whether to use the LED as a disk activity is a user preference.
Some like this usage while others find the LED too bright. So it
might be a good idea to make this choice a runtime parameter rather
than compile-time config.

The default is set to disabled as OS X does not use the LED as a
disk activity indicator.

Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 drivers/macintosh/Kconfig                       | 10 ----------
 drivers/macintosh/via-pmu-led.c                 | 11 ++++++++---
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 43dc35fe5bc0..a656a51ba0a8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -250,6 +250,12 @@
 			Use timer override. For some broken Nvidia NF5 boards
 			that require a timer override, but don't have HPET
 
+	adb_pmu_led_disk [PPC]
+			Use front LED as disk LED by default. Only applies to
+			PowerBook, iBook, PowerMac 7,2/7,3.
+			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
+			Default: disabled
+
 	add_efi_memmap	[EFI; X86] Include EFI memory map in
 			kernel's map of available physical RAM.
 
diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index 5cdc361da37c..243215de563c 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -78,16 +78,6 @@ config ADB_PMU_LED
 	  behaviour of the old CONFIG_BLK_DEV_IDE_PMAC_BLINK, select this
 	  and the disk LED trigger and configure appropriately through sysfs.
 
-config ADB_PMU_LED_DISK
-	bool "Use front LED as DISK LED by default"
-	depends on ADB_PMU_LED
-	depends on LEDS_CLASS
-	select LEDS_TRIGGERS
-	select LEDS_TRIGGER_DISK
-	help
-	  This option makes the front LED default to the disk trigger
-	  so that it blinks on disk activity.
-
 config PMAC_SMU
 	bool "Support for SMU  based PowerMacs"
 	depends on PPC_PMAC64
diff --git a/drivers/macintosh/via-pmu-led.c b/drivers/macintosh/via-pmu-led.c
index ae067ab2373d..faf39a5962aa 100644
--- a/drivers/macintosh/via-pmu-led.c
+++ b/drivers/macintosh/via-pmu-led.c
@@ -25,6 +25,7 @@
 #include <linux/leds.h>
 #include <linux/adb.h>
 #include <linux/pmu.h>
+#include <linux/moduleparam.h>
 #include <asm/prom.h>
 
 static spinlock_t pmu_blink_lock;
@@ -71,11 +72,10 @@ static void pmu_led_set(struct led_classdev *led_cdev,
  	spin_unlock_irqrestore(&pmu_blink_lock, flags);
 }
 
+bool adb_pmu_led_disk;
+
 static struct led_classdev pmu_led = {
 	.name = "pmu-led::front",
-#ifdef CONFIG_ADB_PMU_LED_DISK
-	.default_trigger = "disk-activity",
-#endif
 	.brightness_set = pmu_led_set,
 };
 
@@ -106,6 +106,9 @@ static int __init via_pmu_led_init(void)
 	}
 	of_node_put(dt);
 
+	if (adb_pmu_led_disk)
+		pmu_led.default_trigger = "disk-activity";
+
 	spin_lock_init(&pmu_blink_lock);
 	/* no outstanding req */
 	pmu_blink_req.complete = 1;
@@ -114,4 +117,6 @@ static int __init via_pmu_led_init(void)
 	return led_classdev_register(NULL, &pmu_led);
 }
 
+core_param(adb_pmu_led_disk, adb_pmu_led_disk, bool, 0644);
+
 late_initcall(via_pmu_led_init);
-- 
2.33.1

