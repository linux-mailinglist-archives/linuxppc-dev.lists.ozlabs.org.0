Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D398B1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 08:01:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DYnd4T8bzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:01:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DYl013pKzDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:59:23 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M5vUJh120641
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:59:21 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhj7bnk7y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:59:21 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 22 Aug 2019 06:59:19 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 06:59:18 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7M5wu9H41025960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 05:58:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0938FA4053;
 Thu, 22 Aug 2019 05:59:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADA10A404D;
 Thu, 22 Aug 2019 05:59:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 05:59:16 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2DE4DA021A;
 Thu, 22 Aug 2019 15:59:14 +1000 (AEST)
Date: Thu, 22 Aug 2019 15:59:13 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/pcidn: Warn when sriov pci_dn management is
 used incorrectly
References: <20190821062655.19735-1-oohall@gmail.com>
 <20190821062655.19735-3-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline
In-Reply-To: <20190821062655.19735-3-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19082205-0012-0000-0000-00000341590E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082205-0013-0000-0000-0000217B82C3
Message-Id: <20190822055912.GB25172@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220063
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


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2019 at 04:26:55PM +1000, Oliver O'Halloran wrote:
> These functions can only be used on a SR-IOV capable physical function and
> they're only called in pcibios_sriov_enable / disable. Make them emit a
> warning in the future if they're used incorrectly and remove the dead
> code that checks if the device is a VF.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Looks good, but you might want to consider using WARN_ON_ONCE() just in
case it gets hit a lot.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/kernel/pci_dn.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 24da1d8..69dafc3 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -158,8 +158,8 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
>  	int i;
> =20
>  	/* Only support IOV for now */
> -	if (!pdev->is_physfn)
> -		return pci_get_pdn(pdev);
> +	if (WARN_ON(!pdev->is_physfn))
> +		return NULL;
> =20
>  	/* Check if VFs have been populated */
>  	pdn =3D pci_get_pdn(pdev);
> @@ -199,19 +199,8 @@ void remove_sriov_vf_pdns(struct pci_dev *pdev)
>  	struct pci_dn *pdn, *tmp;
>  	int i;
> =20
> -	/*
> -	 * VF and VF PE are created/released dynamically, so we need to
> -	 * bind/unbind them.  Otherwise the VF and VF PE would be mismatched
> -	 * when re-enabling SR-IOV.
> -	 */
> -	if (pdev->is_virtfn) {
> -		pdn =3D pci_get_pdn(pdev);
> -		pdn->pe_number =3D IODA_INVALID_PE;
> -		return;
> -	}
> -
>  	/* Only support IOV PF for now */
> -	if (!pdev->is_physfn)
> +	if (WARN_ON(!pdev->is_physfn))
>  		return;
> =20
>  	/* Check if VFs have been populated */
> --=20
> 2.9.5
>=20

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl1eLzAACgkQMX8w6AQl
/iKXuwf+OW+zJdQvP4FK1JArbL3ATejhER+P9PBGEgYDN3dgScAuxanx7wtYwUbF
7RONtpAGXyJ5yspdDPGU3YuUlkeJIomlR9lPX3o8gjbIHk5eRkD6vvfwZnaFGasc
EP18Ns6ycf0sE6CxLHx9Ur5DXFhlK9nHz3QxMbWBV3UwQ5buKrX/C9RlYKhEhQ1N
bpRGmLjzuotnikdUXIA5aGAbDCrpXp1PU82YqFyVV8md9crmSNV5cWWCr33WTvZ8
37n5TI850X2yW6ZXsOM2xvbqW3CobVIWaEkc9iWbHtQVxKNP9YLcsnr1tV6CgiSc
OsgD5udDSSXfYBd4wjGLnqXJw6EALA==
=r37O
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--

