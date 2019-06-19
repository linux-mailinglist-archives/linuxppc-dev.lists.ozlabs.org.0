Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004E74B0DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 06:28:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TBly25fXzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 14:28:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TBkF2zMqzDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 14:27:16 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J4QaMo051082
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:27:13 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t7cvw2e34-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:27:13 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 19 Jun 2019 05:27:12 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 05:27:10 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5J4R91q60621002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 04:27:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDE724C040;
 Wed, 19 Jun 2019 04:27:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 412E84C044;
 Wed, 19 Jun 2019 04:27:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 04:27:09 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 37C37A018C;
 Wed, 19 Jun 2019 14:27:08 +1000 (AEST)
Date: Wed, 19 Jun 2019 14:27:07 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v2 3/6] powerpc/eeh: Improve debug messages around device
 addition
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
 <8deaedffad8ed3327f296a561c2a31c930c65f88.1557203383.git.sbobroff@linux.ibm.com>
 <ef181b9d-54df-23f9-2f06-f0f4d0bd8e8a@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <ef181b9d-54df-23f9-2f06-f0f4d0bd8e8a@ozlabs.ru>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19061904-0008-0000-0000-000002F4FFD6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061904-0009-0000-0000-00002262197D
Message-Id: <20190619042706.GA24143@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190035
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
Cc: oohall@gmail.com, linuxppc-dev@lists.ozlabs.org, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 03:47:58PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 07/05/2019 14:30, Sam Bobroff wrote:
> > Also remove useless comment.
> >=20
> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> >  arch/powerpc/kernel/eeh.c                    |  2 +-
> >  arch/powerpc/platforms/powernv/eeh-powernv.c | 14 ++++++++----
> >  arch/powerpc/platforms/pseries/eeh_pseries.c | 23 +++++++++++++++-----
> >  3 files changed, 28 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index 8d3c36a1f194..b14d89547895 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -1291,7 +1291,7 @@ void eeh_add_device_late(struct pci_dev *dev)
> >  	pdn =3D pci_get_pdn_by_devfn(dev->bus, dev->devfn);
> >  	edev =3D pdn_to_eeh_dev(pdn);
> >  	if (edev->pdev =3D=3D dev) {
> > -		pr_debug("EEH: Already referenced !\n");
> > +		pr_debug("EEH: Device %s already referenced!\n", pci_name(dev));
> >  		return;
> >  	}
> > =20
> > diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerp=
c/platforms/powernv/eeh-powernv.c
> > index 6fc1a463b796..0e374cdba961 100644
> > --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> > +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > @@ -50,10 +50,7 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
> >  	if (!pdev->is_virtfn)
> >  		return;
> > =20
> > -	/*
> > -	 * The following operations will fail if VF's sysfs files
> > -	 * aren't created or its resources aren't finalized.
> > -	 */
> > +	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev)=
);
>=20
>=20
> dev_dbg() seems more appropriate.

Oh! It does, or even pci_debug() :-)

I'll change it if I need to do another version, otherwise I'll clean it
up later.

> >  	eeh_add_device_early(pdn);
> >  	eeh_add_device_late(pdev);
> >  	eeh_sysfs_add_device(pdev);
> > @@ -397,6 +394,10 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, voi=
d *data)
> >  	int ret;
> >  	int config_addr =3D (pdn->busno << 8) | (pdn->devfn);
> > =20
> > +	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
> > +		__func__, hose->global_number, pdn->busno,
> > +		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
> > +
> >  	/*
> >  	 * When probing the root bridge, which doesn't have any
> >  	 * subordinate PCI devices. We don't have OF node for
> > @@ -491,6 +492,11 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, voi=
d *data)
> >  	/* Save memory bars */
> >  	eeh_save_bars(edev);
> > =20
> > +	pr_debug("%s: EEH enabled on %02x:%02x.%01x PHB#%x-PE#%x\n",
> > +		__func__, pdn->busno, PCI_SLOT(pdn->devfn),
> > +		PCI_FUNC(pdn->devfn), edev->pe->phb->global_number,
> > +		edev->pe->addr);
> > +
> >  	return NULL;
> >  }
> > =20
> > diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerp=
c/platforms/pseries/eeh_pseries.c
> > index 7aa50258dd42..ae06878fbdea 100644
> > --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> > +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> > @@ -65,6 +65,8 @@ void pseries_pcibios_bus_add_device(struct pci_dev *p=
dev)
> >  	if (!pdev->is_virtfn)
> >  		return;
> > =20
> > +	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev)=
);
> > +
> >  	pdn->device_id  =3D  pdev->device;
> >  	pdn->vendor_id  =3D  pdev->vendor;
> >  	pdn->class_code =3D  pdev->class;
> > @@ -251,6 +253,10 @@ static void *pseries_eeh_probe(struct pci_dn *pdn,=
 void *data)
> >  	int enable =3D 0;
> >  	int ret;
> > =20
> > +	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
> > +		__func__, pdn->phb->global_number, pdn->busno,
> > +		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
> > +
> >  	/* Retrieve OF node and eeh device */
> >  	edev =3D pdn_to_eeh_dev(pdn);
> >  	if (!edev || edev->pe)
> > @@ -294,7 +300,12 @@ static void *pseries_eeh_probe(struct pci_dn *pdn,=
 void *data)
> > =20
> >  	/* Enable EEH on the device */
> >  	ret =3D eeh_ops->set_option(&pe, EEH_OPT_ENABLE);
> > -	if (!ret) {
> > +	if (ret) {
> > +		pr_debug("%s: EEH failed to enable on %02x:%02x.%01x PHB#%x-PE#%x (c=
ode %d)\n",
> > +			__func__, pdn->busno, PCI_SLOT(pdn->devfn),
> > +			PCI_FUNC(pdn->devfn), pe.phb->global_number,
> > +			pe.addr, ret);
> > +	} else {
>=20
>=20
> edev!=3DNULL here so you could do dev_dbg(&edev->pdev->dev,...) and skip
> PCI_SLOT/PCI_FUNC. Or is (edev!=3DNULL && edev->pdev=3D=3DNULL) possible =
(it
> could be, just asking)?

I can see that edev will be non-NULL here, but that pr_debug() pattern
(using the PDN information to form the PCI address) is quite common
across the EEH code, so I think rather than changing a couple of
specific cases, I should do a separate cleanup patch and introduce
something like pdn_debug(pdn, "...."). What do you think?

(I don't know exactly when edev->pdev can be NULL.)

>=20
> >  		/* Retrieve PE address */
> >  		edev->pe_config_addr =3D eeh_ops->get_pe_addr(&pe);
> >  		pe.addr =3D edev->pe_config_addr;
> > @@ -310,11 +321,6 @@ static void *pseries_eeh_probe(struct pci_dn *pdn,=
 void *data)
> >  		if (enable) {
> >  			eeh_add_flag(EEH_ENABLED);
> >  			eeh_add_to_parent_pe(edev);
> > -
> > -			pr_debug("%s: EEH enabled on %02x:%02x.%01x PHB#%x-PE#%x\n",
> > -				__func__, pdn->busno, PCI_SLOT(pdn->devfn),
> > -				PCI_FUNC(pdn->devfn), pe.phb->global_number,
> > -				pe.addr);
> >  		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
> >  			   (pdn_to_eeh_dev(pdn->parent))->pe) {
> >  			/* This device doesn't support EEH, but it may have an
> > @@ -323,6 +329,11 @@ static void *pseries_eeh_probe(struct pci_dn *pdn,=
 void *data)
> >  			edev->pe_config_addr =3D pdn_to_eeh_dev(pdn->parent)->pe_config_add=
r;
> >  			eeh_add_to_parent_pe(edev);
> >  		}
> > +		pr_debug("%s: EEH %s on %02x:%02x.%01x PHB#%x-PE#%x (code %d)\n",
> > +			__func__, (enable ? "enabled" : "unsupported"),
> > +			pdn->busno, PCI_SLOT(pdn->devfn),
> > +			PCI_FUNC(pdn->devfn), pe.phb->global_number,
> > +			pe.addr, ret);
>=20
> Same here. I understand though this one is a cut-n-paste :)
>=20
>=20
> >  	}
> > =20
> >  	/* Save memory bars */
> >=20
>=20
> --=20
> Alexey

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0JuZIACgkQMX8w6AQl
/iJ9NQf/aQkPfMPWmdhHVrXjbvLb5F0+ByKqggsbbf1DGQA2G5J85fXYAf5sNAK5
WqVevt2ZTIEJ0qzlu4hsYgTvpp2SeiFzJKUHsiMf788TemNr/DNk75y7pluZ+8Lm
qrMRqb7F7h2NMrrE2mY107ghUYuLVwFq6llyxBWl0u2g2PLF+xPHuibI03zhdfeE
TkyF15jya+OVSIaOQeh9rxhX1jPWI6hPuTIfzTsDMvfsKrPWIbm9S+NYZdzqHpwv
z3HHetLGOro1UfmBMxMR6wnq7MMR8ZVvjA4mBmGhtX91VZQfinn/PQkkBTKvMlu6
oIj9gltGhEAKtT3w5e2vSXlvdynQhw==
=R3Zx
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--

