Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65D23DA78
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 14:53:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpMb0VDHzDqpq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 22:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=FTKNqPDO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMp185pGRzDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:37:48 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0563C22DBF;
 Thu,  6 Aug 2020 12:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596717466;
 bh=jL9tYWE9iw+uSM7TMvqp3lXSaJ38TCtcHbCBzrH9URk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FTKNqPDOSoDVsrkVCQRBkhh82E5jMj1JeoqvMgmSvt/r52lW6IP0hCZe5xb6yX1XW
 Fc8UcvHlqyqILzqf79rqJaDtp8Yb62k7F06R3KpYF6ZDrdDO38gupAtHWt5GOOVQgy
 nVmjkYs7ZtApS1RJ24E/VGn1ob8gmyOC0Nm9rgi4=
Date: Thu, 6 Aug 2020 13:37:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Get "extal" clock rate by
 clk_get_rate
Message-ID: <20200806123721.GC6442@sirena.org.uk>
References: <1596699585-27429-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <1596699585-27429-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Hedonist for hire... no job too easy!
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2020 at 03:39:45PM +0800, Shengjiu Wang wrote:

>  	} else if (of_node_name_eq(cpu_np, "esai")) {
> +		struct clk *esai_clk = clk_get(&cpu_pdev->dev, "extal");
> +
> +		if (!IS_ERR(esai_clk)) {
> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(esai_clk);
> +			priv->cpu_priv.sysclk_freq[RX] = clk_get_rate(esai_clk);
> +			clk_put(esai_clk);
> +		}

This should handle probe deferral.  Also if this clock is in use
shouldn't we be enabling it?  It looks like it's intended to be a
crystal so it's probably forced on all the time but sometimes there's
power control for crystals, or perhaps someone might do something
unusual with the hardware.

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8r+YEACgkQJNaLcl1U
h9AgUQf/RsD8CeWYDbaeEKFdJGHhIhdtwKO8qRAL1Z0U+AS4lEQwWdvppChPN90d
SjiFV8GtE1TIQ3IrzShwKjq4ZU1Kg8qWKcuqnTiqjQDoMJ11Fj6bWXqdwPSGioZ1
3mKOsJKQihgFHiXY+Xm1R3VuwpJiq19qSM94KYTy+K4p1NcS9Usdr5da5007rE/d
2RiyA2UvQjMtbCgOU8ZhM2XCRzwBUyFSGgmHvifONQIX0Sacr85m5SxW7teUVz36
5//kIoJlF/aOpi0dvugXYBPu1Ic8TVAAYWsIxVthtSvmV2dwKlorbO2X/VCJjbgS
V3SZRTvuY8ZlZdkOdxOSlCA8DNgtTA==
=nUjz
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
