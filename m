Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D73252C7BF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 00:14:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkkhT1BjnzDrQt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:14:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkkY65kMVzDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:07:54 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id r3so13093313wrt.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 15:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7DrLBT8KBYKfbvtR7994XDirbE4jnXzlQLSoJlL9lc=;
 b=kWRTKWe2oicgAdMvcPTn12wRTtaJEF75JsWfRMuxxZQ74Fg0emUbw9nesdsDGXxfHS
 Yo2d4dzoRm3viJrDKf7Cl0n+ohz5YtkewnnPJ4EupDVFqxgKnDwYatD2/NHcSHvZalUz
 TUORiT0tx7KDFdWQGqG/mRE7On1sDH7IZsXpNXtu6ly/oU2CHJl3IN1E7Qp9vJnSEfVY
 vLWQMP7AqB1KjqW9v9IH7JEc+KWwGEhQImWNOFOD2Duu/sYVoqrGY1ZHz629XwmZDJnv
 PznK8sKbyl1ALlqgaq0KuoDERE7A16C6fFPmffnw8PxdarBHmheLVeX5/kTU2JOtkaJ9
 dHeA==
X-Gm-Message-State: AOAM530lNUgDDlAiFJPipuhOIIAvtR5YtPytDqEYL3UH0MS0Fe0O+q+Y
 fegcU/18UdaoxE6nyEm4R8E=
X-Google-Smtp-Source: ABdhPJwdjGj7iDsGU1B5WR1LxkaOGB+ic6Eu0jtLWAlHXS2/EdXYuqT/jY33YywMRM935NcuXWVL6A==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr24605112wrw.42.1606691270924; 
 Sun, 29 Nov 2020 15:07:50 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id d2sm24831005wrn.43.2020.11.29.15.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 15:07:50 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 3/5] PCI: iproc: Convert to use the new ECAM constants
Date: Sun, 29 Nov 2020 23:07:41 +0000
Message-Id: <20201129230743.3006978-4-kw@linux.com>
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

Change interface of the function iproc_pcie_map_ep_cfg_reg() so that use
of PCI_SLOT() and PCI_FUNC() macros and most of the local ECAM-specific
constants can be dropped, and the new PCIE_ECAM_OFFSET() macro can be
used instead.  Use the ALIGN_DOWN() macro to ensure that PCI Express
ECAM offset is always 32 bit aligned.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/controller/pcie-iproc.c | 31 ++++++++---------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 905e93808243..503662380ff8 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -6,6 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/pci-ecam.h>
 #include <linux/msi.h>
 #include <linux/clk.h>
 #include <linux/module.h>
@@ -39,16 +40,8 @@
 
 #define CFG_IND_ADDR_MASK		0x00001ffc
 
-#define CFG_ADDR_BUS_NUM_SHIFT		20
-#define CFG_ADDR_BUS_NUM_MASK		0x0ff00000
-#define CFG_ADDR_DEV_NUM_SHIFT		15
-#define CFG_ADDR_DEV_NUM_MASK		0x000f8000
-#define CFG_ADDR_FUNC_NUM_SHIFT		12
-#define CFG_ADDR_FUNC_NUM_MASK		0x00007000
-#define CFG_ADDR_REG_NUM_SHIFT		2
 #define CFG_ADDR_REG_NUM_MASK		0x00000ffc
-#define CFG_ADDR_CFG_TYPE_SHIFT		0
-#define CFG_ADDR_CFG_TYPE_MASK		0x00000003
+#define CFG_ADDR_CFG_TYPE_1		1
 
 #define SYS_RC_INTX_MASK		0xf
 
@@ -459,19 +452,15 @@ static inline void iproc_pcie_apb_err_disable(struct pci_bus *bus,
 
 static void __iomem *iproc_pcie_map_ep_cfg_reg(struct iproc_pcie *pcie,
 					       unsigned int busno,
-					       unsigned int slot,
-					       unsigned int fn,
+					       unsigned int devfn,
 					       int where)
 {
 	u16 offset;
 	u32 val;
 
 	/* EP device access */
-	val = (busno << CFG_ADDR_BUS_NUM_SHIFT) |
-		(slot << CFG_ADDR_DEV_NUM_SHIFT) |
-		(fn << CFG_ADDR_FUNC_NUM_SHIFT) |
-		(where & CFG_ADDR_REG_NUM_MASK) |
-		(1 & CFG_ADDR_CFG_TYPE_MASK);
+	val = ALIGN_DOWN(PCIE_ECAM_OFFSET(busno, devfn, where), 4) |
+		CFG_ADDR_CFG_TYPE_1;
 
 	iproc_pcie_write_reg(pcie, IPROC_PCIE_CFG_ADDR, val);
 	offset = iproc_pcie_reg_offset(pcie, IPROC_PCIE_CFG_DATA);
@@ -574,8 +563,6 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *val)
 {
 	struct iproc_pcie *pcie = iproc_data(bus);
-	unsigned int slot = PCI_SLOT(devfn);
-	unsigned int fn = PCI_FUNC(devfn);
 	unsigned int busno = bus->number;
 	void __iomem *cfg_data_p;
 	unsigned int data;
@@ -590,7 +577,7 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 		return ret;
 	}
 
-	cfg_data_p = iproc_pcie_map_ep_cfg_reg(pcie, busno, slot, fn, where);
+	cfg_data_p = iproc_pcie_map_ep_cfg_reg(pcie, busno, devfn, where);
 
 	if (!cfg_data_p)
 		return PCIBIOS_DEVICE_NOT_FOUND;
@@ -631,13 +618,11 @@ static void __iomem *iproc_pcie_map_cfg_bus(struct iproc_pcie *pcie,
 					    int busno, unsigned int devfn,
 					    int where)
 {
-	unsigned slot = PCI_SLOT(devfn);
-	unsigned fn = PCI_FUNC(devfn);
 	u16 offset;
 
 	/* root complex access */
 	if (busno == 0) {
-		if (slot > 0 || fn > 0)
+		if (PCIE_ECAM_DEVFN(devfn) > 0)
 			return NULL;
 
 		iproc_pcie_write_reg(pcie, IPROC_PCIE_CFG_IND_ADDR,
@@ -649,7 +634,7 @@ static void __iomem *iproc_pcie_map_cfg_bus(struct iproc_pcie *pcie,
 			return (pcie->base + offset);
 	}
 
-	return iproc_pcie_map_ep_cfg_reg(pcie, busno, slot, fn, where);
+	return iproc_pcie_map_ep_cfg_reg(pcie, busno, devfn, where);
 }
 
 static void __iomem *iproc_pcie_bus_map_cfg_bus(struct pci_bus *bus,
-- 
2.29.2

