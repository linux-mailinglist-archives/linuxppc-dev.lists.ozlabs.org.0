Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D7611667
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 17:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzRtk3fjgz3cLc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 02:54:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kTgfPiGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kTgfPiGx;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzRsm0qyKz3cCZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:53:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 94BC0B82996;
	Fri, 28 Oct 2022 15:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3B5C433D6;
	Fri, 28 Oct 2022 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666972407;
	bh=Lr1MwqXp3hb+RyMzAElHgRcN7Y4whufOoogdp/QICXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTgfPiGxN+g6J1oqeP/b8waZLuwwYlzUeopDw3tKWQ2fLSvWeEmx2N0S+KBOwV5GM
	 8FFZrFsAkI0qDCT8MI4PkZELaDiYF/g6VfedIdEUD5piGBOYpwrvbccRsj3k3OqXF/
	 u0S3AFqp0J2kVByxUJDqFhrfztIqZuPtJgLxM13IUU5ikfJbLZgHq+RhkBRB2mOiGV
	 LqMsA0GRAGHVR9R1tmd7hUSa4p/8glzeP6wkYLniQgnXce2B9PbYSwbGj71aQh08dL
	 08Bnw5+OzrtGq4dhLXSnstJefE5LheVFTH6huSer0knqkKZANbfESvRLPpJfaRszGe
	 mNiDn6nWvYxng==
Date: Fri, 28 Oct 2022 16:53:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Zanders <maarten.zanders@mind.be>
Subject: Re: [PATCH v2] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Message-ID: <Y1v68WuDck1oaVmk@sirena.org.uk>
References: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
 <20221028154534.112175-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zDVZfyM54uy1DY0q"
Content-Disposition: inline
In-Reply-To: <20221028154534.112175-1-maarten.zanders@mind.be>
X-Cookie: Life -- Love It or Leave It.
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--zDVZfyM54uy1DY0q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 05:45:34PM +0200, Maarten Zanders wrote:

> commit 203773e39347 ("ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk=
")
> commit 2277e7e36b4b ("ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk")
>=20
> Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>

If people send tags like Reviewed-by please preserve them unless you
make some change to the patch that would invalidate them, that saves
people duplicating their effort checking patches when they haven't
changed.

--zDVZfyM54uy1DY0q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNb+vAACgkQJNaLcl1U
h9AwBwf/b90319UQfp1/m9HiG8Biyy4dC4eMZuLMs/OQl1kflINQp2JtHId2cqlD
h2nn5TBXn1MjDqqAK0asOXUEh29VNS77YdTQiF6j39vZdhbeezG1WTy8DBBjmCT+
6z5QYVIC1wkdOxCvqUf98QBMfZ/7hjHrmkc4MRTRRq085IPkuLxU9OrZUAVVTBGd
jDTMjT0VM3uwjvESDZJ3/4cah2+9RTpUni9BEyXvbHf0qWY2yiE+13TjiJ1W9Y7p
c0FHtp0VhJJrBnquCrX1J2PRGLeBuLdquNbAJN+wTsi9k6emiebjg2iG1mxxLXp7
4i4G99xn9OdJ74Lle+g48S5+eWULeQ==
=c6ad
-----END PGP SIGNATURE-----

--zDVZfyM54uy1DY0q--
