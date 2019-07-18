Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0FE6C8B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 07:26:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q2fl6TmYzDqc7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 15:26:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q2cm2DDSzDq74
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:24:23 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6I5LqGP046992
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 01:24:20 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttf28er0h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 01:24:19 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 18 Jul 2019 06:24:17 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 18 Jul 2019 06:24:16 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6I5OFEX44695592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 05:24:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29CBD11C04A;
 Thu, 18 Jul 2019 05:24:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7941A11C054;
 Thu, 18 Jul 2019 05:24:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jul 2019 05:24:14 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DC290A010A;
 Thu, 18 Jul 2019 15:24:12 +1000 (AEST)
Date: Thu, 18 Jul 2019 15:24:11 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v2 3/6] powerpc/eeh: Improve debug
 messages around device addition
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
 <8deaedffad8ed3327f296a561c2a31c930c65f88.1557203383.git.sbobroff@linux.ibm.com>
 <ef181b9d-54df-23f9-2f06-f0f4d0bd8e8a@ozlabs.ru>
 <20190619042706.GA24143@tungsten.ozlabs.ibm.com>
 <e8f68068-bb62-6d2e-f484-d6a111811fbc@ozlabs.ru>
 <CAOSf1CFwj93TYGppJVU5djEe4TN6ezo36G=DxWbFU4buaCWM4g@mail.gmail.com>
 <20190716064827.GF3645@tungsten.ozlabs.ibm.com>
 <8cadf8fd4540c2e3ca2426fc195226aa93bdbe65.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <8cadf8fd4540c2e3ca2426fc195226aa93bdbe65.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19071805-4275-0000-0000-0000034E4D50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071805-4276-0000-0000-0000385E64F2
Message-Id: <20190718052411.GA11251@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180061
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2019 at 05:00:44PM +1000, Oliver O'Halloran wrote:
> On Tue, 2019-07-16 at 16:48 +1000, Sam Bobroff wrote:
> > On Thu, Jun 20, 2019 at 01:45:24PM +1000, Oliver O'Halloran wrote:
> > > On Thu, Jun 20, 2019 at 12:40 PM Alexey Kardashevskiy <aik@ozlabs.ru>=
 wrote:
> > > > On 19/06/2019 14:27, Sam Bobroff wrote:
> > > > > On Tue, Jun 11, 2019 at 03:47:58PM +1000, Alexey Kardashevskiy wr=
ote:
> > > > > > On 07/05/2019 14:30, Sam Bobroff wrote:
> > > > > > > Also remove useless comment.
> > > > > > >=20
> > > > > > > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > > > > > > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > > > > > ---
> > > > *snip*
> > > > > I can see that edev will be non-NULL here, but that pr_debug() pa=
ttern
> > > > > (using the PDN information to form the PCI address) is quite comm=
on
> > > > > across the EEH code, so I think rather than changing a couple of
> > > > > specific cases, I should do a separate cleanup patch and introduce
> > > > > something like pdn_debug(pdn, "...."). What do you think?
> > > >=20
> > > > I'd switch them all to already existing dev_dbg/pci_debug rather th=
an
> > > > adding pdn_debug as imho it should not have been used in the first =
place
> > > > really...
> > > >=20
> > > > > (I don't know exactly when edev->pdev can be NULL.)
> > > >=20
> > > > ... and if you switch to dev_dbg/pci_debug, I think quite soon you'=
ll
> > > > know if it can or cannot be NULL :)
> > >=20
> > > As far as I can tell edev->pdev is NULL in two cases:
> > >=20
> > > 1. Before eeh_device_add_late() has been called on the pdev. The late
> > > part of the add maps the pdev to an edev and sets the pdev's edev
> > > pointer and vis a vis.
> > > 2. While recoverying EEH unaware devices. Unaware devices are
> > > destroyed and rescanned and the edev->pdev pointer is cleared by
> > > pcibios_device_release()
> > >=20
> > > In most of these cases it should be safe to use the pci_*() functions
> > > rather than making a new one up for printing pdns. In the cases where
> > > we might not have a PCI dev i'd make a new set of prints that take an
> > > EEH dev rather than a pci_dn since i'd like pci_dn to die sooner
> > > rather than later.
> > >=20
> > > Oliver
> >=20
> > I'll change the calls in {pnv,pseries}_pcibios_bus_add_device() and
> > eeh_add_device_late() to use dev_dbg() and post a new version.
> >=20
> > For {pnv,pseries}_eeh_probe() I'm not sure what we can do; there's no
> > pci_dev available yet and while it would be nice to use the eeh_dev
> > rather than the pdn, it doesn't seem to have the bus/device/fn
> > information we need. Am I missing something there?  (The code in the
> > probe functions seems to get it from the pci_dn.)
>=20
> We do have a pci_dev in the powernv case since pnv_eeh_probe() isn't
> called until the late probe happens (which is after the pci_dev has
> been created). I've got some patches to rework the probe path to make
> this a bit clearer, but they need a bit more work.
>=20
> >=20
> > If there isn't an easy way around this, would it therefore be reasonable
> > to just leave them open-coded as they are?
>=20
> I've had this patch floating around a while that should do the trick.
> The PCI_BUSNO macro is probably unnecessary since I'm sure there is
> something that does it in generic code, but I couldn't find it.

Looks good, I'll try including it and create a dev_dbg style function
or macro that takes an edev.

I don't think I can use it in the pcibios bus add device handlers (where
there is no edev, or where it may be attached to the wrong device) but
I'll use it for all the other cases.

If it works out well I can follow up and update more of the EEH logging
to use it :-)

> From 61ff8c23c4d13ff640fb2d069dcedacdf2ee22dd Mon Sep 17 00:00:00 2001
> From: Oliver O'Halloran <oohall@gmail.com>
> Date: Thu, 18 Apr 2019 18:25:13 +1000
> Subject: [PATCH] powerpc/eeh: Add bdfn field to eeh_dev
>=20
> Preperation for removing pci_dn from the powernv EEH code. The only thing=
 we
> really use pci_dn for is to get the bdfn of the device for config space
> accesses, so adding that information to eeh_dev reduces the need to carry
> around the pci_dn.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/include/asm/eeh.h     | 2 ++
>  arch/powerpc/include/asm/ppc-pci.h | 2 ++
>  arch/powerpc/kernel/eeh_dev.c      | 2 ++
>  3 files changed, 6 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/ee=
h.h
> index 7fd476d..a208e02 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -131,6 +131,8 @@ static inline bool eeh_pe_passed(struct eeh_pe *pe)
>  struct eeh_dev {
>  	int mode;			/* EEH mode			*/
>  	int class_code;			/* Class code of the device	*/
> +	int bdfn; 			/* bdfn of device (for cfg ops) */
> +	struct pci_controller *controller;
>  	int pe_config_addr;		/* PE config address		*/
>  	u32 config_space[16];		/* Saved PCI config space	*/
>  	int pcix_cap;			/* Saved PCIx capability	*/
> diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/as=
m/ppc-pci.h
> index cec2d64..72860de 100644
> --- a/arch/powerpc/include/asm/ppc-pci.h
> +++ b/arch/powerpc/include/asm/ppc-pci.h
> @@ -74,6 +74,8 @@ static inline const char *eeh_driver_name(struct pci_de=
v *pdev)
> =20
>  #endif /* CONFIG_EEH */
> =20
> +#define PCI_BUSNO(bdfn) ((bdfn >> 8) & 0xff)
> +
>  #else /* CONFIG_PCI */
>  static inline void init_pci_config_tokens(void) { }
>  #endif /* !CONFIG_PCI */
> diff --git a/arch/powerpc/kernel/eeh_dev.c b/arch/powerpc/kernel/eeh_dev.c
> index c4317c4..7370185 100644
> --- a/arch/powerpc/kernel/eeh_dev.c
> +++ b/arch/powerpc/kernel/eeh_dev.c
> @@ -47,6 +47,8 @@ struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
>  	/* Associate EEH device with OF node */
>  	pdn->edev =3D edev;
>  	edev->pdn =3D pdn;
> +	edev->bdfn =3D (pdn->busno << 8) | pdn->devfn;
> +	edev->controller =3D pdn->phb;
> =20
>  	return edev;
>  }
> --=20
> 2.9.5
>=20

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0wAnQACgkQMX8w6AQl
/iJMYwf/d30P8VaU6ACaKTOopWkVtLdjVDc1ACHBcQqNsz24fxTFtv4opUOsmEBi
ExEyL8rFEQxVOYSjGmROzX/gtfrSAe09g5NPTwEzZdGqejR+rYS/16RsUurn46gq
Pqprisdqql8mXoWB0aN05Yxsl0ooslZUj9KWF+VdDnUvnEO6LEjNKskZCXYbtdvt
g7upUbRKWe4k1EQNFZ36/8E8qEiOMImAg6OzjmBEqYoL35YrFQxBWox6rRdtQGpK
9sv1O8ZnMvNTiJJiX6p9ApEjkrV20N5hifsH81vZD5t/nsu7vv/AGm7DXR0S8dsi
50jsqxMEslgAWeL/Zcs5asLzhLJZHA==
=HviI
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--

