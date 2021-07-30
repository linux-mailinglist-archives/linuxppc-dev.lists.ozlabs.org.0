Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A00283DC29A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 04:20:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gc7K34ZHMz3d81
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 12:20:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gbw095fZhz3bPZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 03:50:00 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9Wcc-00064T-I3; Fri, 30 Jul 2021 19:48:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9WcO-0005qH-Ky; Fri, 30 Jul 2021 19:48:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m9WcO-00079n-I5; Fri, 30 Jul 2021 19:48:20 +0200
Date: Fri, 30 Jul 2021 19:48:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v1 0/5] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20210730174820.i6ycjyvyzxcxwxsc@pengutronix.de>
References: <20210729203740.1377045-1-u.kleine-koenig@pengutronix.de>
 <YQOy/OTvY66igEoe@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t5ueb7xyetl6m7j3"
Content-Disposition: inline
In-Reply-To: <YQOy/OTvY66igEoe@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Sat, 31 Jul 2021 12:20:05 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>,
 x86@kernel.org, oss-drivers@corigine.com, netdev@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Mackerras <paulus@samba.org>, Taras Chornyi <tchornyi@marvell.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Sathya Prakash <sathya.prakash@broadcom.com>, qat-linux@intel.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Fiona Trahe <fiona.trahe@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ido Schimmel <idosch@nvidia.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Wojciech Ziemba <wojciech.ziemba@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--t5ueb7xyetl6m7j3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Jul 30, 2021 at 11:06:20AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 29, 2021 at 10:37:35PM +0200, Uwe Kleine-K=F6nig wrote:
> > struct pci_dev tracks the bound pci driver twice. This series is about
> > removing this duplication.
> >=20
> > The first two patches are just cleanups. The third patch introduces a
> > wrapper that abstracts access to struct pci_dev->driver. In the next
> > patch (hopefully) all users are converted to use the new wrapper and
> > finally the fifth patch removes the duplication.
> >=20
> > Note this series is only build tested (allmodconfig on several
> > architectures).
> >=20
> > I'm open to restructure this series if this simplifies things. E.g. the
> > use of the new wrapper in drivers/pci could be squashed into the patch
> > introducing the wrapper. Patch 4 could be split by maintainer tree or
> > squashed into patch 3 completely.
>=20
> I see only patch 4 and this cover letter...

The full series is available at

	https://lore.kernel.org/linux-pci/20210729203740.1377045-1-u.kleine-koenig=
@pengutronix.de/

All patches but #4 only touch drivers/pci/ (and include/linux/pci.h) and
it seemed excessive to me to send all patches to all people. It seems at
least for you I balanced this wrongly. The short version is that patch
#3 introduces

	+#define pci_driver_of_dev(pdev) ((pdev)->driver)

which allows to do the stuff done in patch #4 and then patch #5 does

	-#define pci_driver_of_dev(pdev) ((pdev)->driver)
	+#define pci_driver_of_dev(pdev) ((pdev)->dev.driver ? to_pci_driver((pdev=
)->dev.driver) : NULL)

plus some cleanups.

If you want I can send you a bounce (or you try

	b4 am 20210729203740.1377045-1-u.kleine-koenig@pengutronix.de

).

Best regards and thanks for caring,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t5ueb7xyetl6m7j3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEEO2EACgkQwfwUeK3K
7AkOCgf/UKvRbSIrjjdKl0HWJofJEfaXlbATSgBausmxV/dcXsg1sLkhkpTN66bG
WmAdhFN03Vtx3jHKeYtgo3x8g39nfYT4NmlYTNumgxTow6TESnJxbYewE3i0alrR
Jv0JvBFhUaXj++XetOVHn9f5/t7o5NL/XSF5DTwQM8lZ5skmA2+XXea8lU0IFufZ
uTi0XA3G5BNhyU6RiehvnN59J6QCN3CIVqajOrZbqf33jiiyCTDf2tEqCYRbv1vJ
zqt7zYp05RtUaqNKe9oH4N4UFCdChrjZlFP7w7gyqM6Jh/wOSERlVdpocf0BGClR
W6o7YIB7QFf+ByIxy6hIBeXnaPaDFQ==
=oi24
-----END PGP SIGNATURE-----

--t5ueb7xyetl6m7j3--
