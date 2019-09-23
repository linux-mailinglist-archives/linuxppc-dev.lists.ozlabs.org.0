Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9F8BBD5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:55:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cc5t3lV1zDqKf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:55:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cc0c1tj0zDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:50:40 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NKkwoi097671; Mon, 23 Sep 2019 16:50:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v72df5w06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:50:13 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8NKnpi9103691;
 Mon, 23 Sep 2019 16:50:12 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v72df5vyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:50:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NKjFb4020590;
 Mon, 23 Sep 2019 20:50:12 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 2v5bg6pmpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 20:50:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NKo9di53281104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 20:50:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CFF8BE056;
 Mon, 23 Sep 2019 20:50:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6122BE058;
 Mon, 23 Sep 2019 20:50:04 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 20:50:04 +0000 (GMT)
Message-ID: <5492a97960d6991e578caa54ba1536a8e38c7175.camel@linux.ibm.com>
Subject: Re: [PATCH v2 01/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>
Date: Mon, 23 Sep 2019 17:50:03 -0300
In-Reply-To: <90ceb0ca-9f04-65a5-586c-e37c2ecc6e4e@nvidia.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-2-leonardo@linux.ibm.com>
 <90ceb0ca-9f04-65a5-586c-e37c2ecc6e4e@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-BWWhve4qxaPrBo0dh95w"
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
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230175
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


--=-BWWhve4qxaPrBo0dh95w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-23 at 13:42 -0700, John Hubbard wrote:
> Somewhere, there should be a short comment that explains how the followin=
g functions
> are meant to be used. And it should include the interaction with irqs, so=
 maybe
> if you end up adding that combined wrapper function that does both, that'=
s=20
> where the documentation would go. If not, then here is probably where it =
goes.

Thanks for the feedback.
I will make sure to add comments here for v3.

--=-BWWhve4qxaPrBo0dh95w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2JL/sACgkQlQYWtz9S
ttQPlRAAr5/zXU5MsA8IdhhjpUDWfsoINxRO1MdYODVN3wLbY3JzGRaDX4Gl4nX5
9pi4o1ghm49t3tq40uisluJEqhavnoGLrjjpfnKIyQCXY/1qg4zpBxPC87G136B6
wozHzkWXCwjSMbkb58DvPribUYBlxUfYSDnecgnens2axofbN0yQ23cX6Z4Eqce0
3fS6uTuSw3xy/Y1K81tBz3rStfHCjdBcD1rqf0zijDbXgX2CP3havAll7dVWs4cz
3WtT9T0EKGP2SQKeaXzKpG6gieuZN0UijRL524A+afKqc8rlY5Vk9MheHMHonLt2
zsMCcKct4Z+8KKo3KtGfFicVb+TJKl97XQRqiravh/Y6Tu/cd08qUxKT9VNFK47p
xdv+tuSUza8AvvY4PTzONiqCSODmYkeLpoyARa9/6QGfcURhgQxwKJenT3bUP5HI
MCR+s6YtqJwMRKPj12Je7k7lqinWD5I6RgUkhJ5E38/c+ei7NyZfDvsD3vfKPrZf
ey4a9mHuMiEKcTGeG4S11pAHpQOj0DTRl3M7HDJ0xJ1PcI3JbxcwCQFRBB9DDDDP
9/nKhW/WqaVNqj3AeSoMsKq32YKLsacni3xPGIp4Y1dCwXEM4wHKA0C5U3IjCexH
xmL/gvd4kx40YhA8RG2N4Uu0Kbv7nE0R+Iqgsa2a+GVPkA4iDp8=
=Nuqy
-----END PGP SIGNATURE-----

--=-BWWhve4qxaPrBo0dh95w--

