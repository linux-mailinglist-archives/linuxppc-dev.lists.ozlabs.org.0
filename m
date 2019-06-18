Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77663497E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 06:04:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SZGX0jJvzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:04:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SZDX0WvmzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 14:02:51 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I41dvD005130
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:02:48 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6mccymrb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:02:48 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 18 Jun 2019 05:02:46 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 05:02:42 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5I42for63307918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 04:02:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9536642045;
 Tue, 18 Jun 2019 04:02:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 000B942049;
 Tue, 18 Jun 2019 04:02:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 04:02:40 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AA8FCA020E;
 Tue, 18 Jun 2019 14:02:39 +1000 (AEST)
Date: Tue, 18 Jun 2019 14:02:38 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/pci/of: Parse unassigned resources
References: <20190614025916.123589-1-aik@ozlabs.ru>
 <a9f5d1d7-a8dc-91eb-8197-a7aa9b45957b@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <a9f5d1d7-a8dc-91eb-8197-a7aa9b45957b@ozlabs.ru>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19061804-0016-0000-0000-00000289F866
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061804-0017-0000-0000-000032E7466F
Message-Id: <20190618040237.GA4735@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180031
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
Cc: Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 01:18:28PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 14/06/2019 12:59, Alexey Kardashevskiy wrote:
> > The pseries platform uses the PCI_PROBE_DEVTREE method of PCI probing
> > which is basically reading "assigned-addresses" of every PCI device.
> > However if the property is missing or zero sized, then there is
> > no fallback of any kind and the PCI resources remain undiscovered, i.e.
> > pdev->resource[] array is empty.
> >=20
> > This adds a fallback which parses the "reg" property in pretty much same
> > way except it marks resources as "unset" which later makes Linux assign
> > those resources with proper addresses.
> >=20
> > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> >=20
> > This is an attempts to boot linux directly under QEMU without slof/rtas;
> > the aim is to use petitboot instead and let the guest kernel configure
> > devices.
> >=20
> > QEMU does not allocate resources, it creates correct "reg" and zero len=
gth
> > "assigned-addresses" (which is probably a bug on its own) which is
> > normally populated by SLOF later but not during this exercise.

Hi Alexey,

This patch (fixed, as you point out below) also seems to improve hotplug
on pSeries.

Currently, the PCI hotplug driver for pSeries (rpaphp) uses generic PCI
scanning to add hot plugged devices, rather than slot power control,
because the slot power control method doesn't work.

AFAIK one of the reasons that slot power control doesn't work is that
the assigned-addresses node isn't populated by QEMU during hotplug, so I
tested this patch on a guest that has been modified to use that method.

In combination with a QEMU change to prevent PCI_PROBE_ONLY being set
(necessary to allow pcibios_finish_adding_to_bus() to do resource
allocation -- I assume you are using a similar change), I was able to
successfully hot plug a few devices!

So this change seems to be a step in the right direction.

(I also tested it with an unmodified guest, and it doesn't seem to harm
hotpluging via generic PCI scanning.)

One nit: I think that calling the variable "unset" is a bit confusing.
What about calling it "aa_missing" or something like that?

Cheers,
Sam.

> > ---
> >  arch/powerpc/kernel/pci_of_scan.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pc=
i_of_scan.c
> > index 64ad92016b63..cfe6ec3c6aaf 100644
> > --- a/arch/powerpc/kernel/pci_of_scan.c
> > +++ b/arch/powerpc/kernel/pci_of_scan.c
> > @@ -82,10 +82,18 @@ static void of_pci_parse_addrs(struct device_node *=
node, struct pci_dev *dev)
> >  	const __be32 *addrs;
> >  	u32 i;
> >  	int proplen;
> > +	bool unset =3D false;
> > =20
> >  	addrs =3D of_get_property(node, "assigned-addresses", &proplen);
> >  	if (!addrs)
> >  		return;
>=20
>=20
> Ah. Of course, these 2 lines above should go, my bad. I'll repost if
> there are no other (and bigger) problems with this.
>=20
>=20
>=20
> > +	if (!addrs || !proplen) {
> > +		addrs =3D of_get_property(node, "reg", &proplen);
> > +		if (!addrs || !proplen)
> > +			return;
> > +		unset =3D true;
> > +	}
> > +
> >  	pr_debug("    parse addresses (%d bytes) @ %p\n", proplen, addrs);
> >  	for (; proplen >=3D 20; proplen -=3D 20, addrs +=3D 5) {
> >  		flags =3D pci_parse_of_flags(of_read_number(addrs, 1), 0);
> > @@ -110,6 +118,8 @@ static void of_pci_parse_addrs(struct device_node *=
node, struct pci_dev *dev)
> >  			continue;
> >  		}
> >  		res->flags =3D flags;
> > +		if (unset)
> > +			res->flags |=3D IORESOURCE_UNSET;
> >  		res->name =3D pci_name(dev);
> >  		region.start =3D base;
> >  		region.end =3D base + size - 1;
> >=20
>=20
> --=20
> Alexey
>=20

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0IYlgACgkQMX8w6AQl
/iLfQAf/R55yOmFVh/2oN/ZqZBnHJxPRCTzwImoHSfH7ewYOEsAPVda26RObwn/S
92XMt+lslzVNmXtww1FzdKYGQWpQocp/YzlxLtegIZPjEAw/QepCQ41JvEGOWDmI
ooFhEfLcHx+TUdlyJPhhWP4A45WaepmrJilsea8s4WFcDez7LXeISqb1rzb6pWL4
sA43z4rVKGKqAtEf1LwwD1+Ws0/LAB6GL29f/KnMEtyFjLKgovpS53H/A8b/M25Z
+LxuO+M4mYbFgHUEZBIledrt023H4b/POSbzuu7h3jEN1rmSClahCguHRMuPvzqV
7+dlmo5DKezWDCEB/NMsLce2pAahGA==
=B8Xx
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

