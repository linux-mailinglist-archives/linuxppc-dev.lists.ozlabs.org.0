Return-Path: <linuxppc-dev+bounces-3142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D79C69BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 08:15:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpF1K6T5mz2yZN;
	Wed, 13 Nov 2024 18:15:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731482133;
	cv=none; b=fN032Trxy/o2f3D841VPNYx/aoH7ru4vQAEt7U9/98rCPqD7o20swUud9xr7mVkjyKS2j2NgAEpNSY1CzzhaInpaGLQdxilvEVnDpgsJboFJwLKffcrSxytIzwHNye+rWr9udcEPch9qcl6ft10tD08mu1coLI4hDhj1K0QemAvxRqfIMojhZoE5+6law4Y3f0Y8OibrBvEDnfub4MLO+A28Mb1AxvP5HMYgnf57IWwrLO+dYMltlwGF9K8qfYXI5qA4uSlw7KQocHcZ3V5Tom15HVUmhUo8ObNo4TiNEmPdTjHhS9P/5wCmdHDW2Qm+EGaviFXey2zFQIHQ9/Px/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731482133; c=relaxed/relaxed;
	bh=+2ywtLUzcEwfRnZvQwy7PCCoQoHJQTyH+/W3goY8WDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCAxk2U6i0VyUuIb9K9tsFrmwIfc0tsi9cQchmGHLGvViTKR3vtD5oscyAwLGwACKgOOLG8xTDIPNvhILUs/VWodW0QkeHs076C+hNoC7A6ocaEv9VWgqocwDcxagpl7yMbrx4OPxx3eENyl4r670fHad5O/F3MsjSiyZNShYow8ue95Hepa4E+oh1dQv+R0dGKNr54WVWenS/tobE1pLq2Xc/wNHUcd6j9ws7RtOAgMv2NBu9R9FkCHrLVnTFFEB8G1elqivpi/huU4FMLLLgEx2PLzqj8qxv3OTZ+mLcDIawq5Ak7qr4tBQGL2/RZNL8UVnTMvqbh2/lf4J/0GSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpF1J0KB2z2yZ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 18:15:30 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tB7aT-0007QT-1e; Wed, 13 Nov 2024 08:14:49 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tB7aN-000XUv-0p;
	Wed, 13 Nov 2024 08:14:43 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C3AE03721A3;
	Wed, 13 Nov 2024 07:14:42 +0000 (UTC)
Date: Wed, 13 Nov 2024 08:14:41 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Byungho An <bh74.an@samsung.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, 
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Zhao Qiang <qiang.zhao@nxp.com>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
Message-ID: <20241113-nonchalant-spaniel-of-contentment-83978a-mkl@pengutronix.de>
References: <20241112211442.7205-1-rosenp@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yqpx5eyx2zhvpvlt"
Content-Disposition: inline
In-Reply-To: <20241112211442.7205-1-rosenp@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--yqpx5eyx2zhvpvlt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
MIME-Version: 1.0

On 12.11.2024 13:14:42, Rosen Penev wrote:
> In probe, np =3D=3D pdev->dev.of_node. It's easier to pass pdev directly.
>=20
> Replace irq_of_parse_and_map() by platform_get_irq() to do so. Requires
> removing the error message as well as fixing the return type.
>=20
> Replace of_address_to_resource() with platform_get_resource() for the
> same reason.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> (for CAN)
> Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>

Please write this as:

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de> # for CAN

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--yqpx5eyx2zhvpvlt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmc0Ud0ACgkQKDiiPnot
vG9ixwf+MRErFbP8EBNYW4KiknVHSCJqliQuxtMgRc5LE54Iz/W8AKqAbKIjgzTv
XVCnuSSPn5hWw85VK1YrC2romqZQMmkjFDeaDAf27emw1tYQC5DkAg7DfdasiaFw
ZUNWdDjmY3lm3YwXCupckUARjWB9VEXNsLca8eti0+gmBWR16gwNbd7lBeXHm+Qf
mDzxiz9SQG5P/1V6GYCnHUgqw4yC6yxgNim60jfDfbD7t52x/C1EQylcG0Wzx3Uz
H1irShtJQNqXv0j63qMX0K3NQOkUKy0/yfNUS5gqHefjAT5YnEqUHKReldiPq0JB
IvRUsw91n6EDC2kPZwOR1gOkgMzKZA==
=7118
-----END PGP SIGNATURE-----

--yqpx5eyx2zhvpvlt--

