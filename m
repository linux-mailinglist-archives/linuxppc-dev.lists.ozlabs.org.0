Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CC476F1C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 20:23:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m6aJL/mR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGxzq2Wzzz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 04:23:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m6aJL/mR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGxyq28Szz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 04:22:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5ABD261D61;
	Thu,  3 Aug 2023 18:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94685C433C7;
	Thu,  3 Aug 2023 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691086943;
	bh=rYzPPj1pajmgQ2TmW2GpIgJRYwl2kR2mxM9iWu7OYjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6aJL/mRpVeQmNONdk7XxK2AOhD3aqkWHWLT9qV9Ktw2/Dt/gpNObxCUZ9JYjZYpw
	 gP9Kt3vD0bkHcpyKO+CEM1X83XC5marYngM7sWTtf23hVjmsKZQIQ3tHvXv00g7f0Y
	 RQqt5TvhRGAyGY51SzwYWWEKUYWpnAEyZ/96SIb1BYipcXpWbV86/dQJw4+hQnTDsP
	 NMGDEZwSdI12lx6uDzVl8h5Ai4O3iqdN3NqTIgp8RAS+LyTggF9ihk/SBBgTNOePls
	 Bd+/EEbK2FMcxSMzxYPL3TNaIxVyLhvq2G96s0w6ZF+or2qQRIn+FjJXyVz83Je+VX
	 OdxN8LqfnCGAw==
Date: Thu, 3 Aug 2023 19:22:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 RESEND*3] ASoC: fsl MPC52xx drivers require
 PPC_BESTCOMM
Message-ID: <4be1bfef-9f66-4fa8-bb8b-57e25fbba729@sirena.org.uk>
References: <20230803025941.24157-1-rdunlap@infradead.org>
 <9581313f-5340-455d-a75d-dc27d2eb3ec0@sirena.org.uk>
 <63bc327d-999a-1654-e7b5-6bcfd7477a32@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g3EJGwd85dmsC6Ch"
Content-Disposition: inline
In-Reply-To: <63bc327d-999a-1654-e7b5-6bcfd7477a32@infradead.org>
X-Cookie: One Bell System - it works.
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--g3EJGwd85dmsC6Ch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 11:09:43AM -0700, Randy Dunlap wrote:
> On 8/3/23 04:27, Mark Brown wrote:
> > On Wed, Aug 02, 2023 at 07:59:41PM -0700, Randy Dunlap wrote:

> >> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
> >> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
> >> so the 2 former symbols should also depend on PPC_BESTCOMM since
> >> "select" does not follow any dependency chains.

> > Take a hint, it's not clear that the patch is tasteful.

> Thank you for replying.  I'll drop it and just report the build errors.

To be clear I generally don't give you review comments because in the
past I grew so frustrated with having them and their escalations
ignored that it seemed better to just not start.  If the patch seems
fine I generally apply it, usually you just don't resend patches so that
works.=20

--g3EJGwd85dmsC6Ch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTL8FkACgkQJNaLcl1U
h9A2ZAf/cC6V/6CosGIVhHjsgdpesC1xuhx10tq2L5C4HOOufOJXJ7KEEw9YRJl7
NbAWAp2aavscsub/zcP3OzBDFZ9vDRcYDniGIOdt9rv+JGtURTv8aFrbQdBFAAWR
KXfprV0EWwi45+heZNxo6a53tlFYu7Q0h5mVaI7O0R6wbMRr3z92A3BaCH1Eq3/8
6QZkJal7oeNWoHVHwUGSMb3PoqbRVadxYEWudjYGsAVhJ0IdHWyh1G6cx69iIOMz
DCVffJQOXcvvtkmc+oYvd2zfYT2sDSMcpRVBptb/2Dsy9gaaN3CwG9E/Agu4Li5L
WgG5XZBI+Jy/KxTlgICIsEVFG2bjvA==
=Nre9
-----END PGP SIGNATURE-----

--g3EJGwd85dmsC6Ch--
