Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE836D22BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 16:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp2rD4fJNz3fV6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 01:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NLWYgNUG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NLWYgNUG;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp2qL0kMWz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 01:34:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8BDD9B82FEB;
	Fri, 31 Mar 2023 14:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA755C433EF;
	Fri, 31 Mar 2023 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680273257;
	bh=X4+QCHiBy7gZhN6kPilGhg9+VcjqlpmTmtX0Ri7Pe7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLWYgNUG4DD6rCvFj5OkS8rBidfOjP9Zn2NXjH8eeWWFZ+T63s6bPjb04PsSwe0Xe
	 ZEHvLmdCjCSXvcHQL1O+h2rhbZBikgygkkd9j31aV2dU3LvUWegcB1dXwT7rAAceUc
	 /TvHmIR1TKcZjAGyoOZ/uopLykYdb5PK1xJrGzqojYT2sV8dOOb0ZUPrFNEMz6to3J
	 UxLWGERQ1unxFQWdCJxBCAMO3PjFfIlBD6eukAvouUOuTAceqrlvO/5/GtsV+fMnUi
	 tDtKKT/0RyCGx3ZnIWGAnqZc+sG+31VU29QLsvRqIv7Exeq5DcXy9aqbZazdofMFMd
	 kKbtmiypJ7rGg==
Date: Fri, 31 Mar 2023 15:34:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Subject: Re: [PATCH] ASoC: fsl_sai: Use physical format width
Message-ID: <ZCbvZVV4+Ent9Dsx@sirena.org.uk>
References: <CAA+D8AOMTQ00Ah21w54DVXin3KcYkVxaGVd64Z_pSzv+Ooj9vw@mail.gmail.com>
 <20230331142537.1399524-1-emas@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YXpDZxuoKdcGqtRv"
Content-Disposition: inline
In-Reply-To: <20230331142537.1399524-1-emas@bang-olufsen.dk>
X-Cookie: Single tasking: Just Say No.
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--YXpDZxuoKdcGqtRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 31, 2023 at 02:26:33PM +0000, Emil Abildgaard Svendsen wrote:
> On 3/31/23 04:55, Shengjiu Wang wrote:

> > There are different requirements for this slot width. Some need physical
> > width,
> > Some need format width. We need to be careful about change here.

> I might be wrong but shouldn't physical width always correspond to what
> can be physically measured. If you need the slot width, the same as
> format width you use a format with matching widths like
> SNDRV_PCM_FORMAT_S24_3LE?

The point is more that things are likely to be relying on the
current behaviour, for example CODECs that don't actually support
24 bit audio due to a power of two requirement but cope fine when
you play 24 bit audio in a 32 bit timeslot.  This creates issues
changing things even if the new behaviour is in some sense
better.  This is one of the unfortunate consequences of DT.

--YXpDZxuoKdcGqtRv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQm72EACgkQJNaLcl1U
h9BzJQf8Dun08ytWS8qbZ5qM5+dIIh0MDYQJEJMFiye8wSFAec33HuDII5g7mA/3
pBOq7ZEY9h7trz8dmjVldFrU7x6UQ/A1SO5muAPkVD2qlsw+ETFNQpn4mTQatlJ/
gJOxxrz0FVC36wWmZ2Fl9fUR2mxQwt3E3RB5jPZ4GrghWBwx6TpCeHXYtPrfZOrd
CyvduM4Z9YSbpB/eT8Xuo10QxQzCOXxH/KJwpvDJ2de8YPoKzCKLbMJ6BhDvuyB9
XS1/u90Iw5KvmnTtlpeo3iN2HDPhCXQtRuycCW6ub5XZ2xMnnA+kddHCql3QQd0m
OhZNTA2Mk4ekYhpAs/Cb1wDhcl51YQ==
=60DW
-----END PGP SIGNATURE-----

--YXpDZxuoKdcGqtRv--
