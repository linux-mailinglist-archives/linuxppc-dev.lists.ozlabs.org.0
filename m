Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F757162AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 15:52:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVv3K691Gz3f77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 23:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVv2r4Nxwz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 23:52:01 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3zkW-0001PG-Iu; Tue, 30 May 2023 15:50:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3zkQ-003tB5-4p; Tue, 30 May 2023 15:50:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3zkP-009W9H-Ah; Tue, 30 May 2023 15:50:49 +0200
Date: Tue, 30 May 2023 15:50:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 0/6] bus: fsl-mc: Make remove function return void
Message-ID: <20230530135046.oovq5gxzbjfqgzos@pengutronix.de>
References: <20230310224128.2638078-1-u.kleine-koenig@pengutronix.de>
 <20230412171056.xcluewbuyytm77yp@pengutronix.de>
 <AM0PR04MB6289BB9BA4BC0B398F2989108F9B9@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <20230413060004.t55sqmfxqtnejvkc@pengutronix.de>
 <20230508134300.s36d6k4e25f6ubg4@pengutronix.de>
 <CADRPPNQ0QiLzzKhHon62haPJCanDoN=B4QsWCxunJTc4wXwMaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4dpyuum7f6cyucl4"
Content-Disposition: inline
In-Reply-To: <CADRPPNQ0QiLzzKhHon62haPJCanDoN=B4QsWCxunJTc4wXwMaA@mail.gmail.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Gaurav Jain <gaurav.jain@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Eric Dumazet <edumazet@google.com>, "Diana Madalina Craciun \(OSS\)" <diana.craciun@oss.nxp.com>, Stuart Yoder <stuyoder@gmail.com>, Horia Geanta <horia.geanta@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Richard Cochran <richardcochran@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, Alex Williamson <alex.williamson@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "Y.B. Lu" <yangbo.lu@nxp.com>, "dmaengine@vger.kernel.org
 " <dmaengine@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--4dpyuum7f6cyucl4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 08, 2023 at 04:57:00PM -0500, Li Yang wrote:
> On Mon, May 8, 2023 at 8:44=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Thu, Apr 13, 2023 at 08:00:04AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Wed, Apr 12, 2023 at 09:30:05PM +0000, Leo Li wrote:
> > > > > On Fri, Mar 10, 2023 at 11:41:22PM +0100, Uwe Kleine-K=C3=B6nig w=
rote:
> > > > > > Hello,
> > > > > >
> > > > > > many bus remove functions return an integer which is a historic
> > > > > > misdesign that makes driver authors assume that there is some k=
ind of
> > > > > > error handling in the upper layers. This is wrong however and
> > > > > > returning and error code only yields an error message.
> > > > > >
> > > > > > This series improves the fsl-mc bus by changing the remove call=
back to
> > > > > > return no value instead. As a preparation all drivers are chang=
ed to
> > > > > > return zero before so that they don't trigger the error message.
> > > > >
> > > > > Who is supposed to pick up this patch series (or point out a good=
 reason for
> > > > > not taking it)?
> > > >
> > > > Previously Greg KH picked up MC bus patches.
> > > >
> > > > If no one is picking up them this time, I probably can take it thro=
ugh
> > > > the fsl soc tree.
> > >
> > > I guess Greg won't pick up this series as he didn't get a copy of it =
:-)
> > >
> > > Browsing through the history of drivers/bus/fsl-mc there is no
> > > consistent maintainer to see. So if you can take it, that's very
> > > appreciated.
> >
> > My mail was meant encouraging, maybe it was too subtile? I'll try again:
> >
> > Yes, please apply, that would be wonderful!
>=20
> Sorry for missing your previous email.  I will do that.  Thanks.

Either you didn't apply this patch set yet, or your tree isn't in next.
Both variants would be great to be fixed.

I have another change pending for drivers/bus/fsl-mc/fsl-mc-bus.c, would
be great to see these base patches in next first.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4dpyuum7f6cyucl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR1/zUACgkQj4D7WH0S
/k6wYwf/aFknTYegOQsYhfPj+VXVEPLkfLFdy+0HcdoIWviyACOPr3L1s4X6BPqq
sTJMW1RtfiDybFhNCMN1eH2tx0+vSuLIzI3rpU+vrob5w86uWd6UzbIMR8uxXPCn
JN5+JDgQsZd0CZKYyCQOw7b+5KpzPhEHKUbUlyxocvtyBE6HFXoQtjsWQnrrCmHl
gvroNfuqjlh3zmsw8ELv/tyZj207mMkvap8BWsKhMtbhRXg132eMBIFJ+XMB//he
A7iG3AkhiRNNdYGFh/KKiRv2l1vHd+6+YmPEM4zRxDCtidaBJTbRL5SSs3AVeYK0
+gXDgOa2Lsf8VzCxRpTavmjQhdDkcA==
=eJpM
-----END PGP SIGNATURE-----

--4dpyuum7f6cyucl4--
