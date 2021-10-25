Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51E43905E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 09:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd65k1kmGz2yp0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 18:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oYYVXLFk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=maahiuzeon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oYYVXLFk; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd62F3Wg2z2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 18:26:12 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so4354179pjh.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3xNnrHH4M53rb1GiCHYlSdPI2McsQhnl+07FcsHktg=;
 b=oYYVXLFk3S8fMRnc+slFQ8Mwa8cl/VBoK0axh2kjatf6xy8YME5qFfTHuwAbVs6xSK
 NjA0JUQMBsL+WD9ge2GGhmXcyyCNug+Dl/VI4F4wLBIIEaZunfHt+Ibs08O7zsP7n6eL
 sPjHtJ3qs9aGV5HNTTMaYtI1M52wMfd2jh5rOL4M2oGt7zj2ty7nTeMNrQ17L+2UMHb3
 AFlNj788REFhO301YnzLGyAIyvD9c3AO0fgLtvtsPFEfp/fnOoL8iuIX0DrSsazyW6qT
 VsdNbTrEMVFAuk4xRrsqrVi+bsAwW+5mnvYqaFIZh4+XtEYi8i8LpQmE2fjSxpYREh9X
 4cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3xNnrHH4M53rb1GiCHYlSdPI2McsQhnl+07FcsHktg=;
 b=jiqpiOuOx1/GmJC8pUOx2DHUljKUYhDQJnGhAdvt6PddHTFQRzWSn2WS0TavGcX1M9
 jKHlnf9WejcTwq4VrfSvgM4qAf8cYO0FrsLyuHdBrez0DiHE6+LCRFWDZhtb5p2CHC+z
 2jC5+BnMggwtYz+HsTOhdZ8mOfDUbiD1sGnyEXWNAA3vOtdbtwMi/EA5DHTmmGx663bk
 gkIS19Yy1TDTExJer0Vo4qn5H3bY+blmZN87751jHDRq4Qcc0gPcSqt7DAGQtzQ1ypkM
 scYSEjdERervvbX+DHO0xs25BOqZat2Dw2p7wOpCKdhEvfxoB8EdqZJ2Gq8djfVVajRj
 /zxA==
X-Gm-Message-State: AOAM530UIqUXTIW0Ovvzf1Ic2dIstGmZfYrRQFk4poayvT2aK+Mbl9SH
 829TeBFuXnxyTbDRDqlZfWM=
X-Google-Smtp-Source: ABdhPJzaL1yOJQP8Kh519CjECLZi7MQrGD0Wfn9FQG0amNPdQozfRqzr/xyQv6sbMpe+LZ0jZ6Udug==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr18632052pjb.172.1635146769220; 
 Mon, 25 Oct 2021 00:26:09 -0700 (PDT)
Received: from localhost.localdomain (c-73-222-199-61.hsd1.ca.comcast.net.
 [73.222.199.61])
 by smtp.googlemail.com with ESMTPSA id c3sm10271134pji.0.2021.10.25.00.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:26:08 -0700 (PDT)
From: Hill Ma <maahiuzeon@gmail.com>
To: benh@kernel.crashing.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] macintosh/via-pmu-led: make disk activity usage a parameter.
Date: Mon, 25 Oct 2021 00:25:08 -0700
Message-Id: <20211025072508.8667-1-maahiuzeon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Oct 2021 18:28:41 +1100
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
index ae067ab2373d..838dcf98f82e 100644
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
 
+int adb_pmu_led_disk;
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

