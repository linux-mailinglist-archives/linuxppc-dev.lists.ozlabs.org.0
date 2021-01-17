Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B12F91A8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 11:15:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJW4b050tzDsWM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 21:14:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJW2m1fxpzDrS3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 21:13:19 +1100 (AEDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l153D-0002Ur-R1; Sun, 17 Jan 2021 11:12:51 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l1537-0004rN-6i; Sun, 17 Jan 2021 11:12:45 +0100
Date: Sun, 17 Jan 2021 11:12:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dany Madden <drt@linux.ibm.com>, Lijun Pan <ljp@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Juliet Kim <julietk@linux.vnet.ibm.com>
Subject: ibmvnic: Race condition in remove callback
Message-ID: <20210117101242.dpwayq6wdgfdzirl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5xx5owkdwvjrobm2"
Content-Disposition: inline
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, kernel@pengutronix.de,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5xx5owkdwvjrobm2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

while working on some cleanup I stumbled over a problem in the ibmvnic's
remove callback. Since commit

        7d7195a026ba ("ibmvnic: Do not process device remove during device =
reset")

there is the following code in the remove callback:

        static int ibmvnic_remove(struct vio_dev *dev)
        {
                ...
                spin_lock_irqsave(&adapter->state_lock, flags);
                if (test_bit(0, &adapter->resetting)) {
                        spin_unlock_irqrestore(&adapter->state_lock, flags);
                        return -EBUSY;
                }

                adapter->state =3D VNIC_REMOVING;
                spin_unlock_irqrestore(&adapter->state_lock, flags);

                flush_work(&adapter->ibmvnic_reset);
                flush_delayed_work(&adapter->ibmvnic_delayed_reset);
                ...
        }

Unfortunately returning -EBUSY doesn't work as intended. That's because
the return value of this function is ignored[1] and the device is
considered unbound by the device core (shortly) after ibmvnic_remove()
returns.

While looking into fixing that I noticed a worse problem:

If ibmvnic_reset() (e.g. called by the tx_timeout callback) calls
schedule_work(&adapter->ibmvnic_reset); just after the work queue is
flushed above the problem that 7d7195a026ba intends to fix will trigger
resulting in a use-after-free.

Also ibmvnic_reset() checks for adapter->state without holding the lock
which might be racy, too.

Best regards
Uwe

[1] vio_bus_remove (in arch/powerpc/platforms/pseries/vio.c) records the
    return value and passes it on. But the driver core doesn't care for
    the return value (see __device_release_driver() in drivers/base/dd.c
    calling dev->bus->remove()).

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5xx5owkdwvjrobm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAEDZYACgkQwfwUeK3K
7AkwBQf/c47PaHA1ggqrUFZW6gBFSWnb0WF0g1/68U3HbE+n0NneW5z6EzT9F+lF
zCKvZ21hhpaCya0ELqrJsjaHPsafl+GwbUFZWDXgzTZz3sSIVFEoRqAErOuhkkU9
qXo4hSOsz01PTwQLYd9UjzHnlAUGrhxSavJSuZkzFS/4h/f7pXjUiM0+R0Njz1ob
7UweVmKM4px/6MBOybthxtBohmcZgtBUT2+y8OHfo2972u+FTCjMdaGciOQk2v/+
8W3DjMHyWqgIiUnvRc/AZc2TiuEsthQtq/x1R/QO+dEX66l8oyqTYEWqs95Kk9kO
X3Bes4bDpvxoAp1vAdXBorxocl/BQQ==
=4xyH
-----END PGP SIGNATURE-----

--5xx5owkdwvjrobm2--
