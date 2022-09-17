Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A505BB9F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 20:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVKTl6y3qz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 04:39:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bWPgpXH2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bWPgpXH2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVKT26kSfz2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Sep 2022 04:38:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2CEC60F2C;
	Sat, 17 Sep 2022 18:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1FAC433C1;
	Sat, 17 Sep 2022 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663439907;
	bh=orDfa+B9JbzOBv3oHFxpWw2pTtMwJiSiFnhb0zIelIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWPgpXH2EfNmJAt9irEt6mMiu8rdPEEs75c+wPlITchd3iFLGInxgMGaTxdf3Wzgk
	 MALVKJyaoofxOd2lzAyEnm5kmBm5Zs5gt/+C6q9K7ypbgfP3A0RvPaPurldmDld94V
	 uJ78Vjl0wKey+LZPBszY9Cn4hyM8/JqgBJEIRYBq45AjNd8ybdUshfTNvaLHQU72U1
	 WcD+G7xXd3bxHUAKZ6FJCTdImIyznK323gu31h3eDYE8uynGsYmyckBK3cKW7K10Y4
	 kq9S50tns/Fnn8+devUaQNHu+fCx0Bc6A4/O3ra52WAmteWJbOOHGOTq0eNnH8MCF9
	 gqHWY+b82lvng==
Date: Sat, 17 Sep 2022 20:38:21 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] macintosh/ams: Adapt declaration of ams_i2c_remove() to
 earlier change
Message-ID: <YyYUHQIgtafF5vv/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de, kernel test robot <lkp@intel.com>
References: <20220916090802.261279-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YBVzTQCPI4Hj0brB"
Content-Disposition: inline
In-Reply-To: <20220916090802.261279-1-u.kleine-koenig@pengutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--YBVzTQCPI4Hj0brB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 11:08:02AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Commit ed5c2f5fd10d ("i2c: Make remove callback return void") changed
> the prototype of ams_i2c_remove() but failed to adapt the declaration.
> Catch up and fix the declaration accordingly.
>=20
> Fixes: ed5c2f5fd10d ("i2c: Make remove callback return void")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--YBVzTQCPI4Hj0brB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmFBkACgkQFA3kzBSg
KbbLPRAAntK/4HoLEXr4XNqDgfqDEyrFpQCvDfAmlYMLd4qVi8TbxxehcKHQQHNP
Ke2l1yqAgeahkAWabCG3ivN5EEutR0S/3RAX8W+HvrdoKbMXsGyqINBBeOLlz6aK
UlnNc92gU8B4mjCRyE18IhxnSQ6TsayQgIXuQpTlTy7McEp1f1R7+vKbLjHV7Dlb
GiJHemC/i4AIItjuTqu16WOfI7jOZRL/jLs5Fh/eNQueqOXaGnivZdSDOOSHja6T
olNBZeyizPuOxA2UO7YFgai1Wy2UsD7e1xeSRbxHohWdoGsZZO6kayWgJJlUckNz
RIMe5/hlrfX7E6eaNv4aa3vxF1skLgEVKAl0Nz4/kpWgGiEge4w1zbnK+o/EHhy8
NJpokSkqwoRAwUClqFpb5sll2wXUI8cZL8eHRwv8NQy9MPks1At7Z3X3kkP5yWZm
qVphvhm4LNqfpNoQgQn8J1DbiL9b8o4myLZltdYzd2PaMwxB9fYcCmHwvt7IZaxQ
xBGNRHnPpYBYlXOZZJVQmiEpriGrfo9IYIqxSXFbTTio8QG6u/K8fIRJR82lUzXB
usUR6ONvD3G8Bst9jwVPDPA+r16aJ/13n06Gqn/0t4qf4MfOkHg7X+D8UimwrFS9
QH+cd26ov2oT6wQOvIN1qcqwfPF3mcQiTizZATprKlUirjJqVNU=
=vcVb
-----END PGP SIGNATURE-----

--YBVzTQCPI4Hj0brB--
