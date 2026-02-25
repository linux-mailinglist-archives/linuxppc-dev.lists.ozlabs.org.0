Return-Path: <linuxppc-dev+bounces-17199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FRbLKIrn2lXZQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:04:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2619B30C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:04:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLgtP12YYz3f8M;
	Thu, 26 Feb 2026 04:04:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772039069;
	cv=none; b=l4LjA+f9eaVN/6o7rMy8enGEDK1CPkneBWNX/TtjQtllbS0dj7cCvetz27d4R4a1sJHsTO10UtGsBMthR+aMJFJCos3io4Wjumjry1egjt7A3m2Z3EOFwAGwExG0JHN8sV1JBKYWWJAL9lSk/QLDj7x0hQpsiiEr1NsFtAJVz0lljdwFM58Xoh+sWOMWoqDEwGHvd2oTJ9f8AB5UKzKGR//JF0pl8H2N2+FEpD6q9+iRoPlk8S/Pqmd8tK0aIQb9nHZ9l9AuuKWwGfKqNi1KvRjjpFDmxC0z/1cjUWm6EP83po601slgvFnxaO2W46qojs7D/0qePke/XkQ1cCZrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772039069; c=relaxed/relaxed;
	bh=5OsZpD79Seky+JAtLKDU6dySA7SLRwTICtpDLck3W0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwE9eWd+4zxQGUcoCGGVzfCZPFBDc8FDWyzBFrpn9lPoPTMLcdLnqCFMeflzlrTmB1TiYGUjImcoG2tqm9Qn1XDQnlw/7FOTPwLE31DAyAc+zxz2SJyMJfBCDhIYnyeVvBZLoeHkLnaugGbHHjFoNzj4gt5pDfosIDq2j9s9jBRXTK5Mzc2+V17StyRnCH3/jDXufhPaK4LVZUJGwz5H4/T/QW/bAPU+EvOzhaWPfnDTve2wIA0ZMStaA+YDydFl6qhUdPwidEA25e4HzI6a4LfO0E5Sp05tKjfOYT5SqiMNIaMZjWhz25q/uaS+X16Q3MHtWbuPryqSYneI2Q07wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=deuDDxK2; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=deuDDxK2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLgtN1Yryz3f7H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 04:04:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92F996012B;
	Wed, 25 Feb 2026 17:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AAFC19421;
	Wed, 25 Feb 2026 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772039065;
	bh=4b4oZQ1Zn7fI6iKV7SRrY6c4yKHwqXtLbyeVaStjEzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=deuDDxK2LzONw2SPspuHPgwaDSoeOGtrT7H0cN2zbHggGiRG5myttqxk7d96/saw5
	 fVlWKbK41MfLLzb7dCrmfVENjOClSP7UG8wUPFsQAzNIiQXrbnFu7ITGRuulSFnldn
	 yuB3VKNBi321SX1MzK+Tx1VRq3T8mHjZGbO1uKCZGt4Rc343CmQFSQ2fm6EBRP111z
	 CZihko8OV+oH8BlgRXpLQg8Z2JM98Gn17KbKLQhtXJKvo/10BOO6F7kuiM03nq65is
	 wwQyJFEJxBETu7jMrNok2Xzs4BFS/Ah3ahLnO0HGjXPV51AsHksbXBU/wVMEyHCmCU
	 JIssrP2gzM/zw==
From: Niklas Cassel <cassel@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/9] PCI: dwc: Disable BARs in common code instead of in each glue driver
Date: Wed, 25 Feb 2026 18:03:29 +0100
Message-ID: <20260225170324.4033466-17-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225170324.4033466-11-cassel@kernel.org>
References: <20260225170324.4033466-11-cassel@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13334; i=cassel@kernel.org; h=from:subject; bh=4b4oZQ1Zn7fI6iKV7SRrY6c4yKHwqXtLbyeVaStjEzI=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLna6eu3Dq1Se+5UfnDXpawmJUMTrGb9iYU5JSbVOR/f Xp43c4pHaUsDGJcDLJiiiy+P1z2F3e7TzmueMcGZg4rE8gQBi5OAZhI10WG/8Eyc0sTvm6O42V3 qb2hzJQlzRd3dNuWordZ9sufn7ltnsXwT113uqvY/omym1buPDDvS+biXd/6pNKWcTwS2/zhTfN 8IwYA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,google.com,nxp.com,pengutronix.de,gmail.com,axis.com,sntech.de,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com];
	FORGED_RECIPIENTS(0.00)[m:vigneshr@ti.com,m:s-vadapalli@ti.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:jesper.nilsson@axis.com,m:jingoohan1@gmail.com,m:heiko@sntech.de,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:christian.bruel@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:mmaddireddy@nvidia.com,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:cassel@kernel.org,m:linux-omap@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-
 kernel@axis.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	ASN_FAIL(0.00)[1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.f.9.b.1.2.0.0.4.9.4.0.4.2.asn6.rspamd.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_FROM(0.00)[bounces-17199-lists,linuxppc-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: DED2619B30C
X-Rspamd-Action: no action

The current EPC core design relies on an EPC driver disabling all BARs by
default. An EPF driver will then enable the BARs that it wants to enabled.

This design is there because there is no epc->ops->disable_bar().
(There is a epc->ops->clear_bar(), but that is only to disable a BAR that
has been enabled using epc->ops->set_bar() first.)

By default, an EPF driver will not be able to get/enable BARs that are
marked as BAR_RESERVED or BAR_DISABLED (see pci_epc_get_next_free_bar()).

Since the current EPC code design requires an EPC driver to disable all
BARs by default, let's move this to DWC common code from each glue driver.

BAR_RESERVED BARs are not disabled by default because these BARs are
hardware backed, and should only be disabled explicitly by an EPF driver
if absolutely necessary for the EPF driver to function correctly.
(This is similar to how e.g. NVMe may have vendor specific BARs outside of
the mandatory BAR0 which contains the NVMe registers.)

Note that there is currently no EPC operation to disable a BAR that has not
first been programmed using pci_epc_set_bar(). If an EPF driver ever wants
to disable a BAR marked as BAR_RESERVED, a disable_bar() operation would
have to be added first.

No functional changes intended.

Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  4 ----
 drivers/pci/controller/dwc/pci-imx6.c         | 10 --------
 .../pci/controller/dwc/pci-layerscape-ep.c    |  4 ----
 drivers/pci/controller/dwc/pcie-artpec6.c     |  4 ----
 .../pci/controller/dwc/pcie-designware-ep.c   | 24 +++++++++++++++++++
 .../pci/controller/dwc/pcie-designware-plat.c | 10 --------
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  4 ----
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 10 --------
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 10 --------
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 --------
 drivers/pci/controller/dwc/pcie-tegra194.c    | 10 --------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c | 10 --------
 12 files changed, 24 insertions(+), 86 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..cd904659c321 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -378,10 +378,6 @@ static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 
 	dra7xx_pcie_enable_wrapper_interrupts(dra7xx);
 }
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index ec1e3557ca53..f5fe5cfc46c7 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1401,15 +1401,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 	.stop_link = imx_pcie_stop_link,
 };
 
-static void imx_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	enum pci_barno bar;
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-
-	for (bar = BAR_0; bar <= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 				  unsigned int type, u16 interrupt_num)
 {
@@ -1478,7 +1469,6 @@ imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = imx_pcie_ep_init,
 	.raise_irq = imx_pcie_ep_raise_irq,
 	.get_features = imx_pcie_ep_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 5a03a8f895f9..1f5fccdb4ff4 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -152,15 +152,11 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
 	struct dw_pcie_ep_func *ep_func;
-	enum pci_barno bar;
 
 	ep_func = dw_pcie_ep_get_func_from_ep(ep, 0);
 	if (!ep_func)
 		return;
 
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-
 	pcie->ls_epc->msi_capable = ep_func->msi_cap ? true : false;
 	pcie->ls_epc->msix_capable = ep_func->msix_cap ? true : false;
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index e994b75986c3..55cb957ae1f3 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -340,15 +340,11 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
-	enum pci_barno bar;
 
 	artpec6_pcie_assert_core_reset(artpec6_pcie);
 	artpec6_pcie_init_phy(artpec6_pcie);
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 }
 
 static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 295076cf70de..386bfb7b2bf6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1114,6 +1114,28 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void dw_pcie_ep_disable_bars(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_epc_bar_type bar_type;
+	enum pci_barno bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		bar_type = dw_pcie_ep_get_bar_type(ep, bar);
+
+		/*
+		 * Reserved BARs should not get disabled by default. All other
+		 * BAR types are disabled by default.
+		 *
+		 * This is in line with the current EPC core design, where all
+		 * BARs are disabled by default, and then the EPF driver enables
+		 * the BARs it wishes to use.
+		 */
+		if (bar_type != BAR_RESERVED)
+			dw_pcie_ep_reset_bar(pci, bar);
+	}
+}
+
 /**
  * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
@@ -1196,6 +1218,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ep->ops->init)
 		ep->ops->init(ep);
 
+	dw_pcie_ep_disable_bars(ep);
+
 	/*
 	 * PCIe r6.0, section 7.9.15 states that for endpoints that support
 	 * PTM, this capability structure is required in exactly one
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 8530746ec5cb..d103ab759c4e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -32,15 +32,6 @@ struct dw_plat_pcie_of_data {
 static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
 };
 
-static void dw_plat_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 				     unsigned int type, u16 interrupt_num)
 {
@@ -73,7 +64,6 @@ dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = dw_plat_pcie_ep_init,
 	.raise_irq = dw_plat_pcie_ep_raise_irq,
 	.get_features = dw_plat_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index ecc28093c589..4e9b813c3afb 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -361,13 +361,9 @@ static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
 static void rockchip_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
 
 	rockchip_pcie_enable_l0s(pci);
 	rockchip_pcie_ep_hide_broken_ats_cap_rk3588(ep);
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
 };
 
 static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index e55675b3840a..e8c8ba1659fd 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -861,17 +861,7 @@ qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
 	return &qcom_pcie_epc_features;
 }
 
-static void qcom_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = BAR_0; bar <= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static const struct dw_pcie_ep_ops pci_ep_ops = {
-	.init = qcom_pcie_ep_init,
 	.raise_irq = qcom_pcie_ep_raise_irq,
 	.get_features = qcom_pcie_epc_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 9dd05bac22b9..1198ddc1752c 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -386,15 +386,6 @@ static void rcar_gen4_pcie_ep_pre_init(struct dw_pcie_ep *ep)
 	writel(PCIEDMAINTSTSEN_INIT, rcar->base + PCIEDMAINTSTSEN);
 }
 
-static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
 {
 	writel(0, rcar->base + PCIEDMAINTSTSEN);
@@ -449,7 +440,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.pre_init = rcar_gen4_pcie_ep_pre_init,
-	.init = rcar_gen4_pcie_ep_init,
 	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
 	.get_features = rcar_gen4_pcie_ep_get_features,
 	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index c1944b40ce02..a7988dff1045 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -28,15 +28,6 @@ struct stm32_pcie {
 	unsigned int perst_irq;
 };
 
-static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int stm32_pcie_start_link(struct dw_pcie *pci)
 {
 	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
@@ -82,7 +73,6 @@ stm32_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
-	.init = stm32_pcie_ep_init,
 	.raise_irq = stm32_pcie_raise_irq,
 	.get_features = stm32_pcie_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 9f9453e8cd23..3a6bffaff9ea 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1923,15 +1923,6 @@ static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static void tegra_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-};
-
 static int tegra_pcie_ep_raise_intx_irq(struct tegra_pcie_dw *pcie, u16 irq)
 {
 	/* Tegra194 supports only INTA */
@@ -2008,7 +1999,6 @@ tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
-	.init = tegra_pcie_ep_init,
 	.raise_irq = tegra_pcie_ep_raise_irq,
 	.get_features = tegra_pcie_ep_get_features,
 };
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index 5bde3ee682b5..494376d1812d 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -203,15 +203,6 @@ static void uniphier_pcie_stop_link(struct dw_pcie *pci)
 	uniphier_pcie_ltssm_enable(priv, false);
 }
 
-static void uniphier_pcie_ep_init(struct dw_pcie_ep *ep)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	enum pci_barno bar;
-
-	for (bar = BAR_0; bar <= BAR_5; bar++)
-		dw_pcie_ep_reset_bar(pci, bar);
-}
-
 static int uniphier_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -283,7 +274,6 @@ uniphier_pcie_get_features(struct dw_pcie_ep *ep)
 }
 
 static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
-	.init = uniphier_pcie_ep_init,
 	.raise_irq = uniphier_pcie_ep_raise_irq,
 	.get_features = uniphier_pcie_get_features,
 };
-- 
2.53.0


