Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AEC7E9992
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 10:58:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STPy53Ycgz3dBb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 20:58:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STPxY48VNz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 20:57:50 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r2ThD-0002FP-LY; Mon, 13 Nov 2023 10:57:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r2ThC-008her-Uf; Mon, 13 Nov 2023 10:57:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r2ThC-000e8G-LG; Mon, 13 Nov 2023 10:57:30 +0100
Date: Mon, 13 Nov 2023 10:57:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] tty: hvc: Make hvc_remove() return no value
Message-ID: <20231113095730.uein5ix7eduqvboq@pengutronix.de>
References: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
 <20231105214406.3765906-5-u.kleine-koenig@pengutronix.de>
 <CWXL68T68A18.BZ8WHB15ZU2Y@wheely>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e57ttq5xm22amhut"
Content-Disposition: inline
In-Reply-To: <CWXL68T68A18.BZ8WHB15ZU2Y@wheely>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--e57ttq5xm22amhut
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 07:45:27PM +1000, Nicholas Piggin wrote:
> On Mon Nov 6, 2023 at 7:44 AM AEST, Uwe Kleine-K=F6nig wrote:
> > The function hvc_remove() returns zero unconditionally. Make it return
> > void instead to make it obvious that the caller doesn't need to do any
> > error handling. Accordingly drop the error handling from
> > hvc_opal_remove().
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> IIUC these are functionally no change, just tidying and removing
> dead code?

In case this isn't only a rethorical question: There is indeed no
change in behaviour. hvc_remove() returned always zero, so

	rc =3D hvc_remove(hp);
	if (rc =3D=3D 0) {
		... some code not changing rc ...
	}
	... some more code not changing rc ...
	return rc

can be simplified to

	hvc_remove(hp);
	... some code not changing rc ...
	... some more code not changing rc ...
	return 0;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--e57ttq5xm22amhut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVR8wkACgkQj4D7WH0S
/k6j1AgAiALJm4H/iiU3yfW9SEfUmYZS+axaeMjy9V8y2YO/HhvKYOaoAHaAOv0p
8rbM2Dls5ordKi6T97/J1vsOayAFKcFO83pGG/kHUL2DBez1vWrN+Qx/v9FdPx5F
aEUjNvhVqV7ZLD9KzAMJ5j4378sdFkaeRpPdgrkJiWz3JOFbavSMb55DXX0XUWcU
cAz3aPrM/pbUzehaKzKGPyBwhwa4bvkYR77CVAAlmhCt682rftVYTZhKYGMyN9vX
iJVaXIK+lRW9F34zWi+OHBAtXknjAoOpCOKC7azxgpnwD52NI7AzxXNxcb+8vnoE
KduZ2Imc7+bzLOePlVNKIZGu+SoFeg==
=SkF9
-----END PGP SIGNATURE-----

--e57ttq5xm22amhut--
