Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC576D541
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 19:29:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2qTYnVT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGJqy3gT3z3cGW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 03:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2qTYnVT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGJq42j0Vz30hs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 03:28:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B8B461A71;
	Wed,  2 Aug 2023 17:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DCEC433CD;
	Wed,  2 Aug 2023 17:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690997308;
	bh=fZOqG176cU7NTL9kF5IUl1tJY6WVyVd2yvYUysK5c4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2qTYnVTVxmoM/7E/k8f+YVgG+VoGlUIkCW4hUuPFLuW45Gpukag9xjM4G3yNBRFf
	 F9fCcepA0IJAxVfYgBXTi8XC7/fq7AcFLOvA/w5RvjjHUI+sm7qsyIdmxRSymToi9l
	 yElDU1nHeyyAjVpoQg5Q5NsbrP+YDFUWrR1m5qES87cZqrJ3NPRmGCKpcEEFbO18tz
	 PjSrySyhW7OxIuJFh+AsVT0s3SIttTqOByGvWzsj/DE8J1hbh+ezaer48zzC6FqYxG
	 UbTNdG7cNb+U30jy6EPoOvwQU08wmaPJKQecvoO+Q9ZB6nl+DEYqcINItbtYUY9/HA
	 OxkuVgfo611Cg==
Date: Wed, 2 Aug 2023 18:28:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Message-ID: <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MdG0m2yIP0FKio4T"
Content-Disposition: inline
In-Reply-To: <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
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


--MdG0m2yIP0FKio4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 10:41:43PM +0800, Shengjiu Wang wrote:

> Currently the ASRC in ALSA is to connect to another I2S device as
> a sound card.  But we'd like to the ASRC can be used by user space directly
> that user space application can get the output after conversion from ASRC.

That sort of use case would be handled via DPCM at the minute, though
persuading it to connect two front ends together might be fun (which is
the sort of reason why we want to push digital information down into
DAPM and make everything a component).

--MdG0m2yIP0FKio4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTKkjQACgkQJNaLcl1U
h9A05Qf8DvVF+7HkTrWpZeLLTiun4dI0bUwdJ7dBv/9eO2gLeD8aonbFN/iOGUS3
6HQafM/WVAHT67s9CThpIHGG8oWuubOG2Na3mKSs3xD+zRf4NVxpUN9+2JclaYtt
zKwBd+OYExLP/x/6qTGyqQi5BC0pmgpk73+mQtRRVClGOdjsfE3ke6TWvOBsIUsZ
+l3hAMxeKmIgczEq5MkPahD2mfN0CZgbCwaFA2zriaJXCPxPP/YFvYf+Mli8KDBK
6eRZS7e6SHICYPyqngTDICpj6MbiIxCHm7qIKEboyK5C0cW8PR52o6fbyN0XAHxc
sNfbpJop+bjYwFJQnjwlPTzGqO5cgg==
=0H5v
-----END PGP SIGNATURE-----

--MdG0m2yIP0FKio4T--
