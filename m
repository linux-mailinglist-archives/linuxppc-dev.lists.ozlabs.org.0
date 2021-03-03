Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507832B5D3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 09:00:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr5z5703sz3d3d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 19:00:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 935 seconds by postgrey-1.36 at boromir;
 Wed, 03 Mar 2021 19:00:33 AEDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr5yn0ps3z30L7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 19:00:32 +1100 (AEDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lHMBU-0002s8-Rd; Wed, 03 Mar 2021 08:44:40 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lHMBQ-0006Qi-JT; Wed, 03 Mar 2021 08:44:36 +0100
Date: Wed, 3 Mar 2021 08:44:36 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jiri Slaby <jslaby@suse.cz>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 40/44] tty: hvc, drop unneeded forward declarations
Message-ID: <20210303074436.keguljsgyvan6d5g@pengutronix.de>
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-40-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="prjodd2hjuh6jp2h"
Content-Disposition: inline
In-Reply-To: <20210302062214.29627-40-jslaby@suse.cz>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--prjodd2hjuh6jp2h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jiri,

On Tue, Mar 02, 2021 at 07:22:10AM +0100, Jiri Slaby wrote:
> Forward declarations make the code larger and rewrites harder. Harder as
> they are often omitted from global changes. Remove forward declarations
> which are not really needed, i.e. the definition of the function is
> before its first use.
>=20
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/tty/hvc/hvcs.c | 25 -------------------------

note this conflicts with commit 386a966f5ce71a0364b158c5d0a6971f4e418ea8
that currently sits in the powerpc tree. I think it's easy to resolve.

Other than that:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

>  1 file changed, 25 deletions(-)
>=20
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index c90848919644..0b89d878a108 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -290,36 +290,11 @@ static LIST_HEAD(hvcs_structs);
>  static DEFINE_SPINLOCK(hvcs_structs_lock);
>  static DEFINE_MUTEX(hvcs_init_mutex);
> =20
> -static void hvcs_unthrottle(struct tty_struct *tty);
> -static void hvcs_throttle(struct tty_struct *tty);
> -static irqreturn_t hvcs_handle_interrupt(int irq, void *dev_instance);
> -
> -static int hvcs_write(struct tty_struct *tty,
> -		const unsigned char *buf, int count);
> -static int hvcs_write_room(struct tty_struct *tty);
> -static int hvcs_chars_in_buffer(struct tty_struct *tty);
> -
> -static int hvcs_has_pi(struct hvcs_struct *hvcsd);
> -static void hvcs_set_pi(struct hvcs_partner_info *pi,
> -		struct hvcs_struct *hvcsd);
>  static int hvcs_get_pi(struct hvcs_struct *hvcsd);
>  static int hvcs_rescan_devices_list(void);
> =20
> -static int hvcs_partner_connect(struct hvcs_struct *hvcsd);
>  static void hvcs_partner_free(struct hvcs_struct *hvcsd);
> =20
> -static int hvcs_enable_device(struct hvcs_struct *hvcsd,
> -		uint32_t unit_address, unsigned int irq, struct vio_dev *dev);
> -
> -static int hvcs_open(struct tty_struct *tty, struct file *filp);
> -static void hvcs_close(struct tty_struct *tty, struct file *filp);
> -static void hvcs_hangup(struct tty_struct * tty);
> -
> -static int hvcs_probe(struct vio_dev *dev,
> -		const struct vio_device_id *id);
> -static int hvcs_remove(struct vio_dev *dev);
> -static int __init hvcs_module_init(void);
> -static void __exit hvcs_module_exit(void);
>  static int hvcs_initialize(void);
> =20
>  #define HVCS_SCHED_READ	0x00000001
> --=20
> 2.30.1
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--prjodd2hjuh6jp2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmA/PmEACgkQwfwUeK3K
7Ak/+QgAoaMQF3clqadoCfC+pLPxWDoOB9ZNxnHO1dNcFLtQHZEAJNwMZw9h/mxr
DY6thVwediWE2JI/e/c2XaF78mUy9KrMtd8TwTjKHCMhOzAlF9fRNra9eTLP+gBJ
QOJOIQntpeiolTtZTuy4bphiJe09YuuEZSr4zx0HgaECI811eyG+qLZWmPKeK2Jl
EYoZtx1uoKnlwrZOqbhkopk2U9st6Kt/oxzEjBF3NcMXDKjCfFvz9eCaklbwctPq
2e8MFy7Jg2dq2hrNIHBxRIAOu7H7Ba7oPMFnlJkoLdGdg3jyqMjjpQccJjZaSI+j
d6/csnS/+InQyjvZWcGPMCrZSCxvjg==
=/Ai0
-----END PGP SIGNATURE-----

--prjodd2hjuh6jp2h--
