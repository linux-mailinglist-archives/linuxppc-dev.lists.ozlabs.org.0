Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D541ACFF98
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 19:16:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nkXc6QYwzDqQK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 04:16:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nkVk5994zDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 04:14:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x98GvAUp132403; Tue, 8 Oct 2019 13:14:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vgujcfyj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 13:14:12 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x98GvNPm132979;
 Tue, 8 Oct 2019 13:14:11 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vgujcfyh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 13:14:11 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x98GtUGH015110;
 Tue, 8 Oct 2019 17:14:10 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 2vejt6tx3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 17:14:10 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x98HE8xU57934258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2019 17:14:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 527E3C605F;
 Tue,  8 Oct 2019 17:14:08 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53536C605A;
 Tue,  8 Oct 2019 17:14:00 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.46])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Oct 2019 17:14:00 +0000 (GMT)
Message-ID: <6e8877bff034603e75b35599797a39d9bc4840f1.camel@linux.ibm.com>
Subject: Re: [PATCH v5 02/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Christopher Lameter <cl@linux.com>
Date: Tue, 08 Oct 2019 14:13:55 -0300
In-Reply-To: <alpine.DEB.2.21.1910081509070.1734@www.lameter.com>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003013325.2614-3-leonardo@linux.ibm.com>
 <alpine.DEB.2.21.1910081509070.1734@www.lameter.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-JXyt1yOsMJO5qRHMDgfG"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910080140
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, "Peter
 Zijlstra \(Intel\)" <peterz@infradead.org>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Ira Weiny <ira.weiny@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Santosh Sivaraj <santosh@fossix.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar
 K.V" <aneesh.kumar@linux.ibm.com>, Jann Horn <jannh@google.com>,
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-JXyt1yOsMJO5qRHMDgfG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-10-08 at 15:11 +0000, Christopher Lameter wrote:
>=20
> On Wed, 2 Oct 2019, Leonardo Bras wrote:
>=20
> > +
> > +inline unsigned long __begin_lockless_pgtbl_walk(struct mm_struct *mm,
> > +						 bool disable_irq)
> > +{
> > +	unsigned long irq_mask =3D 0;
> > +
> > +	if (IS_ENABLED(CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING))
> > +		atomic_inc(&mm->lockless_pgtbl_walkers);
> > +
>=20
> You are creating contention on a single exclusive cacheline. Doesnt this
> defeat the whole purpose of the lockless page table walk? Use mmap_sem or
> so should cause the same performance regression?

Sorry, I did not understand that question.
I mean, this is just a refcount and never causes a lock. =20


FYI: This function was updated as following, and will be in v6:

#ifdef CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING
	atomic_inc(&mm->lockless_pgtbl_walkers);
#endif
	smp_mb();

IS_ENABLED doesnt work fine if CONFIG_LOCKLESS_PAGE_TABLE_WALK_TRACKING
is not defined, causing an error: the mm member lockless_pgtbl_walkers
doesn't exist.

--=-JXyt1yOsMJO5qRHMDgfG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2cw9MACgkQlQYWtz9S
ttQJpQ/+NQnm5YZrjCiFby0X7Zf2c6QdSw96EfXRY6oxh//DMzzC+U3jhpEDpGKA
QjRsZiDRIdHhVHWVPkC9Oz76ThRYBaFSjhs7l06K7asP0KaXFDxv6XInJ2dlqqQW
GSHmRaqDBbr9ndUaJz3J4CbU05jsEwCrmku7O5BhBejtYoKAQBvHFuFVcO71A1YW
hH92tSFBR39N6SADoVVxDwpSd2ryeK3k0czeLxeekENyCxmRk6HgBUKHcwSMP0d3
rRDpJ+IVWqIja+43DjknTGYq4xGXYnfFzYfdQIaqhc+rNWyKJ3C07/5zhMteVJqk
ycMJ39kFL66uO/J24Cr0DKo9W2VcdwxEQ1a+W2/4FeayI8QT3IgN0WqcMXcnfG/K
ahVV6S/gliueptjZWgWy62jnEXMbWzHLtVMTlzjxYyLGzOe64Lsa6lt054VcIws5
DstylhjC6HOURSZ5c9IChKdavw5QOvRTjoq/stxswR1D05USHVWKrXxyCewY7eSo
7AEnUmOAXpWmem81q+VAFYq4UrOlkknz4gZkhotkUdcfHs+y6hwzTzfh4SzifFxq
QC8cXCtmkrurkVjRDLxSt/6vkemBBouw9ug2EExB8fDHdC5m8O2brErMC2iL5ppx
bG7LtF0rTIqLrfRxpgctebsZ8yRZBV0aMAjbxi/pPOu8egZzHeY=
=Nht8
-----END PGP SIGNATURE-----

--=-JXyt1yOsMJO5qRHMDgfG--

