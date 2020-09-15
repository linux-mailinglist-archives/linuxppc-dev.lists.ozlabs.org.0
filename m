Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8E26A41B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:26:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrLWw6l9CzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:26:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=puresoftware.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=kuldip.dwivedi@puresoftware.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=puresoftware.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=puresoftware-com.20150623.gappssmtp.com
 header.i=@puresoftware-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iWHncBdt; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrL6B4SH7zDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:07:08 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id o16so1592619pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=puresoftware-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=IPDhGgu0otyR0D5FWAzn2/lQZFvFhrDOh5IObqsojaY=;
 b=iWHncBdtzB2UH5J2cOkmy6ubgv4Ns2WCFis1qs6YjEpUbVkClCrL9i5ROlhMEO6J2l
 i29LHAGefXZD91vifwuXqdI3SQOUpobmGTtqaYiL4j7FcONW6aJ7sVozrdI4YhPhGrpN
 2ib9FIogd7Q/iTm4BEICibWPbnK8M1ulTibDqSYIcMtPeiuAK/EPyUEVYPY2deNdosDg
 QbKO7oBMEFZKAuufCmpM6qJafjxJvCHRr/tWGpPgrnP5x2DI6cVn+VvBmBCmPbyJfIVO
 KYLe4IqeiNb4mWiHagholFCEsdjl4lY8gDLbO+5fRDolDGDykARl7lL7dq7DkKZekeJi
 5j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IPDhGgu0otyR0D5FWAzn2/lQZFvFhrDOh5IObqsojaY=;
 b=VPxds6fGYFmYzSL41lRLtcTBLNTcU7qBcX1tOfsWNzw93XvCEcGFP4nj4NEqBi2cZQ
 ULmgYHpGfP51swDsQj0/4vg0pqz0F7+uQxhiwmRNvEbWC/ER6vuROxRoxE5fHwiO+PXt
 JhgHNmdAMIvqrilRakb1wKyuz9wgRUWl5NvR6T7K2I4YKY1Oes8qBG+tcJ9o/kGdn1Pz
 eEibpPFpAdgxfet0fvga/2p8//73TtBtI1Yh8u6hVT5oihvhhS1YR5LMaSsosu0pWzym
 qBoveU+Ys2L0JkWfuCsKpFoz7ZM/cE29WHzhrbMzAll36ttvHGMn3OhaBZwyM/tWnPP2
 wuCA==
X-Gm-Message-State: AOAM5309kGoU5qb5B3dk7aLpsCiQHTDA7/CT5RAJSuwwjbwj46vY8EnD
 iR0gD/sTaQT04zT1sDZ5/6usTw==
X-Google-Smtp-Source: ABdhPJyA9HwpWVL0uXGhfpvfPM8oY97KnK+Zvd/q1ERwk2QiM36t2cfcuyq/L3nFYWKcRJz0A7dkbw==
X-Received: by 2002:a17:902:ba8c:b029:d1:e5e7:be11 with SMTP id
 k12-20020a170902ba8cb02900d1e5e7be11mr1215635pls.68.1600168024250; 
 Tue, 15 Sep 2020 04:07:04 -0700 (PDT)
Received: from DESKTOP-C4AMQCQ.domain.name ([223.235.130.128])
 by smtp.gmail.com with ESMTPSA id k2sm13368523pfi.169.2020.09.15.04.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:07:03 -0700 (PDT)
From: kuldip dwivedi <kuldip.dwivedi@puresoftware.com>
To: Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: fsl: rcpm: Add ACPI support
Date: Tue, 15 Sep 2020 16:36:47 +0530
Message-Id: <20200915110647.846-1-kuldip.dwivedi@puresoftware.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 15 Sep 2020 21:24:00 +1000
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
Cc: Biwen Li <biwen.li@nxp.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 Ran Wang <ran.wang_1@nxp.com>, Paul Yang <Paul.Yang@arm.com>,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Varun Sethi <V.Sethi@nxp.com>, Ard Biesheuvel <Ard.Biesheuvel@arm.com>,
 tanveer <tanveer.alam@puresoftware.com>, Arokia Samy <arokia.samy@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add ACPI support in fsl RCPM driver. This is required
to support ACPI S3 state. S3 is the ACPI sleep state
that is known as "sleep" or "suspend to RAM".
It essentially turns off most power of the system but
keeps memory powered.

Signed-off-by: tanveer <tanveer.alam@puresoftware.com>
Signed-off-by: kuldip dwivedi <kuldip.dwivedi@puresoftware.com>
---

Notes:
    1. Add ACPI match table
    2. NXP team members are added for confirming HID changes
    3. There is only one node in ACPI so no need to check for
       current device explicitly
    4. These changes are tested on LX2160A and LS1046A platforms

 drivers/soc/fsl/rcpm.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe6d2cb..e75a436fb159 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -2,10 +2,12 @@
 //
 // rcpm.c - Freescale QorIQ RCPM driver
 //
-// Copyright 2019 NXP
+// Copyright 2019-2020 NXP
+// Copyright 2020 Puresoftware Ltd.
 //
 // Author: Ran Wang <ran.wang_1@nxp.com>
 
+#include <linux/acpi.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -57,8 +59,13 @@ static int rcpm_pm_prepare(struct device *dev)
 				rcpm->wakeup_cells + 1);
 
 		/*  Wakeup source should refer to current rcpm device */
-		if (ret || (np->phandle != value[0]))
-			continue;
+		if (is_acpi_node(dev->fwnode)) {
+			if (ret)
+				continue;
+		} else {
+			if (ret || (np->phandle != value[0]))
+				continue;
+		}
 
 		/* Property "#fsl,rcpm-wakeup-cells" of rcpm node defines the
 		 * number of IPPDEXPCR register cells, and "fsl,rcpm-wakeup"
@@ -139,10 +146,19 @@ static const struct of_device_id rcpm_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rcpm_of_match);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id rcpm_acpi_match[] = {
+	{ "NXP0015", },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, rcpm_acpi_match);
+#endif
+
 static struct platform_driver rcpm_driver = {
 	.driver = {
 		.name = "rcpm",
 		.of_match_table = rcpm_of_match,
+		.acpi_match_table = ACPI_PTR(rcpm_acpi_match),
 		.pm	= &rcpm_pm_ops,
 	},
 	.probe = rcpm_probe,
-- 
2.17.1

