Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F51B2168
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 10:18:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495xKb6vp2zDr30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 18:18:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OieMy9kZ; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495xGm66qczDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 18:16:16 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id my1so949713pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDCpLEoGjUZywljYputJz9yvf2ndW6BiTJjiOxAiL9E=;
 b=OieMy9kZ7EvZ4SzNXSNIa0cJjJZWB9BuWMPX+NaUspQ+2o0tOLqrLRYrJcB3wHjugt
 gIeSyhFNDk6URSE3/QYOuufMyUjeVCa9qdodLruj129KueVIzOKuk+I70TW844hQTdBl
 AA0E8IgjNf4CqYjB0oQaB9PM7b9LmVRxPlthhARMfwqnlEmWNLo+wruNJV1YFLQbEonO
 iOY+QdBgLsQtJBBBF7IHbY5XojIswld47ijEC3Hqhvpstzv7OGRYrUaPuWPD1htKGcNN
 YpyoUwyDFtCWAFXZWTCUcxYfVdv8aoDLyRKId42igC6PYZ51mjAqsVT3y7YJXzaOwL9L
 iAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDCpLEoGjUZywljYputJz9yvf2ndW6BiTJjiOxAiL9E=;
 b=Wq9eltNun0GCCMltonZkq7GOGEJhG+47a7jU7XT+wxk98B5/0+5QrJ3WArKfA3/ryg
 nLWuA83lxDfonJi6luUGLz12Ub6TGj6MBq4LZwqcGIaU8u/l3qZlkxBtztDPRsjMTi81
 VgqVELZEVa6hJQmwhbxpeBeZEdM12WpQdclefEy3Z5t89rT/b8TpgOdn1WNNRCFW3Z4D
 1OyHqrmFKH2uS/AMKhY071a6qfggQSw7/es0b8jo8itIUJLBsoUjUCdLDxszP29rh5RC
 Hd3rK6gQIcKw48Y7Ufs7a/T5XnLZhbJ4f8Ba0i7ZYMlATKfQKOoqcfVOIgzsLw44pCHw
 shJA==
X-Gm-Message-State: AGi0PuYNsTASw+1dP5xm0MWIPf4jA02GvnGJoiehL4wsg8JoRnB5jzKF
 lC51enX1NlecX+UGbb5PfaJj0LP4
X-Google-Smtp-Source: APiQypKjKDAlPJ8yZYF0zJB1fnWkIceQEABaW2ybpmUEwRHrr4lCealups6hEpBwYOUKx10q6UH1cQ==
X-Received: by 2002:a17:902:ee82:: with SMTP id
 a2mr20184603pld.290.1587456971305; 
 Tue, 21 Apr 2020 01:16:11 -0700 (PDT)
Received: from localhost.ibm.com (115-64-114-38.tpgi.com.au. [115.64.114.38])
 by smtp.gmail.com with ESMTPSA id
 c4sm1606930pgg.17.2020.04.21.01.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:16:10 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries: Make vio and ibmebus initcalls pseries
 specific
Date: Tue, 21 Apr 2020 18:15:39 +1000
Message-Id: <20200421081539.7485-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The vio and ibmebus buses are used for pseries specific paravirtualised
devices and currently they're initialised by the generic initcall types.
This is mostly fine, but it can result in some nuisance errors in dmesg
when booting on PowerNV on some OSes, e.g.

[    2.984439] synth uevent: /devices/vio: failed to send uevent
[    2.984442] vio vio: uevent: failed to send synthetic uevent
[   17.968551] synth uevent: /devices/vio: failed to send uevent
[   17.968554] vio vio: uevent: failed to send synthetic uevent

We don't see anything similar for the ibmebus because that depends on
!CONFIG_LITTLE_ENDIAN.

This patch squashes those by switching to using machine_*_initcall() so the bus
type is only registered when the kernel is running on a pseries machine.

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
--
v2: Added explicit include for machdep.h to fix building ibmebus.
---
 arch/powerpc/platforms/pseries/ibmebus.c | 3 ++-
 arch/powerpc/platforms/pseries/vio.c     | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index b91eb09..a6f101c 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -47,6 +47,7 @@
 #include <linux/stat.h>
 #include <linux/of_platform.h>
 #include <asm/ibmebus.h>
+#include <asm/machdep.h>
 
 static struct device ibmebus_bus_device = { /* fake "parent" device */
 	.init_name = "ibmebus",
@@ -464,4 +465,4 @@ static int __init ibmebus_bus_init(void)
 
 	return 0;
 }
-postcore_initcall(ibmebus_bus_init);
+machine_postcore_initcall(pseries, ibmebus_bus_init);
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 37f1f25..0487b26 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -31,6 +31,7 @@
 #include <asm/tce.h>
 #include <asm/page.h>
 #include <asm/hvcall.h>
+#include <asm/machdep.h>
 
 static struct vio_dev vio_bus_device  = { /* fake "parent" device */
 	.name = "vio",
@@ -1513,7 +1514,7 @@ static int __init vio_bus_init(void)
 
 	return 0;
 }
-postcore_initcall(vio_bus_init);
+machine_postcore_initcall(pseries, vio_bus_init);
 
 static int __init vio_device_init(void)
 {
@@ -1522,7 +1523,7 @@ static int __init vio_device_init(void)
 
 	return 0;
 }
-device_initcall(vio_device_init);
+machine_device_initcall(pseries, vio_device_init);
 
 static ssize_t name_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -1703,4 +1704,4 @@ static int __init vio_init(void)
 	dma_debug_add_bus(&vio_bus_type);
 	return 0;
 }
-fs_initcall(vio_init);
+machine_fs_initcall(pseries, vio_init);
-- 
2.9.5

