Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B10EC93C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 23:51:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46k8wv1xWvzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 07:51:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s1o8WyOS"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46k8sr4v6NzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 07:49:00 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id j11so482180plk.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=RFVF+j79EjljD0tVvhEtyc3AyrhKV124n0ydAPhrM+E=;
 b=s1o8WyOSTetOs7i/TyZ7bWKmiE5YytBY8KouyaeIsXVPy+x50AJu4eQwAOPEAb0wAn
 log2uzAGye9wdJeiOONQJkLrpzsYSavLUy644Md7fg0mGPL1xifKeJ288qFu9VzmbxPP
 4pJ3YhTgGh1RV8dbIckfBhTjOXYj7TRoA2laSVfLzmlqAdHqhHzqulJp6lFub9k4kliS
 JlIvvmqUq1gs9RajERkCcphcFACMCT4O7kbgRn+y3tmjaTeS6Go752MPSQPXHwoKA0jN
 IrvZcejgO4hGS3oK+bbaoNEXqcHGiOkSD86NC9AMwQ8kizxeuBOpVi87KUnESeKuvWqo
 KLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=RFVF+j79EjljD0tVvhEtyc3AyrhKV124n0ydAPhrM+E=;
 b=iWHc3mJSjuAvNJI8DjehaFVDCz3izt6lETxJGoerMDdJbHGBk83lFThtNApov/YBQt
 P0XbSSeUpGCF9l0VEmrGtecEmSdmpNdAe8vN88O1WuJXFPeIfoIMkOSG3MwQDL9nrXra
 OVXhiBHBQQrjQJKyHTRxD51QQDMMJOmAzFxhDabwRFwJWCne8G4kMPn3ZHHPXsyd5zms
 TMDphLT33yXlwNu2l5wcQQx5rXCIZ6MaFlTlqAy3MrJIMU+lYbjtMrUsKK0p7opH9dF/
 GDmPfw9UFNd6hrjEQHp/hBxNRiKleMmr8labA4ocIiKmfYVBQE1UicTsFAdLeKbJH1xT
 xCkg==
X-Gm-Message-State: APjAAAXQkG3m7kluFu22/amYZ3DwWw1cdFNSFSLcYjswpcOHdqjQZjkb
 tGAazB6/3FcwuyLZXiaxzxY=
X-Google-Smtp-Source: APXvYqxAfLm0/jfISiBS2nvwoxUKwsHgY8bnFrRyuhIUlGQnKXVFONyO3/7Q7F+XLp7oSm2O/fhsaA==
X-Received: by 2002:a17:902:222:: with SMTP id
 31mr6197015plc.167.1570052937135; 
 Wed, 02 Oct 2019 14:48:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id d4sm204525pjs.9.2019.10.02.14.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 14:48:56 -0700 (PDT)
Date: Wed, 2 Oct 2019 14:48:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] macintosh/ams-input: switch to using input device polling mode
Message-ID: <20191002214854.GA114387@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jean Delvare <jdelvare@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that instances of input_dev support polling mode natively,
we no longer need to create input_polled_dev instance.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/macintosh/Kconfig         |  1 -
 drivers/macintosh/ams/ams-input.c | 37 +++++++++++++++----------------
 drivers/macintosh/ams/ams.h       |  4 ++--
 3 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index 574e122ae105..da6a943ad746 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -247,7 +247,6 @@ config PMAC_RACKMETER
 config SENSORS_AMS
 	tristate "Apple Motion Sensor driver"
 	depends on PPC_PMAC && !PPC64 && INPUT && ((ADB_PMU && I2C = y) || (ADB_PMU && !I2C) || I2C)
-	select INPUT_POLLDEV
 	help
 	  Support for the motion sensor included in PowerBooks. Includes
 	  implementations for PMU and I2C.
diff --git a/drivers/macintosh/ams/ams-input.c b/drivers/macintosh/ams/ams-input.c
index 06a96b3f11de..0da493d449b2 100644
--- a/drivers/macintosh/ams/ams-input.c
+++ b/drivers/macintosh/ams/ams-input.c
@@ -25,9 +25,8 @@ MODULE_PARM_DESC(invert, "Invert input data on X and Y axis");
 
 static DEFINE_MUTEX(ams_input_mutex);
 
-static void ams_idev_poll(struct input_polled_dev *dev)
+static void ams_idev_poll(struct input_dev *idev)
 {
-	struct input_dev *idev = dev->input;
 	s8 x, y, z;
 
 	mutex_lock(&ams_info.lock);
@@ -59,14 +58,10 @@ static int ams_input_enable(void)
 	ams_info.ycalib = y;
 	ams_info.zcalib = z;
 
-	ams_info.idev = input_allocate_polled_device();
-	if (!ams_info.idev)
+	input = input_allocate_device();
+	if (!input)
 		return -ENOMEM;
 
-	ams_info.idev->poll = ams_idev_poll;
-	ams_info.idev->poll_interval = 25;
-
-	input = ams_info.idev->input;
 	input->name = "Apple Motion Sensor";
 	input->id.bustype = ams_info.bustype;
 	input->id.vendor = 0;
@@ -75,28 +70,32 @@ static int ams_input_enable(void)
 	input_set_abs_params(input, ABS_X, -50, 50, 3, 0);
 	input_set_abs_params(input, ABS_Y, -50, 50, 3, 0);
 	input_set_abs_params(input, ABS_Z, -50, 50, 3, 0);
+	input_set_capability(input, EV_KEY, BTN_TOUCH);
 
-	set_bit(EV_ABS, input->evbit);
-	set_bit(EV_KEY, input->evbit);
-	set_bit(BTN_TOUCH, input->keybit);
+	error = input_setup_polling(input, ams_idev_poll);
+	if (error)
+		goto err_free_input;
 
-	error = input_register_polled_device(ams_info.idev);
-	if (error) {
-		input_free_polled_device(ams_info.idev);
-		ams_info.idev = NULL;
-		return error;
-	}
+	input_set_poll_interval(input, 25);
 
+	error = input_register_device(input);
+	if (error)
+		goto err_free_input;
+
+	ams_info.idev = input;
 	joystick = true;
 
 	return 0;
+
+err_free_input:
+	input_free_device(input);
+	return error;
 }
 
 static void ams_input_disable(void)
 {
 	if (ams_info.idev) {
-		input_unregister_polled_device(ams_info.idev);
-		input_free_polled_device(ams_info.idev);
+		input_unregister_device(ams_info.idev);
 		ams_info.idev = NULL;
 	}
 
diff --git a/drivers/macintosh/ams/ams.h b/drivers/macintosh/ams/ams.h
index fe8d596f9845..935bdd9cd9a6 100644
--- a/drivers/macintosh/ams/ams.h
+++ b/drivers/macintosh/ams/ams.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/i2c.h>
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/kthread.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
@@ -51,7 +51,7 @@ struct ams {
 #endif
 
 	/* Joystick emulation */
-	struct input_polled_dev *idev;
+	struct input_dev *idev;
 	__u16 bustype;
 
 	/* calibrated null values */
-- 
2.23.0.444.g18eeb5a265-goog


-- 
Dmitry
