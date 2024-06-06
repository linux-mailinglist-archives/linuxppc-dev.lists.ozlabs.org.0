Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E12518FE60E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 14:05:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=XfgDWMe+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw3280gyyz3dTN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 22:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=XfgDWMe+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com; envelope-from=s-vadapalli@ti.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 734 seconds by postgrey-1.37 at boromir; Thu, 06 Jun 2024 20:51:58 AEST
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw1Nt3ZBPz3cTj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 20:51:56 +1000 (AEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456Ad1ok093099;
	Thu, 6 Jun 2024 05:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717670341;
	bh=qzRU3NjJ1d8c/C2020uLuMVnu7LuuPICJYaQN3jl9Co=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XfgDWMe+BQyCpPRKKo/C86Fku2TS+SS/V4UKkHuNgaVvXBlkwRzYWDLpdnOeoG1Df
	 88wsCO4NciJyu+tAYaTqHLYvtP8etsj4rZYRrhX1eSRqFIhSL1TIEmraNT2M+q67P/
	 CMmCxbafjX3Vh1d0veRVVX+mlr8XP4f11VWswtxw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456Ad14c006785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 05:39:01 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 05:39:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 05:39:01 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456Ad0SS128334;
	Thu, 6 Jun 2024 05:39:01 -0500
Date: Thu, 6 Jun 2024 16:08:59 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/5] PCI: endpoint: Introduce 'epc_deinit' event and
 notify the EPF drivers
Message-ID: <62430183-a413-454e-a485-a5347b80ce84@ti.com>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 06 Jun 2024 22:05:16 +1000
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2024 at 12:56:35PM +0530, Manivannan Sadhasivam wrote:
> As like the 'epc_init' event, that is used to signal the EPF drivers about
> the EPC initialization, let's introduce 'epc_deinit' event that is used to
> signal EPC deinitialization.
> 
> The EPC deinitialization applies only when any sort of fundamental reset
> is supported by the endpoint controller as per the PCIe spec.
> 
> Reference: PCIe Base spec v5.0, sections 4.2.4.9.1 and 6.6.1.
> 
> Currently, some EPC drivers like pcie-qcom-ep and pcie-tegra194 support
> PERST# as the fundamental reset. So the 'deinit' event will be notified to
> the EPF drivers when PERST# assert happens in the above mentioned EPC
> drivers.
> 
> The EPF drivers, on receiving the event through the epc_deinit() callback
> should reset the EPF state machine and also cleanup any configuration that
> got affected by the fundamental reset like BAR, DMA etc...
> 
> This change also warrants skipping the cleanups in unbind() if already done
> in epc_deinit().
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

[...]

Regards,
Siddharth.
