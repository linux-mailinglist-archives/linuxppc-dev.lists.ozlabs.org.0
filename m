Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F874250C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 13:39:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jWkoWDbB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsGhS5SnSz3bXl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 21:39:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jWkoWDbB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsGgb3k7pz303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 21:39:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66A3A61464;
	Thu, 29 Jun 2023 11:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD05BC433C9;
	Thu, 29 Jun 2023 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688038743;
	bh=ZC+wZcsNqTKU5rNSzVYdvo0zLQKLbGqao3ypI8BdBE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWkoWDbBBcpFOLjtTNnyd7FR1EivjbdWs6gBTaqni4KaZqF/ruLkyUVmsD7MpURYP
	 rXIN6812xuvPL8rk0LvfkXPuPpUz1hQpXTXa4FmQwwGc4RRFqK4mmMMTzeIArd67oU
	 QZcm5IUq/AQMmKyNc3fMndC2bFEoYx2awCnLw3/Ev1c/+YT6650iKtBTNj/dBdVdve
	 X+Ud11/lJBD+QtlrGrRW9J3zz5XHuwXazBHkZmMxBt9V+251CtV1rkc5Im8D16te6T
	 F05OsCRJG8fdaGAvxfw/oT3wVHmryquRfhTQ94WLRfDU/zi2YD5TLF+jkUPnjwvNgW
	 RVeTq7plHPfAw==
Date: Thu, 29 Jun 2023 12:38:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 4/6] ASoC: fsl_asrc: Add memory to memory driver
Message-ID: <f6598cb0-6773-4475-85e1-5dfacaa16de3@sirena.org.uk>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FP1aqfO0iq4vQLEp"
Content-Disposition: inline
In-Reply-To: <1688002673-28493-5-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Surprise due today.  Also the rent.
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-media@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--FP1aqfO0iq4vQLEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 09:37:51AM +0800, Shengjiu Wang wrote:
> Implement the ASRC memory to memory function using
> the v4l2 framework, user can use this function with
> v4l2 ioctl interface.
>=20
> User send the output and capture buffer to driver and
> driver store the converted data to the capture buffer.
>=20
> This feature can be shared by ASRC and EASRC drivers
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/Kconfig        |  13 +
>  sound/soc/fsl/Makefile       |   2 +
>  sound/soc/fsl/fsl_asrc_m2m.c | 878 +++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_asrc_m2m.h |  48 ++

This feels like the bit where we interface v4l to ASoC should be a
separate library, there shouldn't be anything device specific about
getting an audio stream into a block of memory.  I'm thinking something
like the way we handle dmaengine here.

I've not dug into the code yet though.

--FP1aqfO0iq4vQLEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdbVEACgkQJNaLcl1U
h9DmOgf/eCvmgKO/us13curwY8vW24n389PS/2sTaVssYszEQB7BvNfQV5atoKU8
Ba6RqJPl8PRNwurpLqyF4NLOA0EOlv8h0P3cCC/XZ6ticWK2lAy80EmU5XUgR742
FCzts7URNns+y3cZAepJ7a38vxNUQLJh/tbkB5aJGXr9X30sntOepWDMnUgoW4KB
UzzayZWUilTjl2LYkvbiIEf8MfC7VcptLU2Y7DevFjMm27aRoV2yBreIhEbrexsW
ngXnBwKOoR7SCgS68ZtsyD/RzZIeVx+mZI2/I9P0EiGXjcJnBcJAVlehJp+Wrhgl
0IHUq6WGmLFkATfM0fclKq7dykS7UA==
=K8a/
-----END PGP SIGNATURE-----

--FP1aqfO0iq4vQLEp--
