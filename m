Return-Path: <linuxppc-dev+bounces-15716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CDED1E22A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 11:39:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drjKQ3rQgz2xPB;
	Wed, 14 Jan 2026 21:39:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768387162;
	cv=none; b=O1tn92XIUFSsBXEfTLq7Of67SmrpzBkHVksAlFgSEVS1378w9ypTfXNhgjL1PNaDYnYTUmba+0PZjIS7k/d+Gxn8xxLzqgOpxUhENtS7yp09SUqg4QhtUEo8lXvolHuop9OeizZ13TQDNO8TEkRVFlQ6PYitpQsrkI0cM5JxCvVJfbAO4cs8SHrDcmSbGmTLpPfX5CKSqmkLSOwfDdZsk7inxhKGRJryARuYyPuIWapZjqw2V53E0LwbWxvuH/8R6wtbADS5luVsFNULv9MW3/Wp5enn6lJn+ZkSgbQJUBqXF7twVTqjCW0yQmYYKj634YkHpSFG2hUlAtNOGfWWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768387162; c=relaxed/relaxed;
	bh=D/s09hn0ccb9yZFvYxUjpULJqF7ImKPJ28RibKMEcgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1IySVqgGkp8TqAIKMT02y5OU5ucfjIwv65Zm25zE9h6x4XxsuVCuQXB1ouKVRVotDLOoVP4AND7E19svBoeq98BD68MbejHqw3TjSzpNrfuB5Q6fkWRl+0WMeNKKN4Pwz1D5o7MA9KpqDbP/gRYfgNi2SqR1BQEG/p6CfXAdyZ0BlEcs1hsxpJk35gFS+kTRXl26ndJXeon9/fT8mLagOIwuD3dMXRxV+U2Q0TvolHeFoaVft2uxlJv2Pho1Ejgv9SZaQ3PKHSPkoZl+rKHl39xpQIDJQidicfsPbD2NJ7ppIPRrRb+WN1VFgY4v5KrHbvHdgC3Pbkk6wALkVCTtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c1cx4AN6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c1cx4AN6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drjKN5fXKz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:39:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C595C60097;
	Wed, 14 Jan 2026 10:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CFAC4CEF7;
	Wed, 14 Jan 2026 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768387157;
	bh=GXOUS5IVA/W+B1bIiXQJ9wm/cqS9Cfmo4/ZzvR1iFTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1cx4AN6qnW//qfPtg+YU+kBK0Fwi1qx7TD4KI7OcyvNk84LcaOGokwsZbcc85njb
	 qNE/fDPQvFv/hrK3hmEx5+u9dS2ysExw/sZMu59+B6tkrQgcsiR0HoyBLL0SqDaJNl
	 lZiiHfClvv5U5qlwltVlii620fXgPEmppvSDIBUFS8QaAvEzvcf7lbCi351zOc3W8f
	 OSyJms1RzaBtduqCcc4R6U9FLBKh2qAsW/1bGu/5Vq+EF+x+/uK/2ZYuVFmug/pbtL
	 IQE5Pt8WGKFCXfH5aCcnYzBH4PHJ3+KmYKvQ4C17LfDVYZ564TGrXzWP3iZN+7Q5zE
	 l1TuhhZkNiuDQ==
Date: Wed, 14 Jan 2026 11:39:03 +0100
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
Subject: Re: [PATCH v7 5/6] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <aWdyR4Xkh2_ZgOf8@fedora>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-6-den@valinux.co.jp>
 <5kexuvze2a4m6bd3yhv2cd7yrzo4r6ubbbouktdsurv7n22v7o@7s3pgf6ftgur>
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
In-Reply-To: <5kexuvze2a4m6bd3yhv2cd7yrzo4r6ubbbouktdsurv7n22v7o@7s3pgf6ftgur>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 12:54:37PM +0900, Koichiro Den wrote:
> I realized that I missed one case in v7.
> 
> I think dw_pcie_ep_clear_ib_maps() should also be called from
> dw_pcie_ep_ib_atu_bar() to tear down any existing inbound mappings for the
> same BAR before re-programming it in BAR Match Mode.
> 
> This matters when updating inbound mappings for a BAR without resetting the
> BAR in between. There are four possible transition patterns, and pattern #4
> below was overlooked:
> 
>   1. BAR Match Mode -> BAR Match Mode
>      As the current implementation does, the mapping is simply updated
>      (with the same atu index)
> 
>   2. BAR Match Mode -> Address Match Mode
>      This patch series already ensures the old BAR Match mapping is
>      torn down before reprogramming.
> 
>   3. Address Match Mode -> Address Match Mode
>      Likewise, existing Address Match mappings are cleared first.
> 
>   4. Address Match Mode  -> BAR Match Mode
>      This case was not handled. The change below adds the missing
>      teardown so that stale Address Match mappings do not remain active.
> 
>      --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
>      +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
>      @@ -148,9 +148,12 @@ static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
>              u32 free_win;
>              struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>      
>      -       if (!ep->bar_to_atu[bar])
>      +       if (!ep->bar_to_atu[bar]) {
>      +               /* Tear down existing mappings before (re)programming. */
>      +               dw_pcie_ep_clear_ib_maps(ep, bar);
>      +
>                      free_win = find_first_zero_bit(ep->ib_window_map,
>                                                    pci->num_ib_windows);
>      -       else
>      +       } else
>                      free_win = ep->bar_to_atu[bar] - 1;

If one of the branches has braces, both branches should have braces:
https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces


> 
> Unless there are objections, I'll include this fix in v8.

Isn't it easier/cleaner if we call dw_pcie_ep_clear_ib_maps() in
dw_pcie_ep_set_bar(), rather than calling it in both dw_pcie_ep_ib_atu_addr()
and dw_pcie_ep_ib_atu_bar() ?

dw_pcie_ep_set_bar() knows the condition if we are dynamically reprogramming
a BAR or not, and all the four cases are when dynamically reprogramming a BAR.

I.e. instead of adding additional code to dw_pcie_ep_ib_atu_bar(), we do
something like:

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index b2ea2c2c986f..63ae5471fe13 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -318,9 +318,6 @@ static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
                return -EINVAL;
        }
 
-       /* Tear down any existing mappings before (re)programming. */
-       dw_pcie_ep_clear_ib_maps(ep, bar);
-
        for (i = 0; i < epf_bar->num_submap; i++) {
                off = submap[i].offset;
                size = submap[i].size;
@@ -571,6 +568,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
                    ep->epf_bar[bar]->flags != flags)
                        return -EINVAL;
 
+               if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
+                       dw_pcie_ep_clear_ib_maps(ep, bar);
+
                /*
                 * When dynamically changing a BAR, skip writing the BAR reg, as
                 * that would clear the BAR's PCI address assigned by the host.




