Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EFD6DFC56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 19:12:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxTlf6Xhhz3fSF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 03:11:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxTl76MQHz3cG7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 03:11:30 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmdzp-0001ho-BG; Wed, 12 Apr 2023 19:11:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmdzm-00AmwQ-36; Wed, 12 Apr 2023 19:10:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmdzk-00CfNB-OC; Wed, 12 Apr 2023 19:10:56 +0200
Date: Wed, 12 Apr 2023 19:10:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Roy Pledge <Roy.Pledge@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yangbo Lu <yangbo.lu@nxp.com>,
	Diana Craciun <diana.craciun@oss.nxp.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 0/6] bus: fsl-mc: Make remove function return void
Message-ID: <20230412171056.xcluewbuyytm77yp@pengutronix.de>
References: <20230310224128.2638078-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2x2mx27jq2zwvoxs"
Content-Disposition: inline
In-Reply-To: <20230310224128.2638078-1-u.kleine-koenig@pengutronix.de>
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
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2x2mx27jq2zwvoxs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Mar 10, 2023 at 11:41:22PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> many bus remove functions return an integer which is a historic
> misdesign that makes driver authors assume that there is some kind of
> error handling in the upper layers. This is wrong however and returning
> and error code only yields an error message.
>=20
> This series improves the fsl-mc bus by changing the remove callback to
> return no value instead. As a preparation all drivers are changed to
> return zero before so that they don't trigger the error message.

Who is supposed to pick up this patch series (or point out a good reason
for not taking it)?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2x2mx27jq2zwvoxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ25h8ACgkQj4D7WH0S
/k7l+Af+N5+aCs46B4ridehobQBafv9tZPTtFGoBY5sC3oXI6o1esrrE+v65jjyp
+6c8u6nhgNeTebXzIxFZRF5wUcD+7uIAD+ZomoHHX7CJ83BoYu0ifciGJOIC15r5
j5AnkV0+1vzfztf5wozUdHsk/m+PKeRgKLzvJ2z7HmFShucihqWRGFUkdu9+DIw4
0hxxi+Y0L+5iuoKcXmrFi28Rid2oVDjeSYvkQTsWtp3l/4Gtu2Dqc0hW2hU66NmG
6rOxQ24mymBgwEc0XyR0uBq+/1YBdKzJOFjjH3ilQNzWb66Spxl1q74K0karyFcS
rEZESsixkY8yP2PuyQt8FJxICwYcXQ==
=BATw
-----END PGP SIGNATURE-----

--2x2mx27jq2zwvoxs--
