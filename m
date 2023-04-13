Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D206E06A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 08:01:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pxpq75fPXz3fRv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 16:01:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pxppf6DHgz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 16:00:41 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmq08-0006Ev-7l; Thu, 13 Apr 2023 08:00:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmq05-00Atqo-4l; Thu, 13 Apr 2023 08:00:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmq04-00CnQS-Az; Thu, 13 Apr 2023 08:00:04 +0200
Date: Thu, 13 Apr 2023 08:00:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Leo Li <leoyang.li@nxp.com>
Subject: Re: [PATCH 0/6] bus: fsl-mc: Make remove function return void
Message-ID: <20230413060004.t55sqmfxqtnejvkc@pengutronix.de>
References: <20230310224128.2638078-1-u.kleine-koenig@pengutronix.de>
 <20230412171056.xcluewbuyytm77yp@pengutronix.de>
 <AM0PR04MB6289BB9BA4BC0B398F2989108F9B9@AM0PR04MB6289.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dipxl4niloq7i3xa"
Content-Disposition: inline
In-Reply-To: <AM0PR04MB6289BB9BA4BC0B398F2989108F9B9@AM0PR04MB6289.eurprd04.prod.outlook.com>
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
Cc: Stuart Yoder <stuyoder@gmail.com>, Gaurav Jain <gaurav.jain@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "Diana Madalina Craciun \(OSS\)" <diana.craciun@oss.nxp.com>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Horia Geanta <horia.geanta@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Richard Cochran <richardcochran@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, Alex Williamson <alex.williamson@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "Y.B. Lu" <yangbo.lu@nxp.com>, "dmaengine@vger.kernel.org
 " <dmaengine@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--dipxl4niloq7i3xa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Leo,

On Wed, Apr 12, 2023 at 09:30:05PM +0000, Leo Li wrote:
> > On Fri, Mar 10, 2023 at 11:41:22PM +0100, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >
> > > many bus remove functions return an integer which is a historic
> > > misdesign that makes driver authors assume that there is some kind of
> > > error handling in the upper layers. This is wrong however and
> > > returning and error code only yields an error message.
> > >
> > > This series improves the fsl-mc bus by changing the remove callback to
> > > return no value instead. As a preparation all drivers are changed to
> > > return zero before so that they don't trigger the error message.
> >=20
> > Who is supposed to pick up this patch series (or point out a good reaso=
n for
> > not taking it)?
>=20
> Previously Greg KH picked up MC bus patches.
>=20
> If no one is picking up them this time, I probably can take it through
> the fsl soc tree.

I guess Greg won't pick up this series as he didn't get a copy of it :-)

Browsing through the history of drivers/bus/fsl-mc there is no
consistent maintainer to see. So if you can take it, that's very
appreciated.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dipxl4niloq7i3xa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ3mmMACgkQj4D7WH0S
/k5nNwf/ScXPEzfZ09aQk2Q2m2lyI5GB0AuO3Y2J4NAHIWgAoR/6wit1ruKkfvFq
uejLhBvkfGFlVytm4oo946r8RzazbFffixp6Yiu9rh2Mi4ieF8/jqmGA+rWMomRF
36k+LsVG7UvSLjpeYby2OHiMR/+fNc61mRb8vgTq7SMe8Un5o7Lz6vZw7z1vmCWC
KsPwmDvkh3glY1HIqf+fTJoB9EtfGMoQy5umRsLYXWDL5sZYASpBLsHiSOc4KatF
NCT6j5R0wItmhG83LAurRC5NcG8aZ1Jt7kU/Qp6kWMEw2bmgxfWOGhCA2hh5efsh
Leq++vvq24OB1Bd9sVbvuYSkpixT7A==
=v4Gk
-----END PGP SIGNATURE-----

--dipxl4niloq7i3xa--
