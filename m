Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB1BBD58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:53:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cc3p6JxwzDqL5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:53:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbyd2vsczDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:48:57 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NKkwRM135938; Mon, 23 Sep 2019 16:48:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v72aqwu2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:48:34 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8NKlkf4142544;
 Mon, 23 Sep 2019 16:48:33 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v72aqwu1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:48:33 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NKjFNG008412;
 Mon, 23 Sep 2019 20:48:32 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 2v5bg6xjm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 20:48:32 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NKmVNo16057158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 20:48:31 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84B4DAC060;
 Mon, 23 Sep 2019 20:48:31 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EA1CAC059;
 Mon, 23 Sep 2019 20:48:28 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 20:48:27 +0000 (GMT)
Message-ID: <007934281451e843a0428dc1e674f9dae149b75b.camel@linux.ibm.com>
Subject: Re: [PATCH v2 02/11] asm-generic/pgtable: Adds dummy functions to
 monitor lockless pgtable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Sep 2019 17:48:24 -0300
In-Reply-To: <cb7d4196-c646-82c7-d61f-b28ee9ab47b9@nvidia.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-3-leonardo@linux.ibm.com>
 <cb7d4196-c646-82c7-d61f-b28ee9ab47b9@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-gscBM7V3X0iJvvOlmKSv"
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
 Richard Fontana <rfontana@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-gscBM7V3X0iJvvOlmKSv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback,

On Mon, 2019-09-23 at 13:39 -0700, John Hubbard wrote:
> Please remember to include linux-mm if there is a v2.

Sure, I will include on v3.

> Nit: seems like it would be nicer to just put it all in one place, and us=
e
> positive logic, and also I think people normally don't compress the empty
> functions quite that much. So like this:

I did this by following the default on the rest of this file.
As you can see, all other features use the standard of=20
#ifndef SOMETHING
dummy/generic functions
#endif

Declaring the functions become responsibility of the arch.

> #ifdef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_COUNTER
> void start_lockless_pgtbl_walk(struct mm_struct *mm);=20
> void end_lockless_pgtbl_walk(struct mm_struct *mm);=20
> int running_lockless_pgtbl_walk(struct mm_struct *mm);=20
>=20
> #else
> static inline void start_lockless_pgtbl_walk(struct mm_struct *mm)
> {
> }
> static inline void end_lockless_pgtbl_walk(struct mm_struct *mm)
> {
> }
> static inline int running_lockless_pgtbl_walk(struct mm_struct *mm)
> {
>         return 0;
> }
> #endif
>=20
> thanks,

--=-gscBM7V3X0iJvvOlmKSv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2JL5gACgkQlQYWtz9S
ttQ/dxAAmqh1JwzGgrYEa6AI0XaKTKXfH+bFIB1fqsi0Gli4dmGUVNOz/qhFJa4d
HVBKm2Xq2FoNnqNfrihl527mry0pJnpUZTJLHiga3Pu9c6oY8bdSAeqfTh4xR74S
FIP+zgEvZBk6IKZaNit1tlHCkD1dRaPLcCaYUBmSVf0nsya+5zE3hkCgHU0vcsRc
ttmSNmOtglF+Y5zrOhBDrXcHUkHR5242AraOWaqAEh++ijgu4zMP3gsUitjtPPOF
4ZDNSg9/98JUZWd15+29J1f6Zknn8XhCQpiKCzAZQecNZ3xkWiWf0Mtgl7XDKZn6
bHOKBEyKXXLcgwlljlhW5QBHmmwGwPYhOuUhl49eM00jIebyU9JZFjyFR7907dGT
eziIXPFrQDndRxZNbpjTKH9bO7+MUj3X7fdL4RqPM3dJghMGD3SsfQpHVydMCod6
VHNxF3x/uHuqY0lH7zJt98v+qk5TycFFARZGOO0IZ5OCsqNzKxkPqCyVZlK1PiIY
vs0FExh8GZbJ2g2rX0QZqKY4OcgNxKpKRlpAhIHGIV1GQchV8PHcj1icghNzXzX9
7bNyoczCO5atCCJDlrGaNLVE22+LKCciaDKFAN8noZFzhMGGWzGhrfQ/mSbOvAxt
3IuAflLfYMrYZRlyu+Zx8YVXlG6nqzyJpIK2rlTQ/YR2IR19bno=
=ZXCk
-----END PGP SIGNATURE-----

--=-gscBM7V3X0iJvvOlmKSv--

