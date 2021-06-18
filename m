Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB633AC9F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5xdw5KFZz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 21:34:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SqlXqi54;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SqlXqi54; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5xdR4ndPz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 21:33:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E68B610CA;
 Fri, 18 Jun 2021 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624016024;
 bh=9s2RQDW9wanQqORyAIBE9pVzVvO91REtRxxPhTclx3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SqlXqi54Wb+yJCY85fbszND337jMrH1YM9XsF+vWgllGBpqb9VlxWeoQIneYKtmoL
 DDWw6wt7vpYW0ktptOHD07s18Z7MKMyqxG+QttWQ+0Vs2sUxhpzUOOPOfsT/wModgb
 KXCsOEO7f9llPwPii+Ae6A6fRw2dlavWsuGTs3GxHsarnYKzEzSFsGSjK7tZq9E9nB
 aijS9ai4jkTUI2U2HTPCWoqjIGzZ2KpEeJPAT0iO0F5xtCjm/IyRptmvk+3pMiwIFR
 zzUZ93Gzt1DsGgsmiJO5sWtcXSjvGbPlxA3dkXDbdCcC6ctVmJhpGelXftHm9jGPSx
 NZ7ixSeKGTPsg==
Date: Fri, 18 Jun 2021 12:33:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: disable all interrupts when suspend
 happens
Message-ID: <20210618113322.GA4920@sirena.org.uk>
References: <1624009876-3076-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DYLZmz6f0yjrOpaL4B_wicq0ofrYpW6QqzNPEc0j407Q@mail.gmail.com>
 <CAA+D8AOiL2otCBRyP3q7EWd2C7RnUhWZjRtxcJWQyXXXydf_ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <CAA+D8AOiL2otCBRyP3q7EWd2C7RnUhWZjRtxcJWQyXXXydf_ZQ@mail.gmail.com>
X-Cookie: Are you a turtle?
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 18, 2021 at 07:30:25PM +0800, Shengjiu Wang wrote:
> On Fri, Jun 18, 2021 at 7:21 PM Fabio Estevam <festevam@gmail.com> wrote:

> > The operations in _suspend() are usually balanced with the ones in _resume().

> > Shouldn't you enable the interrupts in resume() then?

> No,  as you said below, the interrupts are enabled in fsl_xcvr_prepare().
> so this change should not block anything.

Might be worth a comment explaining why there's the asymmetry.

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDMhIIACgkQJNaLcl1U
h9APMQf/d/lJMjdPrNhdzJeuS3tVHQ268JZCwmabDferZbnDRbjuwaiq+4wAdnBC
EFksPtmaTNBBrrLUc1bTxLs0Hl0wBGNv+zf5r8FCfEm60zrQF3QKDTZ1t46ZelbX
9uQRMcFanYwBChVofttzEwDHWStsDCHoi7pfP4ZwGTR+SR6rERyzgAv43862ne/G
klbzzYKa+CyLGvojCzNTZBvkyNPQCkhuazh7wk6UolcFTf2oz+wjUPYyJ/Xbwqb5
t+Y4zwAqMls5GZtzFWIohvRgCULmADRq8FqCzFQIYm3teLhDgQGtbM8Xn2Tz3Vp0
MQveAgdluQ8hDsBYMq31CB4CgMOZag==
=a0cm
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
