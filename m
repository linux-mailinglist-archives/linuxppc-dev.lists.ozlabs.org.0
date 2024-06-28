Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD791C2A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 17:30:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kgL4S+/f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9fXP6lZVz3cYf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 01:30:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kgL4S+/f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9fWh005Dz3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 01:30:07 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-57d1782679fso1075634a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719588604; x=1720193404; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+DJpOm4RfaDE2zD0n6roADp/UbGD++A0Jdm0qwsA/0=;
        b=kgL4S+/fqRjek9ocaik7o0Duc6cfSDS3ldu/Jrs/l/vZI2JZ4bDfb6fLw/WkliFOpD
         /iTzZYbHOyFA2N4tZMW/Y+xlhld2oBnFx9EPz00r9UPg5L4Al45BUvE1gWUQIdzhTzS/
         c1cCRPZpPjIwsMSnp3JhaUCQ48mRsD4WldExgXElt29N5iQC3EozNPQ7/E4iooJN65gz
         hndpwjHyJ16+lHvDU1EQhz84WlIloqrHFFgQdqltidrpvRka529ZFYMP0HvjHAcHIj8J
         80yeEl30iCCjegHOwG/Paxa0xTNzmUMDqz/9DJiEDAYBQGP5uNDs5MlqRfAtrSviM1Qh
         rhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719588604; x=1720193404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+DJpOm4RfaDE2zD0n6roADp/UbGD++A0Jdm0qwsA/0=;
        b=fvvAmnWfbDysk2ppkqcGCeI717JNDPNeu+lIGH/71HL6GscLb3YmpdfAuQaT0JLT7T
         5tHDi3jEn37tYYHM5cqJXU/N6AmPnvgYHbb01uYCisqY2LQeoPNxIoT/DqJUXBWoymSB
         3uG9l9mVMOwLjnEE1dmn/KmXFgI55gWLb40eRILJx8hADpi4yoUtQTtUH7+UyZs9jumA
         4z0tbQ6dqGQyfnbKSNi8xkhXnDmf3UeuBRhqfnB2oEprWr8/5rLRDuoqVt8jY8KUYZDp
         6vvVk2+uto4UVTUPNzRw7St1ZRqFb6y7I/NBsQf2m5Kguvk+nQnHFQPSsXpTwRjYblfW
         71Sg==
X-Gm-Message-State: AOJu0YyCbG/lfcviuYB96oiYn7rCZKV0f6mH/pAyt4eEBltsLIW7bZPM
	AcrsyJL+wl+EfBPPZIp5eDvokhICqEWJ6ghJf9UG2pH3ODzsh9vbGpezw5MYKQwGQe2/ausYyv/
	qgUY=
X-Google-Smtp-Source: AGHT+IE02jPMfZBw2KBQVkPX8O/q1a3hp+zvqEEFONML0yPpOp4ob5bSwIrIvw8xLDFlj1pBG1JMRA==
X-Received: by 2002:a50:d69d:0:b0:57d:768:cdfb with SMTP id 4fb4d7f45d1cf-57d4bd6a19emr11036745a12.6.1719588604580;
        Fri, 28 Jun 2024 08:30:04 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614f3d51asm1160852a12.81.2024.06.28.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:30:04 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Patch v6] i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr
Date: Fri, 28 Jun 2024 17:30:01 +0200
Message-Id: <20240628153001.282816-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When del_timer_sync() is called in an interrupt context it throws a warning
because of potential deadlock. The timer is used only to exit from
wait_for_completion() after a timeout so replacing the call with
wait_for_completion_timeout() allows to remove the problematic timer and
its related functions altogether.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v6:
- Fixed typo in the patch subject

Changes for v5:
- Replaced wait_for_completion() with wait_for_completion_timeout().
- Removed unneded "alg_data->mif.timer" and its functions
- Request irq with devm_request_irq() as before the patch
- Renamed the patch and reword description for the new way to fix
  the warning

Changes for v4:
- Request irq with devm_request_threaded_irq() to prevent the warning

 drivers/i2c/busses/i2c-pnx.c | 48 ++++++++----------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index a12525b3186b..f448505d5468 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -15,7 +15,6 @@
 #include <linux/ioport.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/timer.h>
 #include <linux/completion.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
@@ -32,7 +31,6 @@ struct i2c_pnx_mif {
 	int			ret;		/* Return value */
 	int			mode;		/* Interface mode */
 	struct completion	complete;	/* I/O completion */
-	struct timer_list	timer;		/* Timeout */
 	u8 *			buf;		/* Data buffer */
 	int			len;		/* Length of data buffer */
 	int			order;		/* RX Bytes to order via TX */
@@ -117,24 +115,6 @@ static inline int wait_reset(struct i2c_pnx_algo_data *data)
 	return (timeout <= 0);
 }
 
-static inline void i2c_pnx_arm_timer(struct i2c_pnx_algo_data *alg_data)
-{
-	struct timer_list *timer = &alg_data->mif.timer;
-	unsigned long expires = msecs_to_jiffies(alg_data->timeout);
-
-	if (expires <= 1)
-		expires = 2;
-
-	del_timer_sync(timer);
-
-	dev_dbg(&alg_data->adapter.dev, "Timer armed at %lu plus %lu jiffies.\n",
-		jiffies, expires);
-
-	timer->expires = jiffies + expires;
-
-	add_timer(timer);
-}
-
 /**
  * i2c_pnx_start - start a device
  * @slave_addr:		slave address
@@ -259,8 +239,6 @@ static int i2c_pnx_master_xmit(struct i2c_pnx_algo_data *alg_data)
 				~(mcntrl_afie | mcntrl_naie | mcntrl_drmie),
 				  I2C_REG_CTL(alg_data));
 
-			del_timer_sync(&alg_data->mif.timer);
-
 			dev_dbg(&alg_data->adapter.dev,
 				"%s(): Waking up xfer routine.\n",
 				__func__);
@@ -276,8 +254,6 @@ static int i2c_pnx_master_xmit(struct i2c_pnx_algo_data *alg_data)
 			~(mcntrl_afie | mcntrl_naie | mcntrl_drmie),
 			  I2C_REG_CTL(alg_data));
 
-		/* Stop timer. */
-		del_timer_sync(&alg_data->mif.timer);
 		dev_dbg(&alg_data->adapter.dev,
 			"%s(): Waking up xfer routine after zero-xfer.\n",
 			__func__);
@@ -364,8 +340,6 @@ static int i2c_pnx_master_rcv(struct i2c_pnx_algo_data *alg_data)
 				 mcntrl_drmie | mcntrl_daie);
 			iowrite32(ctl, I2C_REG_CTL(alg_data));
 
-			/* Kill timer. */
-			del_timer_sync(&alg_data->mif.timer);
 			complete(&alg_data->mif.complete);
 		}
 	}
@@ -400,8 +374,6 @@ static irqreturn_t i2c_pnx_interrupt(int irq, void *dev_id)
 			 mcntrl_drmie);
 		iowrite32(ctl, I2C_REG_CTL(alg_data));
 
-		/* Stop timer, to prevent timeout. */
-		del_timer_sync(&alg_data->mif.timer);
 		complete(&alg_data->mif.complete);
 	} else if (stat & mstatus_nai) {
 		/* Slave did not acknowledge, generate a STOP */
@@ -419,8 +391,6 @@ static irqreturn_t i2c_pnx_interrupt(int irq, void *dev_id)
 		/* Our return value. */
 		alg_data->mif.ret = -EIO;
 
-		/* Stop timer, to prevent timeout. */
-		del_timer_sync(&alg_data->mif.timer);
 		complete(&alg_data->mif.complete);
 	} else {
 		/*
@@ -453,9 +423,8 @@ static irqreturn_t i2c_pnx_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void i2c_pnx_timeout(struct timer_list *t)
+static void i2c_pnx_timeout(struct i2c_pnx_algo_data *alg_data)
 {
-	struct i2c_pnx_algo_data *alg_data = from_timer(alg_data, t, mif.timer);
 	u32 ctl;
 
 	dev_err(&alg_data->adapter.dev,
@@ -472,7 +441,6 @@ static void i2c_pnx_timeout(struct timer_list *t)
 	iowrite32(ctl, I2C_REG_CTL(alg_data));
 	wait_reset(alg_data);
 	alg_data->mif.ret = -EIO;
-	complete(&alg_data->mif.complete);
 }
 
 static inline void bus_reset_if_active(struct i2c_pnx_algo_data *alg_data)
@@ -514,6 +482,7 @@ i2c_pnx_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	struct i2c_msg *pmsg;
 	int rc = 0, completed = 0, i;
 	struct i2c_pnx_algo_data *alg_data = adap->algo_data;
+	unsigned long time_left;
 	u32 stat;
 
 	dev_dbg(&alg_data->adapter.dev,
@@ -548,7 +517,6 @@ i2c_pnx_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		dev_dbg(&alg_data->adapter.dev, "%s(): mode %d, %d bytes\n",
 			__func__, alg_data->mif.mode, alg_data->mif.len);
 
-		i2c_pnx_arm_timer(alg_data);
 
 		/* initialize the completion var */
 		init_completion(&alg_data->mif.complete);
@@ -564,7 +532,10 @@ i2c_pnx_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 			break;
 
 		/* Wait for completion */
-		wait_for_completion(&alg_data->mif.complete);
+		time_left = wait_for_completion_timeout(&alg_data->mif.complete,
+							alg_data->timeout);
+		if (time_left == 0)
+			i2c_pnx_timeout(alg_data);
 
 		if (!(rc = alg_data->mif.ret))
 			completed++;
@@ -653,7 +624,10 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	alg_data->adapter.algo_data = alg_data;
 	alg_data->adapter.nr = pdev->id;
 
-	alg_data->timeout = I2C_PNX_TIMEOUT_DEFAULT;
+	alg_data->timeout = msecs_to_jiffies(I2C_PNX_TIMEOUT_DEFAULT);
+	if (alg_data->timeout <= 1)
+		alg_data->timeout = 2;
+
 #ifdef CONFIG_OF
 	alg_data->adapter.dev.of_node = of_node_get(pdev->dev.of_node);
 	if (pdev->dev.of_node) {
@@ -673,8 +647,6 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	if (IS_ERR(alg_data->clk))
 		return PTR_ERR(alg_data->clk);
 
-	timer_setup(&alg_data->mif.timer, i2c_pnx_timeout, 0);
-
 	snprintf(alg_data->adapter.name, sizeof(alg_data->adapter.name),
 		 "%s", pdev->name);
 
-- 
2.25.1

