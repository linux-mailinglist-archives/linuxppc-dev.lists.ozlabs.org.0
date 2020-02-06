Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4036153E48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 06:32:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CnBc739JzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 16:32:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Cn8q41XpzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 16:31:06 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0165TH6S064522
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Feb 2020 00:31:04 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xyhn63s5c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 00:31:03 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 6 Feb 2020 05:31:02 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 05:31:01 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0165V0AQ53215292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 05:31:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CA0D4C046;
 Thu,  6 Feb 2020 05:31:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A09A4C050;
 Thu,  6 Feb 2020 05:31:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 05:31:00 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 01A5AA00EE;
 Thu,  6 Feb 2020 16:30:56 +1100 (AEDT)
Date: Thu, 6 Feb 2020 16:30:57 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 4/6] powerpc/eeh: Remove PHB check in probe
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-5-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Oiv9uiLrevHtW1RS"
Content-Disposition: inline
In-Reply-To: <20200203083521.16549-5-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20020605-0020-0000-0000-000003A771D4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020605-0021-0000-0000-000021FF3F62
Message-Id: <20200206053057.GG15629@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060042
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
Cc: tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Oiv9uiLrevHtW1RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 07:35:19PM +1100, Oliver O'Halloran wrote:
> This check for a missing PHB has existing in various forms since the
> initial PPC64 port was upstreamed in 2002. The idea seems to be that we
> need to guard against creating pci-specific data structures for the non-p=
ci
> children of a PCI device tree node (e.g. USB devices). However, we only
> create pci_dn structures for DT nodes that correspond to PCI devices so
> there's not much point in doing this check in the eeh_probe path.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

I always wondered how to test that block... and it's just dead code.
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/kernel/eeh.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 9cb3370..a9e4ca7 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1120,7 +1120,6 @@ core_initcall_sync(eeh_init);
>   */
>  void eeh_add_device_early(struct pci_dn *pdn)
>  {
> -	struct pci_controller *phb =3D pdn ? pdn->phb : NULL;
>  	struct eeh_dev *edev =3D pdn_to_eeh_dev(pdn);
> =20
>  	if (!edev)
> @@ -1129,11 +1128,6 @@ void eeh_add_device_early(struct pci_dn *pdn)
>  	if (!eeh_has_flag(EEH_PROBE_MODE_DEVTREE))
>  		return;
> =20
> -	/* USB Bus children of PCI devices will not have BUID's */
> -	if (NULL =3D=3D phb ||
> -	    (eeh_has_flag(EEH_PROBE_MODE_DEVTREE) && 0 =3D=3D phb->buid))
> -		return;
> -
>  	eeh_ops->probe(pdn, NULL);
>  }
> =20
> --=20
> 2.9.5
>=20

--Oiv9uiLrevHtW1RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl47pJEACgkQMX8w6AQl
/iIzaQf8D//CgG8StnGyKDpF0EeoryKAvHNFN3WhWTowvUhkTh3yvaddYFJl0ZVr
gBABSaZabhHrtjPrxGw3baybgrH2EAGUgfaTcaiHu/6cvQfhKXdggMtQmdNa2Grs
GBhqNn8ckyYcpIi+SP7gp5hz8xonK62xJn5djGpS01gdS5x7XHjWNLFaTD/2Bchm
1jyVdJa12CW16m7n/4CfY0KI999FaFQYliHuk8tc7vlnkq5Xr9s3IWua9gDkyqpT
e+kglDkFZk66vKHNPTsNar+kDI898v8/h221cJcZDHYt10vJKEBQO9r1DKU255KB
Dbl4H19goOQiw5P8fKicBHpRsXJ3Hw==
=+SOF
-----END PGP SIGNATURE-----

--Oiv9uiLrevHtW1RS--

