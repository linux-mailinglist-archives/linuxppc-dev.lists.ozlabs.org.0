Return-Path: <linuxppc-dev+bounces-15853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7567D25452
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 16:21:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsRXk0Ccpz309H;
	Fri, 16 Jan 2026 02:21:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768490501;
	cv=none; b=meEUtvC1rfZNfAGrkktYvzDRXbWFM47NwOQMzUDGu0xpQaKXn4GRQfysR+UJm1MCrQHE95ZkhORl26GKAD2BAti8TyQPp2xLUA/ET0hh0PjAc3Cc1Dr8wGQKLx5F6yfDsSeODF6lud129t3WegCuhWlZz266aqgaT8qVvCnW592kXGO9fj7eYkWc5qBkVrenzbYo86AZ65Fw13h5DV7ssS3YduVxem6sBIo6OXrlTmhS9RV2UEoHwMD5BRiEQMQFQ3Dh3WBwjeH1vijVP0GDwfUh2jcygORHq54cSTQy5L/XKtl67KXLODOVt1H4tSSRMvF2TtN92Z+qYiYyJnDRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768490501; c=relaxed/relaxed;
	bh=Ku44XxWRM0LzfFmLHDj4kKRrA1p3SGil+k3zh2j29B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8eu9GMSu+Vz81Z8vUKhWV3gzk6HkWGk1foTijcZqS6EnudkjVELFgf2tFmS56bcYj3rZKyvQLvCoNZxSwk6D0Paqhp9FVhrekN4Y2qc7acApn/92Bz29RWORmO48H1RbyOLdKuKQmHLPjZVfJ02J49u5F33t8JDtwL9tVS8e8HykgtTpd3nnYJleZK9xO0bIYauTWCY3RtZJ1ChniK2ZDToNGEGi4gEjuXhmQG7M/A5TogIZg2FPY45u3t6Ob+ftejcNObCcRJV4iA417DTUwN5FfzFBAC5O8Svgn+72/aw6dgGCq23/JcJecZ3WU9unxQLkA5a56z//ZCSzEG0Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QI7srDK/; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QI7srDK/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 68869 seconds by postgrey-1.37 at boromir; Fri, 16 Jan 2026 02:21:41 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsRXj0gSsz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 02:21:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F46F6001A;
	Thu, 15 Jan 2026 15:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EBFC16AAE;
	Thu, 15 Jan 2026 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768490498;
	bh=Tt0EYm72yfv5arwvfEiESNjf8n0aJTfAVjQfOYQykeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QI7srDK/FhDXgZgja3pcyeu8mCCZXuUfO0oaumMkvJLpDBbxgXYV0dL86YPgf3Z0s
	 JS5xTfYR/dI+NP0Ac+z8jTX+Sk/KoKgegd40WfIvfyr6itWJ7nlEgeQVHMtujECjAA
	 9sLrYvJuucxJeRjo3nRQzbbwEUvzk5zZVckQfEWAMZBWPinnu4Me7RXC0Nk18jOM4Q
	 V5xf/4JizZXKaU1UFVxvgUe241yU7L2jzNnBDn2MI9exJ8/7mF565LjjA5rAqffhq1
	 hA1PlVxKRt1vdrt4C8Y6ZwGZAVP2V/m7QsCY3GxHieqrNSmLUdYRDlFLKmnYwh5CLb
	 ijXqpgpnqqKoA==
Date: Thu, 15 Jan 2026 16:21:21 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Koichiro Den <den@valinux.co.jp>, jingoohan1@gmail.com, mani@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, s-vadapalli@ti.com,
	hongxing.zhu@nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
	jesper.nilsson@axis.com, heiko@sntech.de,
	srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com,
	18255117159@163.com, shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
	vidyas@nvidia.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 2/5] PCI: endpoint: Add BAR subrange mapping support
Message-ID: <aWkF6rT0Du7iJwHh@ryzen>
References: <20260115084928.55701-1-den@valinux.co.jp>
 <20260115084928.55701-3-den@valinux.co.jp>
 <aWj/Sr63+hl7CBe/@lizhi-Precision-Tower-5810>
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
In-Reply-To: <aWj/Sr63+hl7CBe/@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 09:52:58AM -0500, Frank Li wrote:
> > @@ -127,6 +150,10 @@ struct pci_epf_bar {
> >  	size_t		mem_size;
> >  	enum pci_barno	barno;
> >  	int		flags;
> > +
> > +	/* Optional sub-range mapping */
> > +	unsigned int	num_submap;
> > +	struct pci_epf_bar_submap	*submap;
> 
> struct pci_epf_bar_submap submap[] __counted_by(num_submap);
> 
> Not sure if use this simplify alloc/free.

Your suggestion changes the submap from a pointer to a flexible array
member.

A flexible array member must always be last in the struct,
and you can only have one flexible array member per struct.

Additionally, using a flexible array member requires the struct to
always be allocated on the heap. You can't allocate a struct with a
flexible array member on the stack.

So I'm not sure that if your suggestion is something we want.


Kind regards,
Niklas

