Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EC658FCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Dec 2022 18:29:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njb455fZzz3c6h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 04:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njb3T6pDyz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 04:29:07 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pAwhx-0005QI-Re; Thu, 29 Dec 2022 18:28:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pAwhr-002Xc3-9T; Thu, 29 Dec 2022 18:28:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pAwhq-008no3-LN; Thu, 29 Dec 2022 18:28:38 +0100
Date: Thu, 29 Dec 2022 18:28:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH] powerpc/mpc52xx_lpbfifo: Drop unused functions
Message-ID: <20221229172835.ldbpjwl4aelx7p3h@pengutronix.de>
References: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rti4uiobizeudh3c"
Content-Disposition: inline
In-Reply-To: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rti4uiobizeudh3c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 03:51:29PM +0100, Uwe Kleine-K=F6nig wrote:
> The four exported functions mpc52xx_lpbfifo_submit(),
> mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll(), and
> mpc52xx_lpbfifo_start_xfer() are not used. So they can be dropped and the
> definitions needed to call them can be moved into the driver file.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---

I forgot to note here that maybe without these four exported functions
the driver is useless and can be removed completely.

I didn't look in detail, but maybe one of the recipents might know.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rti4uiobizeudh3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOtzj0ACgkQwfwUeK3K
7Alzngf/Xx+HJYH/vMXNuHjNRyrafXDMgBhet+5A1v5j/4Nm97YyRa41lN30vS86
HRKzP3fevg5wxaJ6pTwVjHJxSk2iSuxsuqZ0VGp9angN3YrY0C6/hE+gNz626CJs
jdRRbU0B5MJOf4yd3xADCfxKOxsHCOVIJj2NnyvHpQ0kgk+KKCxvM8yYRZaRdg8x
Zbuffu2ss9qc3mS09yOLv/pdqvMn/YD+vYAOAt1mZaRF0E6j0clpPO7+OkZ6wXWz
TB1KDjM/ZCYAN4g56r79vXYm0Shuo2Ljtty28g4tjHI3FDvdUjQ9hdLJsV8CR7eK
Gm528AR6uba9S5iQJHeGlQlB1CzMLA==
=VL+9
-----END PGP SIGNATURE-----

--rti4uiobizeudh3c--
