Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E662C7BEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 00:12:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkkfH4XS5zDrPP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:12:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkkY41ssBzDrBk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:07:52 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id e7so13083237wrv.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 15:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4ZAbgOviSl5kwTV38A0mgojnuMMJBX6cIDk0sTmaeo=;
 b=CtF2Wr2xGR/HFEmNzYDkWc8bPGuYpno8smGuDE5Th/yPDEcmi+LG1eOs0LAl/JDMT8
 f+Rbuxq38YkKGC0fMs6VO58CJ5jK31t1mMc87X30XItC1zRJ8UyUy28ymz3OyPXPBdci
 m9tGYTrEjrWjGeYSoGR2qziw5aHJwWJZEN179QC/5HhXfKIBUNZ/mTFIPHtnv2PQ+qp8
 o9cmWnfm6f2LHVdolLLRW08x1Ja5X5ht7clgE5zF2L/f8LPmLplb/4uAeedHStoUaYov
 v3Nzq+taQSj/4J107gtrkNH4KNNNUDCAopHvRzAK1YjATrGoN9lCemWUuv+9PSFlKbeB
 xQ9A==
X-Gm-Message-State: AOAM5335d0FyZ8jIf1X8+oaneF5X0L6t7JUHvqw7jXGkzrkwZkzhe2mW
 bnvo9kkJawMLEAHAI06Q3ZY=
X-Google-Smtp-Source: ABdhPJyc10rS86sUCkCS7JwDecOpIFDWRywvD2p3TPef9gz9BjYexnZrT+fR1+MqL8LVO9fcgPl/QQ==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr24090769wrr.119.1606691269434; 
 Sun, 29 Nov 2020 15:07:49 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id d2sm24831005wrn.43.2020.11.29.15.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 15:07:48 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 2/5] PCI: thunder-pem: Add constant for custom ".bus_shit"
 initialiser
Date: Sun, 29 Nov 2020 23:07:40 +0000
Message-Id: <20201129230743.3006978-3-kw@linux.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129230743.3006978-1-kw@linux.com>
References: <20201129230743.3006978-1-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Robert Richter <rrichter@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a custom constant for the ".bus_shit" initialiser to capture
a non-standard platform-specific ECAM bus shift value.

Standard values otherwise defined in the PCI Express Specification
are available in the include/linux/pci-ecam.h.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/controller/pci-thunder-pem.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index 3f847969143e..1a3f70ac61fc 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -19,6 +19,15 @@
 #define PEM_CFG_WR 0x28
 #define PEM_CFG_RD 0x30
 
+/*
+ * Enhanced Configuration Access Mechanism (ECAM)
+ *
+ * N.B. This is a non-standard platform-specific ECAM bus shift value.  For
+ * standard values defined in the PCI Express Base Specification see
+ * include/linux/pci-ecam.h.
+ */
+#define THUNDER_PCIE_ECAM_BUS_SHIFT	24
+
 struct thunder_pem_pci {
 	u32		ea_entry[3];
 	void __iomem	*pem_reg_base;
@@ -404,7 +413,7 @@ static int thunder_pem_acpi_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops thunder_pem_ecam_ops = {
-	.bus_shift	= 24,
+	.bus_shift	= THUNDER_PCIE_ECAM_BUS_SHIFT,
 	.init		= thunder_pem_acpi_init,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
@@ -441,7 +450,7 @@ static int thunder_pem_platform_init(struct pci_config_window *cfg)
 }
 
 static const struct pci_ecam_ops pci_thunder_pem_ops = {
-	.bus_shift	= 24,
+	.bus_shift	= THUNDER_PCIE_ECAM_BUS_SHIFT,
 	.init		= thunder_pem_platform_init,
 	.pci_ops	= {
 		.map_bus	= pci_ecam_map_bus,
-- 
2.29.2

