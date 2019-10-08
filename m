Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F82D006C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 20:05:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nlck2ljQzDqRS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 05:05:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nlZz1WKPzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 05:03:38 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x98HhfQt026408; Tue, 8 Oct 2019 14:02:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vgwdwme50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 14:02:41 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x98HpX0V045873;
 Tue, 8 Oct 2019 14:02:41 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vgwdwme3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 14:02:41 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x98Hxa60005052;
 Tue, 8 Oct 2019 18:02:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2vejt6u75q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 18:02:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x98I2cTY9109858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2019 18:02:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31E8711206F;
 Tue,  8 Oct 2019 18:02:38 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52D72112061;
 Tue,  8 Oct 2019 18:02:31 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.46])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Oct 2019 18:02:31 +0000 (GMT)
Message-ID: <c1676fb14313a8378ec6bb72d1a7b24f48b898b5.camel@linux.ibm.com>
Subject: Re: [PATCH v5 02/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Christopher Lameter <cl@linux.com>
Date: Tue, 08 Oct 2019 15:02:27 -0300
In-Reply-To: <alpine.DEB.2.21.1910081741460.2923@www.lameter.com>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003013325.2614-3-leonardo@linux.ibm.com>
 <alpine.DEB.2.21.1910081509070.1734@www.lameter.com>
 <6e8877bff034603e75b35599797a39d9bc4840f1.camel@linux.ibm.com>
 <alpine.DEB.2.21.1910081741460.2923@www.lameter.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-uR24Id1SoXLfuKZlusT9"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910080142
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


--=-uR24Id1SoXLfuKZlusT9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-10-08 at 17:43 +0000, Christopher Lameter wrote:
> On Tue, 8 Oct 2019, Leonardo Bras wrote:
>=20
> > > You are creating contention on a single exclusive cacheline. Doesnt t=
his
> > > defeat the whole purpose of the lockless page table walk? Use mmap_se=
m or
> > > so should cause the same performance regression?
> >=20
> > Sorry, I did not understand that question.
> > I mean, this is just a refcount and never causes a lock.
>=20
> Locks also use atomic operations like a refcount increment. Both require
> the cacheline to be in exclusive state. So the impact is very similar.

Thanks for explaining. :)

So you say that the performance impact of using my approach is the same
as using locks? (supposing that lock never waits)

So, there are 'lockless pagetable walks' only for the sake of better
performance?=20

I thought they existed to enable doing pagetable walks in states where
locking was not safe.

Is that right?

Thanks!
Leonardo Br=C3=A1s,


--=-uR24Id1SoXLfuKZlusT9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2czzMACgkQlQYWtz9S
ttTcBw//Q3V1Sh9/H9YgHRAZLNo4J0NXNOfZMB3Wuu6FYM2o1AdA8/+94ofzIS9s
b4H3QlO8XePM8lSosVaoR9hxIBJFAg7wcomI1tLbyVA9vxYvf+9HYpMsjcAs991F
FNrFFO3KtCH6ahjNVM/nIqrbZnVqtyqBuQZRhdnMnqzB9xxDLxRPAlhsmq8cfhkT
jjlvhnebjYX7lbzZ55vzRDeZNQb2Nd0wkeA2Ij/0ab9ii5WiNlYaSoi6BbyPL6m2
SYKorTyqqd/Ci92LzXGK4SkQxjeNK/JFmmtHWpWyuow4/8i1pjuVob+KyKF5QFjL
qMFHZGXk2Z/7PAjWz6HuWw2sRC3LTjRdD85zELkDnW8pHy6Tq0gWvmUn5zME0y+4
WNpFrqyLYgjlCXdCwB4WVMxl7OK71seolusrMfszomiAMMjZQBIdHZeep5dViH+9
4ICmwSuG1jLV1bpx3Eoq9rqLbhIN2GNnPLHav2w669z9iANw8A27DtKTUQii/t0L
FpBRbvYBBhAp1bmq894bzBK1DWch8ouoqh9b9e2ZbYv+fCav5lyHo7ikAc0lLU/0
lvNltSIBKQaYiDCP231JT6NowJUfeu6fCQsZjs1mMh1AHPlEy5l6/P/SrP4Q0wa8
0DTkCHMyGNrYnfqXFqeAMOvOjtEMMh/Sy01nq7n6w2gQiaUn+Lk=
=HxOw
-----END PGP SIGNATURE-----

--=-uR24Id1SoXLfuKZlusT9--

