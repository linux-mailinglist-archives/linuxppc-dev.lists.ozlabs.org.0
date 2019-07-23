Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A482725C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 06:14:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thn25mFHzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 14:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ahn4jTwY"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tPqy6xNNzDq6M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 03:00:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lM4rRR9UlNkzJHNHnArlH/ByV65Pyr5ihMbwu1aCo6M=; b=ahn4jTwYjyNa4M8unrPay3xxJ
 qlIqnbejiYbw3DRIt9C70tkP9EFqJ3giqYyOya76N0uvawyijpYmPkEBsUhrU6LcdIrOh0cwbToHJ
 eSDRJERbOtHPC03u2b8BaWLgxBA86iMxobxTGynSM5rNTOe9wRcDXZRV7dWKMKwTfnGMw=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpy9U-0004J0-5S; Tue, 23 Jul 2019 17:00:36 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7DD202742B59; Tue, 23 Jul 2019 18:00:35 +0100 (BST)
Date: Tue, 23 Jul 2019 18:00:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH 01/10] ASoC: fsl_sai: add of_match data
Message-ID: <20190723170035.GO5365@sirena.org.uk>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-2-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9DptZICXTlJ7FQ09"
Content-Disposition: inline
In-Reply-To: <20190722124833.28757-2-daniel.baluta@nxp.com>
X-Cookie: Avoid contact with eyes.
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
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9DptZICXTlJ7FQ09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 03:48:24PM +0300, Daniel Baluta wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
>=20
> New revisions of the SAI IP block have even more differences that need
> be taken into account by the driver. To avoid sprinking compatible
> checks all over the driver move the current differences into of_match_dat=
a.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------

You need to supply your own signoff if you're sending someone else's
patch - see submitting-patches.rst for details on what signoffs mean and
why they're required.

--9DptZICXTlJ7FQ09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl03PTIACgkQJNaLcl1U
h9Ce4wf9FPwW9YoTZLNQAPLcH2tdxWqllpH3ZIAiKSDjWkeH9SHfV2iiH1AAMTIL
yM/q6mJxSQPQ4MLekLosnBJXVMkh6/2U8t2pX6YsLFs//vvguPT5XnBZ3VGti2vo
/jvnayUvKMLs/KhI6EvTT+6UVOBnPos0aFMsLkNbdVzb76jIOPX4kVy/TTiqoSjY
sAtGZkl3m0hfwBlOxWPRgkuJdsckLcRLAvVV99ZopDdsWDo2m0KLEXDCm/81P0F6
oVukPsYlmNfOuU5XpKC+/droD+XBK4AO9gy42C4aFkeSsA8eRmFvLlGjEHXlqBU9
DWoy0wiEwu0NjI5w/kgYiLSufz+TTA==
=kOOi
-----END PGP SIGNATURE-----

--9DptZICXTlJ7FQ09--
