Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 947568B8418
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 03:57:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eSStSS/N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTgDN1Yqqz3d9g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 11:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eSStSS/N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTgCb441Mz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 11:56:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1256361774;
	Wed,  1 May 2024 01:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD2CC2BBFC;
	Wed,  1 May 2024 01:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714528582;
	bh=YHqNQfR2KzM3NdArIJMkOcJO9cdsTJsp3u0H/eNeyPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSStSS/NICuFDdVh5b39LHmEYgRreHSqX8JHJYP/UBw7rK3B6MK/2TPkLre3fEHfu
	 tLQSNFeTvzu8j1h0d6CBrA6ZFZMH3z2AqRFdPJEalH2PHrSs64AmD3NPhOS1Zu/gcU
	 HBi44k60jAkcvP6MHmgniiYlLG1si5ZshpPh2azKd+8WEGrcyGtwLePwl5zYB49WIb
	 HeXw89okgcX3KnOeSqGEm1czuK2mdFp6t7IAES7cHMxRHuod9ZJHIPg+5YSCtAk+z1
	 bA9hZY9fouyoWtbyyiNt3kCY2+xGK03foFE7ETcr+bHYdSRxqXWF7BkBDziHtta/hE
	 Vmr6/qX+g7Fkg==
Date: Wed, 1 May 2024 10:56:15 +0900
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1s5XZL2PHP3gK0J2"
Content-Disposition: inline
In-Reply-To: <20240430172752.20ffcd56@sal.lan>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--1s5XZL2PHP3gK0J2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 05:27:52PM +0100, Mauro Carvalho Chehab wrote:
> Mark Brown <broonie@kernel.org> escreveu:
> > On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:

> > The discussion around this originally was that all the audio APIs are
> > very much centered around real time operations rather than completely

> The media subsystem is also centered around real time. Without real
> time, you can't have a decent video conference system. Having
> mem2mem transfers actually help reducing real time delays, as it=20
> avoids extra latency due to CPU congestion and/or data transfers
> from/to userspace.

Real time means strongly tied to wall clock times rather than fast - the
issue was that all the ALSA APIs are based around pushing data through
the system based on a clock.

> > That doesn't sound like an immediate solution to maintainer overload
> > issues...  if something like this is going to happen the DRM solution
> > does seem more general but I'm not sure the amount of stop energy is
> > proportionate.

> I don't think maintainer overload is the issue here. The main
> point is to avoid a fork at the audio uAPI, plus the burden
> of re-inventing the wheel with new codes for audio formats,
> new documentation for them, etc.

I thought that discussion had been had already at one of the earlier
versions?  TBH I've not really been paying attention to this since the
very early versions where I raised some similar "why is this in media"
points and I thought everyone had decided that this did actually make
sense.

--1s5XZL2PHP3gK0J2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYxoT4ACgkQJNaLcl1U
h9Cdygf/bf6TAsptAknaEPQAw2Z5iLipMaPxhatnFylMl5K5iu0XYqQKgMjz9hzh
pGWiv30tMEb1WWSd01RSGVLhVOz6Q/BoFOLmnu8iqikc/Y9AXuMpznA5kR9n+frq
Vlmf+jK0/Yx/co+47MPq9h7wsuCHeavsUyinC7Iw+M5MkxLXy4ga/C/0tl2tDANc
Ev6nkmUcjKAhI2O6zqwyxvO+0fagaQevxsYwhxJGbcqNcXzaa+OYshVVq8y00ugk
paLFfitKTRz1J3qN5WfkELm40cyRulKxZIdJAQIO0VFwzCIWOdty1FYDs5GXlL0f
Ys8S/0aZLJEVbPqQA1tZML2Y+D99YQ==
=NaHt
-----END PGP SIGNATURE-----

--1s5XZL2PHP3gK0J2--
