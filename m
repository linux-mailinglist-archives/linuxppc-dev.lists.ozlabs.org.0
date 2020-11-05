Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008D2A88D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 22:20:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRxHv2Z4SzDqfY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 08:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRx6n0zghzDr7N
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 08:12:17 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id 32so2793012otm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 13:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSeAzIAtX0I+mR++aZnxjxhWoWE9gqtpuXmmBMEpUoM=;
 b=AhjKLHNbPkvxXweuJ+lpFaOE+GaMVbmhTaI8VmRU9n9zf8izx/7GAO525DcGfTH+RZ
 +Kg2FBwFcnp7KuvriZy3qL6I/Tr4WuvTZMhqsBo7qvlg8qEWhOfwJpQXXFOKaX+nsV+1
 c1KQc50wOBgWbZ5E/MIWH9MXZiFg3KvtqWKLlYZqRwHwLVoaaJo6y/3/Rh6BAZVhM6Vq
 7N+03E5KVB/RYP8i49ILc9YtSmS/nPf4gTnE8wCZyDsVRpVuLaotL3cbl5WWiIA3GuU0
 BOadM9w+JlEz8Wxyqjmaz3LHCJkPveRc877r1RY6AILjNPYHt6d7DIotLH2UE/eylirr
 EkJQ==
X-Gm-Message-State: AOAM531bPasW20TJWpzPCcXAjoyjCuirn3NTLlPconfFmgvxFYdf4Dt4
 XkkWH3Z8aAfqOc+jniXUdQ==
X-Google-Smtp-Source: ABdhPJxLhEme/efGkGRWlMX+cxnoYw1OzFM15/yHz5m09H/AvTEAigpq0ts1OPzmcZCznOfNDj12aA==
X-Received: by 2002:a05:6830:4c6:: with SMTP id
 s6mr2857246otd.31.1604610735164; 
 Thu, 05 Nov 2020 13:12:15 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z19sm622549ooi.32.2020.11.05.13.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 13:12:14 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: 
Subject: [PATCH v2 09/16] PCI: dwc: Rework MSI initialization
Date: Thu,  5 Nov 2020 15:11:52 -0600
Message-Id: <20201105211159.1814485-10-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
 Minghuan Lian <minghuan.Lian@nxp.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Mingkai Hu <mingkai.hu@nxp.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are 3 possible MSI implementations for the DWC host. The first is
using the built-in DWC MSI controller. The 2nd is a custom MSI
controller as part of the PCI host (keystone only). The 3rd is an
external MSI controller (typically GICv3 ITS). Currently, the last 2
are distinguished with a .msi_host_init() hook with the 3rd option using
an empty function. However we can detect the 3rd case with the presence
of 'msi-parent' or 'msi-map' properties, so let's do that instead and
remove the empty functions.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Jingoo Han <jingoohan1@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c     |  9 -------
 drivers/pci/controller/dwc/pci-layerscape.c   | 25 -------------------
 .../pci/controller/dwc/pcie-designware-host.c | 20 +++++++++------
 drivers/pci/controller/dwc/pcie-designware.h  |  1 +
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  9 -------
 5 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 9cf14f13798b..784385ae6074 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -272,14 +272,6 @@ static void ks_pcie_handle_legacy_irq(struct keystone_pcie *ks_pcie,
 	ks_pcie_app_writel(ks_pcie, IRQ_EOI, offset);
 }
 
-/*
- * Dummy function so that DW core doesn't configure MSI
- */
-static int ks_pcie_am654_msi_host_init(struct pcie_port *pp)
-{
-	return 0;
-}
-
 static void ks_pcie_enable_error_irq(struct keystone_pcie *ks_pcie)
 {
 	ks_pcie_app_writel(ks_pcie, ERR_IRQ_ENABLE_SET, ERR_IRQ_ALL);
@@ -854,7 +846,6 @@ static const struct dw_pcie_host_ops ks_pcie_host_ops = {
 
 static const struct dw_pcie_host_ops ks_pcie_am654_host_ops = {
 	.host_init = ks_pcie_host_init,
-	.msi_host_init = ks_pcie_am654_msi_host_init,
 };
 
 static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 53e56d54c482..0d84986c4c16 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -168,37 +168,12 @@ static int ls1021_pcie_host_init(struct pcie_port *pp)
 	return ls_pcie_host_init(pp);
 }
 
-static int ls_pcie_msi_host_init(struct pcie_port *pp)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct device *dev = pci->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *msi_node;
-
-	/*
-	 * The MSI domain is set by the generic of_msi_configure().  This
-	 * .msi_host_init() function keeps us from doing the default MSI
-	 * domain setup in dw_pcie_host_init() and also enforces the
-	 * requirement that "msi-parent" exists.
-	 */
-	msi_node = of_parse_phandle(np, "msi-parent", 0);
-	if (!msi_node) {
-		dev_err(dev, "failed to find msi-parent\n");
-		return -EINVAL;
-	}
-
-	of_node_put(msi_node);
-	return 0;
-}
-
 static const struct dw_pcie_host_ops ls1021_pcie_host_ops = {
 	.host_init = ls1021_pcie_host_init,
-	.msi_host_init = ls_pcie_msi_host_init,
 };
 
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
-	.msi_host_init = ls_pcie_msi_host_init,
 };
 
 static const struct dw_pcie_ops dw_ls1021_pcie_ops = {
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 95deef0eaadf..9b952639d020 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -365,6 +365,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		pci->link_gen = of_pci_get_max_link_speed(np);
 
 	if (pci_msi_enabled()) {
+		pp->has_msi_ctrl = !(pp->ops->msi_host_init ||
+				     of_property_read_bool(np, "msi-parent") ||
+				     of_property_read_bool(np, "msi-map"));
+
 		if (!pp->num_vectors) {
 			pp->num_vectors = MSI_DEF_NUM_VECTORS;
 		} else if (pp->num_vectors > MAX_MSI_IRQS) {
@@ -372,7 +376,11 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			return -EINVAL;
 		}
 
-		if (!pp->ops->msi_host_init) {
+		if (pp->ops->msi_host_init) {
+			ret = pp->ops->msi_host_init(pp);
+			if (ret < 0)
+				return ret;
+		} else if (pp->has_msi_ctrl) {
 			if (!pp->msi_irq) {
 				pp->msi_irq = platform_get_irq_byname_optional(pdev, "msi");
 				if (pp->msi_irq < 0) {
@@ -402,10 +410,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 				pp->msi_data = 0;
 				goto err_free_msi;
 			}
-		} else {
-			ret = pp->ops->msi_host_init(pp);
-			if (ret < 0)
-				return ret;
 		}
 	}
 
@@ -426,7 +430,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		return 0;
 
 err_free_msi:
-	if (pci_msi_enabled() && !pp->ops->msi_host_init)
+	if (pp->has_msi_ctrl)
 		dw_pcie_free_msi(pp);
 	return ret;
 }
@@ -436,7 +440,7 @@ void dw_pcie_host_deinit(struct pcie_port *pp)
 {
 	pci_stop_root_bus(pp->bridge->bus);
 	pci_remove_root_bus(pp->bridge->bus);
-	if (pci_msi_enabled() && !pp->ops->msi_host_init)
+	if (pp->has_msi_ctrl)
 		dw_pcie_free_msi(pp);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
@@ -544,7 +548,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 
 	dw_pcie_setup(pci);
 
-	if (pci_msi_enabled() && !pp->ops->msi_host_init) {
+	if (pp->has_msi_ctrl) {
 		num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
 
 		/* Initialize IRQ Status array */
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 96382dcb2859..5d374bab10d1 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -175,6 +175,7 @@ struct dw_pcie_host_ops {
 };
 
 struct pcie_port {
+	bool			has_msi_ctrl:1;
 	u64			cfg0_base;
 	void __iomem		*va_cfg0_base;
 	u32			cfg0_size;
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index c562eb7454b1..292b9de86532 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -385,14 +385,6 @@ static int intel_pcie_rc_init(struct pcie_port *pp)
 	return intel_pcie_host_setup(lpp);
 }
 
-/*
- * Dummy function so that DW core doesn't configure MSI
- */
-static int intel_pcie_msi_init(struct pcie_port *pp)
-{
-	return 0;
-}
-
 static u64 intel_pcie_cpu_addr(struct dw_pcie *pcie, u64 cpu_addr)
 {
 	return cpu_addr + BUS_IATU_OFFSET;
@@ -404,7 +396,6 @@ static const struct dw_pcie_ops intel_pcie_ops = {
 
 static const struct dw_pcie_host_ops intel_pcie_dw_ops = {
 	.host_init =		intel_pcie_rc_init,
-	.msi_host_init =	intel_pcie_msi_init,
 };
 
 static const struct intel_pcie_soc pcie_data = {
-- 
2.25.1

