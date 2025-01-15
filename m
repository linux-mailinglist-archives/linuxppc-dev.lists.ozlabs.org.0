Return-Path: <linuxppc-dev+bounces-5323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 579B8A12EF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 00:04:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYM5H5mjwz3cfn;
	Thu, 16 Jan 2025 10:04:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736982275;
	cv=none; b=X5HwJpVvby/6u8EPjDZiisl2AaPx0+QXy8zcxKO6G9q+IXKLAOSKGbZZh9+Uvlwq6uqOMPqJaIbEFX1x2tZuXRYT34XzgWwsYH8+AuvTv/78b5faFsN+hMRTf/7jgNpPLXb2ORH96MYDYA3pLVSvav1Rp+EpFsylkOdwnfrtWo3nYYDDG+4+Gseqysz2EtmO/lx2p+Uqy/eBRdsBoHtDgUsHGsbCEDgL0qaF4Sq6PqamjvEc87Fh4BjPYbySsW1Ou4YvZy7mB0Ty6YTR3mlF9WewRH637NLEVCO4z4oEBgEP32W144DzAqRMDY7RO/vromTuyBIsMvXrD36npPf+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736982275; c=relaxed/relaxed;
	bh=+eI3xSTFkFziV5uiRDczRoC2ZPpW6ascy6sv67GeeVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Zj4b6lXK2kZxQxZX8Iy/8baoiR3McfhLxzu5CGge7Sd6oPIHwOP9CyMqnjC6Fb4kukGE16Uuyflt8jOg2/zvGVvs6L4L2yUE0xM1Hh6eo9bJyn4zPIT5TL/qw+RtLXuCx0JMtFeU9LcDqW6AbBbZHO1vDkmDjs0rFEs4xY+N1Eebv79+gGwbFfBJ+CDhHrBpFENyU3P7khMyPtH7wPmHMfnX52bzYWx/GPkSaMus6Yts1bO7qbX8zEq28X8dy1e8QZep9gvewHGZWRzHQhrr2uBVJ2PwwABnp8vm9oJswax8Nqaftk+XtSiCh+wRDQY/az1n0Lx7YhNlaKr1mDpbMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndMSRS4a; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndMSRS4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYM5G698tz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 10:04:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B91DA42639;
	Wed, 15 Jan 2025 23:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EF6C4CED1;
	Wed, 15 Jan 2025 23:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736982272;
	bh=wXuBoyyk9ETcMFkcjs1CAzvucCe5P+ktEzNq56RKFKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ndMSRS4aPOQkcBRM8NZ8koAU62dLa6PMuBifPbWPnqACBtNUs7AkyKfx3Ng/ZaVHa
	 b/TPH3VpMkqnRFVnjBO9OfxflS9K7ZA9gYYrMy8V0YbO4mTbrf6x8whUPSok08TE64
	 E1qG2kySB8p3WLmzqXPakm9gS4SF6cI3x1FRKAxd4z6ovPSwnsh1ZHoTo2Kw67J/U9
	 UWHXiZBMXR/buiJsuaNEWw3/vRb/KFCKk/XbzAMDL3YN4eFDGZTYjPP8pdAahioTw1
	 8KzQdBlCVlpgm83ybNQPfdNWrjE147p9LYRlSPmZXEa3pKZsjTq74/r3ZYZfZJgSJ6
	 4e3/DcgTV8OkQ==
Date: Wed, 15 Jan 2025 17:04:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] PCI: dwc: dra7xx: Use
 syscon_regmap_lookup_by_phandle_args
Message-ID: <20250115230430.GA560547@bhelgaas>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-1-fcb6ebcc0afc@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 12, 2025 at 02:39:02PM +0100, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c | 27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 5c62e1a3ba52919afe96fbcbc6edaf70775a69cb..33d6bf460ffe5bb724a061558dd93ec7bdadc336 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -635,30 +635,20 @@ static int dra7xx_pcie_unaligned_memaccess(struct device *dev)
>  {
>  	int ret;
>  	struct device_node *np = dev->of_node;
> -	struct of_phandle_args args;
> +	unsigned int args[2];
>  	struct regmap *regmap;
>  
> -	regmap = syscon_regmap_lookup_by_phandle(np,
> -						 "ti,syscon-unaligned-access");
> +	regmap = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-unaligned-access",
> +						      2, args);
>  	if (IS_ERR(regmap)) {
>  		dev_dbg(dev, "can't get ti,syscon-unaligned-access\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = of_parse_phandle_with_fixed_args(np, "ti,syscon-unaligned-access",
> -					       2, 0, &args);
> -	if (ret) {
> -		dev_err(dev, "failed to parse ti,syscon-unaligned-access\n");
> -		return ret;
> -	}
> -
> -	ret = regmap_update_bits(regmap, args.args[0], args.args[1],
> -				 args.args[1]);
> +	ret = regmap_update_bits(regmap, args[0], args[1], args[1]);
>  	if (ret)
>  		dev_err(dev, "failed to enable unaligned access\n");
>  
> -	of_node_put(args.np);
> -
>  	return ret;
>  }
>  
> @@ -671,18 +661,13 @@ static int dra7xx_pcie_configure_two_lane(struct device *dev,
>  	u32 mask;
>  	u32 val;
>  
> -	pcie_syscon = syscon_regmap_lookup_by_phandle(np, "ti,syscon-lane-sel");
> +	pcie_syscon = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-lane-sel",
> +							   1, &pcie_reg);
>  	if (IS_ERR(pcie_syscon)) {
>  		dev_err(dev, "unable to get ti,syscon-lane-sel\n");
>  		return -EINVAL;
>  	}
>  
> -	if (of_property_read_u32_index(np, "ti,syscon-lane-sel", 1,
> -				       &pcie_reg)) {
> -		dev_err(dev, "couldn't get lane selection reg offset\n");
> -		return -EINVAL;
> -	}

Wow.  I believe you that syscon_regmap_lookup_by_phandle_args() is
equivalent to both:

  - syscon_regmap_lookup_by_phandle() followed by
    of_parse_phandle_with_fixed_args(), and

  - syscon_regmap_lookup_by_phandle() followed by
    of_property_read_u32_index()

but I can't say it's obvious to this syscon- and OF-naive reviewer,
even after tracing a few layers in :)

Bjorn

