Return-Path: <linuxppc-dev+bounces-15537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42DD125B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 12:44:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqVs24YRlz3060;
	Mon, 12 Jan 2026 22:44:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768218246;
	cv=none; b=VWLdWwJ0R2Rd76zpjklmH6E2w8/jyiKLfV10WvRxrPxpWTkWWAtkNjgbgZVyneQZrTWnoHttR2J9rmdpSrlNVuWWE5pfDa3fGImBbU1P2v22d7jZWeSCT+bv3PE/SO+aUIvkkVFYELFuC+0OpsfsEM6jcmhtQO0TLBnUjAqsGXAyhBkJjiv+f7W7yTvesgz8ONnXstM9bwqmtaA+sVLN315Faq+ZMWEsBqNfNeSuRMXNaIeg4Sx/mhUP+Epgh7+ObZuuS8b4seObMbgcE6Xnc4emPkvnAJG2BFW4PgiEz9IkidGOwaNGKtZbkgX65teYYbJLkM3TC6sEcIWu9LeXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768218246; c=relaxed/relaxed;
	bh=LQuuFAZL1+sdcv6II2cFu76iju0kO+Vj+iY18Ip4PYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLmOCDXWRaIuKRj9EDebgVPvBhFlyYdSsnIKzmG6uLkkp1LrgZygqJsCh/whbMwxkKV5VbWMZF9MJoieBBS4P1ay7lKYAuoqRp6VzMoKZc6z6v5yr0N/pVeVEdbi7AybYXHPgVG/xu3YwZ6e74r+8icp/pGisvY64MOhCHEhtuNpoPyNQiwThgNGkN1wuIP2G65E3uwF72pwBuH5r6lmI7LgZshp2+muADIw47o1S60R+1czBjwJrVNbngjhvn8NgBTdVgspwEOwfpITMgi2ASBULbax+uXSmm2medPdfvzcP+FwWNleGTG9Ea4w/053WTakWPl6vV/ZCTtAuBT1FA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BDSFaEjh; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BDSFaEjh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqVs14MDCz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 22:44:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E82E243E75;
	Mon, 12 Jan 2026 11:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02848C16AAE;
	Mon, 12 Jan 2026 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768218242;
	bh=wYxzqaucRGuoMNi3CMgj0x5c6RoysJv8GcSjGMutuIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDSFaEjhcr82fZbuOnjBsIysguMmvESRnrY4Tpsv9UGf02g8W7lpkhwWzD3ZIsLOR
	 7AeG2s+ycAlQNjCw8YvdfZWEU6xGElMYLW6io9YkNrIvlGIPar1iQI7aij9znZaI/6
	 BxJ/wIFz6DdmbdPiZHbOoiwkZUJv3hQjpiOuavR/2Ua7mkrI3qhF0BRjXMU8U5mBPo
	 2HMuNGiN0xFNsBs0I4Q2tw3Cwl1R6aWTYi3pXz6xaXjzyFoGuIH7U0OtYGZv4JnSKY
	 y+AXIMFWSkAK5y7yHajqyXFoHhHBAtAJssYs+UufUpqaqMQPxX/X1j7u9ik4vwXeRY
	 +s9LbpjkC3sow==
Date: Mon, 12 Jan 2026 12:43:50 +0100
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
Message-ID: <aWTedhkOclAVvktO@ryzen>
References: <20260108172403.2629671-1-den@valinux.co.jp>
 <20260108172403.2629671-4-den@valinux.co.jp>
 <aWAZv3ZwdUmo4_wc@ryzen>
 <nqpwi6ewen4kf7jqgon4ljerceqjeaule25dzb6ytas3wslqhp@ddkr3jum6eac>
 <aWC8jGTtKIzVuG-X@ryzen>
 <wvb42kyfcpyii3jql2gm75dd6hqpcd32yat2yb7cg7sl3raw4l@d4mfxk47l6md>
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
In-Reply-To: <wvb42kyfcpyii3jql2gm75dd6hqpcd32yat2yb7cg7sl3raw4l@d4mfxk47l6md>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Koichiro,

On Sat, Jan 10, 2026 at 11:29:06PM +0900, Koichiro Den wrote:

(snip)

> > Your new feature (epc_features->subrange_mapping) in epc_features appears
> > to depend on epc_features->dynamic_inbound_mapping, so it is a shame that
> > we don't have a epc_features->dynamic_inbound_mapping bit, so that this new
> > feature could have depended on that bit.
> > 
> > 	if (epf_bar->use_submap &&
> > 	    !(epc_features->dynamic_inbound_mapping &&
> > 	      epc_features->subrange_mapping))
> > 		return -EINVAL;
> > 
> > 
> > I think adding some documentation is a good step.
> > 
> > Perhaps we should also introduce a epc_features->dynamic_inbound_mapping bit?
> > Since you are making DWC glue drivers return a mutable EPC features, we could
> > set this bit in the DWC driver after that commit. What do you think?
> 
> As you pointed out, support for dynamic_inbound_mapping is needed
> independently of my series. Given that, it would make sense to handle it
> either before this series, or to fold it into the next iteration (=v6) of
> the series if that is preferred.

Please fold it into the next iteration (=v6).

It should be a one liner patch in the DWC driver, at least if you put it
after your "PCI: dwc: Allow glue drivers to return mutable EPC features"
patch.

Thank you for all your efforts on improving the endpoint framework.


Kind regards,
Niklas

