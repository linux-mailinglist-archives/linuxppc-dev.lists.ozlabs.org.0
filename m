Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511B41C5E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 15:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKHg90QTqz3bj5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 23:44:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKHfh5y3qz2yMH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 23:44:27 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVZs4-0002ro-Tl; Wed, 29 Sep 2021 15:43:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVZru-0005It-Cu; Wed, 29 Sep 2021 15:43:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVZru-0001Wi-AO; Wed, 29 Sep 2021 15:43:30 +0200
Date: Wed, 29 Sep 2021 15:43:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v5 10/11] PCI: Replace pci_dev::driver usage by
 pci_dev::dev.driver
Message-ID: <20210929134330.e5c57t7mtwu5iner@pengutronix.de>
References: <20210929085306.2203850-1-u.kleine-koenig@pengutronix.de>
 <20210929085306.2203850-11-u.kleine-koenig@pengutronix.de>
 <75dd6d60-08b9-fa68-352c-3a0c5a04c0ab@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ycp367bsarc33tfb"
Content-Disposition: inline
In-Reply-To: <75dd6d60-08b9-fa68-352c-3a0c5a04c0ab@linux.ibm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Oliver O'Halloran <oohall@gmail.com>,
 Jiri Olsa <jolsa@redhat.com>, Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kernel@pengutronix.de,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ycp367bsarc33tfb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 11:15:37PM +1000, Andrew Donnellan wrote:
> On 29/9/21 6:53 pm, Uwe Kleine-K=F6nig wrote:>   =09
> list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
> > -			if (afu_dev->driver && afu_dev->driver->err_handler &&
> > -			    afu_dev->driver->err_handler->resume)
> > -				afu_dev->driver->err_handler->resume(afu_dev);
> > +			struct pci_driver *afu_drv;
> > +			if (afu_dev->dev.driver &&
> > +			    (afu_drv =3D to_pci_driver(afu_dev->dev.driver))->err_handler &&
>=20
> I'm not a huge fan of assignments in if statements and if you send a v6 I=
'd
> prefer you break it up.

I'm not a huge fan either, I used it to keep the control flow as is and
without introducing several calls to to_pci_driver.

The whole code looks as follows:

	list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
		struct pci_driver *afu_drv;
		if (afu_dev->dev.driver &&
		    (afu_drv =3D to_pci_driver(afu_dev->dev.driver))->err_handler &&
		    afu_drv->err_handler->resume)
			afu_drv->err_handler->resume(afu_dev);
	}

Without assignment in the if it could look as follows:

	list_for_each_entry(afu_dev, &afu->phb->bus->devices, bus_list) {
		struct pci_driver *afu_drv;

		if (!afu_dev->dev.driver)
			continue;

		afu_drv =3D to_pci_driver(afu_dev->dev.driver));

		if (afu_drv->err_handler && afu_drv->err_handler->resume)
			afu_drv->err_handler->resume(afu_dev);
	}

Fine for me.

(Sidenote: What happens if the device is unbound directly after the
check for afu_dev->dev.driver? This is a problem the old code had, too
(assuming it is a real problem, didn't check deeply).)

> Apart from that everything in the powerpc and cxl sections looks good to =
me.

Thanks for checking.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ycp367bsarc33tfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFUbX8ACgkQwfwUeK3K
7Am1vgf4oAZW8TWGX7Ao47AspECT0eq6axIwcj5PXeVpv5NC7BZPYClTPkycpcUZ
q8GsCEDyP5ratJ0gW3XFPyCkvgml0ndAP8y5Cs1ZeE1rU6xCJivD/HWMBoTJvaIH
uWxKIKzt/IiZWdt4Wo+fYplgR1/fak8IgUcV7jWOXA7pVVcZB3enVL/cB6xinq/H
+T9nGsYMVfSfdJdcD/EHVePI34oVlE9Eor3g1MFzRHk21B+r9J/TxUCsj84/JW60
P//CUO5CrpsjnqvhmShEm8POvpOjaTXLPxxTh3Oan2WFcgc/8mNx5zaKFdM1Rjmg
YeZXa3sMNdP7hIFZvqylIJDO3SbK
=MbZA
-----END PGP SIGNATURE-----

--ycp367bsarc33tfb--
