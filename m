Return-Path: <linuxppc-dev+bounces-3102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 969439C5052
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 09:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnfJR294Nz2xpk;
	Tue, 12 Nov 2024 19:11:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731399095;
	cv=none; b=an6kd3I29eCetbLLK1kS2rXjMeQ1xy+gmDqSOxoj9gsjYcvzG15gVILG43yd4FFM7ZaN677A+EAOEs/ixYEFosyHJpqLTLpYpZDHRP2jdonHmepZq4T2bHDAIED1Cmj3UaJcNTQPQs8pAdCx/yFZUyyuIiudk/dIcuwDHTHT5Q+AJKhGacx0nbZnWMw6BAVjN+UgqlkRl8gi9XemwWAdM83+SOXeJ9oaskihtF3M1rrqiL/1MErs+TzSVOnfUA2lg+ZspvLL/DRmj0DlQSSN7qj4z7wMyQlwRc/ZjKPdEL8H+iq5t7C8pigAUfMf3oGlL3Ik4s9v0IQ1xdZGNeUKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731399095; c=relaxed/relaxed;
	bh=jbCEbJtigEzrfzyGdDfeYhf12Y+BqR/lK0AjwtgVJuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3KF3451oekNvoPsIjkJQwu45GMPoVflQ3SnZSpp4scBLieN0QH3ktEBa+28hcGnicZW4Pvrenm0efNBsBuRw7qAkAJst7Xz8NC7q7QHZ58accuJmR0ZooiAuwzULSEJ+8P/f0zXQltqZ5p8WOjfFWAtesP7m3F3MPF2AI/UsqfLYb7e7mXswK9CWVLpqcVJQ7SbOmN0vmu0oT/u76yE0npyxNlgKz3oHiINsTkMo2FALZ1695ijd4S7rfvIVEG1yRpVxtGodW4SSTnHYixQg7BUz9vX6hxYepOXfzS/LLDqRbZhZeuqH4KWbLIlnqSoyu9q+NYfpvR+edauat850Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mkl@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 961 seconds by postgrey-1.37 at boromir; Tue, 12 Nov 2024 19:11:33 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnfJP17Rpz2xk1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 19:11:33 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tAljt-000840-0J; Tue, 12 Nov 2024 08:55:05 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tAljp-000NFm-0Y;
	Tue, 12 Nov 2024 08:55:01 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A90A23712AA;
	Tue, 12 Nov 2024 07:55:00 +0000 (UTC)
Date: Tue, 12 Nov 2024 08:55:00 +0100
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
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
Message-ID: <20241112-lush-beneficial-chicken-9a31f5-mkl@pengutronix.de>
References: <20241111210316.15357-1-rosenp@gmail.com>
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
	protocol="application/pgp-signature"; boundary="wiafd67i2wzywtxu"
Content-Disposition: inline
In-Reply-To: <20241111210316.15357-1-rosenp@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--wiafd67i2wzywtxu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
MIME-Version: 1.0

On 11.11.2024 13:03:16, Rosen Penev wrote:
> np here is the node coming from platform_device. No children are used.
>=20
> I changed irq_of_parse_and_map to platform_get_irq to pass it directly.
>=20
> I changed of_address_to_resource to platform_get_resource for the same
> reason.
>=20
> It ends up being the same.

You should describe in an imperative way your changes. Something like:

Modernize IRQ resource acquisition.

Replace irq_of_parse_and_map() by platform_get_irq()

=2E..and list the other changes, too.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: fixed compilation errors. Also removed non devm transformations.
>  Those will be handled separately. Also reworded description.
>  drivers/net/can/grcan.c                          |  2 +-
>  drivers/net/can/mscan/mpc5xxx_can.c              |  2 +-

Reviewed by: Marc Kleine-Budde <mkl@pengutronix.de> # for CAN

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--wiafd67i2wzywtxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmczCdEACgkQKDiiPnot
vG9P5Qf9GHBDogv141w23Ql4QYhPyQNOFBbAjfAmSaXZJQjwjI2/PT9uMOtwx1N3
xkyyFSufM0a+sr9Mn7vC+liJrlzO9Xmqq+53eTAvq2e2RPKAdVT/aPa21s05sWUI
u1r/6bgaTgg9stZMDtivo6HAYr69FexPGYKdk9bAcm4gANpW/Ih+NpLB4IwzqKv6
EHXEtt4AfiBCLNkq4BUwBO4D1CHsDbICmSZbC2RRZ5Jc85R9u+YYqwj7RN3EbDfL
fWarhFuRuoGubmHPg8gaauKa5/Cxjo9fsjn93QTzRbgEgLJEsii3Y85oI0LaN0U8
e9/zBSWu8p/gXjqOGAwOOYQ1WVxswA==
=3yO+
-----END PGP SIGNATURE-----

--wiafd67i2wzywtxu--

