Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A81BBA84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 19:28:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cWWG3sTLzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 03:28:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cWT971C1zDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 03:26:36 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NHN69O047941; Mon, 23 Sep 2019 13:26:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v70cvce19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 13:26:02 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8NHN7wV048081;
 Mon, 23 Sep 2019 13:26:01 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v70cvce0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 13:26:01 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NHPD51024308;
 Mon, 23 Sep 2019 17:26:00 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2v5bg72k8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 17:26:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NHPxRQ11076200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 17:25:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5037BAC05E;
 Mon, 23 Sep 2019 17:25:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 555A3AC059;
 Mon, 23 Sep 2019 17:25:56 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 17:25:56 +0000 (GMT)
Message-ID: <18c5c378db98f223a0663034baa9fd6ce42f1ec7.camel@linux.ibm.com>
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>
Date: Mon, 23 Sep 2019 14:25:51 -0300
In-Reply-To: <4ea26ffb-ad03-bdff-7893-95332b22a5fd@nvidia.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-12-leonardo@linux.ibm.com>
 <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
 <24863d8904c6e05e5dd48cab57db4274675ae654.camel@linux.ibm.com>
 <4ea26ffb-ad03-bdff-7893-95332b22a5fd@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-QkhmEMJu3huKrEpzj07X"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=661 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230156
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
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Keith Busch <keith.busch@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-QkhmEMJu3huKrEpzj07X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-20 at 17:48 -0700, John Hubbard wrote:
>=20
[...]
> So it seems that full memory barriers (not just compiler barriers) are re=
quired.
> If the irq enable/disable somehow provides that, then your new code just =
goes
> along for the ride and Just Works. (You don't have any memory barriers in
> start_lockless_pgtbl_walk() / end_lockless_pgtbl_walk(), just the compile=
r
> barriers provided by the atomic inc/dec.)
>=20
> So it's really a pre-existing question about the correctness of the gup_f=
ast()
> irq disabling approach.

I am not experienced in other archs, and I am still pretty new to
Power, but by what I could understand, this behavior is better
explained in serialize_against_pte_lookup.=20

What happens here is that, before doing a THP split/collapse, the
function does a update of the pmd and a serialize_against_pte_lookup,
in order do avoid a invalid output on a lockless pagetable walk.

Serialize basically runs a do_nothing in every cpu related to the
process, and wait for it to return.=20

This running depends on interrupt being enabled, so disabling it before
gup_pgd_range() and re-enabling after the end, makes the THP
split/collapse wait for gup_pgd_range() completion in every cpu before
continuing. (here happens the lock)

(As told before, every gup_pgd_range() that occurs after it uses a
updated pmd, so no problem.)

I am sure other archs may have a similar mechanism using
local_irq_{disable,enable}.

Did it answer your questions?

Best regards,

Leonardo Bras

--=-QkhmEMJu3huKrEpzj07X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2JAB8ACgkQlQYWtz9S
ttRr1Q//T4jMYmkfmx27+Bg69sKonvlgnqSo2pOluY9vzcehO8orfWtP3QQO2WNv
ruCYAfCtzUh9x6sByQylolwbt1e/8dI82HBybU4Cy0lgP7ZfDTe+YiWJzMUiUh1l
Mm36hPPdVyN3EC0UgWQ7nnfnk2xR7UDOfw701rOzvIsK9P568qP65Iryf7uu0V3n
jvZ5JhVJX9eit1OMfEfVBvZigAuv4eAMvu0LK4ko2uTRUgRdkgZa+Pgf9N38Ok8/
iaHvDIcbUaZM/PiHkMSdh1iypyAnkGEYb9zpu0He41DiMOsjSkspvcJPRv19/N7X
p71AztGoVXZd02F6tAMkO+794GqIT2/sixX3gUPCCY7d1uhae2d/u5lMhvXK+sCS
ktivTMvPqwVfAOGpMheFkugQAu7GhGkUvhslC+YXcZUZJDShK1exMfpbF9slvpEy
x8/IkF0EGNWei1jw9iW5ic6b9Abk0WoxwbAAjCgZIkbSliZp9O5eD5+woyMn6DRT
c9CSagzNt6ztFsoAMFbtGHq0bgyW8THVNt9Oq1mijpPEwmfGoa7yfMRmt4+KU4bh
n6NHbeStFsqhe+59pFTpLRRFkTbMoTQHWsNCLVRlG6fTVZOp0kurs2IjywGqVV8X
KyFpkCPlUtX8N69af3sVNbUHG11DDvFF4F+FPPjpRnCpqiyRs3E=
=BjCh
-----END PGP SIGNATURE-----

--=-QkhmEMJu3huKrEpzj07X--

