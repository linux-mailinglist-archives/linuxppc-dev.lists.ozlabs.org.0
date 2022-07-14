Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E457570F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 23:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkSXS6Zbjz3c9p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 07:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkSX22Sb6z3bZP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 07:37:51 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oC6WW-0007X2-CX; Thu, 14 Jul 2022 23:37:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oC6WS-000zJB-6a; Thu, 14 Jul 2022 23:37:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oC6WR-005DiY-Af; Thu, 14 Jul 2022 23:37:23 +0200
Date: Thu, 14 Jul 2022 23:37:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Anatolij Gustschin <agust@denx.de>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/52xx: Mark gpt driver as not removable
Message-ID: <20220714213720.w7jj3cb64ei3iuoa@pengutronix.de>
References: <20220612213400.159257-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z3z6jpv7vkan36ns"
Content-Disposition: inline
In-Reply-To: <20220612213400.159257-1-u.kleine-koenig@pengutronix.de>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--z3z6jpv7vkan36ns
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hello,

On Sun, Jun 12, 2022 at 11:34:00PM +0200, Uwe Kleine-K=F6nig wrote:
> Returning an error code (here -EBUSY) from a remove callback doesn't
> prevent the driver from being unloaded. The only effect is that an error
> message is emitted and the driver is removed anyhow.
>=20
> So instead drop the remove function (which is equivalent to returning zer=
o)
> and set the suppress_bind_attrs property to make it impossible to unload
> the driver via sysfs.
>=20
> This is a preparation for making platform remove callbacks return void.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This patch recived a (positive) review, but it's not included in next
nor got it any maintainer feedback. Did it fell through the cracks?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--z3z6jpv7vkan36ns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLQjI0ACgkQwfwUeK3K
7Ak6vwf+M7X8WGeKrZV64VVFXT/K/t9jbKfr3wQxUFASfbbcupt+xvuUbQOBrE47
hToH14tJfNs37E1e7cyiJplZYAGexBPV91fJLP0/KzduvZCtBAFKtc/fwvozOax3
6CZ7Y+YKSV7m7QvkRvbwpUqk5efnyz4pyFBRAu5iqT7WTdQPEjPhp87meDP3LA9R
mV438jK6Xe5paXpwDEFmUJwW3rviQuYYxL8AxP31BijiUnr4tQoKd4lLYX1fxA+e
2m8aQsmY+BnE8PQ5HV+Rrjx2omva7l/0w2bKPYnn9Y0b5RJpRkhcVe73l4+s+z9e
Df5MDmbfDJLaw0Ai22eJRyS58CAN6g==
=X+tq
-----END PGP SIGNATURE-----

--z3z6jpv7vkan36ns--
