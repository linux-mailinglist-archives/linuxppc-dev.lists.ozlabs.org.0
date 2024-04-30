Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57A8B7A75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:46:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HRoXQHpF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTNLz1p8lz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:46:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HRoXQHpF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTNL95P1dz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:46:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 97997CE1046;
	Tue, 30 Apr 2024 14:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA7C2BBFC;
	Tue, 30 Apr 2024 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714488365;
	bh=sBXF+gjdjkRUhUS5Q4VYAIn7ZZ0+/7CQzrsCxXjL5dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRoXQHpFRApacG9ybBX6B95wKslmuE4UrGaFexMEbtIm4t0uAJWO5tcrZym/VeE6c
	 /S830uVslcO9IbwPhqveybIosTrozBqM7h3wLkepcAlo/OU8tSPtYbhSNFrRkBmJoY
	 coUyqlE3pvWN7L+ZADP0BArwUBwm0ZuPyscvkM+nbLTP2FFxQjOkqSGzrLP0nmF59c
	 HpkI+8ke0LG7xCL9EukPGz03r7pzDIngxJliSGTTyZzTiGidd9jyzpgZOskOd14X1g
	 RsWX+jRkJXkQXTcPdZpK1YXzqklzIBXOuEYb0AbCkvsNf+KksxsobnCLpsLMJhDf6m
	 zrcNcrPKbwG0Q==
Date: Tue, 30 Apr 2024 23:46:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8QM/NXLseGhLxhjD"
Content-Disposition: inline
In-Reply-To: <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
X-Cookie: lisp, v.:
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--8QM/NXLseGhLxhjD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:

> first of all thanks for all of this work and I am very sorry for only
> emerging this late into the series, I sadly didn't notice it earlier.

It might be worth checking out the discussion on earlier versions...

> 1. The biggest objection is, that the Linux Kernel has a subsystem
> specifically targeted for audio devices, adding support for these
> devices in another subsystem are counterproductive as they work around
> the shortcomings of the audio subsystem while forcing support for a
> device into a subsystem that was never designed for such devices.
> Instead, the audio subsystem has to be adjusted to be able to support
> all of the required workflows, otherwise, the next audio driver with
> similar requirements will have to move to the media subsystem as well,
> the audio subsystem would then never experience the required change and
> soon we would have two audio subsystems.

The discussion around this originally was that all the audio APIs are
very much centered around real time operations rather than completely
async memory to memory operations and that it's not clear that it's
worth reinventing the wheel simply for the sake of having things in
ALSA when that's already pretty idiomatic for the media subsystem.  It
wasn't the memory to memory bit per se, it was the disconnection from
any timing.

> So instead of hammering a driver into the wrong destination, I would
> suggest bundling our forces and implementing a general memory-to-memory
> framework that both the media and the audio subsystem can use, that
> addresses the current shortcomings of the implementation and allows you
> to upload the driver where it is supposed to be.

That doesn't sound like an immediate solution to maintainer overload
issues...  if something like this is going to happen the DRM solution
does seem more general but I'm not sure the amount of stop energy is
proportionate.

--8QM/NXLseGhLxhjD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYxBCsACgkQJNaLcl1U
h9Cv4gf/cXnSe2CcRqekxdvf3QpCLrReELvBj5Ryx0es6jh5p0iXtGjTAa+m1l2U
Qn6JhhdVxr6YDApk3yXTkGvTElhB2RPjdxhHGklWqfXFTwKhZtFYKmx2GqfKxLXZ
6N4OhJv/OYSeLGuGQDh3WLEJW44PKKQUfDg6zdCCu2xeTqt42IeZOPA4NLU9lBvm
6vzvRoB9ddXzdqIJ5tPx89c3PXrCKBHhFIz9FQ1QLpE9p/26fkpsjYkB9cTQhAGq
kMvWcqfITh7e8JEEPsVzlYMNOcsCCegJqJwniSw2OV3fQDBUDoHaO/I1hYidAzVS
IndFbuEtQpfHjpRlfXAsGrrxDysAfw==
=/WXD
-----END PGP SIGNATURE-----

--8QM/NXLseGhLxhjD--
