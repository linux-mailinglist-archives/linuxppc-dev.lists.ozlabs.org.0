Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD24CBBD7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 23:01:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ccFD4z2kzDqCc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 07:01:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ccB92GvXzDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:58:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NKvv1A006865; Mon, 23 Sep 2019 16:58:36 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v73bn40fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:58:35 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8NKvwOe006963;
 Mon, 23 Sep 2019 16:58:35 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v73bn40f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:58:35 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NKtJiP027666;
 Mon, 23 Sep 2019 20:58:34 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 2v5bg7487t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 20:58:34 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NKwXNW38011164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 20:58:33 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20CF1AE05C;
 Mon, 23 Sep 2019 20:58:33 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2FB8AE05F;
 Mon, 23 Sep 2019 20:58:29 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 20:58:29 +0000 (GMT)
Message-ID: <43fb35d2f8cc1c488547ca20a566092f6098f093.camel@linux.ibm.com>
Subject: Re: [PATCH v2 00/11] Introduces new count-based method for
 monitoring lockless pagetable wakls
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>
Date: Mon, 23 Sep 2019 17:58:28 -0300
In-Reply-To: <b2d47f4b-2bf2-20a8-2438-4fd3f9b08a63@nvidia.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <1f5d9380418ad8bb90c6bbdac34716c650b917a0.camel@linux.ibm.com>
 <b2d47f4b-2bf2-20a8-2438-4fd3f9b08a63@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-Ayjh91N4wxCaAZRIoOiI"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230177
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Keith Busch <keith.busch@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-Ayjh91N4wxCaAZRIoOiI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-23 at 13:51 -0700, John Hubbard wrote:
> Also, which tree do these patches apply to, please?=20
>=20
> thanks,

They should apply on top of v5.3 + one patch:=20
https://patchwork.ozlabs.org/patch/1164925/

I was working on top of this patch, because I thought it would be
merged fast. But since I got no feedback, it was not merged and the
present patchset became broken. :(

But I will rebase v3 on top of plain v5.3.

Thanks,
Leonardo Bras




--=-Ayjh91N4wxCaAZRIoOiI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2JMfQACgkQlQYWtz9S
ttQTdA/8CDV7ZfiTjTJT5utE6tAn94hWnwVq8zsELwHU1YAfpRgAfdsiMWjkrHY7
MFYxevO7dxosWPW6TWOUtt5nPIvfQ5671t0rCgwyh2qZl/w8e9QwwxPHdZjHwIw1
oUS/kjzsSBKPi7nQOGInW8I8sHHybpzQKASHmaQ7EhvJW/e52WeUIPR7/WxqSYVY
YUZP5KRQrrvmVx9kns6+Lkn/yynMULXho6DZUQrn1it6gH9JUsQA1e4oBqLg7x63
iKGhSyP30V1z7gym5pI3WKMY5zPVP5FbeN9tWblTfv1uLGKn6h9jdf4D14zgDAHN
h21C5irYZTHL1nOci6S1+iRo9azBM9zIRTqsFO6nmmHD+yMYZR7zahKt8d2BJ1er
p0nu9hU5a6s0kA2k6Al+MLA9i/Oadc7epqZujvcUXiTmSR8vxdklzlNaCOIrj9cO
kA1Ept6WFEWUZsXxrnTPyGpWQBkFGCV1FsQELbo0Cp2pctqKPNlof6oAY+TU+t7d
dCr5W9BqxgV37fgUP2GwXGj9EDH7ZixqjS7OXiwaZg/yywuX24E4nCIkcz3c8eXf
6UE3ZOc0BVL63oZHPHbVEE9UruYyq5tFyFT9op6gIFg8Hdj1TVYT8XNcixjbKpn+
0+DsZvgLazuFORtN2/shKeE3agEtU5KlhKP/TXHawuUVDLov9xQ=
=Wyzu
-----END PGP SIGNATURE-----

--=-Ayjh91N4wxCaAZRIoOiI--

