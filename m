Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD5155F8C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXtHh6ZRFz3by6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 17:24:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXtHF3mqRz3bw4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 17:23:36 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6S2d-0005UO-4V; Wed, 29 Jun 2022 09:23:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6S2S-003M3c-Vk; Wed, 29 Jun 2022 09:23:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6S2V-001qeU-Nu; Wed, 29 Jun 2022 09:23:07 +0200
Date: Wed, 29 Jun 2022 09:23:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3yzpq2rgg2xm7tqn"
Content-Disposition: inline
In-Reply-To: <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
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
Cc: linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev, kasan-dev@googlegroups.com, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, Support Opensource <support.opensource@diasemi.com>, netdev@vger.kernel.org, Wolfram Sang <wsa@kerne
 l.org>, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--3yzpq2rgg2xm7tqn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[I dropped nearly all individuals from the Cc: list because various
bounces reported to be unhappy about the long (logical) line.]

On Wed, Jun 29, 2022 at 03:03:54PM +0800, Jeremy Kerr wrote:
> Looks good - just one minor change for the mctp-i2c driver, but only
> worthwhile if you end up re-rolling this series for other reasons:
>=20
> > -static int mctp_i2c_remove(struct i2c_client *client)
> > +static void mctp_i2c_remove(struct i2c_client *client)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0struct mctp_i2c_client *mcli =3D i2c_get_client=
data(client);
> > =A0=A0=A0=A0=A0=A0=A0=A0struct mctp_i2c_dev *midev =3D NULL, *tmp =3D N=
ULL;
> > @@ -1000,7 +1000,6 @@ static int mctp_i2c_remove(struct i2c_client *cli=
ent)
> > =A0=A0=A0=A0=A0=A0=A0=A0mctp_i2c_free_client(mcli);
> > =A0=A0=A0=A0=A0=A0=A0=A0mutex_unlock(&driver_clients_lock);
> > =A0=A0=A0=A0=A0=A0=A0=A0/* Callers ignore return code */
> > -=A0=A0=A0=A0=A0=A0=A0return 0;
> > =A0}
>=20
> The comment there no longer makes much sense, I'd suggest removing that
> too.

Yeah, that was already pointed out to me in a private reply. It's
already fixed in

	https://git.pengutronix.de/cgit/ukl/linux/log/?h=3Di2c-remove-void

> Either way:
>=20
> Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Added to my tree, too.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3yzpq2rgg2xm7tqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK7/dUACgkQwfwUeK3K
7AnTJgf9GW2H7fk9/Je11PRlCnUOSZ1sz/49RHAm4xj66pI/hdRP++D8L5o7ntEU
Hl5hKosR36cUyX12ie+YQtiCRkjhLqUoJnPzJOtcXQNV7mlMt6ds2INSO4iHYtMa
b2UH+lLQ6K/DO0+1KquElKJhfBOKucYY1WQAVK4cfasBKMR4MtukcHAgcYClRYdj
Nvvy6bCjqr8M1+uqDTJUUR/d0rWYHxFKygYRUfK7YPpz57gaVgaR9Js9GDGkVFB4
qVL5x23NzgB/Djr1Ls1F6Z5eFMjbtVb+S1HDRsU+HJOYD6v1LkT2OFx9iFpme+8m
+4HHNR5pxKogz59u4YpP1pIb0MejhA==
=ibah
-----END PGP SIGNATURE-----

--3yzpq2rgg2xm7tqn--
