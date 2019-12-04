Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22874113503
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 19:30:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SnT34SVZzDq9n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 05:29:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SnPv6GNKzDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 05:27:15 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4IPp2U014128; Wed, 4 Dec 2019 13:26:59 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wntctt8g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 13:26:59 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB4IPxbS015108;
 Wed, 4 Dec 2019 13:26:58 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wntctt8f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 13:26:58 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB4IPIFT021221;
 Wed, 4 Dec 2019 18:27:02 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 2wkg26fmjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 18:27:02 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB4IQu9w43188536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 18:26:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34D65AE05C;
 Wed,  4 Dec 2019 18:26:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A755AE05F;
 Wed,  4 Dec 2019 18:26:54 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.137])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Dec 2019 18:26:53 +0000 (GMT)
Message-ID: <1f337af9f52ac4c3128e61c971cf0e32068a71ab.camel@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc/pseries/iommu: Share the per-cpu TCE
 page with the hypervisor.
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Wed, 04 Dec 2019 15:26:50 -0300
In-Reply-To: <1575269124-17885-2-git-send-email-linuxram@us.ibm.com>
References: <1575269124-17885-1-git-send-email-linuxram@us.ibm.com>
 <1575269124-17885-2-git-send-email-linuxram@us.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-xOP3QrA+adzjZyTY2Uvc"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxlogscore=969 clxscore=1011 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=2 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912040148
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
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-xOP3QrA+adzjZyTY2Uvc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-12-01 at 22:45 -0800, Ram Pai wrote:
> @@ -206,8 +224,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_tabl=
e *tbl, long tcenum,
>          * from iommu_alloc{,_sg}()
>          */
>         if (!tcep) {
> -               tcep =3D (__be64 *)__get_free_page(GFP_ATOMIC);
> -               /* If allocation fails, fall back to the loop implementat=
ion */
> +               tcep =3D alloc_tce_page();
>                 if (!tcep) {
>                         local_irq_restore(flags);
>                         return tce_build_pSeriesLP(tbl, tcenum, npages, u=
addr,

The comment about failing allocation was removed, but I see no chage of
behaviour here.=20

Can you please explain what/where it changes?=20

Best regards,

Leonardo

--=-xOP3QrA+adzjZyTY2Uvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl3n+moACgkQlQYWtz9S
ttRN3xAA5oyWECPthDRG8RJVWpXNBntk5Q5p2NArYbJ2lPJPtQUZ4n1jTrXU9jzH
3lJ/fgi3X3uKzDt85ZJRN7r8Q/EvSH7GQwS8615PSzkQ+7pR2ncdsJNiW99Q5/AF
PxLiygpyAYCIAvfQVyHS5zpdIMDmQ2jX2Pw9KOLMyBhcm1SdI60y6H3FYr3ihXUo
iswyg49W/jc7u2MwpX5T4p4CS8aUHdaZLKePpGTwI7feZaJNYZkuCSecC35vuBBB
9zuLFWh1bXQ78U+B3eikQr8HP13xuHMkOo3gN2OhBKhREO4VSfkMQ76W3Zko9HE3
+T7kxanN+fThP9cVzV6Lvee1mgt7C2rOMdcL9/VnAQ8VkbhSpnUxkDGBA6CrFadF
rdspu4FdWdlbI9JW3fGjcSGFtwzPkIV9JV3YfQsUKvUDZro10dwoeYwjv/cVcOlH
UFQByrOSa26k4rAFrlnD1YmZJyY5GHnkk3dIhzq1my96foYC2ucOO1tNSMyHkyuT
Hr23JAxFO3QSqhc4093l+MxiirP5VAsOyXQFcYLMtWV2gw1FKVRumenBTWt6hIDR
ATnM6uj5TUOx5R/rI+XhAJj5ar5XMdRU8CsbmTh1zHd0laz3k62z7z5B0HhhfPzd
JBbkysHhunvUUs9J0s+STdyScofunsbTx9j0Pchhgwbeb9bB+XA=
=axXy
-----END PGP SIGNATURE-----

--=-xOP3QrA+adzjZyTY2Uvc--

