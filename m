Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0171613A93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1HXp5Qhgz3cct
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 02:45:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQqq4InZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQqq4InZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1HR025QQz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 02:40:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C73B612F5;
	Mon, 31 Oct 2022 15:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D751C433C1;
	Mon, 31 Oct 2022 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230809;
	bh=E9tojarincoSMS24j3RHNxidQvPWn4XpnyUgXJA5+30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQqq4InZ/kYs4ThGgsePZUNLFgiadoZAmvKwXPjPZCqbAmSZ5ILQUOu04WkFWvYow
	 wdgjXat438oY8ksyzjLPYAbxiasKDpBSkttyteCNtBIN2jVkeZoJPvOMuSjthmWeo3
	 iWOzmqdrPGZNobCrFIlW3sVqtb8l6Qyjjd3sWPYSaPz2X+zt3oSkqeolEhSiLkrYo6
	 6R6SV9hICUKD71OBUs9qeQ++MWWETe5rSLqlyVRJFjw7K4Ek6YRD6GEhyBQRrcC3gx
	 7PbkF50iWH9mr8ZKrI2lCjD1AB53yrRGkDS1ywJQ/TBg93UDjSvqOb8061YMdfMCrG
	 iuZBwGEUBwDng==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v3 5/5] PCI: Remove unnecessary <linux/of_irq.h> includes
Date: Mon, 31 Oct 2022 10:39:54 -0500
Message-Id: <20221031153954.1163623-6-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
References: <20221031153954.1163623-1-helgaas@kernel.org>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Scott Branden <sb
 randen@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Many host controller drivers #include <linux/of_irq.h> even though they
don't need it.  Remove the unnecessary #includes.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/cadence/pci-j721e.c   | 1 -
 drivers/pci/controller/dwc/pci-layerscape.c  | 1 -
 drivers/pci/controller/dwc/pcie-armada8k.c   | 1 -
 drivers/pci/controller/dwc/pcie-tegra194.c   | 1 -
 drivers/pci/controller/pci-v3-semi.c         | 1 -
 drivers/pci/controller/pci-xgene-msi.c       | 1 -
 drivers/pci/controller/pci-xgene.c           | 1 -
 drivers/pci/controller/pcie-altera-msi.c     | 1 -
 drivers/pci/controller/pcie-iproc-platform.c | 1 -
 drivers/pci/controller/pcie-iproc.c          | 1 -
 drivers/pci/controller/pcie-microchip-host.c | 1 -
 drivers/pci/controller/pcie-rockchip-host.c  | 1 -
 drivers/pci/controller/pcie-xilinx-cpm.c     | 1 -
 drivers/pci/controller/pcie-xilinx-nwl.c     | 1 -
 14 files changed, 14 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index a82f845cc4b5..cc83a8925ce0 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -15,7 +15,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 879b8692f96a..ed5fb492fe08 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -13,7 +13,6 @@
 #include <linux/init.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index dc469ef8e99b..5c999e15c357 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -21,7 +21,6 @@
 #include <linux/platform_device.h>
 #include <linux/resource.h>
 #include <linux/of_pci.h>
-#include <linux/of_irq.h>
 
 #include "pcie-designware.h"
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 1b6b437823d2..02d78a12b6e7 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -21,7 +21,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
-#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
index 154a5398633c..784fcf35599c 100644
--- a/drivers/pci/controller/pci-v3-semi.c
+++ b/drivers/pci/controller/pci-v3-semi.c
@@ -22,7 +22,6 @@
 #include <linux/kernel.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index bacb14e558ee..d7987b281f79 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -11,7 +11,6 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
-#include <linux/of_irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 549d3bd6d1c2..887b4941ff32 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -14,7 +14,6 @@
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/pci-acpi.h>
diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controller/pcie-altera-msi.c
index 4366e042e98b..65e8a20cc442 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
index 538115246c79..4142a73e611d 100644
--- a/drivers/pci/controller/pcie-iproc-platform.c
+++ b/drivers/pci/controller/pcie-iproc-platform.c
@@ -12,7 +12,6 @@
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
-#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 2519201b0e51..83029bdfd884 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
-#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 
diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 57b2a62f52c8..0ebf7015e9af 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 7352b5ff8d35..c96c0f454570 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -28,7 +28,6 @@
 #include <linux/of_device.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/phy/phy.h>
diff --git a/drivers/pci/controller/pcie-xilinx-cpm.c b/drivers/pci/controller/pcie-xilinx-cpm.c
index e4ab48041eb6..4a787a941674 100644
--- a/drivers/pci/controller/pcie-xilinx-cpm.c
+++ b/drivers/pci/controller/pcie-xilinx-cpm.c
@@ -16,7 +16,6 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pci-ecam.h>
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 40d070e54ad2..f0271b6c6f8d 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -17,7 +17,6 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
-- 
2.25.1

