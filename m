Return-Path: <linuxppc-dev+bounces-15748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC872D21238
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 21:13:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dry4M1n83z2xNg;
	Thu, 15 Jan 2026 07:13:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768421635;
	cv=none; b=iSFMqbcuLCrcttfkmifObo1+ZKsUohMx6eT8oA4OFLpfMcuYcWMFd37XRM7XlGAj+wBY75DEFgtbWMH3e41lc2jSczSNk1UgLQMOhsfN3h+ZOnGXATa3cGnpJgCXT/FuvsTtS03pkZ3g08TPLwgrOakdFXJufhs9z4SrLAIIfzSWkQrU2lK1aFX2wb/khjIbng3fAbhkOYqUExmKQVHz0IgmO04h3rEetVjT0HAUqIVCK6GXy/bnwMQboWjlGlrM/C+ijLmqCA+VRvzXSvokd7a90C0SLv3FdAbXw0z6M6WIKYTjyyo3goDnC+Iy7QZg9dUWuUeEDRxduLQv4a4LnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768421635; c=relaxed/relaxed;
	bh=D8sN5YjfWroRHEqJ04mMy8ZMveyvydtJNN8U/yx4JSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUdyY17/5jHjtGHd8yvUG0P8juMStF09deJlDX5y6K/4ymAyC/GB2Re61unYyrVLMU8Ej1YKyd3P6KF20JCWH3/cYVyO3xAwUwbxCeYM/fpuS8DJPwwJZnwrlp29mo2NALHa9mb3Ho+I7B/DsbeReOZnVUJEPFaKCd/YtPaAghmv7eC3vkVixirgSxNW9ZWDuJSwIn+s+tR2CBKOtmFjjCTiZ01iGwE7URQybaAJLwwq22DP/L9oCK6XeGx/J9t8LDx/AxY5Z4/C4elOobYedvf9P2N252m79ipLUH+Vb7B8bIidZN2Npb+SYAzJj92NOmm7ckAidEiAxk+hanb7rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c5mIULR/; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c5mIULR/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dry4L2DXhz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 07:13:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 915826001D;
	Wed, 14 Jan 2026 20:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D89CC4CEF7;
	Wed, 14 Jan 2026 20:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768421629;
	bh=MMH8BxTdLCMG6H0k3fKrVpip0aGLgha/EOhPfRlgxMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5mIULR/ygIzxL+Pxuty2E8BhuVMHRvwCUrYsJBWxe4NzUKKOvLAHR7O5T55F/bwX
	 8Sao0YehpAnrOtH3Cv93t6hj77ccJbds7h9behm5sB/bF4j1EXJT+XINv2x1ke5C+i
	 nBTDVTjP+ljthpD5TzWKEMWc32UsTKRs+aTvOb3d3kUOm1miZ8lNpyqikqvMgP3BDW
	 WLIgmTjHA+HTTrPt2NMj093kfu2BQb33BcNhJChO49A8CRrFYcvFATIckjUkyHgWo8
	 duYni3PcbrLxP3ol8/+Vqc3h2JQtvSwo/amvWEl164C/evEW3b51EsRId7Yoax4GR6
	 0YROdUiZQvKJA==
Date: Wed, 14 Jan 2026 21:13:34 +0100
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
Subject: Re: [PATCH v7 3/6] PCI: dwc: Allow glue drivers to return mutable
 EPC features
Message-ID: <aWf47s1oY-bjCDSA@fedora>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-4-den@valinux.co.jp>
 <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
 <mz3ahnech7yn66hcv7hqllir6rz6qpjd6m2aj3feh2gqfsvpwk@oobwtkb6o2jx>
 <aWe0KJnZNHqSUAKg@lizhi-Precision-Tower-5810>
 <m47oybaq4u2noqqd77czzgwwnmmquhvarjnxgijlhb5neulznt@dts3icronu6u>
 <aWfyDHZCoh1t6/vP@lizhi-Precision-Tower-5810>
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
In-Reply-To: <aWfyDHZCoh1t6/vP@lizhi-Precision-Tower-5810>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 02:44:12PM -0500, Frank Li wrote:
> > > > > Add
> > > > > 	DWC_EPC_DEFAULT, into every epc_features.
> > > >
> > > > One corner case is that pci-layerscape-ep.c builds the pci_epc_features
> > >
> > > It is our old platform. I checked code, it should be wrong. features should
> > > report EPC hardware capibility.
> >
> > I'm not really sure whether commit cc255eb0bfbe ("PCI: layerscape: Modify
> > the way of getting capability with different PEX") was wrong.
> > Do you have a patch in mind?
> 
> I think it's wrong. And it doesn't impact your patch. Just leave it as it.
> we can add submap support later if need.

Adding a macro:
#define DWC_EPC_COMMON_FEATURES .dynamic_inbound_mapping = true

And including it in all the DWC glue drivers' epc_features sounds
fine to me.

Frank does have a point that if some glue driver ever has some random
errata or bad integration, it will be simpler for a single glue driver
to override the defaults.


The commit that adds subrange mapping support would then just
change the macro to something like:

#define DWC_EPC_COMMON_FEATURES .dynamic_inbound_mapping = true, \
				.subrange_mapping = true


Kind regards,
Niklas

