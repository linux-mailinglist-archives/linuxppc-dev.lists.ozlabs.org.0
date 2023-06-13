Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F371F72DAB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 09:21:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgKk86rRWz30XP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 17:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 416 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 17:21:25 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgKjd1RX1z30Dm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 17:21:24 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8yKi-0008JZ-2f; Tue, 13 Jun 2023 09:20:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8yKc-0074SF-7G; Tue, 13 Jun 2023 09:20:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8yKb-00DnMo-Ex; Tue, 13 Jun 2023 09:20:45 +0200
Date: Tue, 13 Jun 2023 09:20:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] macintosh: Switch i2c drivers back to use .probe()
Message-ID: <20230613072044.gqyzostj4yu6yxo4@pengutronix.de>
References: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ay2stk2d4e4ube37"
Content-Disposition: inline
In-Reply-To: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Corey Minyard <cminyard@mvista.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ajay Gupta <ajayg@nvidia.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Liang He <windhl@126.com>, Jean Delvare <jdelvare@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Adrien Grassein <adrien.grassein@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Colin Leroy <colin@colino.net>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Petr Machata <petrm@nvidia.com>, Maximilian Luz <luzmaximilian@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ay2stk2d4e4ube37
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 23, 2023 at 09:50:53PM +0200, Uwe Kleine-K=F6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this patch was generated using coccinelle, but I aligned the result to
> the per-file indention.
>=20
> I chose to convert all drivers below drivers/macintosh in a single
> patch, but if you prefer I can split by driver.
>=20
> v6.4-rc1 was taken as a base, as there are no commits in next touching
> drivers/macintosh I don't expect problems when applying this patch. If
> conflicts arise until this is applied, feel free to just drop the files
> with conflicts from this patch. I'll care about the fallout later then.
>=20
> Also note there is no coordination necessary with the i2c tree. Dropping
> .probe_new() will happen only when all (or most) drivers are converted,
> which will happen after v6.5-rc1 for sure.

Can someone still pick up this patch for v6.5-rc1? I intend to send a
pull request to Wolfram's i2c-tree that drops .probe_new() from struct
i2c_driver on top of v6.5-rc1 early after the merge window closes. So
getting this in before would be great. Otherwise I'm happily adding
received acks to this patch for my PR :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ay2stk2d4e4ube37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSIGMwACgkQj4D7WH0S
/k7Y8ggAgl0jEeX+7Kh5IzQx45yVpOWnCRg17HyU/cOUPH0MdY4lvJhnpCJ8XQGC
Vtoeuumt3DoAjywr5jaE3Xd4PPUVZqQmq5zRXyUpSl9XUH9SvdDE9apb0b+wkQPr
HeL0PnxHh+2QrjcbL6WGohHvwJPWHSAhPuS9sF6iqfpL3iOZZWCA6ogVpvmErcpa
sa2PIoDLMnGFUETwktVDVvl26Y2BFkgPvthkwk8YDkoZVF/mpevIOnnl1eFUOlAu
56Rt5czDw5orpzoYEObIZ83JIld/Aa9mzOxN332aB2Aa9U8+9xBBtHD5f9Z+9zOE
I5pyWnOWG3BasrGd4OdxRSnUMxKXCQ==
=KEwM
-----END PGP SIGNATURE-----

--ay2stk2d4e4ube37--
