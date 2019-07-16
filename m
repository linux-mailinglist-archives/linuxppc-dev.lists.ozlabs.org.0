Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3056A26F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 08:50:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nrd76vTYzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 16:50:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nrZv41whzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 16:48:38 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6G6lCOm048280
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 02:48:35 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ts66qfp56-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 02:48:35 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 16 Jul 2019 07:48:34 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 07:48:32 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6G6mIVj39911728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 06:48:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 665FE4203F;
 Tue, 16 Jul 2019 06:48:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEBCC42041;
 Tue, 16 Jul 2019 06:48:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 06:48:30 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 82936A0259;
 Tue, 16 Jul 2019 16:48:29 +1000 (AEST)
Date: Tue, 16 Jul 2019 16:48:28 +1000
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline
In-Reply-To: <CAOSf1CFwj93TYGppJVU5djEe4TN6ezo36G=DxWbFU4buaCWM4g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19071606-0008-0000-0000-000002FD9356
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071606-0009-0000-0000-0000226B07EF
Message-Id: <20190716064827.GF3645@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160088
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


--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 01:45:24PM +1000, Oliver O'Halloran wrote:
> On Thu, Jun 20, 2019 at 12:40 PM Alexey Kardashevskiy <aik@ozlabs.ru> wro=
te:
> >
> > On 19/06/2019 14:27, Sam Bobroff wrote:
> > > On Tue, Jun 11, 2019 at 03:47:58PM +1000, Alexey Kardashevskiy wrote:
> > >>
> > >> On 07/05/2019 14:30, Sam Bobroff wrote:
> > >>> Also remove useless comment.
> > >>>
> > >>> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > >>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > >>> ---
> > *snip*
> > >
> > > I can see that edev will be non-NULL here, but that pr_debug() pattern
> > > (using the PDN information to form the PCI address) is quite common
> > > across the EEH code, so I think rather than changing a couple of
> > > specific cases, I should do a separate cleanup patch and introduce
> > > something like pdn_debug(pdn, "...."). What do you think?
> >
> > I'd switch them all to already existing dev_dbg/pci_debug rather than
> > adding pdn_debug as imho it should not have been used in the first place
> > really...
> >
> > > (I don't know exactly when edev->pdev can be NULL.)
> >
> > ... and if you switch to dev_dbg/pci_debug, I think quite soon you'll
> > know if it can or cannot be NULL :)
>=20
> As far as I can tell edev->pdev is NULL in two cases:
>=20
> 1. Before eeh_device_add_late() has been called on the pdev. The late
> part of the add maps the pdev to an edev and sets the pdev's edev
> pointer and vis a vis.
> 2. While recoverying EEH unaware devices. Unaware devices are
> destroyed and rescanned and the edev->pdev pointer is cleared by
> pcibios_device_release()
>=20
> In most of these cases it should be safe to use the pci_*() functions
> rather than making a new one up for printing pdns. In the cases where
> we might not have a PCI dev i'd make a new set of prints that take an
> EEH dev rather than a pci_dn since i'd like pci_dn to die sooner
> rather than later.
>=20
> Oliver

I'll change the calls in {pnv,pseries}_pcibios_bus_add_device() and
eeh_add_device_late() to use dev_dbg() and post a new version.

For {pnv,pseries}_eeh_probe() I'm not sure what we can do; there's no
pci_dev available yet and while it would be nice to use the eeh_dev
rather than the pdn, it doesn't seem to have the bus/device/fn
information we need. Am I missing something there?  (The code in the
probe functions seems to get it from the pci_dn.)

If there isn't an easy way around this, would it therefore be reasonable
to just leave them open-coded as they are?

Cheers,
Sam.

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0tcy8ACgkQMX8w6AQl
/iJ+hQf/VNKFdj64GWBZXtU9OfIxdMBdG8zFFFJVk1yPbuVU9JeYfCwRdwFjEjJf
LlV2rGL5KEqEkaUgdw72xFNv2INK1OHVeJCf5oH98rP08KRboowSyCVW8IcldNhp
loyINDUgJ0Jh7klUgj1FoOSnzuY9QXsY0pBUJRZaswp2d/X3xZ8ruWKN6gI44srF
ElNg1+oiccOo1oQuBUSOl3kea+Z2T4jLtgaO0YdpgIAIBhIG8sj9wIBYvjHAi4HB
MJ8Z0lAfx27aaRLScMZxWsFcDGp+fbc3jXAUx2kmEsRxcE7lYlEWSxkFmqXNF3tM
2C+UmyuQjbbNq7wdldOjZ+z4kTDYnQ==
=ymRx
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--

