Return-Path: <linuxppc-dev+bounces-15622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42CD1801D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:27:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr56h2PCvz2xWP;
	Tue, 13 Jan 2026 21:27:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768300076;
	cv=none; b=S2sN75Lls8M6DoAzQzHzhjVT2m3IjxrhHQMDnhkQGVmK8DKFUR7GdYLghmM3CfXT8YhZgDy4HW4QgD/lID9rCBWVz1Bna037VmRhPkoUEJ1crDDKGffhTgMIg9UWwL7EszctsgqGm8MoL3BwYd5c+qGxcfwVRCJx0hoxVcfMejIoputm9n/Tbcz8GWZV5zydhuQEhq2Xv2R6sW2Twb06L/V/XP2s/ZQYcqZOe8rySyaCJQPuTgnp2gs649a369X+KqCkjcHMvIOiWRJyj9vUqvGjZWnhHMRLk8eIUe0lRiDCa94bWHqjuTtokGo0AQnZVvQmUt4TqPPC+3a7W/7v9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768300076; c=relaxed/relaxed;
	bh=d1HYZxvS7r9G1oMnzh/rff45Mt9jlohIXLZ64DZw3Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9CaBhgkisCNjN3QzmIp0eQxA5e+/ZcKgcXLFr+bCoE7tzEF5te//jA+KD5wfO6y/8L3310XRqrjw79+n/a66HcOmUOmJKt9XFOv1yyRdDmHOuc8NJI5tKTjub0c7JkR6eY+bwr5dCJum+th2O9OFSGRP8nrGsGTs0nJTpPppq9kcIghX6RypZIJUK+DfoyKoqhyeoiix4rJ5ONBtOttieOd9Znv9B2HV2DnZGFH5IU7UnWghAswU3wk0Jb3wJTuehN165s8TmAKeJXi4GvJD/0yBeh3LyQrpzPq/2UlGVZeAL0/4cMBf4OPe66pQ6NGDAp8ZyNFOm3L7Zq4S22PWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KHVExecN; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KHVExecN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr56g0vpHz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:27:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 615B74075A;
	Tue, 13 Jan 2026 10:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FB0C116C6;
	Tue, 13 Jan 2026 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768300073;
	bh=C8UgsS+YrsZDchnel7CNOtadN1mg/ONjw32g4J6+OCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHVExecNeP0XkZg6xghaAQoJqr/q0z3GdC0x9jlfMNdwId0ErGseOxuOiGwv29fD7
	 AvHvAxAYhEhEwlTtZ/HzVBPzak/DCiPS0cy2tK74aPn60U+CPG+/5TqEOYVmIpPOB+
	 t0lfLQrTlza7crImIQKqJobRsLqGMk0r+g0eXbY9SIXRxX+hMLbFEU7eN5Xkq1qwjt
	 tqZncLDnAqJDaSQnuMYsFLITR5wWfSPuJ4e3LtNOMwEMkXQnDUSM9mD8VFTfDQepbM
	 3idXM1YFBgiHX990n6orktQZK0baqsg7qxAQ9euVwMmyZF8sanjixl845BLKqFX5sj
	 jWW9lS8W7E+tQ==
Date: Tue, 13 Jan 2026 11:27:40 +0100
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
Subject: Re: [PATCH v6 4/5] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <aWYeHNoPEl9T-Qo-@ryzen>
References: <20260113023715.3463724-1-den@valinux.co.jp>
 <20260113023715.3463724-5-den@valinux.co.jp>
 <aWYbTt6UjlXb9Uk-@ryzen>
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
In-Reply-To: <aWYbTt6UjlXb9Uk-@ryzen>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 11:15:42AM +0100, Niklas Cassel wrote:
> On Tue, Jan 13, 2026 at 11:37:14AM +0900, Koichiro Den wrote:
> > @@ -626,11 +831,22 @@ static const struct pci_epc_features*
> >  dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
> >  {
> >  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> > +	struct pci_epc_features *features;
> >  
> >  	if (!ep->ops->get_features)
> >  		return NULL;
> >  
> > -	return ep->ops->get_features(ep);
> > +	features = ep->ops->get_features(ep);
> > +	if (!features)
> > +		return NULL;
> > +
> > +	/* All DWC-based glue drivers support dynamic inbound mapping */
> > +	features->dynamic_inbound_mapping = true;
> 
> I think you should create a separate patch, before this patch, that simply
> sets:
> features->dynamic_inbound_mapping = true;
> 
> Since that is technically a different feature, independent of this
> feature, so it deserves its own patch.

The commit message for that separate patch should mention that the reason
why there are no code changes when exposing/enabling support for the
dynamic_inbound_mapping feature, is because the actual code changes to the
the DWC driver already in commit 4284c88fff0e ("PCI: designware-ep: Allow
pci_epc_set_bar() update inbound map address").


Kind regards,
Niklas

