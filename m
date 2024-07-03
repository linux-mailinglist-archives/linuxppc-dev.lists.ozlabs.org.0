Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7979269D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:03:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gGWRsB9H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDsgd3XT5z3dBq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:03:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gGWRsB9H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDsfx5ChGz3cbX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:02:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53DD2CE2FEB;
	Wed,  3 Jul 2024 21:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B3BC2BD10;
	Wed,  3 Jul 2024 21:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720040550;
	bh=dmmPN7PbNyCuDzjw4nX616fO/kyvAhA6uaaJgw/vC5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGWRsB9H5MXgtDn7xBNW3x8qyw8sNfFGFcrNRO8O/yIwf4qqlSgoIJAMpNG+t7BZX
	 +AKaNMZnSTW4BhxsEDiixqYQXjKtfclgZgjhydQxZMm5TBdoAjiLfsPmtiPKpGEVBH
	 aA0+F2GTdsgouJCp7SjzpViThXocsy3WXNw/Y+KaMkXP+XplJoFUdxgaEfzWOQixUZ
	 bsQZkCrJg+4nGLJsbgVE8NmRAiwVdIjZxxi/tYhpzwa3F6oVqpx356zsR7lFetlzpJ
	 X49nafffoCvVToREvd67r+CMnyPu62/lizDqCqlBh2Z56O17YJk6yCzqZkFQ0dmnAM
	 o0nxREnHvwoVQ==
Date: Wed, 3 Jul 2024 22:02:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to get
 a channel from a phandle list
Message-ID: <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
 <20240701113038.55144-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IXiemNHl5uycVqbr"
Content-Disposition: inline
In-Reply-To: <20240701113038.55144-8-herve.codina@bootlin.com>
X-Cookie: There is a fly on your nose.
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--IXiemNHl5uycVqbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 01:30:34PM +0200, Herve Codina wrote:
> qmc_chan_get_byphandle() and the resource managed version retrieve a
> channel from a simple phandle.
>=20
> Extend the API and introduce qmc_chan_get_byphandles_index() and the
> resource managed version in order to retrieve a channel from a phandle
> list using the provided index to identify the phandle in the list.

These two PowerPC patches seem trivial enough and have got no response,
unless someone objects I'll go ahead and apply them.

--IXiemNHl5uycVqbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaFvF4ACgkQJNaLcl1U
h9BZVQf/UimpDsgz78MuXcxLPQ7UIFnEeDuapV1kWGaWCmCLoHhTHXeG8B/9AQqI
ttiEWJdBKBzc1NRr0xmsh4BpKIVlCe3zZ3tndxE0umFnliWOKBeo7ZqroZb47asH
lcjxXenwNC733si1/zHRv3cxK8z0zprPshVonONBP4iaKppNz0Kmifj77IglG/h2
C6j9RiJ9CNkG7KTc5XU376/q5G4PXStk+KRrVL0F+x+c93QywoqXinxhXovc/j69
CNNc/7NjfF/7Rs+Y+F4QA+6VA9WjwjEO+WNaI3VtZad+beJ6ERyJBnh6G0tCrWl7
PYG5NWe9uOZQxqsuESvUUBEGB2nJzg==
=qAFL
-----END PGP SIGNATURE-----

--IXiemNHl5uycVqbr--
