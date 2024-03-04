Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB5B87102B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:36:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpYTj1rM5z3vXS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 09:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpYTG1bL2z2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 09:36:32 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhGv4-0008Vk-S2; Mon, 04 Mar 2024 23:36:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhGv1-004RE3-Kf; Mon, 04 Mar 2024 23:36:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhGv1-00H7Yf-1g;
	Mon, 04 Mar 2024 23:36:23 +0100
Date: Mon, 4 Mar 2024 23:36:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/11] misc: Convert to platform remove callback
 returning void
Message-ID: <p2rqzrmgfaqdcwj2hlgt7u2yrgfrf4dwizecicdpdmb3jezoky@zmkxw5vt7qyi>
References: <cover.1708508896.git.u.kleine-koenig@pengutronix.de>
 <d6c4ff9e-756a-4604-993a-cf14cfdbc53c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rqw7vqzv73lfjvx5"
Content-Disposition: inline
In-Reply-To: <d6c4ff9e-756a-4604-993a-cf14cfdbc53c@app.fastmail.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "derek.kiernan@amd.com" <derek.kiernan@amd.com>, Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Frederic Barrat <fbarrat@linux.ibm.com>, John Stultz <jstultz@google.com>, "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Justin Stitt <justinstitt@google.com>, Michal Simek <michal.simek@amd.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Tomas Winkler <tomas.winkler@intel.com>, Amol Maheshwari <amahesh@qti.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>, linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rqw7vqzv73lfjvx5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Arnd, hello Greg,

On Wed, Feb 21, 2024 at 02:52:29PM +0100, Arnd Bergmann wrote:
> On Wed, Feb 21, 2024, at 10:53, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >
> > this series converts all drivers below drivers/misc to struct
> > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> > Provide a remove callback that returns no value") for an extended
> > explanation and the eventual goal.
> >
> > All conversations are trivial, because their .remove() callbacks
> > returned zero unconditionally.
> >
> > There are no interdependencies between these patches, so they could be
> > picked up individually. But I'd hope that Greg or Arnd picks them up all
> > together.
>=20
> These all look good to me, whole series
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks.

You (=3D Arnd and Greg) are the listed maintainers for drivers/misc/. How
is this series supposed to be merged? Would a pull request help?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rqw7vqzv73lfjvx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXmTOYACgkQj4D7WH0S
/k7/bggAtLWuAbB65yreKqC3+3BQAW+yYHVR0gr5eF3xYgOQz1633vz0SPYZjaUe
v9bbou74JW3Qsav38qI+/Onjrk60Iov624KdbHUheuPaTwFsKne/+S+rFqZfAQpg
lrpDDpdBAZPeBWeqBUcy57wThrjH78HuAJyvSqldI4nxv0rjT1vYNlwChQ4IGsv9
Bu9oZAPJswmwB418yGlGb1SuyPgnbf78KkqHOy7GPwApOavIhjEqU+r5VZFEk/B5
RZ9smtJ/Rn+DrRUCV1rc0QUCLDkuT/bFFUaPwTI+2kY6NYA6CA7Nk361GfqSLvjx
Q/WnE2MMUAqxDf/RZIZulv6Jkz+u/A==
=hJf2
-----END PGP SIGNATURE-----

--rqw7vqzv73lfjvx5--
