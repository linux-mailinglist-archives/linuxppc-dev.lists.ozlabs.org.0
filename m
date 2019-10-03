Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C16CAF05
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 21:15:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kjPh3dqlzDq9p
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 05:15:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kjCQ4YpszDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 05:06:10 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x93IqL1A004018; Thu, 3 Oct 2019 15:04:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdm1756yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 15:04:19 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x93IqgZA004949;
 Thu, 3 Oct 2019 15:04:16 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdm1756x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 15:04:16 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x93ItvaJ020338;
 Thu, 3 Oct 2019 19:04:15 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 2v9y58j8kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 19:04:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x93J4Dkf54591808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 19:04:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDC21112061;
 Thu,  3 Oct 2019 19:04:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB474112064;
 Thu,  3 Oct 2019 19:04:06 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 19:04:06 +0000 (GMT)
Message-ID: <08c43176fcf46c768d474f7d3620e07f3f71b140.camel@linux.ibm.com>
Subject: Re: [PATCH v5 10/11] mm/Kconfig: Adds config option to track
 lockless pagetable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Qian Cai <cai@lca.pw>
Date: Thu, 03 Oct 2019 16:04:02 -0300
In-Reply-To: <88228CE0-81B2-4F2F-8C1D-F3376DB25A16@lca.pw>
References: <20191003013325.2614-11-leonardo@linux.ibm.com>
 <88228CE0-81B2-4F2F-8C1D-F3376DB25A16@lca.pw>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-6JwD3nS1I5bp6jdQjZJI"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=27 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030155
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "Dmitry
 V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christoph Lameter <cl@linux.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Santosh Sivaraj <santosh@fossix.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-6JwD3nS1I5bp6jdQjZJI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-10-02 at 22:08 -0400, Qian Cai wrote:
> Can=E2=80=99t this name and all those new *lockless* function names be sh=
orter?=20
> There are many functions name with *_locked, so how about dropping=20
> lockless at all, i.e., PAGE_TABLE_WALK_TRACKING blah blah?

Thanks for the feedback!

Well, in this case it only tracks the 'lockless pagetable walks'. In
this approach, the 'locked pagetable walks' don't need to be tracked.



--=-6JwD3nS1I5bp6jdQjZJI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2WRiIACgkQlQYWtz9S
ttTLPQ/5AadIHB7M8l0r2DhjP46ynmXH5IxgHEY7CjSTQZzcRJIAM9AMhlH9Ps+z
fjqBvZ0ZSOJAJQPbMP4nRi3kTdAdg7tyLtJj78BgcKpM+2Y3iKlq3O2HgqvqCZdH
zkuVaWtPdlYICGLA12Y39UaiYxnNEAwvm+W7vb9nk/fL6T8aTTZFZAZOT1SVQZty
a6YhEcj/10usw6lATrcmS3j4z8RV0aLP5L4gFQeexekfPZQu08Jaq8B3tWmC9nTc
eimFeMtGUaAybx9HJb//9GYYkSGGGGi8AkE1EpiIbQkoK88n0nPenGCcaBvJfD+V
w2hHUAmtfEOCYgDO4pHiQRCxl0sI5fuVJNPpAFJc317szxCW/MGhg+CxxrPjfDtA
S0Y0Iu9DZdXrHbBP7sfLuXv05bhL4yR7vS3/T6J+5CdzBSjnfMpYvL61Qj8vXb1R
g703mw25Ukm4FXbxTNoVvalohYjPM80J6IOiFpMr+MWjuZSzBpS8ooH8SKO3hoMd
wMwRtiJZD0vwLlj859memG7yhiufyG/TU6/lzAVydl9JZdb7xjhlSExGyutxCFCo
2Bnsd5rOYsT2pQNPnWuHm0r+MvPW7wYnm3qy7GoYhNsxB1hAhvNkFy+EXCzmcDKE
tTVoRqlRZXwvVjtmTVbmV7NzchhZicDLcJRPS38dfIm2PezXsno=
=6lYM
-----END PGP SIGNATURE-----

--=-6JwD3nS1I5bp6jdQjZJI--

