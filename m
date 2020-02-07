Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90215519E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 05:44:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DN4s50hNzDqcx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 15:44:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DN381MjgzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 15:43:15 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0174ed9Z035288
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Feb 2020 23:43:14 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y0nnfu2x8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 23:43:13 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 7 Feb 2020 04:43:11 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Feb 2020 04:43:09 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0174h8wf30343608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Feb 2020 04:43:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9310511C04A;
 Fri,  7 Feb 2020 04:43:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8D1B11C054;
 Fri,  7 Feb 2020 04:43:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Feb 2020 04:43:07 +0000 (GMT)
Received: from osmium (unknown [9.102.53.41])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7F77BA0131;
 Fri,  7 Feb 2020 15:43:03 +1100 (AEDT)
Date: Fri, 7 Feb 2020 15:43:04 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/1] vfio-pci/nvlink2: Allow fallback to ibm,mmio-atsd[0]
References: <426f75e09ac1a6879a6d51f592bf683c698b4bda.1580959044.git.sbobroff@linux.ibm.com>
 <84147d70-3409-e216-495d-fc54366b92a6@ozlabs.ru>
 <20200207023914.GC21238@osmium>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline
In-Reply-To: <20200207023914.GC21238@osmium>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20020704-0020-0000-0000-000003A7CC9A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020704-0021-0000-0000-000021FF9E59
Message-Id: <20200207044303.GD21238@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=18 spamscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002070030
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
Cc: Alex Williamson <alex.williamson@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 01:39:14PM +1100, Sam Bobroff wrote:
> On Thu, Feb 06, 2020 at 03:23:03PM +1100, Alexey Kardashevskiy wrote:
> >=20
> >=20
> > On 06/02/2020 14:17, Sam Bobroff wrote:
> > > Older versions of skiboot only provide a single value in the device=
=09
> > > tree property "ibm,mmio-atsd", even when multiple Address Translation
> > > Shoot Down (ATSD) registers are present. This prevents NVLink2 devices
> > > (other than the first) from being used with vfio-pci because vfio-pci
> > > expects to be able to assign a dedicated ATSD register to each NVLink2
> > > device.
> > >=20
> > > However, ATSD registers can be shared among devices. This change
> > > allows vfio-pci to fall back to sharing the register at index 0 if
> > > necessary.
> > >=20
> > > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > > ---
> > >  drivers/vfio/pci/vfio_pci_nvlink2.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/v=
fio_pci_nvlink2.c
> > > index f2983f0f84be..851ba673882b 100644
> > > --- a/drivers/vfio/pci/vfio_pci_nvlink2.c
> > > +++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
> > > @@ -420,8 +420,17 @@ int vfio_pci_ibm_npu2_init(struct vfio_pci_devic=
e *vdev)
> > > =20
> > >  	if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd", nvlink_in=
dex,
> > >  			&mmio_atsd)) {
> > > -		dev_warn(&vdev->pdev->dev, "No available ATSD found\n");
> > > -		mmio_atsd =3D 0;
> > > +		dev_warn(&vdev->pdev->dev,
> > > +			 "No ibm,mmio-atsd[%d] found: trying ibm,mmio-atsd[0]\n",
> > > +			 nvlink_index);
> >=20
> >=20
> > We do not really need this warning (nvlink_index doesn't matter that
> > much, we can work out from the device tree what happened), warnings
> > below are enough (if you really want, you can print nvlink_index there).
> >=20
> > Either way,
> >=20
> > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >=20
>=20
> Thanks,
>=20
> I'll change it if there's some reason to do another version but
> otherwise leave it as is.
>=20
> Sam.

Oh! I almost forgot: maybe this should carry a fixes tag?
Fixes: 7f92891778df ("vfio_pci: Add NVIDIA GV100GL [Tesla V100 SXM2] subdri=
ver")

> >=20
> >=20
> >=20
> > > +		if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd", 0,
> > > +				&mmio_atsd)) {
> > > +			dev_warn(&vdev->pdev->dev, "No available ATSD found\n");
> > > +			mmio_atsd =3D 0;
> > > +		} else {
> > > +			dev_warn(&vdev->pdev->dev,
> > > +				 "Using fallback ibm,mmio-atsd[0] for ATSD.\n");
> > > +		}
> > >  	}
> > > =20
> > >  	if (of_property_read_u64(npu_node, "ibm,device-tgt-addr", &tgt)) {
> > >=20
> >=20
> > --=20
> > Alexey



--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl486skACgkQMX8w6AQl
/iLbRggAhrbwEK22ntU2VtA600HoPF6giSSwRiG5xW6vlN9nDNa0zPQlkuSrz3hq
N0++aL3+WJNg93Ymd75+uRxN7edBz2j6BfOrkkZypscDjjpXXjQOnAsaFbd74uAj
i8mEiBp8vY91I6zIGA1iY5op1G3HUHMzJntYYFJawsK04utWkxGnh551cz8vJpls
o0v1jlQQ/2xJ5V0PUu9K87351xCEjIhNhRmwvJSWmqCAfHO5fd/iCp0F/wS0sY2/
5t55gftIRCWXj8BkDstyJ3PDvPF5Tocztj10ZZrvbwzpCh1gxLO0wwXyvbT/CJRr
w+VXTEO9tCko0gVR7zzRJYTeQ015wg==
=GMZR
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--

