Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EDB7461B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 19:59:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FhW9voFl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvtx72HJ4z3c1P
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 03:59:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FhW9voFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvtwC6HPtz30g2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 03:59:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E70C960FE2;
	Mon,  3 Jul 2023 17:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2F4C433C8;
	Mon,  3 Jul 2023 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688407142;
	bh=XiKFb7V3OWMEwZYvzGXbVzuxPSM8FbOxPhs9OT74TMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhW9voFlWsg2QeJzEydQBhtOwjlMm8fZzCdy3Jg6bgRw3Esqh+f8rsZBYIA3SCaPx
	 AQz+Oc9EBN6nn93BEoFFPSg+57WrZmANomGNefAIrNciFIsppxAehBRnMqXAt/ywjm
	 z7iqgzyrENrfpeSnG308kL3EU9gR+y4v6L3MlpiOyNoivVjA3mh4bTEnyioySkQzgM
	 GxeHgvOxN6ShRkFj3TRimrwaeLvgUIl10cAmpoOAJRCAw3PSjPMnrlQB4GB7fHJBUf
	 S3+AIOJVoJNcN8mVzU6/cDqq2x4yEOq0egDriSpyLBXZ5+3puLj3beKYTz+4YpegCI
	 Yid4vMQ3ucBZQ==
Date: Mon, 3 Jul 2023 18:58:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
Message-ID: <090cc065-b078-4f2c-9b2d-3b0b7418461d@sirena.org.uk>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
 <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
 <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lxJuGwNgfQ7aT3CA"
Content-Disposition: inline
In-Reply-To: <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Jacopo Mondi <jacopo@jmondi.org>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, Sakari Ailus <sakari.ailus@iki.fi>, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--lxJuGwNgfQ7aT3CA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 03, 2023 at 03:12:55PM +0200, Hans Verkuil wrote:

> My main concern is that these cross-subsystem drivers are a pain to
> maintain. So there have to be good reasons to do this.

> Also it is kind of weird to have to use the V4L2 API in userspace to
> deal with a specific audio conversion. Quite unexpected.

> But in the end, that's a decision I can't make.

> So I wait for that feedback. Note that if the decision is made that this
> can use V4L2, then there is quite a lot more that needs to be done:
> documentation, new compliance tests, etc. It's adding a new API, and that
> comes with additional work...

Absolutely, I agree with all of this - my impression was that the target
here would be bypass of audio streams to/from a v4l2 device, without
bouncing through an application layer.  If it's purely for audio usage
with no other tie to v4l2 then involving v4l2 does just seem like
complication.

--lxJuGwNgfQ7aT3CA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSjDF4ACgkQJNaLcl1U
h9C2qQf/T1bo/x5kzUxZUiZwHmeGiBJp44klM7V/tJxivlJLnJasmtd1XuabJOck
svgGpJOHeeAAIAQIleix37Lwq5hMLYgRdPPAHw3+uw4mYtDzqo5dx8t7Wb8d7+px
152zx6Cv8YdJ1mK/UOKXC/+knHpkW0r9PtzwItAAnCTPpAIPjB0FAjSkhRuQr2bl
tlzLcAepTA/uPQYuK1FbwUZEcm0i/qo/aFpE5T7hYpY3IlFYrtMz8uNyqhXMsuM2
SMREMMIMF84hMJkJ3sRrf6609xv86w+Rkh6illa8jX/GCKDHQRNR0xa+0Gky5cah
eOW+Q5lSP6NtzVnkBdM3DUDl/+IaRg==
=ImD6
-----END PGP SIGNATURE-----

--lxJuGwNgfQ7aT3CA--
