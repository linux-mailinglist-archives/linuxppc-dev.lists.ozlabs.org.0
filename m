Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA929D226
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 21:52:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM13Z57FQzDqWh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 07:52:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0xF2v3rzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 07:46:57 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id f97so394382otb.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 13:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQyia8yFxJFo/T6o8CYQ5VyHneaAbbvX2dVIUGSCMQQ=;
 b=Vg7VLiRl0B08mPsB8gUzPb5wEd0tXTAKrvS+1cyl8kTXsk31lIJ3G0dy/a8gkffeSu
 SzeAn49ci4m82l6+oZJPEcz5mLzoFoy4Szmz8CuiC6w1zY3/fBY8Ev6c4iTkSUWSlit7
 Smsd/r3XX7xhqr7eqAGejrqdZiHRtkgcxMiokcsYTC4hLuW0td77nazI5kqyH2/ptlM3
 CeYscIodCg44bguuK3LkEZ2n+rxgjcbnPlWy9TvCj4ue3IvrSEmP8HHHZaSajFm/DKJW
 m0Kf0vsnkUgZWk/fxpvDsaSnCgxHWqWSmQUgF6KMlYRl+fthXhiNGhfbiLKEwHcWGMSt
 VV8Q==
X-Gm-Message-State: AOAM531abDjRNPpg0DbYsO8znhQZLz07Y5qERx6siW1wPpv6TIfmIvwZ
 JJ4vhmz1LJ+X2DD4AAqilA==
X-Google-Smtp-Source: ABdhPJw2Fi0abZoXS4t0yH9eCkAEgtoxTCLjdD+B6EjQnzh8DitGWJBXxEHGCCo7AWLp1zCE4fxuXQ==
X-Received: by 2002:a9d:685a:: with SMTP id c26mr883050oto.40.1603918014866;
 Wed, 28 Oct 2020 13:46:54 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:46:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 02/13] PCI: dwc/intel-gw: Move ATU offset out of driver match
 data
Date: Wed, 28 Oct 2020 15:46:35 -0500
Message-Id: <20201028204646.356535-3-robh@kernel.org>
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

The ATU offset should be a register range in DT called 'atu', not driver
match data. Any future platforms with a different ATU offset should add
it to their DT.

This is also in preparation to do DBI resource setup in the core DWC
code, so let's move setting atu_base later in intel_pcie_rc_setup().

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 5650cb78acba..77ef88333115 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -58,7 +58,6 @@
 
 struct intel_pcie_soc {
 	unsigned int	pcie_ver;
-	unsigned int	pcie_atu_offset;
 	u32		num_viewport;
 };
 
@@ -155,11 +154,15 @@ static void intel_pcie_init_n_fts(struct dw_pcie *pci)
 
 static void intel_pcie_rc_setup(struct intel_pcie_port *lpp)
 {
+	struct dw_pcie *pci = &lpp->pci;
+
+	pci->atu_base = pci->dbi_base + 0xC0000;
+
 	intel_pcie_ltssm_disable(lpp);
 	intel_pcie_link_setup(lpp);
-	intel_pcie_init_n_fts(&lpp->pci);
-	dw_pcie_setup_rc(&lpp->pci.pp);
-	dw_pcie_upconfig_setup(&lpp->pci);
+	intel_pcie_init_n_fts(pci);
+	dw_pcie_setup_rc(&pci->pp);
+	dw_pcie_upconfig_setup(pci);
 }
 
 static int intel_pcie_ep_rst_init(struct intel_pcie_port *lpp)
@@ -425,7 +428,6 @@ static const struct dw_pcie_host_ops intel_pcie_dw_ops = {
 
 static const struct intel_pcie_soc pcie_data = {
 	.pcie_ver =		0x520A,
-	.pcie_atu_offset =	0xC0000,
 	.num_viewport =		3,
 };
 
@@ -461,7 +463,6 @@ static int intel_pcie_probe(struct platform_device *pdev)
 
 	pci->ops = &intel_pcie_ops;
 	pci->version = data->pcie_ver;
-	pci->atu_base = pci->dbi_base + data->pcie_atu_offset;
 	pp->ops = &intel_pcie_dw_ops;
 
 	ret = dw_pcie_host_init(pp);
-- 
2.25.1

