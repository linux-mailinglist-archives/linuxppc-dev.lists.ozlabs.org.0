Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A87228BC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:23:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZbRs6D9Jz3fbR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 00:23:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZbRM2gPhz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 00:22:38 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6B6P-0003sp-Cu; Mon, 05 Jun 2023 16:22:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6B6H-005ILy-VI; Mon, 05 Jun 2023 16:22:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q6B6H-00BPoh-7V; Mon, 05 Jun 2023 16:22:25 +0200
Date: Mon, 5 Jun 2023 16:22:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 2/2] serial: 8250: Apply FSL workarounds also without
 SERIAL_8250_CONSOLE
Message-ID: <20230605142225.75l6px3ep5ythkl6@pengutronix.de>
References: <20230605130857.85543-1-u.kleine-koenig@pengutronix.de>
 <20230605130857.85543-3-u.kleine-koenig@pengutronix.de>
 <2d70e8b-7722-71e7-76f3-d27a2b2caa55@linux.intel.com>
 <20230605133445.vi762odw2v7pkrog@pengutronix.de>
 <f01b13f5-34c9-62fc-52fd-33e923e2a2ba@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67aykvgma767d2t7"
Content-Disposition: inline
In-Reply-To: <f01b13f5-34c9-62fc-52fd-33e923e2a2ba@linux.intel.com>
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
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Liang He <windhl@126.com>, linux-serial <linux-serial@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, kernel@pengutronix.de, Matthew Gerlach <matthew.gerlach@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--67aykvgma767d2t7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ilpo,

On Mon, Jun 05, 2023 at 04:44:08PM +0300, Ilpo J=E4rvinen wrote:
> On Mon, 5 Jun 2023, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jun 05, 2023 at 04:22:55PM +0300, Ilpo J=E4rvinen wrote:
> > > On Mon, 5 Jun 2023, Uwe Kleine-K=F6nig wrote:
> > >=20
> > > > The need to handle the FSL variant of 8250 in a special way is also
> > > > present without console support. So soften the dependency for
> > > > SERIAL_8250_FSL accordingly. Note that with the 8250 driver compile=
d as
> > > > a module, some devices still might not make use of the needed
> > > > workarounds. That affects the ports instantiated in
> > > > arch/powerpc/kernel/legacy_serial.c.
> > > >=20
> > > > This issue was identified by Dominik Andreas Schorpp.
> > > >=20
> > > > To cope for CONFIG_SERIAL_8250=3Dm + CONFIG_SERIAL_8250_FSL=3Dy, 82=
50_fsl.o
> > > > must be put in the same compilation unit as 8250_port.o because the
> > > > latter defines some functions needed in the former and so 8250_fsl.o
> > > > must not be built-in if 8250_port.o is available in a module.
> > > >=20
> > > > Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > Link: https://lore.kernel.org/r/20230531083230.2702181-1-u.kleine-k=
oenig@pengutronix.de
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > >  drivers/tty/serial/8250/Kconfig  | 2 +-
> > > >  drivers/tty/serial/8250/Makefile | 2 +-
> > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8=
250/Kconfig
> > > > index 5313aa31930f..10c09b19c871 100644
> > > > --- a/drivers/tty/serial/8250/Kconfig
> > > > +++ b/drivers/tty/serial/8250/Kconfig
> > > > @@ -378,7 +378,7 @@ config SERIAL_8250_BCM2835AUX
> > > > =20
> > > >  config SERIAL_8250_FSL
> > > >  	bool "Freescale 16550 UART support" if COMPILE_TEST && !(PPC || A=
RM || ARM64)
> > > > -	depends on SERIAL_8250_CONSOLE
> > > > +	depends on SERIAL_8250
> > >=20
> > > Just one additional thought: After the adding the arch side=20
> > > workaround/hack, SERIAL_8250_FSL could become a tristate?
> >=20
> > I see no benefit for a module separate from 8250_base.ko. There are
> > dependencies in both directions between 8250_port.o and 8250_fsl.o[1].
> > So in my book a bool SERIAL_8250_FSL that modifies 8250_base.ko (with
> > SERIAL_8250=3Dm) is fine.
> >=20
> > Best regards
> > Uwe
> >=20
> > [1] 8250_port.o uses fsl8250_handle_irq() from 8250_fsl.o
>=20
> Is that after some fix which isn't in tty-next? I see only these:
>=20
> $ git grep -l fsl8250_handle_irq
> arch/powerpc/kernel/legacy_serial.c
> drivers/tty/serial/8250/8250_fsl.c
> drivers/tty/serial/8250/8250_of.c
> include/linux/serial_8250.h
>=20
> No users of fsl8250_handle_irq in 8250_port.c.

Ah right, I was too quick:

	8250_of.o uses fsl8250_handle_irq() from 8250_fsl.o
	8250_fsl.o uses serial8250_modem_status() from 8250_port.o (which is in 82=
50_base.o)


However linking 8250_fsl.o in 8250_of.o isn't a good solution either as
8250_fsl.o should also be available with CONFIG_SERIAL_OF_PLATFORM
disabled to provide the ACPI driver. And as 8250_of.o already depends on
8250_port.o (e.g. via serial8250_em485_config()) adding 8250_fsl.o
together with 8250_port.o into 8250_base.ko is fine and doesn't add new
dependencies.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--67aykvgma767d2t7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR976AACgkQj4D7WH0S
/k4MGAf/VAEWzwsb0OBa1vOhvfkbQuHbzxtBbk4SzWstL1H66G7NOx0pYEhOLDBt
iqYVGKZCV55/BRtmAEKirmAzN2Md1jp0moODFRw8LCt6oEHONOJIJlAkasX20E3W
0eCtlz3MeTf0Ik4cVaV2x5XnmpaFKa4ZlycRx77ge/P/rV7f1phT62t8f032kbhu
5jKdgbQ8fHOxrOqwqCXfMc9BPsbXJOXomIFAPdmPQnTBF4Q7z9/CO83HASFQfucV
8ptleADX4EGVisg1/I+fzx8GVdN0PaRfiiN+VuilpyaIjXGq3MEGM0+E3NmG2Tu0
GfoDtqjgsgnrNQUQk+jOJkLB7seySg==
=tDp/
-----END PGP SIGNATURE-----

--67aykvgma767d2t7--
