Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDE6FC19B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 10:22:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFrkQ6f6zz3fN9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 18:22:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFrjt5CMvz3cM6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 18:22:10 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pwIbe-0005j4-4k; Tue, 09 May 2023 10:21:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pwIba-002BuQ-Oe; Tue, 09 May 2023 10:21:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pwIba-002iPP-3L; Tue, 09 May 2023 10:21:54 +0200
Date: Tue, 9 May 2023 10:21:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Drop MPC5200 LocalPlus bus FIFO driver
Message-ID: <20230509082153.jcy2qpvyd44bjaee@pengutronix.de>
References: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
 <20230412150524.ojsvukh47hing6db@pengutronix.de>
 <87zg7cabf6.fsf@mpe.ellerman.id.au>
 <20230413061642.kqkor4wkt7lp2mhp@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jz6b5qpi3ldmi55y"
Content-Disposition: inline
In-Reply-To: <20230413061642.kqkor4wkt7lp2mhp@pengutronix.de>
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
Cc: Anatolij Gustschin <agust@denx.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--jz6b5qpi3ldmi55y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Apr 13, 2023 at 08:16:42AM +0200, Uwe Kleine-K=F6nig wrote:
> While mpc5200b.dtsi contains a device that this driver can bind to, the
> only purpose of a bound device is to be used by the four exported functio=
ns
> mpc52xx_lpbfifo_submit(), mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll()
> and mpc52xx_lpbfifo_start_xfer(). However there are no callers to this
> function and so the driver is effectively superfluous and can be deleted.
> Also drop some defines and a struct from <asm/mpc52xx.h> that are unused
> now together with the declarations of the four mentioned functions.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello Michael,
>=20
> On Thu, Apr 13, 2023 at 10:11:25AM +1000, Michael Ellerman wrote:
> > Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
> > > On Wed, Dec 28, 2022 at 03:51:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > >> The four exported functions mpc52xx_lpbfifo_submit(),
> > >> mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll(), and
> > >> mpc52xx_lpbfifo_start_xfer() are not used. So they can be dropped an=
d the
> > >> definitions needed to call them can be moved into the driver file.
> > >>=20
> > >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >
> > > I never got feedback about this driver and it has not appeared in next
> > > up to now. Did it fell through the cracks?
> >=20
> > Yeah. I was hoping someone would explain what's going on with the
> > driver.
> >=20
> > Presumably there are some out-of-tree drivers that use the routines
> > provided by this driver?
>=20
> I googled for the function names but the only related hits were
> references to this thread :-)
>=20
> > I think rather than merging this patch, which keeps the code but makes
> > it completely useless, do you mind sending a patch to remove the whole
> > driver? Maybe that will get someone's attention.
>=20
> fair enough, here it is.

What is your thought about this patch? If you (also) think getting it
into next soon after a merge window closed, around now would be a good
opportunity to do so ..

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jz6b5qpi3ldmi55y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRaAqEACgkQj4D7WH0S
/k785Qf/ZliZLWmy9GKR+VccrZYE0nfkRJGLWHhQZhFn0In1A9R+uO+Gszh5rRZX
mH8vWixRKyYIW694+5Bcyg7SjXZzxDZQZzkDLi213lKZ60sbrxLKIgdhfjthEUoP
mKk4/I4WTPXn2RKcNGLHS828fi2cSk32bU9+WTQtWO4uKJxrv6ctW9pCWwHXQ/mj
8cGalx5YDNy38mSCtJ9se5pKES4NOSYcvPdD/xLIju5ZKyz4HIC5FZiNyNPDzh+f
F6U6VaSAME8hznCuZAEva2zZMdcEyc1WGGG38JmSKbXRFv+DiKrglvqcryzW4RsK
kRaqpzZJxx7GccK2FIsvaEJhi7SHXg==
=mgE1
-----END PGP SIGNATURE-----

--jz6b5qpi3ldmi55y--
