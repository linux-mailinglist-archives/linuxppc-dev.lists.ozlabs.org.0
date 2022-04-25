Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0F50E708
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 19:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnBhf65HCz3bwL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 03:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnBhG5MyVz2ypZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 03:24:14 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj2RK-0007xm-MT; Mon, 25 Apr 2022 19:23:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj2RJ-005BoB-Kh; Mon, 25 Apr 2022 19:23:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj2RH-005ZQu-FS; Mon, 25 Apr 2022 19:23:55 +0200
Date: Mon, 25 Apr 2022 19:23:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] macintosh: macio_asic: fix resource_size.cocci warnings
Message-ID: <20220425172350.fggwi7a76v5d6cbh@pengutronix.de>
References: <20220414140304.82751-1-hanyihao@vivo.com>
 <87zgkd8vnb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y36m4bm5lfadd555"
Content-Disposition: inline
In-Reply-To: <87zgkd8vnb.fsf@mpe.ellerman.id.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
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
Cc: Sven Van Asbroeck <TheSven73@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Yihao Han <hanyihao@vivo.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-kernel@vger.kernel.org,
 kernel@vivo.com, Mark Brown <broonie@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--y36m4bm5lfadd555
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Michael,

On Fri, Apr 22, 2022 at 04:44:24PM +1000, Michael Ellerman wrote:
> Yihao Han <hanyihao@vivo.com> writes:
> > -		if (index =3D=3D 0 && (res->end - res->start) > 0xfff)
> > +		if (index =3D=3D 0 && (resource_size(res)) > 0xfff)
> >  			res->end =3D res->start + 0xfff;
> > -		if (index =3D=3D 1 && (res->end - res->start) > 0xff)
> > +		if (index =3D=3D 1 && (resource_size(res)) > 0xff)
>=20
> Are you sure the conversion is correct? It's not exactly equivalent:
>=20
> static inline resource_size_t resource_size(const struct resource *res)
> {
> 	return res->end - res->start + 1;
> }

Indeed. I pointed out this issue in the v2 that already hit my inbox.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--y36m4bm5lfadd555
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJm2SMACgkQwfwUeK3K
7AmYawf/QfGR/l+1FYITPyljtHxUcmS2QItRhRWCUUYh3GfjAbISpfA4QpCoQ+FV
WrQ8w0FW6XEbi5mXqI71rsL6jLQjRB9dheQYapd7JXuL1Q8Vtzr0UaOBmksGWKLH
RCAOvlqfTBMMcR17vsYoo1DQlrE0721MAilie6JcbCBzmV376tRsox+p2Bcuc0Xo
19T9Od9nMz79J6wBsOXccAwqc9UUlaxAfth2nxJyQbTtn1OBLtEztz8nf3+Y9VGo
CIj/3UBriHrGFUH/LVtFuAZwncErTxwUk6wcesgNUJNNSUJylLTfRarjZ+cHXlZr
Zu/WQOBr2X9h7xo73uriTK9lfqIw4Q==
=zCfi
-----END PGP SIGNATURE-----

--y36m4bm5lfadd555--
