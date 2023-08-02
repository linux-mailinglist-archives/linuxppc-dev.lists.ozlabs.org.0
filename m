Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB7476CC56
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 14:10:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n0nVo96Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG9m16k3Qz3cmV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 22:10:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n0nVo96Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG9kt69Cmz3cRJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 22:09:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D402D61926;
	Wed,  2 Aug 2023 12:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BCDC433C8;
	Wed,  2 Aug 2023 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690978163;
	bh=M5e9aIt4zB+xazIlQzHD++KNXR0lBSq5lPpPZBlFnnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0nVo96YwWrmpCF4FJWiUwGfROiwCepHz2+sCu2OSN3CVI7R58tLGqYicwk4YYKOg
	 +NyLJzHU9dFDb2Ho6UPuP2IEP/c/D0cJo7dHvPkGv/B50Ta5mZBFLUrrx0aC9/XNWi
	 +t/sdjYvpddoKhGi/JXjdc+frbE7nFrY66eu014qVGygZQPEEgKavljf8ltRC6P5Nq
	 Xl3zKTbG64yhtVO+lK7S6RXM3ey01oWUYp+6GBs47b5d74fGfCwBb2ahJbqV9qozKI
	 DnSeTdBh7Y9dCBVGiTCZq9YuojTjQKdr2+orJcAcMbvj7a7mpqrt05719eGZTT2qOk
	 sgy/jEHSfCbYA==
Date: Wed, 2 Aug 2023 13:09:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Message-ID: <b7120871-325c-4db0-a785-854b51ab680f@sirena.org.uk>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s7JwRvdQJYqkq6dD"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
X-Cookie: Humpty Dumpty was pushed.
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--s7JwRvdQJYqkq6dD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 08:02:29PM +0800, Shengjiu Wang wrote:
> On Wed, Aug 2, 2023 at 7:22=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:

> > Well, I personally don't mind to have some audio capability in v4l2
> > layer.  But, the only uncertain thing for now is whether this is a
> > must-have or not.

> Thanks,  I am also not sure about this.  I am also confused that why
> there is no m2m implementation for audio in the kernel.  Audio also
> has similar decoder encoder post-processing as video.

This is the thing where we've been trying to persuade people to work on
replacing DPCM with full componentisation for about a decade now but
nobody's had time other than Morimoto-san who's been chipping away at
making everything component based for a good chunk of that time.  One
trick is that we don't just want this to work for things that are memory
to memory, we also want things where there's a direct interconnect that
bypasses memory for off-SoC case.

> The reason why I select to extend v4l2 for such audio usage is that v4l2
> looks best for this audio m2m implementation.  v4l2 is designed for m2m
> usage.  if we need implement another 'route',  I don't think it can do be=
tter
> that v4l2.

> I appreciate that someone can share his ideas or doable solutions.
> And please don't ignore my request, ignore my patch.

There's a bunch of presentations Lars-Peter did at ELC some considerable
time ago about this.

--s7JwRvdQJYqkq6dD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTKR2sACgkQJNaLcl1U
h9DDTwf/Xps9jJnts1SAD46EJPtve2N9sezS1xZvZgz0pluqjz+vDEyh+ediLcCy
uoiOc/xZz8Odde64unpb8nKuJzfH8hwdn4JFEMc9capaRijhM9iYxSNlDK6p0wil
AX82WXjRdrxyPbNJQgqYehJTbcydxIbewfCqG0ryrG+NeiAPZwR/p1IrCVzBrCZ5
E5+J4oQCAB7li51EuyZuihiImeoDS8LMbPJ5ciHXbhnXyIZaw8AvxTEz9d9llUl8
36hbfxrM24rlJDE16kRco/zHvMkK38W6fubovlGudON8xDoUBFZIPP3SWa5TRy7n
j3xcxiC0N3R2xWsDWKC3p7rK6OoiYQ==
=0Tfg
-----END PGP SIGNATURE-----

--s7JwRvdQJYqkq6dD--
