Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1ED745CA0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 14:54:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWP6F7tv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvm954FsBz3bYm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 22:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWP6F7tv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvm8B36jtz30Nw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 22:54:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3539560EFB;
	Mon,  3 Jul 2023 12:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F7EC433C7;
	Mon,  3 Jul 2023 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688388838;
	bh=hewjnNwAOpFhWN8t9+3hp7dpuy2ksO2+BijfX7/pwtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWP6F7tvelb32aSFkmXp3E37CiVtJLdyV1Q/Ol+oRCeZ8nbkDPcaKwnvipmDJY7tH
	 54BJt+Oc4y83gshDU9zSBY8HSz7K/MU8Y0voUnWGhtfIy1CdScydVw8NVkMU1EoU2n
	 zQ7PTlmNXODiJcTWCcRKDWy6zczUYmSHoqRbRHJ21RUV2qlBOEw0yuexv38JuMAhSx
	 sFkOlE4rxVTL3Qbj35KkPeFAQTB7J9Jz41zlNo3gfESItN/Y9hSRVQ6Bq1nPFiw674
	 nOiuhwpXKQywk/gVZzjACg//zXsHevdnUMkGHdOaJWCePBUDyigaQH1iPwiFg4JO6l
	 DQeRuvSaX7XWg==
Date: Mon, 3 Jul 2023 13:53:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
Message-ID: <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XyTCZVqlIuin1XJf"
Content-Disposition: inline
In-Reply-To: <87h6ql5hch.wl-tiwai@suse.de>
X-Cookie: Please go away.
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
Cc: hverkuil@xs4all.nl, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Jacopo Mondi <jacopo@jmondi.org>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, Sakari Ailus <sakari.ailus@iki.fi>, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--XyTCZVqlIuin1XJf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 02:07:10PM +0200, Takashi Iwai wrote:
> Shengjiu Wang wrote:

> > There is no such memory to memory interface defined in ALSA.=A0 Seems
> > ALSA is not designed for M2M cases.

> There is no restriction to implement memory-to-memory capture in ALSA
> framework.  It'd be a matter of the setup of PCM capture source, and
> you can create a corresponding kcontrol element to switch the mode or
> assign a dedicated PCM substream, for example.  It's just that there
> was little demand for that.

Yeah, it's not a terrible idea.  We might use it more if we ever get
better support for DSP audio, routing between the DSP and external
devices if driven from the CPU would be a memory to memory thing.

> I'm not much against adding the audio capture feature to V4L2,
> though, if it really makes sense.  But creating a crafted /dev/audio*
> doesn't look like a great idea to me, at least.

I've still not looked at the code at all.

--XyTCZVqlIuin1XJf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSixNsACgkQJNaLcl1U
h9AHBgf+PmrkjDoGNN2pkJ1mNw5jmGsBAJkUX+OHPdAbWl0Su866gJ9fD6vXajFO
Y/9d2UZ5ubbmVeBZn47fj95dmPvq2povgtl2nzNz85MpDwcac03pQBVmS+ZPfYlk
Ui4s5mk+QFpXMRCxt4b9vYr8Wkp/lVH4RaD2q3fOXGeQqUvCp0Sn99z6tDZaTWBO
9hShFfh4il+VkKeBk6+m2MxWTcAEy5pAM7moCIE0VMDmZ4MEWmaXxvyJCZEOapD9
f+WpZURGpbdIi5yBHwfi/zVEHzfo2DGccC2UauYc50Z+hekml26dBQuTvfZM37Qc
BN0Unl4+vKxBW8rdx7rkbRIUueFLGA==
=SMUJ
-----END PGP SIGNATURE-----

--XyTCZVqlIuin1XJf--
