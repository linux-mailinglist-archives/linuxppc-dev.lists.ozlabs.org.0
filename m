Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 633CE1A9383
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 08:46:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492CZN4R5BzDr5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 16:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492CWp2sRxzDr2g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 16:44:37 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03F6Ynwg054090
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 02:44:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnn3ahq4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 02:44:34 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 15 Apr 2020 07:44:05 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 15 Apr 2020 07:44:02 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03F6iSx062914688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Apr 2020 06:44:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B4AD4C046;
 Wed, 15 Apr 2020 06:44:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2B0E4C04A;
 Wed, 15 Apr 2020 06:44:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Apr 2020 06:44:27 +0000 (GMT)
Received: from osmium (unknown [9.81.221.66])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 392F1A00A5;
 Wed, 15 Apr 2020 16:44:22 +1000 (AEST)
Date: Wed, 15 Apr 2020 16:44:25 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 3/4] powerpc/eeh: Remove workaround from
 eeh_add_device_late()
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <252491a9c3fb015383ac757220c5df43d168fe4e.1585544197.git.sbobroff@linux.ibm.com>
 <c7e81c27a6da9f7a4266cec9995b597bce4efc7b.camel@gmail.com>
 <20200408062159.GB25852@osmium>
 <CAOSf1CHA+ZzWpLtuPrvkOvWO13Dikv86UjiBdppyG4GrexGSpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <CAOSf1CHA+ZzWpLtuPrvkOvWO13Dikv86UjiBdppyG4GrexGSpA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20041506-0008-0000-0000-00000370F495
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041506-0009-0000-0000-00004A92A721
Message-Id: <20200415064423.GA22089@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_01:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004150049
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 04:53:36PM +1000, Oliver O'Halloran wrote:
> On Wed, Apr 8, 2020 at 4:22 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
> >
> > On Fri, Apr 03, 2020 at 05:08:32PM +1100, Oliver O'Halloran wrote:
> > > On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> > > > When EEH device state was released asynchronously by the device
> > > > release handler, it was possible for an outstanding reference to
> > > > prevent it's release and it was necessary to work around that if a
> > > > device was re-discovered at the same PCI location.
> > >
> > > I think this is a bit misleading. The main situation where you'll hit
> > > this hack is when recovering a device with a driver that doesn't
> > > implement the error handling callbacks. In that case the device is
> > > removed, reset, then re-probed by the PCI core, but we assume it's the
> > > same physical device so the eeh_device state remains active.
> > >
> > > If you actually changed the underlying device I suspect something bad
> > > would happen.
> >
> > I'm not sure I understand. Isn't the case you're talking about caught by
> > the earlier check (just above the patch)?
> >
> >         if (edev->pdev =3D=3D dev) {
> >                 eeh_edev_dbg(edev, "Device already referenced!\n");
> >                 return;
> >         }
>=20
> No, in the case I'm talking about the pci_dev is torn down and
> freed(). After the PE is reset we re-probe the device and create a new
> pci_dev.  If the release of the old pci_dev is delayed we need the
> hack this patch is removing.

Oh, yes, that is the case I was intending to change here.  But I must be
missing something, isn't it also the case that's changed by patch 2/4?

What I intended was, after patch 2, eeh_remove_device() is called from
the bus notifier so it happens imediately when recovery calls
pci_stop_and_remove_bus_device().  Once it returns, edev->pdev has
already been set to NULL by eeh_remove_device() so this case can't be
hit anymore, and we should clean it up (this patch).

(There is a slight difference in the way EEH_PE_KEEP is handled between
the code removed here and the body of eeh_remove_device(), but checking
and explaining that is already on my list for v2.)

(I did test recovery on an unaware device and didn't hit the
WARN_ON_ONCE().)

> The check above should probably be a WARN_ON() since we should never
> be re-running the EEH probe on the same device. I think there is a
> case where that can happen, but I don't remember the details.

Yeah, I also certainly see the "Device already referenced!" message
while debugging, and it would be good to track down.

> Oliver

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl6WrUEACgkQMX8w6AQl
/iKnqgf/VptiINtKIXT0GNsmAN2CbN66S+EKA6FlZ0n+i7azWm1h38+yMF/mpkTP
w3rIjxDOG0m32Z9Oc4XvmQswJ1UL6bD1Vhl92KXJj5auA8OCsAeHnJeiFYve7Eqk
fyjxs9IzPvzBkCqGDHveFXaEpHcQwWe4HgoXU3aHoiS0SDf14F4VnVR49+zpF1dm
ilG+mtct05uBc//RySW60VQWSF/OtHdKn6Szt0H4LpUd7l71BFl7tyAlScUsgLi6
Y3w/XMjII1xW9JRVn7/SltcP3klLvqoPTjFiLg3a5YQnO+iEl+h5oCGvD2nGJob0
WIHS51hLxG2DCZ4u2mhPywDVuQMjOg==
=+VrZ
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--

