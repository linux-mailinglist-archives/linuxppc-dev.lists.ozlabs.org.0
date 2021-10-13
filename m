Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32F42CF91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 02:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV9KQ5t9Zz3blF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 11:30:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTqM20hyvz2yWH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 22:00:28 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mabyZ-0005e3-LW; Wed, 13 Oct 2021 12:59:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mabyL-0005Lr-7I; Wed, 13 Oct 2021 12:58:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mabyL-0007HS-2y; Wed, 13 Oct 2021 12:58:57 +0200
Date: Wed, 13 Oct 2021 12:58:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 00/11] PCI: Drop duplicated tracking of a pci_dev's
 bound driver
Message-ID: <20211013105856.yve6n5zu625im5fo@pengutronix.de>
References: <20211013085131.5htnch5p6zv46mzn@pengutronix.de>
 <20211013105428.GA1890798@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="52e44hxpwffbx22b"
Content-Disposition: inline
In-Reply-To: <20211013105428.GA1890798@bhelgaas>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Thu, 14 Oct 2021 11:29:19 +1100
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-pci@vger.kernel.org, Alexander Duyck <alexanderduyck@fb.com>,
 qat-linux@intel.com, oss-drivers@corigine.com,
 Oliver O'Halloran <oohall@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Olsa <jolsa@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marco Chiappero <marco.chiappero@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Fiona Trahe <fiona.trahe@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ido Schimmel <idosch@nvidia.com>, Simon Horman <simon.horman@corigine.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Wojciech Ziemba <wojciech.ziemba@intel.com>, Jack Xu <jack.xu@intel.com>,
 Borislav Petkov <bp@alien8.de>, Michael Buesch <m@bues.ch>,
 Jiri Pirko <jiri@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Namhyung Kim <namhyung@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, xen-devel@lists.xenproject.org,
 Vadym Kochan <vkochan@marvell.com>, MPT-FusionLinux.pdl@broadcom.com,
 Taras Chornyi <tchornyi@marvell.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Tomaszx Kowalik <tomaszx.kowalik@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-perf-users@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--52e44hxpwffbx22b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Oct 13, 2021 at 05:54:28AM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 13, 2021 at 10:51:31AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, Oct 12, 2021 at 06:32:12PM -0500, Bjorn Helgaas wrote:
> > > diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
> > > index d997c9c3ebb5..7eb3706cf42d 100644
> > > --- a/drivers/misc/cxl/guest.c
> > > +++ b/drivers/misc/cxl/guest.c
> > > @@ -20,38 +20,38 @@ static void pci_error_handlers(struct cxl_afu *af=
u,
> > >  				pci_channel_state_t state)
> > >  {
> > >  	struct pci_dev *afu_dev;
> > > +	struct pci_driver *afu_drv;
> > > +	struct pci_error_handlers *err_handler;
> >=20
> > These two could be moved into the for loop (where afu_drv was with my
> > patch already). This is also possible in a few other drivers.
>=20
> That's true, they could.  I tried to follow the prevailing style in
> the file.  At least in cxl, I didn't see any other cases of
> declarations being in the minimal scope like that.

I don't care much, do whatever you consider nice. I'm happy you liked
the cleanup and that you took it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--52e44hxpwffbx22b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFmu+0ACgkQwfwUeK3K
7AnoGgf+Org0o7CctF9VMJ1cRL0/n994P0Xf4J0pVgDihRJKx2m6225saLIOfR9c
tezswS1SpHGF0jh6VVcc26om68F6diINTuhV9HjdShrJ3OqoifBqUQ+ggPRWVaT5
KB06t/1umM6bzcXmVvhwDX4+amPeFwfSPynHBfhudbA6DLwhCVuJk+109EvvuLlm
u79Qp7+p4PyMwo699ubwQFekrSsf72gzSOfuRBPqHqx0SWbSUPlUyLyolxtsUD22
7/ex/TOt2JrmP7lFEfLhrONg7BvlEBUokQ5MGQqxdyP/djPUVbtDoM3iX0kC7x2A
Fa44dFbWF/D3+K4X5Cesu+BfzXP+rA==
=xGeM
-----END PGP SIGNATURE-----

--52e44hxpwffbx22b--
