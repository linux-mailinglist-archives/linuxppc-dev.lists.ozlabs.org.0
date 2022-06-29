Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB2560163
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 15:35:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY2Xd69q8z3dsV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 23:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY2X954qGz3cBp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 23:35:20 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6Xqa-0006SP-06; Wed, 29 Jun 2022 15:35:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6XqQ-003PNQ-Vz; Wed, 29 Jun 2022 15:35:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6XqT-001txR-NY; Wed, 29 Jun 2022 15:35:05 +0200
Date: Wed, 29 Jun 2022 15:35:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220629133504.syc6x4ptia3mnof5@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <CAPAsAGwP4Mw_CJfsi7oapABdTBwO1HfiQux6X4UahspU74VjtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5z6hgi6euioj5d47"
Content-Disposition: inline
In-Reply-To: <CAPAsAGwP4Mw_CJfsi7oapABdTBwO1HfiQux6X4UahspU74VjtQ@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org, Pe
 ngutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5z6hgi6euioj5d47
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped most people from Cc, keeping only lists]

On Wed, Jun 29, 2022 at 04:11:26PM +0300, Andrey Ryabinin wrote:
> On 6/28/22 17:03, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >
> > The value returned by an i2c driver's remove function is mostly ignored.
> > (Only an error message is printed if the value is non-zero that the
> > error is ignored.)
> >
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour, all callbacks were prepared to
> > return 0 before.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>                                     | 2 +-
> >  lib/Kconfig.kasan                                         | 1 +
>=20
> > diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> > index f0973da583e0..366e61639cb2 100644
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -149,6 +149,7 @@ config KASAN_STACK
> >       depends on KASAN_GENERIC || KASAN_SW_TAGS
> >       depends on !ARCH_DISABLE_KASAN_INLINE
> >       default y if CC_IS_GCC
> > +     depends on !ARM
> >       help
> >         Disables stack instrumentation and thus KASAN's ability to dete=
ct
> >         out-of-bounds bugs in stack variables.
>=20
>=20
> What is this doing here?

Huh, that is wrong. I needed that for build testing, but it shouldn't
have been added to the patch. I'm dropping that for the final
submission.

Thanks for spotting.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5z6hgi6euioj5d47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK8VQUACgkQwfwUeK3K
7AkL0wf/Ra+JtsXozoGjhV4ADtJcJAo/mOIZQ6qOdPZGqHYkMvBmkEJ9zbvY4Edk
SwYoapiHgVT4tDX56ekEGnm/x3udNUt5wugpsqDm4oAgYtbBCMEVtHbp3t/AqMp2
sZcn0JsvUs6FVWSTomD396Pt10x0r+JrPTJVY2pwj1nUUV63/25oIT/4I77IughK
LvQBMIesHK9damtObmRGqI5Ljz1L6SP7WgiLSEq1R/LjSeEwbURT3ijca95YO2Jv
YyxoC7TiNJj2uJiisjl/r1T/LdGF6RpMN197XQjcvaZ0sbTZRF2vXlqp3cSyXrCG
BbT2nohQYXjznouz9TIuBFtA0iX7SA==
=YEZr
-----END PGP SIGNATURE-----

--5z6hgi6euioj5d47--
