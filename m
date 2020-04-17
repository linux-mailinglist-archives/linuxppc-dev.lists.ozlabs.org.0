Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171F1AD511
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 06:09:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493N0759gHzF0dT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 14:09:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OmgdRQx3; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493MyJ5n8tzDrcK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 14:08:08 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f8so499131plt.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 21:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1favo7u/N3GGzynnXhNSh5aFkCUQ5dnyg32mk9RZIBM=;
 b=OmgdRQx3SUepAmtdh/2FWRC02/sc67dVsgZdpItOmn4LGZ8CAzN46L74X2l5ONQ8iR
 Zkl4AxHi+KfGuT34Py9ihhcdv5gURKoDabrXnY/Tut5H6aF2uKFco5qMKlyBBRLnalnm
 D0+xG4XXDsEM3sXwm8ImZ9EcAtB3iZ5XFynlDmWaSBYHGdFinnRc/nmTwCADkY3pumB0
 Iwye/0MXhMYhc9M5WLHKtm6tDwZ5nwqr5TNsGoODAAQsGeExPo1ZWCOuKQD2wuypqyyQ
 X5qg59eIic9PbWJloNoe4IWaQdcedbrnCC9IyZjXLCr4Nx5bGH8AxYsnluRCsHL/xNc8
 Qsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1favo7u/N3GGzynnXhNSh5aFkCUQ5dnyg32mk9RZIBM=;
 b=Qsb3rEdc5RLzOiOzyTgcbx5/Rugh/gd+0m5uj/tjMBJbl88WEnOikPHrLiDm0pzrJw
 cGfShRnWCQYGZ1ftT2EgjkfbctkUT+Wd18wYW04gxTkcpec1f1Rdd9Z9AvCj0ri20E7Q
 c4kBnEETQVeJ6e2Wrn+Qeg/FjLFwNlr0EyirWnKooKyw3w6dY8VSeEchtRFMcHgu2xZK
 9aZHndtW1plTa9wChgJuOu6oeehaDWRBk7XIO1FNc0QmCKAwl+6qvImaxkDOT1550h2p
 zWYgrk8Szj6r9WRN85aZkM1ZuO//hbRH2JO1mzalBnQDm1p8jnH3Kg5EO5TASuA9c0hq
 jnwA==
X-Gm-Message-State: AGi0PubG/MCvzddOz2r/EafxGwQMzbrII4LMiivMawqhs/vPoZw98iHQ
 dBuTBrRJhyYzip5282ohr9JyCcHy
X-Google-Smtp-Source: APiQypL+BYtUy0w6Wx1KTuXTI/x3rNVLS3QGeHFbChaph43wIHpHvZI0SKD0AZLc+uGAL0vDXwrf4Q==
X-Received: by 2002:a17:90b:3110:: with SMTP id
 gc16mr1923293pjb.155.1587096484394; 
 Thu, 16 Apr 2020 21:08:04 -0700 (PDT)
Received: from 192-168-1-13.tpgi.com.au (115-64-37-247.static.tpgi.com.au.
 [115.64.37.247])
 by smtp.gmail.com with ESMTPSA id b2sm16693718pgg.77.2020.04.16.21.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 21:08:03 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Make vio and ibmebus initcalls pseries
 specific
Date: Fri, 17 Apr 2020 14:07:49 +1000
Message-Id: <20200417040749.25800-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
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

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/ibmebus.c | 2 +-
 arch/powerpc/platforms/pseries/vio.c     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index b91eb09..4cd9e65 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -464,4 +464,4 @@ static int __init ibmebus_bus_init(void)
 
 	return 0;
 }
-postcore_initcall(ibmebus_bus_init);
+machine_postcore_initcall(pseries, ibmebus_bus_init);
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 37f1f25..33be37e 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1513,7 +1513,7 @@ static int __init vio_bus_init(void)
 
 	return 0;
 }
-postcore_initcall(vio_bus_init);
+machine_postcore_initcall(pseries, vio_bus_init);
 
 static int __init vio_device_init(void)
 {
@@ -1522,7 +1522,7 @@ static int __init vio_device_init(void)
 
 	return 0;
 }
-device_initcall(vio_device_init);
+machine_device_initcall(pseries, vio_device_init);
 
 static ssize_t name_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -1703,4 +1703,4 @@ static int __init vio_init(void)
 	dma_debug_add_bus(&vio_bus_type);
 	return 0;
 }
-fs_initcall(vio_init);
+machine_fs_initcall(pseries, vio_init);
-- 
2.9.5

