Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1A56183A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 12:38:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYZYx5j5Dz3dxl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 20:38:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ke/h3lcP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ke/h3lcP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYZXb67YNz3bkQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 20:37:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCF3EB82A24;
	Thu, 30 Jun 2022 10:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E296C341C8;
	Thu, 30 Jun 2022 10:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656585449;
	bh=iIKs3rpaYPtUZ0eaoQBogoq+V5pKpR1jkSxXnpou/3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ke/h3lcPOMIcjmkXSDygaQX/fBnyA5e1eEEUNs8qdP9Dwt+FEhhFsyDc8q1vNT0Wi
	 ZIAz4B4huhN4ynq/IVmE8WlnX4UCtgS1koYpNof7PCbUhFM8wlBkAcGs/ex+wRYFRM
	 S92Z1bjJKrpgkGsSruKC+H++8Nm4+A5xlLWUnqFMDshpvkdFrdj8wqY1Lf0kJwYwFB
	 C3zKHGEVhlMmTkVPMtdbUdFuXQhh/6kNFUq5m0b8uTvTMmZfw96hg/3oUfCHHasld3
	 Ve3kCsGl/H4yqXC4WwkFjIVNwlEYa8smOf70ranpv+Vgr465CwFtphi5HVMHjQx4rM
	 eyCO2Y7pbAvcQ==
Date: Thu, 30 Jun 2022 11:37:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_micfil: Add support for PLL switch at
 runtime
Message-ID: <Yr1842e42P4piYnE@sirena.org.uk>
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
 <1656567554-32122-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SDyGFineERFKDrrR"
Content-Disposition: inline
In-Reply-To: <1656567554-32122-4-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Today is what happened to yesterday.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, robh+dt@kernel.org, krzk+dt@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--SDyGFineERFKDrrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 01:39:11PM +0800, Shengjiu Wang wrote:

> +static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int sample_rate)
> +{
> +	struct device *dev = &micfil->pdev->dev;
> +	u64 ratio = sample_rate;
> +	struct clk *clk;
> +	int ret;
> +
> +	/* Reparent clock if required condition is true */
> +	if (!micfil->pll8k_clk || !micfil->pll11k_clk)
> +		return 0;
> +
> +	ratio = do_div(ratio, 8000) ? CLK_11K_FREQ : CLK_8K_FREQ;
> +
> +	/* Get root clock */
> +	clk = micfil->mclk;
> +	if (IS_ERR_OR_NULL(clk)) {
> +		dev_err(dev, "no mclk clock in devicetree\n");
> +		return PTR_ERR(clk);
> +	}
> +
> +	/* Disable clock first, for it was enabled by pm_runtime */
> +	clk_disable_unprepare(clk);
> +	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
> +				     micfil->pll11k_clk, ratio);
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

Seems like more of this logic could be factored out into the reparent
function if the target sample rate is passed in?

--SDyGFineERFKDrrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9fOIACgkQJNaLcl1U
h9C68Qf/YX1eL795b+XK2iAIiNLwaLomwMbw0JjNUWxPZS3+wkMhyqOfDxWfq52s
WZkSoJ7vyDPSIr7R5nCH7QFdwdgdLqck/2GSAaPUndpELFvuLqME+nElf2OlYx6l
nq33cMqc0OZlIpM757VsPYN6IPPq87rPXI030XM4lmOxzhvV1gE0195pRFSiyiCl
dWiddG47/R+cRgjm6LaGN0kkVTLWdj16f5E7zlz2VDse8I/CR5w7/U9hQ0yfE/Rr
oJtQi+ybrw26ELGPHDP/2yljgWzaCuc/+BllHMwQeoTYgjuu+nxpX8m6B5ToffUT
RpPmDmKDRpeFSTwxqqUVNwCPjHNjqQ==
=Zj5G
-----END PGP SIGNATURE-----

--SDyGFineERFKDrrR--
