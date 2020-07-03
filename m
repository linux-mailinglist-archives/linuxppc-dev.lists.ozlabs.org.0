Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A140F213D16
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 17:58:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49z04D26HBzDr74
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 01:58:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=jOpysPRu; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49z01P2xNczDrHy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jul 2020 01:55:53 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B17420737;
 Fri,  3 Jul 2020 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593791751;
 bh=Fwb0iJ6mVcp04VHQWexbTvxsCiVNKg6ZNoMpsYLJboA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOpysPRuDr3Z2qxjIAg0GOpIqxyWnWgUf0RMwvW1KzR2P5YGytArk+3MuuzkBzn7V
 K5GnEQbu7HtJyloD8PkOJblpECREXxZCqBOIKRKkoR5wO2Mss1R8FEZciWW1JP9LFI
 YIHC8WSRmM5QyPtfDyl3yqFeaNn4DbY2RqWt8Vjc=
Date: Fri, 3 Jul 2020 16:55:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703155548.GA17656@sirena.org.uk>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Sin boldly.
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


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 04:47:56PM +0800, Shengjiu Wang wrote:
> The ASRC not only supports ideal ratio mode, but also supports
> internal ratio mode.

This doesn't apply against current code, please check and resend.

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7/VQQACgkQJNaLcl1U
h9Ba6Qf+Pt9/pqEBOEoCDH8/qYlQD3h2YcW8V7LV+bs0lwfMFzHxLPRt7AEt8s33
2CXRTYZvxM4yEcF39OVz1tcKlhk9xzxMhI9OeVspxsaGmImHDDWpwBeIJLze+Tj2
xiUVftkSpVsWvgbDzG+l6CraB0KEmH7T7/t9/OEbetNyc6r/w9wkkQ32TGtvUPFY
PfP4CL5O3K0LpRPyF60C7pMGALCa/ktqrfRVN+6h8M0HQ7/JNejLc302JqjvGCAO
0jACiNqj5u8/3UgMCB+r7iUPNkjDxwheTQw3Y+PWMisQbtcnVq5Qyn5jVoJXLRjk
MzyJtIbWTBUnEVoWiifcNPVUerGMvw==
=vKxS
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
