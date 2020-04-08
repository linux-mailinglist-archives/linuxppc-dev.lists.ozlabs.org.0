Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB661A1BD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 08:17:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xvG12y4bzDr2y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 16:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xvCq6dtDzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 16:15:50 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03864cmQ091136
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Apr 2020 02:15:46 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30920sha8w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 02:15:46 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 8 Apr 2020 07:15:41 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Apr 2020 07:15:38 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0386FfPp43450452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 06:15:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEC6BAE067;
 Wed,  8 Apr 2020 06:15:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47F4DAE057;
 Wed,  8 Apr 2020 06:15:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 06:15:40 +0000 (GMT)
Received: from osmium (unknown [9.163.60.137])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 636F6A01DF;
 Wed,  8 Apr 2020 16:15:31 +1000 (AEST)
Date: Wed, 8 Apr 2020 16:15:20 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 2/4] powerpc/eeh: Release EEH device state synchronously
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <6b3ce475194cd3c1aefd876e311b5a218c3a627a.1585544197.git.sbobroff@linux.ibm.com>
 <505121b7e9f40708aef50a2fae0932d3e535e616.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <505121b7e9f40708aef50a2fae0932d3e535e616.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20040806-0028-0000-0000-000003F433AA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040806-0029-0000-0000-000024B9CD9E
Message-Id: <20200408061519.GA25852@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080043
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2020 at 03:51:18PM +1100, Oliver O'Halloran wrote:
> On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> > EEH device state is currently removed (by eeh_remove_device()) during
> > the device release handler, which is invoked as the device's reference
> > count drops to zero. This may take some time, or forever, as other
> > threads may hold references.
> >=20
> > However, the PCI device state is released synchronously by
> > pci_stop_and_remove_bus_device(). This mismatch causes problems, for
> > example the device may be re-discovered as a new device before the
> > release handler has been called, leaving the PCI and EEH state
> > mismatched.
> >=20
> > So instead, call eeh_remove_device() from the bus device removal
> > handlers, which are called synchronously in the removal path.
> >=20
> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> >  arch/powerpc/kernel/eeh.c         | 26 ++++++++++++++++++++++++++
> >  arch/powerpc/kernel/pci-hotplug.c |  2 --
> >  2 files changed, 26 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index 17cb3e9b5697..c36c5a7db5ca 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -1106,6 +1106,32 @@ static int eeh_init(void)
> > =20
> >  core_initcall_sync(eeh_init);
> > =20
> > +static int eeh_device_notifier(struct notifier_block *nb,
> > +			       unsigned long action, void *data)
> > +{
> > +	struct device *dev =3D data;
> > +
> > +	switch (action) {
> > +	case BUS_NOTIFY_DEL_DEVICE:
> > +		eeh_remove_device(to_pci_dev(dev));
> > +		break;
> > +	default:
> > +		break;
> > +	}
>=20
> A comment briefly explaining why we're not doing anything in the add
> case might be nice.

Good point, I'll add something for v2.
>=20
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
>=20
> > +	return NOTIFY_DONE;
> > +}
> > +
> > +static struct notifier_block eeh_device_nb =3D {
> > +	.notifier_call =3D eeh_device_notifier,
> > +};
> > +
> > +static __init int eeh_set_bus_notifier(void)
> > +{
> > +	bus_register_notifier(&pci_bus_type, &eeh_device_nb);
> > +	return 0;
> > +}
> > +arch_initcall(eeh_set_bus_notifier);
> > +
> >  /**
> >   * eeh_add_device_early - Enable EEH for the indicated device node
> >   * @pdn: PCI device node for which to set up EEH
> > diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pc=
i-hotplug.c
> > index d6a67f814983..28e9aa274f64 100644
> > --- a/arch/powerpc/kernel/pci-hotplug.c
> > +++ b/arch/powerpc/kernel/pci-hotplug.c
> > @@ -57,8 +57,6 @@ void pcibios_release_device(struct pci_dev *dev)
> >  	struct pci_controller *phb =3D pci_bus_to_host(dev->bus);
> >  	struct pci_dn *pdn =3D pci_get_pdn(dev);
> > =20
> > -	eeh_remove_device(dev);
> > -
> >  	if (phb->controller_ops.release_device)
> >  		phb->controller_ops.release_device(dev);
> > =20
>=20

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl6Na+8ACgkQMX8w6AQl
/iIAHQf+JoBuJaA1tMRx/L7ztBc7Rr4fmd8Gr1cK0dJaJR4VVf4RShQzohZQWdJK
er52HjN/mBhDDoC/9CcOzsdYQA9bI4LCp/iKJcSiqfQpcn+Z88Lhr7lrqDyLXg0+
K6DY0exHNYUl7ihQxnbd9ITHjSnimGbqlwagE5NZPcLxC2MMILtCBw92bVxeL4j0
FPTaeaJa14yq6z/a5MNCy+k0yOUWudjoHs3BJmsRM/4O4bI5+rKyVtmxl+GmG/nj
LSmZgnpVhV0BwKwE8vvKHeL7lITMgYrSk6IuyCiNUY31HTxbKP9jt0Ap5fTH5wq5
H3CSnwaCOcyuZ5uwwrGgawHFcdkSmg==
=5FCA
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

