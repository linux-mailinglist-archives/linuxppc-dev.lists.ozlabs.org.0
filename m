Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C137F9E65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 12:19:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf3506pW0z3cbC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 22:19:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf33X0GtPz3cRs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 22:17:57 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7ZcT-0000NU-Id; Mon, 27 Nov 2023 12:17:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7ZcS-00BvgE-8m; Mon, 27 Nov 2023 12:17:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7ZcR-009IZy-Vj; Mon, 27 Nov 2023 12:17:39 +0100
Date: Mon, 27 Nov 2023 12:17:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the tty tree with the powerpc tree
Message-ID: <20231127111739.ryvlgofx3b65z2hf@pengutronix.de>
References: <20231127114904.77f7efb6@canb.auug.org.au>
 <877cm34g0l.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4eyf7rezxjwurju5"
Content-Disposition: inline
In-Reply-To: <877cm34g0l.fsf@mail.lhotse>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Greg KH <greg@kroah.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--4eyf7rezxjwurju5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Nov 27, 2023 at 10:00:58PM +1100, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the tty tree got a conflict in:
> >
> >   drivers/tty/hvc/hvc_console.h
> >
> > between commit:
> >
> >   c9e38dc90e1c ("tty: hvc: Make hvc_remove() return no value")
> >
> > from the powerpc tree and commit:
> >
> >   7f30c19caf94 ("tty: hvc: Make hvc_remove() return no value")
> >
> > from the tty tree.
> >
> > These are slightly different versions of the same patch.
>=20
> I'll drop it from my tree.

FTR: Regarding the slightly difference: The variant in the tty tree is
the better one. So nothing to do for Greg (or me) here.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4eyf7rezxjwurju5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVketMACgkQj4D7WH0S
/k6xOgf+NZ2fNHlxIPkzzXeqRV8tvyXxa1uBM2gugQRm+9VBIvNM9m/ywtsM3GKZ
OVSkXb4mWIp1QXXJodmlPBnAyv4+J568aKjSlAAZw3gxzNDJ4pLBTGCJo9L+U3WO
YThzKymrcwwsb9z/L7oL4IiH64KGtQj7uZ6rsuJZFT2zaBJRZJo+Q1VahvQHtakZ
aNo5NRhg2swXKhoAv0LDbxFY6ZmQVxKI6PmoLwzK0f8l8+SeE9fYtxr22minkWDA
48kV91gH/vgx9YjP8MJ1HzRxTssmvkUj6mHwBjz1Vxpd3GuCTK6sm1+Bmf8xnDof
bM0LSRRDZyR47GrqhtUchIMD0mEsTw==
=8Vol
-----END PGP SIGNATURE-----

--4eyf7rezxjwurju5--
