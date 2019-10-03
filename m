Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D999DCB111
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 23:26:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kmKY4n56zDqbr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 07:26:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kmHS3WvwzDq9j
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 07:24:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x93LCdfx082613; Thu, 3 Oct 2019 17:24:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdpu7432j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 17:24:23 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x93LOMJM110138;
 Thu, 3 Oct 2019 17:24:22 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdpu74323-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 17:24:22 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x93LA0iK002172;
 Thu, 3 Oct 2019 21:24:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2v9y5a39je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 21:24:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x93LOJjE45547824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 21:24:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BF9FC605A;
 Thu,  3 Oct 2019 21:24:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ABC0C6055;
 Thu,  3 Oct 2019 21:24:11 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 21:24:10 +0000 (GMT)
Message-ID: <c46ba8cec981ad28383bb7b23161fb83ccda4a60.camel@linux.ibm.com>
Subject: Re: [PATCH v5 01/11] asm-generic/pgtable: Adds generic functions to
 monitor lockless pgtable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 03 Oct 2019 18:24:07 -0300
In-Reply-To: <20191003115141.GJ4581@hirez.programming.kicks-ass.net>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003013325.2614-2-leonardo@linux.ibm.com>
 <20191003071145.GM4536@hirez.programming.kicks-ass.net>
 <20191003115141.GJ4581@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-AbFimQGKzzzvtIH76Jj2"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030171
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


--=-AbFimQGKzzzvtIH76Jj2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter, thanks for the feedback!

On Thu, 2019-10-03 at 13:51 +0200, Peter Zijlstra wrote:
> On Thu, Oct 03, 2019 at 09:11:45AM +0200, Peter Zijlstra wrote:
> > On Wed, Oct 02, 2019 at 10:33:15PM -0300, Leonardo Bras wrote:
> > > diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgta=
ble.h
> > > index 818691846c90..3043ea9812d5 100644
> > > --- a/include/asm-generic/pgtable.h
> > > +++ b/include/asm-generic/pgtable.h
> > > @@ -1171,6 +1171,64 @@ static inline bool arch_has_pfn_modify_check(v=
oid)
> > >  #endif
> > >  #endif
> > > =20
> > > +#ifndef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_CONTROL
> > > +static inline unsigned long begin_lockless_pgtbl_walk(struct mm_stru=
ct *mm)
> > > +{
> > > +	unsigned long irq_mask;
> > > +
> > > +	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING))
> > > +		atomic_inc(&mm->lockless_pgtbl_walkers);
> >=20
> > This will not work for file backed THP. Also, this is a fairly serious
> > contention point all on its own.
>=20
> Kiryl says we have tmpfs-thp, this would be broken vs that, as would
> your (PowerPC) use of mm_cpumask() for that IPI.

Could you please explain it?
I mean, why this breaks tmpfs-thp?

Also, why mm_cpumask() is also broken?

>=20
> > > +	/*
> > > +	 * Interrupts must be disabled during the lockless page table walk.
> > > +	 * That's because the deleting or splitting involves flushing TLBs,
> > > +	 * which in turn issues interrupts, that will block when disabled.
> > > +	 */
> > > +	local_irq_save(irq_mask);
> > > +
> > > +	/*
> > > +	 * This memory barrier pairs with any code that is either trying to
> > > +	 * delete page tables, or split huge pages. Without this barrier,
> > > +	 * the page tables could be read speculatively outside of interrupt
> > > +	 * disabling.
> > > +	 */
> > > +	smp_mb();
> >=20
> > I don't think this is something smp_mb() can guarantee. smp_mb() is
> > defined to order memory accesses, in this case the store of the old
> > flags vs whatever comes after this.
> >=20
> > It cannot (in generic) order against completion of prior instructions,
> > like clearing the interrupt enabled flags.
> >=20
> > Possibly you want barrier_nospec().
>=20
> I'm still really confused about this barrier. It just doesn't make
> sense.
>=20
> If an interrupt happens before the local_irq_disable()/save(), then it
> will discard any and all speculation that would be in progress to handle
> the exception.
>=20
> If there isn't an interrupt (or it happens after disable) it is
> irrelevant.
>=20
> Specifically, that serialize-IPI thing wants to ensure in-progress
> lookups are complete, and I can't find a scenario where
> local_irq_disable/enable() needs additional help vs IPIs. The moment an
> interrupt lands it kills speculation and forces things into
> program-order.
>=20
> Did you perhaps want something like:
>=20
> 	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING)) {
> 		atomic_inc(&foo);
> 		smp_mb__after_atomic();
> 	}
>=20
> 	...
>=20
> 	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING)) {
> 		smp_mb__before_atomic();
> 		atomic_dec(&foo);
> 	}
>=20
> To ensure everything happens inside of the increment?
>=20

I need to rethink this barrier, but yes. I think that's it.=20
It's how it was on v4.

I have changed it because I thought it would be better this way. Well,
it was probably a mistake of my part.

> And I still think all that wrong, you really shouldn't need to wait on
> munmap().

That is something I need to better understand. I mean, before coming
with this patch, I thought exactly this: not serialize when on munmap.=20

But on the way I was convinced it would not work on munmap. I need to
recall why, and if it was false to assume this, re-think the whole
solution.

Best regards,

Leonardo Br=C3=A1s

--=-AbFimQGKzzzvtIH76Jj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2WZvcACgkQlQYWtz9S
ttTX8hAAxN3+8qz101R3PnfPxCPJuz+SZo22mLmwJKcJWwwEejFEZR0+2bLUMzIH
ryWzy33/IPNdLR4le/j2oXMWbxsaj/mIFCPSv2kZECYKBexqmdwL5bu89xzdbahC
keS0+sD/WZzYa9F2IaipvTQROGGjgLJkdCTEk3NnR/eXsWwXGATQ1k40G3kOVGg0
b8/27SCbuDKVHXEXtoIMXHV5b62a6ShT4qg2hqBbzsWGel/jYMwg7FFgImogu0YP
L5jlEXZLKOWEaklSCyzA1XYPVpyIFct/ZBV5YpKKelZsOcu7GiCHB4fLyJCLc18K
vQc3d8n/mjsE1ikyKTprhJZEY46MNtKMjWLnnhwxVAcDU5qCijt0WlRqeeI14NuP
3IN/+SysNt7Hzl70QRWeR2siGKYPPWMQDqEHcLJtYtau0r/qtKjixZkath62KVrJ
MlziT40b3hLEtZsQj0VdwqQ+w3H+vu04RjvUt0dRXHEmQXz0tbCyHcCZ3ztUHx8O
kisfErvVQT4xl+esHJWumKJGS5udezi/FRLLeABwWKbbv8UncwCb7OneOAmdtYA/
AsGmCP8YBPrsTF5gGymTP0mg/yvvjyDqXYTAmqY0KyDjKC4UM7hpnP5iIBobPTA4
ZEa8jx6zzJvipJ4/C/bR0XtE4ql6pMPddC5HBNMHrYyPO5myIyY=
=AO5j
-----END PGP SIGNATURE-----

--=-AbFimQGKzzzvtIH76Jj2--

