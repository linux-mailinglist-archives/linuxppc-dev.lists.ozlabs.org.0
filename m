Return-Path: <linuxppc-dev+bounces-15436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E242DD062D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:55:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnHHM1vp7z2yFn;
	Fri, 09 Jan 2026 07:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767905743;
	cv=none; b=XthLOjFA7FSzUqwyRDJq/tsOv9oBj47cQcuF0xrm5xk2q5iC3fTouCC2uyz+IUCmNaFULJQac+lF/QbinY+JXCVK81iXzI+TMKUB/Nl76Gz+2qIubziKSDxKWwm8mYudSPOmaFSpbagY2Jj0bxDLEDO0+00tfz/gGSZQnnu22LF3NT8Qx9hU21mzbCkeFP8smbxVqmGa9cFQ9LX5ghP2X5mSJVksbw5qfMqudQ3FLB6Dwy8xJqKJMVzfWy0srFWReMYsC+MpmA9HungJbK/eUdblbOR5Ym2NvhJqkrFcGku+ayjnEKSxqQZ3hpgJtMDVlvWK3BXa1oCGLFCKBWWm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767905743; c=relaxed/relaxed;
	bh=pvezu0X4UyTiDTPsXD2JmIg88DHxjyn9VA9NlwGq3kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9xA9nwQ8O9KL0rCmxcUAh9sxFBYI4npYybq/OBlOlOf9oftFqa8wRZfByYjixfrzV9WnmeavucYFj6ewD78U1IYF+UFfMwytOW+g9lHEl+B+SdBMne6lX6+CpqmPDUKbQXMusAXw+hYLi6k0p7CaSIw2ar3fhUjVS7KEVrOu920nPpsU61A7cWKkQ5UiwFrM4jOMrCo1jfPTlJLNPLHW7WtYgmRz5mHQdegA1unslQk9lNgMeoLL1AW3ZDvSueNi6dVoxGj4nfj/W9gDFYBkRjiUIzooEsAnno2qB6l3cHJrbachCXnFhKP7Zuhn614xAEikMs7cwebSEVNYksT0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SjSg9NeT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SjSg9NeT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnHHL2kZgz2yFl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 07:55:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F8A040989;
	Thu,  8 Jan 2026 20:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B290C116C6;
	Thu,  8 Jan 2026 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767905740;
	bh=xBJe/1TFcmT6ykWBd9m6VDk/sy5CDIe6A5UhmE5fQMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjSg9NeThhyh+++t7oDphRi9jrjfHMpyjFOTzaeh0gYoZ3izGVjS4O26bFUA1QUvm
	 J3SqsMuOQCewM7IKUQ96hK2KMq/kcHx9beh18yud/0R4cTYRVZLISqCM0zEThG8jQ+
	 h5AYr5uN46Rj5jEJLWP1pW79KbPjBYUs+2Un3MzTPCOu3AXqD7aNoNxS/PtrsiFlh/
	 hahC8p89QMUHjsXVrAsAGZl/GL0U9LcdaKzZNuS74lwloUO1xDsSnYzTWALX39Z9GL
	 rvyrOUOB/9IfhehMJlaoXTpriWA0L1IpI4LhNpjLMymvGJSP5UfbZz9Kzfuz+mPimt
	 U7lpSI5WgMQxg==
Date: Thu, 8 Jan 2026 21:55:27 +0100
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
Subject: Re: [PATCH v5 3/3] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <aWAZv3ZwdUmo4_wc@ryzen>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
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
In-Reply-To: <20260108172403.2629671-4-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Koichiro,

On Fri, Jan 09, 2026 at 02:24:03AM +0900, Koichiro Den wrote:

(snip)

> +/* Address Match Mode inbound iATU mapping */
> +static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
> +				  const struct pci_epf_bar *epf_bar)
> +{
> +	const struct pci_epf_bar_submap *submap = epf_bar->submap;
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	enum pci_barno bar = epf_bar->barno;
> +	struct device *dev = pci->dev;
> +	u64 pci_addr, parent_bus_addr;
> +	struct dw_pcie_ib_map *new;
> +	u64 size, off, base;
> +	unsigned long flags;
> +	int free_win, ret;
> +	unsigned int i;
> +
> +	if (!epf_bar->num_submap || !submap || !epf_bar->size)
> +		return -EINVAL;
> +
> +	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
> +					 epf_bar->size);
> +	if (ret)
> +		return ret;
> +
> +	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> +	if (!base) {
> +		dev_err(dev,
> +			"BAR%u not assigned, cannot set up sub-range mappings\n",
> +			bar);
> +		return -EINVAL;
> +	}

Sorry for giving additional review comments.

But there is one thing that I might not be so obvious for someone just
reading this source. How is this API supposed to be used in practice?

Most DWC-based controllers are not hotplug capable.

That means that we must boot the EP, create the EPF symlink in configfs,
and start link training by writing to configfs, before starting the host.

dw_pcie_ep_ib_atu_addr() reads the PCI address that the host has assigned
to the BAR, and returns an error if the host has not already assigned a
PCI addres to the BAR.

Does that mean that the usage of this API will be something like:

1) set_bar() ## using BAR match mode, since BAR match mode can write
   the BAR mask to define a BAR size, so that the host can assign a
   PCI address to the BAR.

2) start() ## start link

3) link up

4) wait for some special command, perhaps NTB_EPF_COMMAND
CMD_CONFIGURE_DOORBELL or NTB_EPF_COMMAND CMD_CONFIGURE_MW

5) set_bar() ## using Address match mode. Because address match mode
   requires that the host has assigned a PCI address to the BAR, we
   can only change the mapping for a BAR after the host has assigned
   PCI addresses for all bars.



Perhaps you should add some text to:
Documentation/PCI/endpoint/pci-endpoint.rst

Because right now the documentation for pci_epc_set_bar() says:

   The PCI endpoint function driver should use pci_epc_set_bar() to configure
   the Base Address Register in order for the host to assign PCI addr space.
   Register space of the function driver is usually configured
   using this API.

So it is obviously meant to be called *before* the host assigns a PCI
address for the BAR. Now with submap ranges, it appears that it has to
be called *after* the host assigned a PCI address for the BAR.

So I can only assume that you will call set_bar() twice.
Once with BAR match mode, and then a second time with address map mode.

It might be obvious to you, but I think it makes sense to also have some
kind of documentation for this feature.


Kind regards,
Niklas

