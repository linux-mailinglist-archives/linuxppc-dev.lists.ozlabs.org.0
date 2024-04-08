Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043289B8C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 09:43:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCh1406pGz3vX8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 17:43:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCh0f3LY0z2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 17:43:28 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rtjep-0003xj-Rt; Mon, 08 Apr 2024 09:43:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rtjep-00B4Ir-Aa; Mon, 08 Apr 2024 09:43:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rtjep-00G41v-0k;
	Mon, 08 Apr 2024 09:43:11 +0200
Date: Mon, 8 Apr 2024 09:43:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Zhang Wei also unreachable working
Message-ID: <zj6uueuu4c2vpjgg23r2lmqlleg4o6uxn4b7xlegcios23ifx5@ttom2yzyke2h>
References: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mrcj7cuohzw5kahh"
Content-Disposition: inline
In-Reply-To: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
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
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mrcj7cuohzw5kahh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2024 at 09:20:41AM +0200, Uwe Kleine-K=F6nig wrote:
> -M:	Li Yang <leoyang.li@nxp.com>
>  M:	Zhang Wei <zw@zh-kernel.org>

This address of Zhang Wei doesn't seem to work either.

zh-kernel.org doesn't have an MX in DNS, the host behind its A entry
doesn't react to pings and connection attempts to tcp port 25 time out.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mrcj7cuohzw5kahh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYToA4ACgkQj4D7WH0S
/k65PAgAlzOGcV34Muztc48A4sK3thMx4xmK2GT3dLVR5K1QiaydY2gSBO8onaei
iZPOJGypivVIWUqaBhsuuZmBAnqvSeQ2b1NvKlq/8APDmqPz6igTYdS9vTIxp26C
VcIFqbqkQXNp2KIXgpktaZfOvAAZpwIN3w23tGgHDgRgTh57KvvDssMuOlbu181v
G5flqP4+LXYZKkDWMmQbEpkwktRdZk1sfQxJaTTQYVuY1ByaNncw9hzCrMCqL8WO
bXGl7J+ClwXN0kLXZCkNlCRWvTrPMFrZAlvSnLY+H7STK3Zpmxh+LeAtAHxwYTFN
+GXJHCHxAemst04lXyi5pyCzibQ1Cg==
=XE4m
-----END PGP SIGNATURE-----

--mrcj7cuohzw5kahh--
