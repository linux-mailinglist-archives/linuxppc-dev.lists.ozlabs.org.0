Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D717CB042
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 22:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46klH70Z8BzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 06:39:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46klDt6YspzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 06:37:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x93KW46d033719; Thu, 3 Oct 2019 16:36:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vdqct1kun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 16:36:45 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x93KXmk8042901;
 Thu, 3 Oct 2019 16:36:44 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vdqct1ku6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 16:36:44 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x93KYoi6005598;
 Thu, 3 Oct 2019 20:36:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2v9y57f714-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 20:36:43 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x93KagKt35783092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 20:36:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 807D3AC05E;
 Thu,  3 Oct 2019 20:36:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0073AC059;
 Thu,  3 Oct 2019 20:36:35 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 20:36:35 +0000 (GMT)
Message-ID: <c46d6c7301314a2d998cffc47d69b404f2c26ad3.camel@linux.ibm.com>
Subject: Re: [PATCH v5 00/11] Introduces new count-based method for tracking
 lockless pagetable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 03 Oct 2019 17:36:31 -0300
In-Reply-To: <20191003072952.GN4536@hirez.programming.kicks-ass.net>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003072952.GN4536@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-MwGy14uV6sOBKPSXi/z8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030166
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
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christoph Lameter <cl@linux.com>, Ira Weiny <ira.weiny@intel.com>,
 Ingo Molnar <mingo@kernel.org>, Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch@vger.kernel.org, Santosh Sivaraj <santosh@fossix.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Allison Randal <allison@lohutok.net>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm-ppc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Reza Arbab <arbab@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-MwGy14uV6sOBKPSXi/z8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter, thanks for the feedback!

On Thu, 2019-10-03 at 09:29 +0200, Peter Zijlstra wrote:
> On Wed, Oct 02, 2019 at 10:33:14PM -0300, Leonardo Bras wrote:
> > If a process (qemu) with a lot of CPUs (128) try to munmap() a large
> > chunk of memory (496GB) mapped with THP, it takes an average of 275
> > seconds, which can cause a lot of problems to the load (in qemu case,
> > the guest will lock for this time).
> >=20
> > Trying to find the source of this bug, I found out most of this time is
> > spent on serialize_against_pte_lookup(). This function will take a lot
> > of time in smp_call_function_many() if there is more than a couple CPUs
> > running the user process. Since it has to happen to all THP mapped, it
> > will take a very long time for large amounts of memory.
> >=20
> > By the docs, serialize_against_pte_lookup() is needed in order to avoid
> > pmd_t to pte_t casting inside find_current_mm_pte(), or any lockless
> > pagetable walk, to happen concurrently with THP splitting/collapsing.
> >=20
> > It does so by calling a do_nothing() on each CPU in mm->cpu_bitmap[],
> > after interrupts are re-enabled.
> > Since, interrupts are (usually) disabled during lockless pagetable
> > walk, and serialize_against_pte_lookup will only return after
> > interrupts are enabled, it is protected.
>=20
> This is something entirely specific to Power, you shouldn't be touching
> generic code at all.

Up to v4, I was declaring dummy functions so it would not mess up with
other archs: http://patchwork.ozlabs.org/patch/1168779/

But I was recommended to create a generic function that could guide the
way to archs: http://patchwork.ozlabs.org/patch/1168775/

The idea was to concentrate all routines of beginning/ending lockless
pagetable walks on these functions, and call them instead of
irq_disable/irq_enable.
Then it was easy to place the refcount-based tracking in these
functions. It should only be enabled in case the config chooses to do
so.=20

>=20
> Also, I'm not sure I understand things properly.
>=20
> So serialize_against_pte_lookup() wants to wait for all currently
> out-standing __find_linux_pte() instances (which are very similar to
> gup_fast).
>=20
> It seems to want to do this before flushing the THP TLB for some reason;
> why? Should not THP observe the normal page table freeing rules which
> includes a RCU-like grace period like this already.
>=20
> Why is THP special here? This doesn't seem adequately explained.

"It's necessary to monitor lockless pagetable walks, in order to avoid
doing THP splitting/collapsing during them."

If a there is a THP split/collapse during the lockless pagetable walk,
the returned ptep can be a pointing to an invalid pte.=20

To avoid that, the pmd is updated, then serialize_against_pte_lookup is
ran. Serialize runs a do_nothing in all cpu in cpu_mask.=20

So, after all cpus finish running do_nothing(), there is a guarantee
that if there is any 'lockless pagetable walk' it is running on top of
a updated version of this pmd, and so, collapsing/splitting THP is
safe.

>=20
> Also, specifically to munmap(), this seems entirely superfluous,
> munmap() uses the normal page-table freeing code and should be entirely
> fine without additional waiting.

To be honest, I remember it being needed in munmap case, but I really
don't remember the details. I will take a deeper look and come back
with this answer.=20

> Furthermore, Power never accurately tracks mm_cpumask(), so using that
> makes the whole thing more expensive than it needs to be. Also, I
> suppose that is buggered vs file backed THP.

That accuracy of mm_cpumask is above my knowledge right now. =3D)

I agree that it's to expensive to do that. That's why I suggested this
method, that can check if there is any 'lockless pagetable walk'
running before trying to serialize. It reduced the waiting time a lot
for large amounts of memory. (more details on cover letter)

Best regards,

Leonardo Br=C3=A1s

--=-MwGy14uV6sOBKPSXi/z8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2WW88ACgkQlQYWtz9S
ttR2SA/8CaspKJYeFlhYLpBdeWuazYm5DTWTEEOUml0igLgqAtk4ehAw/DJN2Yqg
uIcYMOoIaKVQaE20fFeapyXSj7aNe1VIDIkehEGCTKCr7PZ0qEpWecCgJJaus012
FDvFYmJQgtBQpf6dDEaDnINRq72SF4Bek5kuLRdePO3bla4FY7HlA0ZwvtTq4ji7
cEDkJiGZpyDTz35DGcwfEXvJAWJRyVEdIs1DV1vNkgO7+TQNlj1ErQf9OcdS5DN2
zJyfx5Rb+3ijNcjB/l/duXXAKfdWxBSY7jWvNT02Z82qc7PoZZ88OazB07PcaJF3
2z8E7Xm0apy9xbv0W/6vzeJpyBMUKNwven7s9oLlg4TITPJLHLsD5iIL0banmzzT
J3PNGuz5DJXal+WE08ZAvURcLSw1yAkN2XRx7aSuwvxSiwzUd/yI3hRakOYGO1Ii
oaXujHvDycEG8L1xRWr+f0/OKnukanV7XLJWyPslgIu5RaKMGLwruXC/BsbX+4Tm
naenYMazQHF3LrwBcY05M+708wFO/4HYtGmnuRzFHi6Eh4YQe3XYMhwuBVfUcyYX
pQDsFaunwzQLlKolRolDL7sx+bcdIKxpuzoYPGoxrbvPmZVUqEmIKzx+KiYUr7vY
QNAP2bHeVI2RrZvSWsYGmsyNALWVixCM+hxbfBQS4EI3AtQa40E=
=f84a
-----END PGP SIGNATURE-----

--=-MwGy14uV6sOBKPSXi/z8--

