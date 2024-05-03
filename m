Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544C8BA515
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 03:48:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=huJ8dvqB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVtx335fWz3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 11:48:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=huJ8dvqB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVtwH1MWfz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 11:47:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 195B961BF3;
	Fri,  3 May 2024 01:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB22C113CC;
	Fri,  3 May 2024 01:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714700842;
	bh=jnztmxuaRUJ/EUjiAcJ6LSXXmWw6auqF5LGM5XsjF8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huJ8dvqB+TN/5IgJ6rtnCXfVgXOlZfAdZYA/7vs7YuLO962TFb+avL/V+5+Rni204
	 u9/f/fRre6WsTm1XAt3biIJ7MtrAkKMlIcdBiezfCUBrbLhc4GQOvDOFdoMrywy15G
	 HVDUuTPVvWfCo/LWmMR/YAYd76bJuAAZMqubdIdTqLpUHdoyUTiJr/OhqWHi1DQwX/
	 TTfuZAYA+OBxUo5XMadmDCz6i1lMZq0CwsUh/khAN9yCvtk9LCjCamRsZktG50n/EX
	 TDY9n+egIwFoWC/EpRvSADEFoGvRx918hONbY9legxC9/dh+ROPGl1a4VHgQWky9Ab
	 R0tQiZIJgiz0A==
Date: Fri, 3 May 2024 10:47:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YhSjxC/xCHptpvaf"
Content-Disposition: inline
In-Reply-To: <20240502102643.4ee7f6c2@sal.lan>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--YhSjxC/xCHptpvaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> > There are still time control associated with it, as audio and video
> > needs to be in sync. This is done by controlling the buffers size=20
> > and could be fine-tuned by checking when the buffer transfer is done.

=2E..

> Just complementing: on media, we do this per video buffer (or
> per half video buffer). A typical use case on cameras is to have
> buffers transferred 30 times per second, if the video was streamed=20
> at 30 frames per second.=20

IIRC some big use case for this hardware was transcoding so there was a
desire to just go at whatever rate the hardware could support as there
is no interactive user consuming the output as it is generated.

> I would assume that, on an audio/video stream, the audio data
> transfer will be programmed to also happen on a regular interval.

With audio the API is very much "wake userspace every Xms".

--YhSjxC/xCHptpvaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY0QicACgkQJNaLcl1U
h9DEDgf+OxkntU8LcfqnvW2Z51UqNQJ0p62Te/DmJ+wZWQotYcbwAQdb4fMKfeyw
TU+Kka5bvWBtYfhoCnXFlDqQUh4Ldk7wZEWfHS2KCCM+o3mr/WHvxCRqSvy2geXZ
+76U6qA5/RPQnAFUlNe9Kp4LK4LpvGg9KONljKpsIdFBEDvJG84wr+zLwDuboy4O
rVP1hJQmucWST9qsBWFT+7VmJt9tbK2I3iwIB2Z3utiJvBFvyyj8bVMx5I1ssxfj
Rh5yL+iQ+aEQkTwEBTzuAS055XYNxzl/eBa25iRWCgoYOrMiphGpWBDWp5qUoPiB
SWVL9dU2q9I5o4Y+GNohSdEw9Rctfw==
=OLs5
-----END PGP SIGNATURE-----

--YhSjxC/xCHptpvaf--
