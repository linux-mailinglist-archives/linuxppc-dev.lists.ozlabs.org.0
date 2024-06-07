Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBFB8FFF41
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 11:23:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vq/ngASC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwbMk3F6Xz3cVv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 19:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vq/ngASC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwbLY0HPbz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 19:21:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA79C61F2E;
	Fri,  7 Jun 2024 09:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA625C2BBFC;
	Fri,  7 Jun 2024 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717752115;
	bh=mkI9Zleemp+5fJfBU0GcUZWrMN2oLrp/WKztAvoJ3vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vq/ngASCb2PCKhRAbva5iVV9N8kqnIlkHsohtzvANVFjV1DDyAL0TN2UQAPoldLNW
	 v3sAUcxfKxJTN15EKoiI4H9hbsB5XBUN8xvf8LvEyHWVv0YLhDtQnttgClP7zcf9bB
	 9+cimC+7UIPVxS6hSHqNafOxRvskvteDvcNu5W9bFgN+IJuB+xYSA3VRh8HeJ3ciF5
	 245pY+YWiCo1jQGVdSXp/8it4oYatSXX2GsENiVxQ63kTkCousJoMMY88chQs2Nvz9
	 Qkviu3aYYBDgpM2AWvu7CUwyLcQCTh/XN/iBZspUoxv3tH5+pIE3JeS5oP2rY6oq/l
	 GEEiy0iiT1ZFA==
Date: Fri, 7 Jun 2024 11:21:44 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 3/5] PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown()
 API to handle Link Down event
Message-ID: <ZmLRKJ76esDBgYW1@ryzen.lan>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <20240606-pci-deinit-v1-3-4395534520dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-pci-deinit-v1-3-4395534520dc@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2024 at 12:56:36PM +0530, Manivannan Sadhasivam wrote:
> As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
> under any of the following circumstances:
> 
> 1. Fundamental/Hot reset
> 2. Link disable transmission by upstream component
> 3. Moving from L2/L3 to L0
> 
> In those cases, Link Down causes some non-sticky DWC registers to loose the
> state (like REBAR, etc...). So the drivers need to reinitialize them to
> function properly once the link comes back again.
> 
> This is not a problem for drivers supporting PERST# IRQ, since they can
> reinitialize the registers in the PERST# IRQ callback. But for the drivers
> not supporting PERST#, there is no way they can reinitialize the registers
> other than relying on Link Down IRQ received when the link goes down. So
> let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
> non-sticky registers and also notifies the EPF drivers about link going
> down.
> 
> This API can also be used by the drivers supporting PERST# to handle the
> scenario (2) mentioned above.
> 
> NOTE: For the sake of code organization, move the dw_pcie_ep_linkup()
> definition just above dw_pcie_ep_linkdown().
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Like Siddharth reported, this patch is already in pci/next.
