Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5A6A107
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 05:55:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nml04p85zDqSC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:55:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nmj81JX8zDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 13:53:47 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6G3pfgd058383
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 23:53:44 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ts6perpm1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 23:53:44 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 16 Jul 2019 04:53:42 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 04:53:40 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6G3rd8Z52756680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 03:53:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38CFE5204F;
 Tue, 16 Jul 2019 03:53:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D9DA752051;
 Tue, 16 Jul 2019 03:53:38 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 17337A01A7;
 Tue, 16 Jul 2019 13:53:36 +1000 (AEST)
Date: Tue, 16 Jul 2019 13:53:34 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 1/5] powerpc/eeh_cache: Don't use pci_dn when inserting
 new ranges
References: <20190715085612.8802-1-oohall@gmail.com>
 <20190715085612.8802-2-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <20190715085612.8802-2-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19071603-0020-0000-0000-00000353E7AC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071603-0021-0000-0000-000021A7B1A4
Message-Id: <20190716035334.GA3645@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160048
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


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2019 at 06:56:08PM +1000, Oliver O'Halloran wrote:
> At the point where we start inserting ranges into the EEH address cache t=
he
> binding between pci_dev and eeh_dev has already been set up. Instead of
> consulting the pci_dn tree we can retrieve the eeh_dev directly using
> pci_dev_to_eeh_dev().
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

In fact the binding between pci_dev and eeh_dev is set up right before
the calls to eeh_addr_cache_insert_dev() (see eeh_addr_cache_build() and
eeh_add_device_tree_late()) so this looks clearly correct to me.

A few simple tests of EEH recovery still succeed as well.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/kernel/eeh_cache.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_ca=
che.c
> index 3204723..908ba69 100644
> --- a/arch/powerpc/kernel/eeh_cache.c
> +++ b/arch/powerpc/kernel/eeh_cache.c
> @@ -156,18 +156,10 @@ eeh_addr_cache_insert(struct pci_dev *dev, resource=
_size_t alo,
> =20
>  static void __eeh_addr_cache_insert_dev(struct pci_dev *dev)
>  {
> -	struct pci_dn *pdn;
>  	struct eeh_dev *edev;
>  	int i;
> =20
> -	pdn =3D pci_get_pdn_by_devfn(dev->bus, dev->devfn);
> -	if (!pdn) {
> -		pr_warn("PCI: no pci dn found for dev=3D%s\n",
> -			pci_name(dev));
> -		return;
> -	}
> -
> -	edev =3D pdn_to_eeh_dev(pdn);
> +	edev =3D pci_dev_to_eeh_dev(dev);
>  	if (!edev) {
>  		pr_warn("PCI: no EEH dev found for %s\n",
>  			pci_name(dev));
> --=20
> 2.9.5
>=20

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0tSjgACgkQMX8w6AQl
/iLdfgf+KT82qbEPHHdRX3oaUhfIiRUzYlb3tYTw+NJIt41+XjoWsyH/M+ErOS+N
ZNp3OoaaZq/PzoFl04/mz+4wOALCW/NsnH3B4kouyqzcBQ1ZiyLsWoPtS4/umPkl
0gPTbD9ERn3KSQsDYYkhaB0WSlX8VSK3sHtDuXjh40vBqKPs9hzudqFAv7bOZL3c
KXz7wIinAuL0jD33i3ByX2CrbRkpCP4cP5lBbRzw2kyNukTSrL0BVGqwqqM0/DS8
IjMdKo8wL1T4Hdbm53fEo6bKP4m/F6XZuYQ57x0m5zxdfgZeX/Aio5oroh2IUiMl
TNiMtiw1PPZzLhGJ6yyWEkwQTo55Nw==
=ILET
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

