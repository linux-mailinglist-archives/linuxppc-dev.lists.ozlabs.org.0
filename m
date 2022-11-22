Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6429E6347FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 21:18:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGwZR2Qnbz3cck
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 07:18:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGwYt5rMGz3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 07:18:23 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oxZhX-0006Qx-Bo; Tue, 22 Nov 2022 21:17:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oxZhR-005v1B-UM; Tue, 22 Nov 2022 21:16:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oxZhS-000s7U-3N; Tue, 22 Nov 2022 21:16:58 +0100
Date: Tue, 22 Nov 2022 21:16:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <20221122201654.5rdaisqho33buibj@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221122185818.3740200d@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3mjk627u66tfbb3"
Content-Disposition: inline
In-Reply-To: <20221122185818.3740200d@jic23-huawei>
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
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, linux-pm@vger.kernel.org, linux-actions@lists.infradead.org, Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org, Angel Iglesias <ang.iglesiasg@gmail.com>, linux-rpi-kernel@lists.infradead.org, linux-am
 logic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, patches@opensource.cirrus.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--t3mjk627u66tfbb3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 06:58:18PM +0000, Jonathan Cameron wrote:
>=20
> Queued all of the below:
> with one tweaked as per your suggestion and the highlighted one dropped o=
n basis
> I was already carrying the equivalent - as you pointed out.
>=20
> I was already carrying the required dependency.
>=20
> Includes the IIO ones in staging.
>=20
> Thanks,
>=20
> Jonathan
>=20
> p.s. I perhaps foolishly did this in a highly manual way so as to
> also pick up Andy's RB.  So might have dropped one...

You could have done:

	H=3D$(git rev-parse @)
	b4 am -P 49-190 20221118224540.619276-1-uwe@kleine-koenig.org
	git am ...
	git filter-branch -f --msg-filter "grep -v 'Signed-off-by: Jonathan'; echo=
 'Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>'; echo '=
Signed-off-by: Jonathan Cameron <jic23@kernel.org>'" $H..

(untested, but you get the idea).

> Definitely would have been better as one patch per subsystem with
> a cover letter suitable for replies like Andy's to be picked up
> by b4.

Next time I will go for one series per subsystem which I like better
than one patch per subsystem.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t3mjk627u66tfbb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN9LjMACgkQwfwUeK3K
7An96wf/RMtsCSXVJy8BDrXiXMhey9OEm8p08ulRn0lKYlG54KR8nU/s77uuMjGS
99aUfUU56Abxk02DuBv6N5Bax8nlFyIlUgkfaYPP9iN1TkF5XiucQ0Se4/haYL4A
q11UqWIcKBS+5BL3K6Bl1Cqv4dPYpRvs99X3jlU6JmhFqJPPhPgAu0p74arSvLie
kN6wgOGVdCjZTRD+Z7FxfIQPZqvVo7anPAynyk7XfgTXMSAK80JPR2UeMfvQ7yr2
W28htsacTaJSnPOb1VIrhN8OytpxASYa120EJ8augNmBXC0IzvjosWI0LZnNljAU
izPd/d6lzDCP0Mz/LU9QCBYUR1jxuQ==
=KmMu
-----END PGP SIGNATURE-----

--t3mjk627u66tfbb3--
