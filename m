Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF748C315B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 14:48:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vzmo7KOP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vc5Ch3Nm3z3cGb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 22:48:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vzmo7KOP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vc5Bw6fncz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 22:48:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 867F1CE075A;
	Sat, 11 May 2024 12:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F7CC2BBFC;
	Sat, 11 May 2024 12:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715431682;
	bh=L6GEnWbRFIUnTLp5ZBj1nZe8npzW7+LcYnKnNImrCg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vzmo7KOP8imYYP9EUREB9SqsQ0mVwP4UlBMEmp4UUI9JrhCFszuETUr+sobW5mIqI
	 cNOFhl6Jr0CCjYfCZ36yW53o4k7WeW3ndW5DxN0JJe+cuW+MKWrBEZu4iVj2wec7Eb
	 Vd3ENik62UjGkZ7q1vX4C/iwqHwMdyW3QeV3PtKHHBtAddUzcU3BBTcO82g6H5GP1O
	 2yjAkBV8ME6uOst13YEmtCMTSrwvl2RCLxCyYq4SYjp02uqr6cFGhpsCzCp1lOvHhx
	 sFTXvHK90OM0SsClnWIOnKbefDJC2G1pIVeNCrriMYfitCiDZX/Iqe0yJUg7JJe601
	 sTr+bFiqVJKMw==
Date: Sat, 11 May 2024 13:47:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock
 sources
Message-ID: <20240511-catwalk-ipod-98f3e636360e@spud>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
 <20240509-repurpose-dumping-156b57c25960@spud>
 <CAA+D8AOkDbj_QsF9VescuAfFjKcB8FnOXqwjXVrrBM1Ck4ut4Q@mail.gmail.com>
 <CAA+D8AOQtwHTLsQcqh_LCvVP5CWXqiHc3-at8jv3B-kA8ORR_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BhobfpOXM1U4v7Qe"
Content-Disposition: inline
In-Reply-To: <CAA+D8AOQtwHTLsQcqh_LCvVP5CWXqiHc3-at8jv3B-kA8ORR_w@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--BhobfpOXM1U4v7Qe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 10:38:30AM +0800, Shengjiu Wang wrote:
> On Fri, May 10, 2024 at 10:27=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gma=
il.com> wrote:
> >
> > On Fri, May 10, 2024 at 1:14=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> > > > Add two PLL clock sources, they are the parent clocks of the root c=
lock
> > > > one is for 8kHz series rates, named as 'pll8k', another one is for
> > > > 11kHz series rates, named as 'pll11k'. They are optional clocks,
> > > > if there are such clocks, then the driver can switch between them to
> > > > support more accurate sample rates.
> > > >
> > > > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > > > clocks and clock-names properties.
> > >
> > > Despite the detail given here in the commit message, the series this =
is
> > > appearing in and one of the driver patches makes me a bit "suspicious"
> > > of this patch. Are these newly added clocks available on all devices,=
 or
> > > just on the imx95, or?
> >
> > These newly added clocks are only available for the imx95 XCVR.
> >
>=20
> Looks like I should merge patch1 & 2 together, patch 3 & 3 together. righ=
t?

Please, and also add constraints so that the newly added clocks are only
allowed on the imx95.

Thanks,
Conor.

--BhobfpOXM1U4v7Qe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9o/QAKCRB4tDGHoIJi
0hihAQCXLcY+nll7YEK6/Ko2DGZ15ldjwMy8rI2F7y5rjxW/cwD9G3UV60KNhoRE
ivzxxabhzsz8cc1NzjnzrR0RpqNhCgw=
=I79W
-----END PGP SIGNATURE-----

--BhobfpOXM1U4v7Qe--
