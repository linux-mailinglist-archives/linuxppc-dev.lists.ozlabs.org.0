Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C92C6AB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 18:36:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjMHz65GFzDrhj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 04:36:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjMG66pb9zDrgv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 04:35:10 +1100 (AEDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kihdj-0007Oz-Uy; Fri, 27 Nov 2020 18:34:35 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kihdg-00033s-JD; Fri, 27 Nov 2020 18:34:32 +0100
Date: Fri, 27 Nov 2020 18:34:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Leonard Goehrs <l.goehrs@pengutronix.de>
Subject: Re: [PATCH] ALSA: ppc: remove redundant checks in PS3 driver probe
Message-ID: <20201127173430.cdfufayj3cbytdx7@pengutronix.de>
References: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
 <20201127152259.1470079-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x2xoi2yg7vw2oj4d"
Content-Disposition: inline
In-Reply-To: <20201127152259.1470079-1-l.goehrs@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: alsa-devel@alsa-project.org, geoff@infradead.org, tiwai@suse.com,
 perex@perex.cz, paulus@samba.org, kernel@pengutronix.de,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--x2xoi2yg7vw2oj4d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Leonard,

On Fri, Nov 27, 2020 at 04:22:59PM +0100, Leonard Goehrs wrote:
> The check for the FW_FEATURE_PS3_LV1 firmware feature is already performed
> in ps3_system_bus_init() before registering the driver. So if the probe
> function is actually used, this feature is already known to be available.
>=20
> The check for the match id is also superfluous; the condition is always
> true because the bus' match function (ps3_system_bus_match()) only
> considers this driver for devices having:
> dev->match_id =3D=3D snd_ps3_bus_driver_info.match_id.
>=20
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Leonard Goehrs <l.goehrs@pengutronix.de>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks for picking this up.

Best regards and have a nice week-end,
Uwe Kleine-K=F6nig

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--x2xoi2yg7vw2oj4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/BOKMACgkQwfwUeK3K
7AmJhwf+OJGfgynfv6pDuxi0y6ZDfmonepwmPvArhPNxed/UewGad/XtUkRxuh+S
axBDPcdEC8mxvW+ZyO+DMQY0zzQql63e+Ao1/g5SnP1MxuxWIndeMC/94SQy0IaJ
URI1y9N7cabNRalVvc6WMf7mNl8yfWU5SJBQt8DRh7VB+YlbywCWMfSc/bXC1nV6
GkgVRpAEeMs6tX8/9U1zvwzjMzXdm78Hy3Ptcz6E+PtcAXjs1QIXgsjWrKlBXr7b
kjc8Z6uIRjvIKOrDAQuiP4Zplq359Zy0FDPUoM0U6e2llQ5GT1EEW7nKwvcd9/Ri
1bhMMe4KNa+o8mDqBWVq0V9OQvDAlA==
=/9Ch
-----END PGP SIGNATURE-----

--x2xoi2yg7vw2oj4d--
