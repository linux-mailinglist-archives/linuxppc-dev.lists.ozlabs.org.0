Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B569B2E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:16:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJM426Yhtz3fQc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 06:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SrtDEi1I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SrtDEi1I;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJM361cmkz3f5b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 06:15:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4996561F16;
	Fri, 17 Feb 2023 19:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489C9C433D2;
	Fri, 17 Feb 2023 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676661325;
	bh=G/85bFWMblsbIz5H+NTur/T3kbROSsPA8F4KeWTtTxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrtDEi1IVNLAktpZEhk1uI+ToDFVeSSVBgZ1ez9vN0+RG7D2uXX5SgnlxwL3xEegT
	 C94sbFYK/5JALtaoEkcw2FnS3IPBE51MIA3vbDJIg3dUUGrjNZwbxAPcmC/5D1AWg7
	 muCfEXNkTG36ZqSXp9JLKJhC8+0hc1Y4GTLJQ3VPu8D30oovBCHr+3QNV94QhuEXln
	 HgvqZiK1aL5KstnK1JlPXZLECJovSIJRjY0lQjHbqoqBx4sOkU+BENovq6FAiIZp3V
	 cOr4kQbfd0EB3DlvLvKAMLxOMyteV8x5AViB9AypQd+HuWclObS5sK1YGBBpMtQVG3
	 ujbn+ASxOwZsw==
Date: Fri, 17 Feb 2023 19:15:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
Message-ID: <Y+/SStm9ifszrYA1@sirena.org.uk>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
 <87mt5dyxph.fsf@mpe.ellerman.id.au>
 <0606f44f-bdbb-055c-6fff-440007222ce3@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VaNrrXW2eNrXN8Fc"
Content-Disposition: inline
In-Reply-To: <0606f44f-bdbb-055c-6fff-440007222ce3@csgroup.eu>
X-Cookie: Serving suggestion.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Herve Codina <herve.codina@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Takashi Iwai <tiwai@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Li Yang <leoyang.li@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--VaNrrXW2eNrXN8Fc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2023 at 06:32:03AM +0000, Christophe Leroy wrote:

> Mark, is that ok for you or do you expect this series to go via soc tree ?

Sure, that sounds good to me.  I'll give it another check and
then assuming everything is fine apply for -rc1.

--VaNrrXW2eNrXN8Fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPv0kkACgkQJNaLcl1U
h9A2ZAf+JT6rtuHjPfgpWsk/znSGdDmha4+vtlzEcAE1Dbq5/LFIShop84OCskiY
0dIpfquVu0eN9u5F983mJtpr/jZfFZIvvJaN5ccwRNpduirs17rh3o8V0LoJRElD
jv+lct+lydazjRFK/kmsuCtxrFvdoPI6edCHvAx8xIYUyG2cbNIpsU7X5hHGHzc6
lxhGZDHR7DNveAVx91r1WaAzd8loxbpXkjGGsoqZr2/dkdSx5jlLiyIbMLlTdfrT
PrkJ/ITqKSkmwMRCK0KH/gASwr7ChraDgaEIRhC+O0K+I3pL0BnInwSuv3XezGz9
hdSU/02x5goYzdcJddt12woaNCqQYw==
=SHcR
-----END PGP SIGNATURE-----

--VaNrrXW2eNrXN8Fc--
