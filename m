Return-Path: <linuxppc-dev+bounces-17506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO1HNLBfpWmx+wUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 11:00:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5DD1D5E41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 11:00:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPZDX41PKz3bsC;
	Mon, 02 Mar 2026 21:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772445612;
	cv=none; b=RVVsAvfhHN95Zzdv3qgIgyTMr9yp2Nbk5F7huku81rxTDNcsmRyIDpXxD83LxQl4EDqtfGnTuX8EgLiSnTV9fiAm08lqXH86xBWKRch3LGMhhFp5YH5CffIFX6f0OE8u9XV+Po1TpjLFg1k3Ie0+WiPyXc+oobFy4FRdJTKJIxo+iDJD1p9RaDo67UMAHMe4LrUj9936VPg2FxUqgHARIJoHc7cFgIQ5pm2ZzrpUsxlIx+Z3V/NFVAfWWvw0jmBTNpWlnFdg2CfVODDo4NAuwASfv8rT8ijbpzpWZJa8qRZyaxUVIKKjSUxuqqAXqpxwLd6w3Csre3PA3zKyU+FR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772445612; c=relaxed/relaxed;
	bh=bNLSjzN1DN4bxizBkRvJNtGUeXXbhrzp7s3inMMgjis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juWTGIav2ll/WOH26IuCWeqQxMmuMPt4Zhd5N+oT1/xKObJnAju0U/QF1n6+B2sZpQ93Lh3dsTAfAXdMttMcSj1uTIjlAdRw4u9PNe8nrWgXSaJq2rmLl9zVFyiWhUNZyClyMTmb6rMDb0IBcUF86VJZsL4xiJxG6OM2MMX3OzPbvykzX6qytQ07dkxakW1Sk1zDOvcq4N4ie6nlY0ZU1owu1kniKmCxwJ4LgDd7xlUC19z6vGA+mMCOdBzPOAITeIaqUB3Joy2hVyag8kUocVHNrBvDb2qofPanocv6ipn2y+3SgWAn+auJzWdIaBRzBblOYlhR+RFY69S/TAjTmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dx+5vVE6; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dx+5vVE6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPZDW5LbWz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 21:00:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9629B43BD5;
	Mon,  2 Mar 2026 10:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB436C19425;
	Mon,  2 Mar 2026 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772445609;
	bh=BxIYx3Y999QRoEkyovD05r3kAt0oourcD0d7OR38w/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dx+5vVE6p+29xGUUJChh99qvbGtsZ4Dyd2J1DEGKuMDD2KM/fjMA6+SiVZELx89Jh
	 50BFScarlpt/oTVgeaFjQX1+u/4gTI0okmZJh2l25arG0zrws6yK7iHRrKmqKC9xKj
	 rGxJBKPwc3APmR1szWc4AHELctWmeoPR5CYI4czXyjMNhwvX5umOUcxhVcGiKQ6ovd
	 jiKq49HKYZX950f8fmYv5BXKlIhqACRnje9zIvnoxdt/ypK2HN2gfc6G2kDu9JJ+4Z
	 izqUn3mPa568hj0TH/hgSjVqaAbCbPj8ve7SwPiZVcb2RxsZ2q3lePmNmnkljpMUMz
	 D3sz2hyZZkUWA==
From: Niklas Cassel <cassel@kernel.org>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
Date: Mon,  2 Mar 2026 10:59:13 +0100
Message-ID: <20260302095913.48155-12-cassel@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302095913.48155-11-cassel@kernel.org>
References: <20260302095913.48155-11-cassel@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7941; i=cassel@kernel.org; h=from:subject; bh=BxIYx3Y999QRoEkyovD05r3kAt0oourcD0d7OR38w/8=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKXxpdzZXDKaPV8yv94V66obW5sWWXJsv7PipPeake1G r155L6/o5SFQYyLQVZMkcX3h8v+4m73KccV79jAzGFlAhnCwMUpABP5lc/whyMtPfbWMYbsOy/8 TqtV5S/dEcNj6OvQnRTk1u8+/0DNSob/FVv7/EIU6oskd12qYJur83VBly73p3mLtf4zSDod/by UDwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17506-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:srikanth.thokala@intel.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kishon@kernel.org,m:mmaddireddy@nvidia.com,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:thierryreding@gmail.com,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,valinux.co.jp:email]
X-Rspamd-Queue-Id: DC5DD1D5E41
X-Rspamd-Action: no action

Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate from
BAR_RESERVED.

This BAR type will only be used for a BAR following a "only_64bit" BAR.

This makes the BAR description more clear, and the reader does no longer
need to check the BAR type for the preceding BAR to know how to interpret
the BAR type.

No functional changes.

Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c |  4 ++--
 drivers/pci/controller/dwc/pcie-keembay.c      |  6 +++---
 drivers/pci/controller/dwc/pcie-qcom-ep.c      |  4 ++--
 drivers/pci/controller/dwc/pcie-tegra194.c     |  2 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c  | 10 +++++-----
 drivers/pci/controller/pcie-rcar-ep.c          |  6 +++---
 drivers/pci/endpoint/pci-epc-core.c            |  3 ++-
 include/linux/pci-epc.h                        |  5 ++++-
 8 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index a4a800699f89..5a03a8f895f9 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -251,9 +251,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci->ops = pcie->drvdata->dw_pcie_ops;
 
 	ls_epc->bar[BAR_2].only_64bit = true;
-	ls_epc->bar[BAR_3].type = BAR_RESERVED;
+	ls_epc->bar[BAR_3].type = BAR_64BIT_UPPER;
 	ls_epc->bar[BAR_4].only_64bit = true;
-	ls_epc->bar[BAR_5].type = BAR_RESERVED;
+	ls_epc->bar[BAR_5].type = BAR_64BIT_UPPER;
 	ls_epc->linkup_notifier = true;
 
 	pcie->pci = pci;
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 2666a9c3d67e..5a00b8cf5b53 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -313,11 +313,11 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
-	.bar[BAR_1]		= { .type = BAR_RESERVED, },
+	.bar[BAR_1]		= { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2]		= { .only_64bit = true, },
-	.bar[BAR_3]		= { .type = BAR_RESERVED, },
+	.bar[BAR_3]		= { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_4]		= { .only_64bit = true, },
-	.bar[BAR_5]		= { .type = BAR_RESERVED, },
+	.bar[BAR_5]		= { .type = BAR_64BIT_UPPER, },
 	.align			= SZ_16K,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 18460f01b2c6..e55675b3840a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -850,9 +850,9 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.msi_capable = true,
 	.align = SZ_4K,
 	.bar[BAR_0] = { .only_64bit = true, },
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2] = { .only_64bit = true, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 };
 
 static const struct pci_epc_features *
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..31aa9a494dbc 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1993,7 +1993,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
 			.only_64bit = true, },
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 	.bar[BAR_4] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d52753060970..f873a1659592 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -426,9 +426,9 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 		.msix_capable = false,
 		.align = 1 << 16,
 		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
+		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
+		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_4] = { .type = BAR_RESERVED, },
 		.bar[BAR_5] = { .type = BAR_RESERVED, },
 	},
@@ -445,11 +445,11 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 		.msix_capable = false,
 		.align = 1 << 12,
 		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
+		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
+		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_4] = { .only_64bit = true, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
+		.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
 	},
 };
 
diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
index 657875ef4657..9b3f5391fabe 100644
--- a/drivers/pci/controller/pcie-rcar-ep.c
+++ b/drivers/pci/controller/pcie-rcar-ep.c
@@ -440,13 +440,13 @@ static const struct pci_epc_features rcar_pcie_epc_features = {
 	/* use 64-bit BARs so mark BAR[1,3,5] as reserved */
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = 128,
 			.only_64bit = true, },
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = 256,
 			.only_64bit = true, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256,
 			.only_64bit = true, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
 };
 
 static const struct pci_epc_features*
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index e546b3dbb240..1ad2f62963c8 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -104,7 +104,8 @@ enum pci_barno pci_epc_get_next_free_bar(const struct pci_epc_features
 
 	for (i = bar; i < PCI_STD_NUM_BARS; i++) {
 		/* If the BAR is not reserved, return it. */
-		if (epc_features->bar[i].type != BAR_RESERVED)
+		if (epc_features->bar[i].type != BAR_RESERVED &&
+		    epc_features->bar[i].type != BAR_64BIT_UPPER)
 			return i;
 	}
 
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index c021c7af175f..c22f8a6cf9a3 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -192,12 +192,15 @@ struct pci_epc {
  *		   NOTE: An EPC driver can currently only set a single supported
  *		   size.
  * @BAR_RESERVED: The BAR should not be touched by an EPF driver.
+ * @BAR_64BIT_UPPER: Should only be set on a BAR if the preceding BAR is marked
+ *		     as only_64bit.
  */
 enum pci_epc_bar_type {
 	BAR_PROGRAMMABLE = 0,
 	BAR_FIXED,
 	BAR_RESIZABLE,
 	BAR_RESERVED,
+	BAR_64BIT_UPPER,
 };
 
 /**
@@ -207,7 +210,7 @@ enum pci_epc_bar_type {
  * @only_64bit: if true, an EPF driver is not allowed to choose if this BAR
  *		should be configured as 32-bit or 64-bit, the EPF driver must
  *		configure this BAR as 64-bit. Additionally, the BAR succeeding
- *		this BAR must be set to type BAR_RESERVED.
+ *		this BAR must be set to type BAR_64BIT_UPPER.
  *
  *		only_64bit should not be set on a BAR of type BAR_RESERVED.
  *		(If BARx is a 64-bit BAR that an EPF driver is not allowed to
-- 
2.53.0


