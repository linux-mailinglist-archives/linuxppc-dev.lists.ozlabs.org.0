Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AC3E3573
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 15:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhjNC6FzLz3bT9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 23:08:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhcVh5mMCz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 19:29:15 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mCIc5-0000Og-1o; Sat, 07 Aug 2021 11:27:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mCIbl-0007UG-9f; Sat, 07 Aug 2021 11:27:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mCIbl-0007Ct-6j; Sat, 07 Aug 2021 11:27:09 +0200
Date: Sat, 7 Aug 2021 11:26:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 0/6] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20210807092645.52kn4ustyjudztvl@pengutronix.de>
References: <20210806064623.3lxl4clzbjpmchef@pengutronix.de>
 <20210806212452.GA1867870@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hfh2djfsv3k2boqr"
Content-Disposition: inline
In-Reply-To: <20210806212452.GA1867870@bjorn-Precision-5520>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Sat, 07 Aug 2021 23:08:41 +1000
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
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>, oss-drivers@corigine.com,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-perf-users@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Ido Schimmel <idosch@nvidia.com>, x86@kernel.org, qat-linux@intel.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Wojciech Ziemba <wojciech.ziemba@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Fiona Trahe <fiona.trahe@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Simon Horman <simon.horman@corigine.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, Jiri Pirko <jiri@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Juergen Gross <jgross@suse.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taras Chornyi <tchornyi@marvell.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--hfh2djfsv3k2boqr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 04:24:52PM -0500, Bjorn Helgaas wrote:
> On Fri, Aug 06, 2021 at 08:46:23AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, Aug 05, 2021 at 06:42:34PM -0500, Bjorn Helgaas wrote:
>=20
> > > I looked at all the bus_type.probe() methods, it looks like pci_dev is
> > > not the only offender here.  At least the following also have a driver
> > > pointer in the device struct:
> > >=20
> > >   parisc_device.driver
> > >   acpi_device.driver
> > >   dio_dev.driver
> > >   hid_device.driver
> > >   pci_dev.driver
> > >   pnp_dev.driver
> > >   rio_dev.driver
> > >   zorro_dev.driver
> >=20
> > Right, when I converted zorro_dev it was pointed out that the code was
> > copied from pci and the latter has the same construct. :-)
> > See
> > https://lore.kernel.org/r/20210730191035.1455248-5-u.kleine-koenig@peng=
utronix.de
> > for the patch, I don't find where pci was pointed out, maybe it was on
> > irc only.
>=20
> Oh, thanks!  I looked to see if you'd done something similar
> elsewhere, but I missed this one.
>=20
> > > Looking through the places that care about pci_dev.driver (the ones
> > > updated by patch 5/6), many of them are ... a little dubious to begin
> > > with.  A few need the "struct pci_error_handlers *err_handler"
> > > pointer, so that's probably legitimate.  But many just need a name,
> > > and should probably be using dev_driver_string() instead.
> >=20
> > Yeah, I considered adding a function to get the driver name from a
> > pci_dev and a function to get the error handlers. Maybe it's an idea to
> > introduce these two and then use to_pci_driver(pdev->dev.driver) for the
> > few remaining users? Maybe doing that on top of my current series makes
> > sense to have a clean switch from pdev->driver to pdev->dev.driver?!
>=20
> I'd propose using dev_driver_string() for these places:
>=20
>   eeh_driver_name() (could change callers to use dev_driver_string())
>   bcma_host_pci_probe()
>   qm_alloc_uacce()
>   hns3_get_drvinfo()
>   prestera_pci_probe()
>   mlxsw_pci_probe()
>   nfp_get_drvinfo()
>   ssb_pcihost_probe()

So the idea is:

	PCI: Simplify pci_device_remove()
	PCI: Drop useless check from pci_device_probe()
	xen/pci: Drop some checks that are always true

are kept as is as preparation. (Do you want to take them from this v2,
or should I include them again in v3?)

Then convert the list of functions above to use dev_driver_string() in a
4th patch.

> The use in mpt_device_driver_register() looks unnecessary: it's only
> to get a struct pci_device_id *, which is passed to ->probe()
> functions that don't need it.

This is patch #5.

> The use in adf_enable_aer() looks wrong: it sets the err_handler
> pointer in one of the adf_driver structs.  I think those structs
> should be basically immutable, and the drivers that call
> adf_enable_aer() from their .probe() methods should set
> ".err_handler =3D &adf_err_handler" in their static adf_driver
> definitions instead.

I don't understand that one without some research, probably this yields
at least one patch.

> I think that basically leaves these:
>=20
>   uncore_pci_probe()     # .id_table, custom driver "registration"
>   match_id()             # .id_table, arch/x86/kernel/probe_roms.c
>   xhci_pci_quirks()      # .id_table
>   pci_error_handlers()   # roll-your-own AER handling, drivers/misc/cxl/g=
uest.c
>=20
> I think it would be fine to use to_pci_driver(pdev->dev.driver) for
> these few.

Converting these will be patch 7 then and patch 8 can then drop the
duplicated handling.

Sounds reasonable?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hfh2djfsv3k2boqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEOUc0ACgkQwfwUeK3K
7AnHpgf/RF3DUcUr+MLq/SXC+ZFfynYOmvBgChskJ2ZCMYGHElw/XWeeZ3ypnETk
Bq9PLYeIZrTWUb6sDYkPOkeSkiNrYOAp2v1vkl8fGpTpxobnkCW2Rv2fYndODqw9
z5he4PjzBqPSO+LpWQ+XuW6OKaQaPijZm6SgH4JdVW2Etu1RiIeQHnTlFMkx2pd8
hn3lUEsH/SF+WGd7olILhZ/FxycXldBLR4CjQNbCJ1G7LZ6IuGu+Ir2TbrlnPMPD
RWuspO5voAOSEaTPlgGYELadA2nNr375R89u659MJOo/DssBdSaNaKik6udH5Vea
yvZvenIp8//zyIdZpD38UlFSayO1OQ==
=tPhD
-----END PGP SIGNATURE-----

--hfh2djfsv3k2boqr--
