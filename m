Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76F341AD08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 12:32:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJbS55JnCz305C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 20:32:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJbRd3lmXz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 20:32:27 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVAOh-0007IU-GX; Tue, 28 Sep 2021 12:31:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVAOX-0002lF-WD; Tue, 28 Sep 2021 12:31:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mVAOX-0003v8-Tx; Tue, 28 Sep 2021 12:31:29 +0200
Date: Tue, 28 Sep 2021 12:31:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH v4 4/8] PCI: replace pci_dev::driver usage that gets the
 driver name
Message-ID: <20210928103129.c3gcbnfbarezr3mm@pengutronix.de>
References: <20210927204326.612555-1-uwe@kleine-koenig.org>
 <20210927204326.612555-5-uwe@kleine-koenig.org>
 <20210928100127.GA16801@corigine.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="65t344eghsh2eaox"
Content-Disposition: inline
In-Reply-To: <20210928100127.GA16801@corigine.com>
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
Cc: Alexander Duyck <alexanderduyck@fb.com>, oss-drivers@corigine.com,
 Paul Mackerras <paulus@samba.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Ido Schimmel <idosch@nvidia.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Vadym Kochan <vkochan@marvell.com>, Michael Buesch <m@bues.ch>,
 Jiri Pirko <jiri@nvidia.com>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taras Chornyi <tchornyi@marvell.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--65t344eghsh2eaox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 12:01:28PM +0200, Simon Horman wrote:
> On Mon, Sep 27, 2021 at 10:43:22PM +0200, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > struct pci_dev::driver holds (apart from a constant offset) the same
> > data as struct pci_dev::dev->driver. With the goal to remove struct
> > pci_dev::driver to get rid of data duplication replace getting the
> > driver name by dev_driver_string() which implicitly makes use of struct
> > pci_dev::dev->driver.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> ...
>=20
> > diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c b/dri=
vers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
> > index 0685ece1f155..23dfb599c828 100644
> > --- a/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
> > +++ b/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
> > @@ -202,7 +202,7 @@ nfp_get_drvinfo(struct nfp_app *app, struct pci_dev=
 *pdev,
> >  {
> >  	char nsp_version[ETHTOOL_FWVERS_LEN] =3D {};
> > =20
> > -	strlcpy(drvinfo->driver, pdev->driver->name, sizeof(drvinfo->driver));
> > +	strlcpy(drvinfo->driver, dev_driver_string(&pdev->dev), sizeof(drvinf=
o->driver));
>=20
> I'd slightly prefer to maintain lines under 80 columns wide.
> But not nearly strongly enough to engage in a long debate about it.

:-)

Looking at the output of

	git grep strlcpy.\*sizeof

I wonder if it would be sensible to introduce something like

	#define strlcpy_array(arr, src) (strlcpy(arr, src, sizeof(arr)) + __must_b=
e_array(arr))

but not sure this is possible without a long debate either (and this
line is over 80 chars wide, too :-).

> In any case, for the NFP portion of this patch.
>=20
> Acked-by: Simon Horman <simon.horman@corigine.com>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--65t344eghsh2eaox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFS7v4ACgkQwfwUeK3K
7Al9pwf+I6TDjUNhtsTqkV/J+f3tcMtnjPMZH0hCqv+jXSkmBqkwvn8wxEQXGFBL
q6aNbMpy8LUCK3yn4+yes6FhZOK+CkMC6LgAv+Kzr43plzOCOvWTSDTi/nKx8sYf
JqmAcctxmEA1hkAuort6dCBezIVcHHCpWrnsUuokesFvURNzLkytUGekUAkR5NNj
g1aF021oqz88PJwyABeyfgrnCgwMSk8VlL39MdNJPUZewreVGija36YlIh/pFUyk
3TvYaY4JrCgqq7AfYcZbZwiqCpi1AxWWY+ACJOQlG4IDCzQr2I7c8IWI+8yxow5o
9j9Z8N/LPOHLfPGUNx5Cj8qLUoDiIw==
=IxWL
-----END PGP SIGNATURE-----

--65t344eghsh2eaox--
