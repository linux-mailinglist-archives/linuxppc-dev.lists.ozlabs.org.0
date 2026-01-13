Return-Path: <linuxppc-dev+bounces-15621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49059D17F39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:18:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr4vx62czz2xl0;
	Tue, 13 Jan 2026 21:18:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768299517;
	cv=none; b=nbmCh3LuJbQmxgthsOtV3BVSOGKtU5KDrIg8B1KKveoLcmbnBkNIN4v4ngu7dX//pHxJAZ3bI5amOTLCdBGGj4G8lUaVXxrQ/ZmXYHAhF9nM+bxcZwxbUo0xslvL/OhjNlpWoNN3kXfBKmdMJfIzHKmIYA/v1Z3EtUEUPNckTPoSBAzSMJ2wSSKx1Tnce52IsHk0zrPCsByCaEKk5KXYDFy6i96mw0OiUAkk9W0xxsUNohRgTC18ErKM008bLk3B8UcXxpP4okmNJuGpAFUU+C/f3g/6757mm65Sc0ze+I6CUEsCWhnLG16I3e1UhqKW2m58WfQBdp7D6bOq8dVrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768299517; c=relaxed/relaxed;
	bh=7/Ue9IQWKT/lmz8kyZhADFs3Z/lJ99p8FNaLzYAMxRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjTySf4BmOvFEtKO6Q/Up+VbqRgx55CB18/IhZNjafRtY1+lwhG0kxeOslLRK+0xlf/GHVuloqq2zB0DyCWuy23nC1hN+yhUcB3DouF+Ao5qTxoTAftM3gd074ObFKfB8wognR1CK9aBY0Crkll3yt70nft6NC9ry+d2KAshDrLX4xG0bP2MIerc0HvLEEkptAQe8xxZJUmjQMGf86n84Ik6LiW1GT/z6DaW6SZZtA6LYWAmXLyn/52+ZX9WpMSjNYhv3wmq5OqtOcAJBdG8adIC6htioJH8s/krkHW2gJ5PxY5Klh7FE8RcaqCVqfT0mznFkJgJn5Qr0mLUzGo4IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SRp9YMAN; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SRp9YMAN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr4vx07ZBz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:18:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FFCB6000A;
	Tue, 13 Jan 2026 10:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE25C116C6;
	Tue, 13 Jan 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768299484;
	bh=0fpbeQGAJF9xjq5Byej/gkDKIoAX4CGtzrNcpesJoYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRp9YMANteq690cw3Tc7KijMkA6B5f5vSRAv1KYS88CI6bYfRan3AunIB+7E3+4Zf
	 mH6JR+bx1yw1zxCxKPf3N1DLKskJu82uTfBstubAf28agXhdqU772iiBJkM5LgXEpy
	 plOKWgaX4KN/pF6w30vo35DCBordFKJeLgvSIIfExlQb5H2XThPtbweNqsw40BnW02
	 gumS3q0YECyjFfZOW1nnxfwdEnGYxO1CC4ikdXYnd7c3XwQmF7m/5skQdCXx7sdxre
	 E0Rgup+mH27I+3bpVVUf7q1WahO6w+oqQMKt64/Evzkesa8eBewcfSH5ATrS9liPkS
	 BVWMV4ydfdzuQ==
Date: Tue, 13 Jan 2026 11:17:51 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com,
	l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com, roy.zang@nxp.com, jesper.nilsson@axis.com,
	heiko@sntech.de, srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org,
	rongqianfeng@vivo.com, 18255117159@163.com,
	shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 5/5] Documentation: PCI: endpoint: Clarify
 pci_epc_set_bar() usage
Message-ID: <aWYbzzAeDSLYJJcB@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-6-den@valinux.co.jp>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113023715.3463724-6-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 11:37:15AM +0900, Koichiro Den wrote:
> The current documentation implies that pci_epc_set_bar() is only used
> before the host enumerates the endpoint.
> 
> In practice, some Endpoint Controllers support calling pci_epc_set_bar()
> multiple times for the same BAR (without clearing it) in order to update
> inbound address translations after the host has programmed the BAR base
> address, which some Endpoint Functions such as vNTB already relies on.
> Add document text for that.
> 
> Also document the expected call flow for BAR subrange mapping
> (pci_epf_bar.use_submap / pci_epf_bar.submap), which may require
> a second pci_epc_set_bar() call after the host has programmed the BAR base
> address.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  Documentation/PCI/endpoint/pci-endpoint.rst | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
> index 0741c8cbd74e..d3d9abbbc71e 100644
> --- a/Documentation/PCI/endpoint/pci-endpoint.rst
> +++ b/Documentation/PCI/endpoint/pci-endpoint.rst
> @@ -95,6 +95,28 @@ by the PCI endpoint function driver.
>     Register space of the function driver is usually configured
>     using this API.
>  
> +   Some endpoint controllers also support calling pci_epc_set_bar() again
> +   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
> +   address translations after the host has programmed the BAR base address.
> +   Endpoint function drivers can check this capability via the
> +   dynamic_inbound_mapping EPC feature bit.
> +
> +   When pci_epf_bar.use_submap is set, the endpoint function driver is
> +   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
> +   the EPC to advertise support via the subrange_mapping EPC feature bit.
> +
> +   If the EPF driver wants to program inbound subrange mappings that are
> +   based on the BAR base address programmed by the host during enumeration,
> +   it needs to call pci_epc_set_bar() twice for the same BAR (requires
> +   dynamic_inbound_mapping): first with use_submap cleared to configure the
> +   BAR size, then after the PCIe link is up and the host enumerates the
> +   endpoint and programs the BAR base address, again with use_submap set.

"If the EPF driver wants to ..."

Here you have phrased it in a way where it almost seems like this is an
alternative way that you could use this feature.

But in reality, dw_pcie_ep_ib_atu_addr() will return an error if
dw_pcie_ep_read_bar_assigned() does not return an assigned PCI address.

So perhaps write it something like:
"When an EPF driver wants to make use of the inbound subrange mapping
feature, it requires that the BAR base address has been programmed by
the host during enumeration. Thus, it needs to ..."


> +
> +   Note that in this flow, the EPF driver must not call pci_epc_clear_bar()
> +   between the two pci_epc_set_bar() calls, because clearing the BAR can
> +   clear/disable the BAR register or BAR decode on the endpoint while the
> +   host still expects the assigned BAR address to remain valid.

"Note that in this flow, ..."

This also somehow sounds like this is an alternative way, when it is the
only way.

Perhaps simply something like:
"Note that when making use of the inbound subrange mapping feature,
the EPF driver must not call pci_epc_clear_bar() ..."


With that fixed, this looks good to me:
Reviewed-by: Niklas Cassel <cassel@kernel.org>

