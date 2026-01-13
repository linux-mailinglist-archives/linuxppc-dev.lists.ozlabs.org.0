Return-Path: <linuxppc-dev+bounces-15659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3719D1AE02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 19:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drJ8T3G8nz2xWP;
	Wed, 14 Jan 2026 05:45:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768329913;
	cv=none; b=P99lD+x1tzD7JcM71OpBxX6253vhKRiKa+VgzGIMOqKqfZqurHxcHskDYWedrPQ+7SWWmoAhEC7VihBxD5hCW6GWL3Db44QjZ8gstzC7rgsckoOp5j/rCIGk5wmtXTtvn4vspYTgO3Tbk+8M0bys2TV3QwhJtU4K7HidzW8q1lfrXMnMb+P2hDWoY0od0WugGnPdNdT2hWC5vxXfbqexe5qBby5akM3+ICVrOsla2sS1lghNReshqhh4+DtGGKJhd4NJHHKOEcKbUjbcW3oSZahcruRN4kdoJkRIHPh/ray1wgiGiJPlq0zavHQObLqJHZQL2p2CA9blhQvjqhmhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768329913; c=relaxed/relaxed;
	bh=Tax1+m6bXoUYj8E2m620WPi66Dw62eUrySU1vzxBsaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kh6cmp/xBYEAHo9ryH6Ko5xZYJKkM4egduPXXzrsCzywy/gCOE+kwilbGM/JVWiQJtA60Eqs01+PRPipUC5KmXKZQ3xfDDA8diKgjknH5iukpi2l6rj6792yE3WYEORIEYkbfpO9Hpz/i6DLkJ1D4LoCgYDZCpNhqXiSQEUuM+qhg9jrpE+zbfM6XzLu2YtPin6axeLrnSu+aSmnZJPAC6gFtwAq7pnuvwAjc2fBzly4qAcHtd1EKGi//K/3NjeM9RqTl3Me8o86Pbr2MUaqBDw/vl0tCfVoJifSKY6a5L1Selvopx3+i6QBXm9x9ELn//BtcaX8Ye+9MlPW3G6ybw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mJ/epLMx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mJ/epLMx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drJ8R6j5vz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 05:45:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A8F76000A;
	Tue, 13 Jan 2026 18:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC54FC116C6;
	Tue, 13 Jan 2026 18:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768329878;
	bh=guH+X5X5Zw5RK4+z7WReUiSq/PEpKm6VSIBaw1TF1Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJ/epLMx61KYA6qPjpRXqerwQQ3NcjyRncy5NLUppRcvNbs2ALyBM6FjEhD9uCvW2
	 eg+DxvUNeugL74YCHEYOOv4VS+A/BfA6G/dMZqmg4UIxaOswYQMpqwbpy7mH2VJssd
	 pryhg1yTNddK0bWY9Uq9gE7ggwr1D0Kf4ak8pCyjAuuQxjtChOyO00kugpRuZ29n40
	 WzTS8Cd0E4qQJrBcO9qMgrhYRyavxl9eWt+/iAY5yX2qEdebOKThI+hfkrhzfqh5HQ
	 VQ0q4gLY53Z/GZ66GOvRjkXfxIKgJEY7/T6uorHk2QfWRmmEUeUhwAT/SFYMOSF+KF
	 80DfzL+JVf/oA==
Date: Tue, 13 Jan 2026 19:44:25 +0100
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
Subject: Re: [PATCH v7 4/6] PCI: dwc: Advertise dynamic inbound mapping
 support
Message-ID: <aWaSggUJpnxjAPA_@ryzen>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-5-den@valinux.co.jp>
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
In-Reply-To: <20260113162719.3710268-5-den@valinux.co.jp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 01:27:17AM +0900, Koichiro Den wrote:
> The DesignWare EP core has supported updating the inbound iATU mapping
> for an already configured BAR (i.e. allowing pci_epc_set_bar() to be
> called again without a prior pci_epc_clear_bar()) since
> commit 4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
> inbound map address").
> 
> Now that the EPC layer exposes this capability via the
> dynamic_inbound_mapping feature bit, set the bit centrally in the
> DesignWare EP layer so that all DWC-based EP glue drivers report it
> consistently, without duplicating the same flag in each individual
> driver.
> 
> No functional change intended. This only advertises existing behavior to
> EPF drivers.
> 
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

