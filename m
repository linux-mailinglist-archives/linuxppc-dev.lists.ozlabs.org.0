Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF4329D230
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 22:01:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM1G93pkQzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 08:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0xT69gczDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:47:09 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id j7so933651oie.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 13:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxZqaaZeM9rn0EmiB2pyN8ld61KaiAeovfT1I1hXfhU=;
 b=VfbRyVxeZ2uOaa+hWRnwQzQ0SyxwkwYcy1YtVRM8QkbwY1TSAuWZmIrJM/d5bFhgjY
 IHPpzVDSAYuhlOp6Hs/6C1t/gG6XbgDfP5kyrv0yf7WMhGRjKEZGMNmJUkMhLj7v3Eyn
 xDBslzRo/Sr7qfBFV/GAR+pl3l8btSUEFjIIGtD5nSj5qKnkvpT+4SAz8BAcNlhtU3el
 +9ZtDobIPsnnGTVtPhYSv+qAKh93ez1Ms8K+EA3xsegWK0hv3Bm4TrgmjkQbkjWcJ8zV
 u0tdOOH10LawtcowamNoKwwZgEEfkb5rkjSBcoutGHBwZPcJXcRfd4LXHjbOjW32SPvd
 8dZA==
X-Gm-Message-State: AOAM5338TG+D+soBp8ja7QoelloJkmTseZ5FVLQiashHVjdwsYbMSxhH
 aAIo5GHldfx+w9/XoMfRrw==
X-Google-Smtp-Source: ABdhPJyFp7QnoFosByRfbGom+wWmaa8T9lbdi9qswtTyff4qMNEAI9VDyjl5mqDEBjA5fFbiY8f1Ew==
X-Received: by 2002:a54:4194:: with SMTP id 20mr606316oiy.137.1603918027560;
 Wed, 28 Oct 2020 13:47:07 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:06 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 07/13] PCI: dwc: Drop the .set_num_vectors() host op
Date: Wed, 28 Oct 2020 15:46:40 -0500
Message-Id: <20201028204646.356535-8-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's no reason for the .set_num_vectors() host op. Drivers needing a
non-default value can just initialize pcie_port.num_vectors directly.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 19 ++++---------------
 .../pci/controller/dwc/pcie-designware-plat.c |  7 +------
 drivers/pci/controller/dwc/pcie-designware.h  |  1 -
 drivers/pci/controller/dwc/pcie-tegra194.c    |  7 +------
 4 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 265a48f1a0ae..1bd6a9762426 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -365,22 +365,11 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		pci->link_gen = of_pci_get_max_link_speed(np);
 
 	if (pci_msi_enabled()) {
-		/*
-		 * If a specific SoC driver needs to change the
-		 * default number of vectors, it needs to implement
-		 * the set_num_vectors callback.
-		 */
-		if (!pp->ops->set_num_vectors) {
+		if (!pp->num_vectors) {
 			pp->num_vectors = MSI_DEF_NUM_VECTORS;
-		} else {
-			pp->ops->set_num_vectors(pp);
-
-			if (pp->num_vectors > MAX_MSI_IRQS ||
-			    pp->num_vectors == 0) {
-				dev_err(dev,
-					"Invalid number of vectors\n");
-				return -EINVAL;
-			}
+		} else if (pp->num_vectors > MAX_MSI_IRQS) {
+			dev_err(dev, "Invalid number of vectors\n");
+			return -EINVAL;
 		}
 
 		if (!pp->ops->msi_host_init) {
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 562a05e07b1d..13fede1d4157 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -44,14 +44,8 @@ static int dw_plat_pcie_host_init(struct pcie_port *pp)
 	return 0;
 }
 
-static void dw_plat_set_num_vectors(struct pcie_port *pp)
-{
-	pp->num_vectors = MAX_MSI_IRQS;
-}
-
 static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
 	.host_init = dw_plat_pcie_host_init,
-	.set_num_vectors = dw_plat_set_num_vectors,
 };
 
 static int dw_plat_pcie_establish_link(struct dw_pcie *pci)
@@ -128,6 +122,7 @@ static int dw_plat_add_pcie_port(struct dw_plat_pcie *dw_plat_pcie,
 			return pp->msi_irq;
 	}
 
+	pp->num_vectors = MAX_MSI_IRQS;
 	pp->ops = &dw_plat_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ed19c34dd0fe..96382dcb2859 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -171,7 +171,6 @@ enum dw_pcie_device_mode {
 
 struct dw_pcie_host_ops {
 	int (*host_init)(struct pcie_port *pp);
-	void (*set_num_vectors)(struct pcie_port *pp);
 	int (*msi_host_init)(struct pcie_port *pp);
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f8fca6794282..5e2841f58700 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -990,11 +990,6 @@ static int tegra_pcie_dw_link_up(struct dw_pcie *pci)
 	return !!(val & PCI_EXP_LNKSTA_DLLLA);
 }
 
-static void tegra_pcie_set_msi_vec_num(struct pcie_port *pp)
-{
-	pp->num_vectors = MAX_MSI_IRQS;
-}
-
 static int tegra_pcie_dw_start_link(struct dw_pcie *pci)
 {
 	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
@@ -1019,7 +1014,6 @@ static const struct dw_pcie_ops tegra_dw_pcie_ops = {
 
 static struct dw_pcie_host_ops tegra_pcie_dw_host_ops = {
 	.host_init = tegra_pcie_dw_host_init,
-	.set_num_vectors = tegra_pcie_set_msi_vec_num,
 };
 
 static void tegra_pcie_disable_phy(struct tegra_pcie_dw *pcie)
@@ -1995,6 +1989,7 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 	pci->n_fts[1] = FTS_VAL;
 
 	pp = &pci->pp;
+	pp->num_vectors = MAX_MSI_IRQS;
 	pcie->dev = &pdev->dev;
 	pcie->mode = (enum dw_pcie_device_mode)data->mode;
 
-- 
2.25.1

