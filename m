Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 688E8754100
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 19:47:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2f832PRLz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 03:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.48; helo=mail-io1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2f7Z4q9zz3bX2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 03:47:22 +1000 (AEST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7836272f36eso89549039f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 10:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356840; x=1691948840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZsEsfKX6fx2CPTk8lEiCg36FX1KD3cI2EzS3pEP/M1Y=;
        b=FMLJ1euDwtu+XaSYSmGFxonUv9IEM5icuxtmiBPNOtJL1WwuX/Ixl/Y1J4bZUpY+vn
         UcxXh6jA34XtVWJVHeJe9O+G+wr9XeYQ4KW6mG42e1LdAV+YuVmypWUBPKsPTx9knon7
         undBUdqn1cVqPG3sKPT4RDorgp3KVwQza2vAu8WG+UQSe6SL5eWNmnBYtlujIPWNBONd
         hp87b12AjQH1pU3atFBna4x1NslIStajAoVDmoWx7kckyeHUq9gbv2fhiAmDzueZ7D1a
         rvTtcynh3BVI2OQnDGnOQQKirOPqzkTmcASgmqRf8fM5QUqxOsXam+GdfZUYKdY7iuhT
         qYVQ==
X-Gm-Message-State: ABy/qLbR9yyqqhi/XerrupR5/5TBHP6ZK3phFqz2mbU13tMKr/37Og/0
	H3qwAMrnKV64HylEx8DlYsz07JSceQ==
X-Google-Smtp-Source: APBJJlHtkf2StfuBbwBf8coPVemYiYLnfRrMm7RxOWmK/J92J/Cq3PmUW0tNGo59CjkyVi79zBYnag==
X-Received: by 2002:a5e:da4c:0:b0:783:5e4e:b785 with SMTP id o12-20020a5eda4c000000b007835e4eb785mr5813551iop.19.1689356840237;
        Fri, 14 Jul 2023 10:47:20 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id b25-20020a05663801b900b0042b3a328ee0sm2682686jaq.166.2023.07.14.10.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:47:19 -0700 (PDT)
Received: (nullmailer pid 4059057 invoked by uid 1000);
	Fri, 14 Jul 2023 17:47:01 -0000
From: Rob Herring <robh@kernel.org>
To: Colin Leroy <colin@colino.net>
Subject: [PATCH] macintosh: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:46:54 -0600
Message-Id: <20230714174654.4058898-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/macintosh/ams/ams.h              |  1 -
 drivers/macintosh/smu.c                  |  1 +
 drivers/macintosh/therm_adt746x.c        |  2 ++
 drivers/macintosh/therm_windtunnel.c     | 22 ++++++++++++----------
 drivers/macintosh/windfarm_lm75_sensor.c |  4 ++--
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/macintosh/ams/ams.h b/drivers/macintosh/ams/ams.h
index 2c159c8844c1..e053c1515460 100644
--- a/drivers/macintosh/ams/ams.h
+++ b/drivers/macintosh/ams/ams.h
@@ -8,7 +8,6 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/of_device.h>
 
 enum ams_irq {
 	AMS_IRQ_FREEFALL = 0x01,
diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index 5183a00529f5..b2b78a53e532 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -37,6 +37,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sched/signal.h>
 
diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_adt746x.c
index 53ea56b286f9..00693741f744 100644
--- a/drivers/macintosh/therm_adt746x.c
+++ b/drivers/macintosh/therm_adt746x.c
@@ -25,7 +25,9 @@
 #include <linux/kthread.h>
 #include <linux/moduleparam.h>
 #include <linux/freezer.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/machdep.h>
 #include <asm/io.h>
diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 18a982454321..52289de15058 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -1,9 +1,9 @@
-/* 
+/*
  *   Creation Date: <2003/03/14 20:54:13 samuel>
  *   Time-stamp: <2004/03/20 14:20:59 samuel>
- *   
+ *
  *	<therm_windtunnel.c>
- *	
+ *
  *	The G4 "windtunnel" has a single fan controlled by an
  *	ADM1030 fan controller and a DS1775 thermostat.
  *
@@ -20,11 +20,11 @@
  *   Copyright (C) 2003, 2004 Samuel Rydh (samuel@ibrium.se)
  *
  *   Loosely based upon 'thermostat.c' written by Benjamin Herrenschmidt
- *   
+ *
  *   This program is free software; you can redistribute it and/or
  *   modify it under the terms of the GNU General Public License
  *   as published by the Free Software Foundation
- *   
+ *
  */
 
 #include <linux/types.h>
@@ -36,7 +36,9 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kthread.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/machdep.h>
 #include <asm/io.h>
@@ -48,10 +50,10 @@
 static struct {
 	volatile int		running;
 	struct task_struct	*poll_task;
-	
+
 	struct mutex	 	lock;
 	struct platform_device	*of_dev;
-	
+
 	struct i2c_client	*thermostat;
 	struct i2c_client	*fan;
 
@@ -127,7 +129,7 @@ write_reg( struct i2c_client *cl, int reg, int data, int len )
 	tmp[1] = (len == 1) ? data : (data >> 8);
 	tmp[2] = data;
 	len++;
-	
+
 	if( i2c_master_send(cl, tmp, len) != len )
 		return -ENODEV;
 	return 0;
@@ -369,7 +371,7 @@ attach_fan( struct i2c_client *cl )
 }
 
 static int
-attach_thermostat( struct i2c_client *cl ) 
+attach_thermostat( struct i2c_client *cl )
 {
 	int hyst_temp, os_temp, temp;
 
@@ -378,7 +380,7 @@ attach_thermostat( struct i2c_client *cl )
 
 	if( (temp=read_reg(cl, 0, 2)) < 0 )
 		goto out;
-	
+
 	/* temperature sanity check */
 	if( temp < 0x1600 || temp > 0x3c00 )
 		goto out;
diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh/windfarm_lm75_sensor.c
index 48dbdb2bda15..6b26e0f92105 100644
--- a/drivers/macintosh/windfarm_lm75_sensor.c
+++ b/drivers/macintosh/windfarm_lm75_sensor.c
@@ -14,7 +14,7 @@
 #include <linux/init.h>
 #include <linux/wait.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <asm/machdep.h>
 #include <asm/io.h>
 #include <asm/sections.h>
@@ -128,7 +128,7 @@ static int wf_lm75_probe(struct i2c_client *client)
 		name = "cpu-inlet-temp-1";
 	else
 		return -ENXIO;
- 	
+
 
 	lm = kzalloc(sizeof(struct wf_lm75_sensor), GFP_KERNEL);
 	if (lm == NULL)
-- 
2.40.1

