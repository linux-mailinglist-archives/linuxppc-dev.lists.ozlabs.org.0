Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC72FBFE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 20:21:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKz5q4y70zDqvd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 06:21:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKz3Z1YVGzDqxl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 06:19:05 +1100 (AEDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l1wWT-0005To-Hy; Tue, 19 Jan 2021 20:18:37 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l1wWN-0007tb-CB; Tue, 19 Jan 2021 20:18:31 +0100
Date: Tue, 19 Jan 2021 20:18:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dany Madden <drt@linux.ibm.com>
Subject: Re: ibmvnic: Race condition in remove callback
Message-ID: <20210119191831.7tvf26tia7vcsp2n@pengutronix.de>
References: <20210117101242.dpwayq6wdgfdzirl@pengutronix.de>
 <b725079b34031595887b019d1d2f6fc7@imap.linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k4hz2aaja2cpa25v"
Content-Disposition: inline
In-Reply-To: <b725079b34031595887b019d1d2f6fc7@imap.linux.ibm.com>
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
Cc: Juliet Kim <julietk@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lijun Pan <ljp@linux.ibm.com>,
 kernel@pengutronix.de, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--k4hz2aaja2cpa25v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dany,

On Tue, Jan 19, 2021 at 10:14:25AM -0800, Dany Madden wrote:
> On 2021-01-17 02:12, Uwe Kleine-K=F6nig wrote:
> > while working on some cleanup I stumbled over a problem in the ibmvnic's
> > remove callback. Since commit
> >=20
> >         7d7195a026ba ("ibmvnic: Do not process device remove during
> > device reset")
> >=20
> > there is the following code in the remove callback:
> >=20
> >         static int ibmvnic_remove(struct vio_dev *dev)
> >         {
> >                 ...
> >                 spin_lock_irqsave(&adapter->state_lock, flags);
> >                 if (test_bit(0, &adapter->resetting)) {
> >                         spin_unlock_irqrestore(&adapter->state_lock,
> > flags);
> >                         return -EBUSY;
> >                 }
> >=20
> >                 adapter->state =3D VNIC_REMOVING;
> >                 spin_unlock_irqrestore(&adapter->state_lock, flags);
> >=20
> >                 flush_work(&adapter->ibmvnic_reset);
> >                 flush_delayed_work(&adapter->ibmvnic_delayed_reset);
> >                 ...
> >         }
> >=20
> > Unfortunately returning -EBUSY doesn't work as intended. That's because
> > the return value of this function is ignored[1] and the device is
> > considered unbound by the device core (shortly) after ibmvnic_remove()
> > returns.
>=20
> Oh! I was not aware of this.

There are not very many people who are aware. That's why I'm working on
making all these remove callbacks return void. (And that's how I stubled
over this driver's expectations when returning -EBUSY.)

> In our code review, a question on whether or not device reset should
> have a higher precedence over device remove was raised before. So, now
> it is clear that this driver has to take care of remove over reset.

Yes, either you have to sleep in .remove until the reset is completed,
or you cancel the request.

> > While looking into fixing that I noticed a worse problem:
> >=20
> > If ibmvnic_reset() (e.g. called by the tx_timeout callback) calls
> > schedule_work(&adapter->ibmvnic_reset); just after the work queue is
> > flushed above the problem that 7d7195a026ba intends to fix will trigger
> > resulting in a use-after-free.
>=20
> It was proposed that when coming into ibmvnic_remove() we lock down the
> workqueue to prevent future access, flush, cleanup, then unregister the
> device. Your thought on this?

This is already done a bit, as ibmvnic_reset() checks for adapter->state
=3D=3D VNIC_REMOVING. The problem is just that this check is racy.

> > Also ibmvnic_reset() checks for adapter->state without holding the lock
> > which might be racy, too.
>
> Suka started addressing consistent locking with this patch series:
> https://lists.openwall.net/netdev/2021/01/08/89
>=20
> He is reworking this.

Please understand that I won't look into this. This is not in my area of
expertise and interest and I'd like to consider this problem already
done for me with my report. I'm glad you're acting on it. Depending on
how quick this is fixed I plan to submit a patch that changes

	return -EBUSY;

to

	return 0;

to prepare changing the prototype of the remove callback to return void.

> Thank you for taking the time to review this driver, Uwe. This is very
> helpful for us.

You're welcome.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k4hz2aaja2cpa25v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAHMIQACgkQwfwUeK3K
7AntFQgAmr0IOZwp51V1vzHF0tc5kP+UsD+uAHogNIIyzA3RBWvyn2+jbGtdPMNg
USUS6HoyTiw46kW6iSZGpHaKSvxJtSqG6VCVDu2q1+xXrBZzwJcHqree+jeUiBzb
LUrK2AZBCYPiZuTBhOE50ldxTUfa7MQDbQiURGeuC2MXEnP0QfPq9XIXXhcBDHsv
y7FREkBCfHiPD4Bv8zLJlFNZACahB4EIUnJoj2gLtlaTetmwpseYTxc8xTKZ+4ur
T2Z37RNdub8ynHmOkwYvyh6iG6MMksTygL16tNLTJG+uy6DeUmoc6FwNg6BRt/lW
FurpfQVmpvR8ZlZH8y0LDxkkFCOQtw==
=m6FS
-----END PGP SIGNATURE-----

--k4hz2aaja2cpa25v--
