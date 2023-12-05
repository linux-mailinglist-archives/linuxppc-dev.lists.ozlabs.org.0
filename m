Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AC2804B46
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 08:40:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skss53hf0z3d9K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 18:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sksrc2GmXz2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 18:40:14 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAQ1T-0007nO-OE; Tue, 05 Dec 2023 08:39:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAQ1P-00Dh2K-W4; Tue, 05 Dec 2023 08:39:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAQ1P-00EZzR-Lj; Tue, 05 Dec 2023 08:39:11 +0100
Date: Tue, 5 Dec 2023 08:39:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next v2 0/9] net*: Convert to platform remove
 callback returning void
Message-ID: <20231205073911.e6nphzhc6yjan5vu@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
 <20231205075110.795b88d2@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yvpnmk4qagvgsgfh"
Content-Disposition: inline
In-Reply-To: <20231205075110.795b88d2@xps-13>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Eric Dumazet <edumazet@google.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Zhao Qiang <qiang.zhao@nxp.com>, linux-renesas-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Christian Marangi <ansuelsmth@gmail.com>, Nick Child <nnac123@linux.ibm.com>, Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Loic Poulain <loic.poulain@linaro.org>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, "David S. Miller" <davem@davemloft.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, kernel@pengutronix.de, Johannes Berg <johannes@sipsolutions.
 net>, Imre Kaloz <kaloz@openwrt.org>, linux-wpan@vger.kernel.org, Linus Walleij <linusw@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--yvpnmk4qagvgsgfh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Miquel,

On Tue, Dec 05, 2023 at 07:51:10AM +0100, Miquel Raynal wrote:
> u.kleine-koenig@pengutronix.de wrote on Mon,  4 Dec 2023 19:30:40 +0100:
> > (implicit) v1 of this series can be found at
> > https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@=
pengutronix.de.
> > Changes since then:
> >=20
> >  - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
> >    converts ipa to remove_new() and introduces an error message in the
> >    error path that failed before.
> >=20
> >  - Rebased to today's next
> >=20
> >  - Add the tags received in the previous round.
> >=20
> > Uwe Kleine-K=F6nig (9):
> >   net: ipa: Convert to platform remove callback returning void
> >   net: fjes: Convert to platform remove callback returning void
> >   net: pcs: rzn1-miic: Convert to platform remove callback returning
> >     void
> >   net: sfp: Convert to platform remove callback returning void
> >   net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
> >     void
> >   net: wan/ixp4xx_hss: Convert to platform remove callback returning
> >     void
> >   net: wwan: qcom_bam_dmux: Convert to platform remove callback
> >     returning void
> >   ieee802154: fakelb: Convert to platform remove callback returning void
> >   ieee802154: hwsim: Convert to platform remove callback returning void
>=20
> FYI, I plan on taking patches 8 and 9 through wpan-next.

I forgot to mention explicitly that there are no interdependencies in
this series. So each maintainer picking up up their patches is fine.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yvpnmk4qagvgsgfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVu054ACgkQj4D7WH0S
/k6iZAgAk0+g8Khu/Ep6tOFWM4mSMy9654kVheNx2FCbbW/bAMDmjjTU+JefFpX+
7FjzwXTwgg1LgMrgBGElDY2TT6R2655WJe8jWIEOSjXPJLpqH19V1nbyE4D0ESd/
j3Ng/QZKClTPeg3Qm/6ECF3YR2HDwT1xnUOYPEJinZcpBjJ/oyH16DVG11rvhYxL
o+1q0NZqQfR+TEwIRj84WFCmk1UCfG7TVGZSJOmby1+bg7W6Heh+yr/vyyQ+vYEL
4w0ogQenAk2aIlE7RmrsUp9WFA5pTFVYz+xJOA8tJx9p6pzSRpkXWtCN1ZrUTnnY
vxZ07dy2791XsDRamfgrGOZgzi9RJg==
=F8+E
-----END PGP SIGNATURE-----

--yvpnmk4qagvgsgfh--
