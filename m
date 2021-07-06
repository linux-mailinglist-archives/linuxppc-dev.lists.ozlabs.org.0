Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B93BD741
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 14:55:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK2Zq6QZgz3f92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 22:54:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK1mG2jsCz2ysm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 22:18:04 +1000 (AEST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m0jyc-0001jk-4o; Tue, 06 Jul 2021 14:14:58 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m0jyP-0001fC-Gy; Tue, 06 Jul 2021 14:14:45 +0200
Date: Tue, 6 Jul 2021 14:14:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] bus: Make remove callback return void
Message-ID: <20210706121445.o3nxgi4bhzrw5w73@pengutronix.de>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
 <87pmvvhfqq.fsf@redhat.com> <87mtqzhesu.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qlv3rwmw2vf6tbvn"
Content-Disposition: inline
In-Reply-To: <87mtqzhesu.fsf@redhat.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 06 Jul 2021 22:48:04 +1000
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
Cc: nvdimm@lists.linux.dev, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Alison Schofield <alison.schofield@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mike Christie <michael.christie@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Takashi Iwai <tiwai@suse.com>, linux-acpi@vger.kernel.org,
 Tom Rix <trix@redhat.com>, xen-devel@lists.xenproject.org,
 Tomas Winkler <tomas.winkler@intel.com>, Jason Wang <jasowang@redhat.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Alex Williamson <alex.williamson@redhat.com>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 kernel@pengutronix.de, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, linux-media@vger.kernel.org,
 David Woodhouse <dwmw@amazon.co.uk>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 target-devel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>,
 Helge Deller <deller@gmx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 industrypack-devel@lists.sourceforge.net, Wu Hao <hao.wu@intel.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, greybus-dev@lists.linaro.org,
 Frank Li <lznuaa@gmail.com>, Mark Gross <mgross@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Joey Pabalan <jpabalanb@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Len Brown <lenb@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-pci@vger.kernel.org, Julien Grall <jgrall@amazon.com>,
 SeongJae Park <sjpark@amazon.de>, linux-hyperv@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, Qinglang Miao <miaoqinglang@huawei.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Allen Hubbe <allenbh@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Jiri Kosina <jikos@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Ben Widawsky <ben.widawsky@intel.com>, Moritz Fischer <mdf@kernel.org>,
 linux-cxl@vger.kernel.org, Michael Buesch <m@bues.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Martyn Welch <martyn@welchs.me.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Sven Van Asbroeck <TheSven73@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Vishal Verma <vishal.l.verma@intel.com>, Russell King <linux@armlinux.org.uk>,
 Thorsten Scherer <t.scherer@eckelmann.de>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Johan Hovold <johan@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Juergen Gross <jgross@suse.com>,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--qlv3rwmw2vf6tbvn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 01:17:37PM +0200, Cornelia Huck wrote:
> On Tue, Jul 06 2021, Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> > On Tue, Jul 06 2021, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de=
> wrote:
> >
> >> The driver core ignores the return value of this callback because there
> >> is only little it can do when a device disappears.
> >>
> >> This is the final bit of a long lasting cleanup quest where several
> >> buses were converted to also return void from their remove callback.
> >> Additionally some resource leaks were fixed that were caused by drivers
> >> returning an error code in the expectation that the driver won't go
> >> away.
> >>
> >> With struct bus_type::remove returning void it's prevented that newly
> >> implemented buses return an ignored error code and so don't anticipate
> >> wrong expectations for driver authors.
> >
> > Yay!
> >
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >> ---
> >> Hello,
> >>
> >> this patch depends on "PCI: endpoint: Make struct pci_epf_driver::remo=
ve
> >> return void" that is not yet applied, see
> >> https://lore.kernel.org/r/20210223090757.57604-1-u.kleine-koenig@pengu=
tronix.de.
> >>
> >> I tested it using allmodconfig on amd64 and arm, but I wouldn't be
> >> surprised if I still missed to convert a driver. So it would be great =
to
> >> get this into next early after the merge window closes.
> >
> > I'm afraid you missed the s390-specific busses in drivers/s390/cio/
> > (css/ccw/ccwgroup).

:-\

> The change for vfio/mdev looks good.
>=20
> The following should do the trick for s390; not sure if other
> architectures have easy-to-miss busses as well.
>=20
> diff --git a/drivers/s390/cio/ccwgroup.c b/drivers/s390/cio/ccwgroup.c
> index 9748165e08e9..a66f416138ab 100644
> --- a/drivers/s390/cio/ccwgroup.c
> +++ b/drivers/s390/cio/ccwgroup.c
> @@ -439,17 +439,15 @@ module_exit(cleanup_ccwgroup);
> =20
>  /************************** driver stuff ******************************/
> =20
> -static int ccwgroup_remove(struct device *dev)
> +static void ccwgroup_remove(struct device *dev)
>  {
>  	struct ccwgroup_device *gdev =3D to_ccwgroupdev(dev);
>  	struct ccwgroup_driver *gdrv =3D to_ccwgroupdrv(dev->driver);
> =20
>  	if (!dev->driver)
> -		return 0;
> +		return;

This is fine to be squashed into my patch. In the long run: in a remove
callback dev->driver cannot be NULL, so this if could go away.

>  	if (gdrv->remove)
>  		gdrv->remove(gdev);
> -
> -	return 0;
>  }
> =20
>  static void ccwgroup_shutdown(struct device *dev)
> diff --git a/drivers/s390/cio/css.c b/drivers/s390/cio/css.c
> index a974943c27da..ebc321edba51 100644
> --- a/drivers/s390/cio/css.c
> +++ b/drivers/s390/cio/css.c
> @@ -1371,15 +1371,14 @@ static int css_probe(struct device *dev)
>  	return ret;
>  }
> =20
> -static int css_remove(struct device *dev)
> +static void css_remove(struct device *dev)
>  {
>  	struct subchannel *sch;
> -	int ret;
> =20
>  	sch =3D to_subchannel(dev);
> -	ret =3D sch->driver->remove ? sch->driver->remove(sch) : 0;
> +	if (sch->driver->remove)
> +		sch->driver->remove(sch);

Maybe the return type for this function pointer can be changed to void,
too.

I will add these changes to a v2 that I plan to send out after the dust
settles some more.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qlv3rwmw2vf6tbvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDkSTIACgkQwfwUeK3K
7AmpKwf/cEGBSAtr38Z6g8D5Sb7wD6N+VKt79z1eeeFykI81lxaibOS1hxqeDq28
jW5itKeFVh1+cP8UVt8l7VJlvhIUO+xFsMgJ/LrRGoynkDBqMdlbTfQnZ/yOULyX
KI6vecR8mDHh+M0cs+KxsmbHXtKL+WJfAnGYMVFhrq7cayZ2ZnflKlVAFFyN1iWR
ewHXQduLqDi718k76IDgu9PZfUuQbRNLuX69ZAwyVl1F+BpBxMCvnMU2apcdJQ1B
ovWeCbDSh+HLgMrfUAYcVddvRKo81lrMn1i24FK2RuVnrnYdupIRl3L+Y5V4D7Pd
xOqLOUY6yncBK5uZwnZctg9p3aX8wA==
=Zesi
-----END PGP SIGNATURE-----

--qlv3rwmw2vf6tbvn--
