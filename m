Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7189568383
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 11:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdDpQ6Mb6z3c9K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 19:32:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdDp03PG9z2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 19:31:51 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o91Nj-0005lo-Ss; Wed, 06 Jul 2022 11:31:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o91Na-004jSK-Sg; Wed, 06 Jul 2022 11:31:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o91Nd-003KbY-Gm; Wed, 06 Jul 2022 11:31:33 +0200
Date: Wed, 6 Jul 2022 11:31:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220706093130.cet7y7upl76rp6ug@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <20220706091315.p5k2jck3rmyjhvqw@skbuf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yp3ilhvx53xygi7l"
Content-Disposition: inline
In-Reply-To: <20220706091315.p5k2jck3rmyjhvqw@skbuf>
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev, kasan-dev@googlegroups.com, linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, patches@opensource.cirrus.co
 m, linux-usb@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org, netdev@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--yp3ilhvx53xygi7l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 12:13:15PM +0300, Vladimir Oltean wrote:
> On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >=20
> > The value returned by an i2c driver's remove function is mostly ignored.
> > (Only an error message is printed if the value is non-zero that the
> > error is ignored.)
> >=20
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour, all callbacks were prepared to
> > return 0 before.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>=20
> Assuming you remove the spurious kasan change:

It's already gone in my tree, see
https://git.pengutronix.de/cgit/ukl/linux/commit/?h=3Di2c-remove-void

> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yp3ilhvx53xygi7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLFVmcACgkQwfwUeK3K
7AkOwAgAkt7aZ38n1lpOoBzXslSDQyp/lKc47Ehs+a1LTESfOP6+4frSHSJhaIMw
WX2bIAZO2kfHd2GJJ1+miP0YO3eys+YJus7vlVp9LsZCtTrR7uUlJ9PhG4eVmYxD
ZPZMbP533Mkp9Tj201PJRSbnOlhRhKnwpl4kQfj9nXD478yP1zbT/7CDh4Im1isE
dOUnNdPTAnT17u0fIRREu6TIC/hKy5Lh772ukCBsHwkBWQD4WTtLmdL1uZrspPa3
fKxI4tIGoKufFCNMNNzK8li/dghhpkn4uy8iNwyjkkmjfCXAkNdwNJiCDlo6qPwb
idJ3DvpJEEx44L8KdcjzBYUHdSNUkQ==
=ZnQL
-----END PGP SIGNATURE-----

--yp3ilhvx53xygi7l--
