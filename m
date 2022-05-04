Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6751A229
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 16:27:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtfKp1ng6z3c7g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 00:27:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=mkl@pengutronix.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1043 seconds by postgrey-1.36 at boromir;
 Thu, 05 May 2022 00:26:47 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtfKM07jLz3bdC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 00:26:45 +1000 (AEST)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1nmFgM-0000h2-LG; Wed, 04 May 2022 16:08:46 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a00:20:7019:a9b6:6aae:fc9e:d3ef:96db])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 347A975CE1;
 Wed,  4 May 2022 14:08:34 +0000 (UTC)
Date: Wed, 4 May 2022 16:08:33 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/4] powerpc/mpc5xxx: Switch
 mpc5xxx_get_bus_frequency() to use fwnode
Message-ID: <20220504140833.b2itvapuqlssm74k@pengutronix.de>
References: <20220504134449.64473-1-andriy.shevchenko@linux.intel.com>
 <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vz3cm7jicnfhqyjt"
Content-Disposition: inline
In-Reply-To: <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
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
Cc: linux-ide@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Anatolij Gustschin <agust@denx.de>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-can@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--vz3cm7jicnfhqyjt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04.05.2022 16:44:47, Andy Shevchenko wrote:
> Switch mpc5xxx_get_bus_frequency() to use fwnode in order to help
> cleaning up other parts of the kernel from OF specific code.
>=20
> No functional change intended.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/powerpc/include/asm/mpc5xxx.h            |  9 +++-
>  arch/powerpc/platforms/52xx/mpc52xx_gpt.c     |  2 +-
>  arch/powerpc/sysdev/mpc5xxx_clocks.c          | 41 ++++++++++---------
>  drivers/ata/pata_mpc52xx.c                    |  2 +-
>  drivers/i2c/busses/i2c-mpc.c                  |  7 ++--
>  drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
>  drivers/net/ethernet/freescale/fec_mpc52xx.c  |  2 +-
>  .../net/ethernet/freescale/fec_mpc52xx_phy.c  |  3 +-
>  .../net/ethernet/freescale/fs_enet/mii-fec.c  |  4 +-
>  drivers/spi/spi-mpc52xx.c                     |  2 +-
>  drivers/tty/serial/mpc52xx_uart.c             |  4 +-
>  11 files changed, 44 insertions(+), 34 deletions(-)

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for mscan/mpc5xxx_can

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--vz3cm7jicnfhqyjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJyiN4ACgkQrX5LkNig
010OIAf8CBk7q4SlnkqYRtXPIROz3oNFhMidCM6GZg2jjdclJJWBQBKZcqVIqVOE
d8lOgUvYv1HV6YvQfoaTflFSAabkzzrzJHOzvrPjpQN8m/g/jQWrtgnLsnXR6DQ8
+IlS6l/ePviEK1b1wBflbpnXNDvqyuZ1JI6raS33OtF23UfR9i3okaA7vtWhBH2p
w/pqkLeh9WHNBneeJaf9q5ag2Z99PothsCek8lEUrwJYaw9/bn0is0JWC8Zjze4C
skOkxpOERxfSedvx4WSFuU7U+CNYXk4/BkWQa/1dcLbzFuW/WdgAJDKFOtWTOI9C
od+uCAGiK4UNsWkGX3PG24Mrvry9iw==
=o7Bz
-----END PGP SIGNATURE-----

--vz3cm7jicnfhqyjt--
