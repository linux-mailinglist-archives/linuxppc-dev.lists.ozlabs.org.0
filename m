Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4286CE78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 17:14:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlxB46nHJz3vdd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 03:14:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlx9c05BXz3bqD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 03:13:53 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rfj2U-0006SE-V8; Thu, 29 Feb 2024 17:13:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rfj2T-003ceH-Pn; Thu, 29 Feb 2024 17:13:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rfj2T-00E292-2J;
	Thu, 29 Feb 2024 17:13:41 +0100
Date: Thu, 29 Feb 2024 17:13:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Add allmodconfig for all 32-bit sub-arches
Message-ID: <yji7lf3sa54olbeegkjtwkta3edfxpbcg2bzzzs4htlmuntzpp@irrvdebrmb52>
References: <20240229114108.743810-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iujfugwdwh5k5zum"
Content-Disposition: inline
In-Reply-To: <20240229114108.743810-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--iujfugwdwh5k5zum
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 10:41:08PM +1100, Michael Ellerman wrote:
> 32-bit powerpc kernels can be built for one of 5 sub-arches, see
> Kconfig.cputype:
>=20
>   PPC_BOOK3S_32: "512x/52xx/6xx/7xx/74xx/82xx/83xx/86xx"
>   PPC_85xx: "Freescale 85xx"
>   PPC_8xx: "Freescale 8xx"
>   40x: "AMCC 40x"
>   44x: "AMCC 44x, 46x or 47x"
>=20
> By default none of these are built for a plain allmodconfig build,
> because it selects PPC64 which builds a 64-bit kernel.
>=20
> There is already a ppc32_allmodconfig, which enables PPC_BOOK3S_32.
>=20
> Add similar targets for the other 32-bit sub-arches to increase build
> coverage:
>   ppc40x_allmodconfig
>   ppc44x_allmodconfig
>   ppc8xx_allmodconfig
>   ppc85xx_allmodconfig
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

\o/

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iujfugwdwh5k5zum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXgrTQACgkQj4D7WH0S
/k4AGwf9Ef5yOMqfqDKRPwcW1zYXUNlNAxjPV06SvXSbAuYstTNtRyZ/X7Bww3lY
dwgzIXZEQIi00GEdrNJulGQSEuLWwMIAZvWi8jJUirmfGss51KCWtK3Eiz+kZ4BI
VGBBYbYF8QhXZQZMQmhuv9hdrscUh2SscTCVMImqqPcXt00rSoT2cy9WTkltu7Wk
kz42Peh5NeNQy2prM2P+2kvGusFyUX14absFqBOFdhkBA1rXd7hlTrdKsh4EXkHd
opnAHQAjVnO7N7Oy6Otj2LGZZlTduLzw/tLXUgqts30XG1lncdK3nozKiCjnHC1a
PTptqduoY/NKJMm0AKe5Us/D665nEg==
=c34t
-----END PGP SIGNATURE-----

--iujfugwdwh5k5zum--
