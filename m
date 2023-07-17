Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED79756370
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 14:56:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cqxtSMHe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4MXN0pqYz2ypx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 22:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cqxtSMHe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4MWR1ZJjz2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 22:55:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 009BF61059;
	Mon, 17 Jul 2023 12:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DB5C433C8;
	Mon, 17 Jul 2023 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689598526;
	bh=Iqh7TfjijModD1NwjJzA82R/SnUFVzZQQvN3iUdM0Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqxtSMHeVaOO2y+5T7XvfymkK6ZiMuedPIKRkPc7kZ9pVnWDBY2HBK+wDsN53yylv
	 s5GLwxI0ftOyPwsJcIqnGzeGNPUuQ+jlhngpUgzqdlA4rGdKxeTjsP5V1RCLp4LfJY
	 ICOTTmXoJYPGBTJiXJ73iT/WbmIkOia21Eybua6b79PomacrGD6uPmyeE5gOy2znNQ
	 L3mgvj27TR3Qx+jTbphosG7wrF6TRG0HTAM+IjG5/Z75NRGyC7vZNHdewK/rT863FD
	 C8D8jblHKb4vGXwarkv/u5Wk4wSfeviBjcOW6yuC6+49sbSPihS2kIKmSbdXyzlXdt
	 XM0QSQqyU1rTQ==
Date: Mon, 17 Jul 2023 13:55:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
Message-ID: <d2cbf249-32e1-4e19-8362-7087d6b7d3d8@sirena.org.uk>
References: <20230712124934.32232-1-matuszpd@gmail.com>
 <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PksENF3NvhBOBXfu"
Content-Disposition: inline
In-Reply-To: <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
X-Cookie: Not a flying toy.
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Matus Gajdos <matuszpd@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--PksENF3NvhBOBXfu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 09:31:38AM -0300, Fabio Estevam wrote:
> On Wed, Jul 12, 2023 at 9:53=E2=80=AFAM Matus Gajdos <matuszpd@gmail.com>=
 wrote:
> >
> > Otherwise bit clock remains running writing invalid data to the DAC.
> >
> > Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
>=20
> Should this contain a Fixes tag so that it could be backported to
> stable kernels?

I'll just put a non-specific Cc stable tag on it, that should be enough
to get it backported.

--PksENF3NvhBOBXfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS1OjcACgkQJNaLcl1U
h9DS1wf/c16EisoD6DHiFlMXL2USTW4POzR71yM0WbVK9sShUOKNMw++l2llTr8F
+2lfuS0cGsgEJxtBPRJnWJlUleMwVRHpZJ9Vhl7TdwFQF7X2G6jXGFO6EFg7aBqz
knhGCxOTfYZO3MqD3ppBKGhcaNJdoWOWi8Dre2NNh6StSURThYv+hSIwp92OQP3W
09ssoeCBkrVkOmvWoxIJ8fgkr0b2ySIXi0dDLeeTAhZ73xydCGq9GehXiJphnshX
iSAYkBqrD6ioCD+8n1kO4a4Jp18sTF1IVvGEonzv9sVpSavKrqWIohI5Kiu318TP
lVKVvYs/7EH4FswQ2FztkW7ksidFZQ==
=3WHI
-----END PGP SIGNATURE-----

--PksENF3NvhBOBXfu--
