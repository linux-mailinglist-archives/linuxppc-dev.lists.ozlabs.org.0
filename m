Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6563CAF1A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 21:23:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kjbS07YMzDqWy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 05:23:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kjJg5VgqzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 05:10:43 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x93IqPVr031308; Thu, 3 Oct 2019 15:09:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdkqyfe0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 15:09:00 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x93IqbGP031821;
 Thu, 3 Oct 2019 15:08:59 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdkqyfdyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 15:08:59 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x93IttdU020332;
 Thu, 3 Oct 2019 19:08:57 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2v9y58j9yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 19:08:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x93J8taL56426992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 19:08:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62F4878064;
 Thu,  3 Oct 2019 19:08:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 843A97805F;
 Thu,  3 Oct 2019 19:08:46 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 19:08:46 +0000 (GMT)
Message-ID: <43648fe1bb12a7627a14a49405ec18289f3dbbe8.camel@linux.ibm.com>
Subject: Re: [PATCH v5 10/11] mm/Kconfig: Adds config option to track
 lockless pagetable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Qian Cai <cai@lca.pw>
Date: Thu, 03 Oct 2019 16:08:45 -0300
In-Reply-To: <08c43176fcf46c768d474f7d3620e07f3f71b140.camel@linux.ibm.com>
References: <20191003013325.2614-11-leonardo@linux.ibm.com>
 <88228CE0-81B2-4F2F-8C1D-F3376DB25A16@lca.pw>
 <08c43176fcf46c768d474f7d3620e07f3f71b140.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-VybRhkfSRVywgfzTr45C"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=27 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
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


--=-VybRhkfSRVywgfzTr45C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-10-03 at 16:04 -0300, Leonardo Bras wrote:
> On Wed, 2019-10-02 at 22:08 -0400, Qian Cai wrote:
> > Can=E2=80=99t this name and all those new *lockless* function names be =
shorter?=20
> > There are many functions name with *_locked, so how about dropping=20
> > lockless at all, i.e., PAGE_TABLE_WALK_TRACKING blah blah?
>=20
> Thanks for the feedback!
>=20
> Well, in this case it only tracks the 'lockless pagetable walks'. In
> this approach, the 'locked pagetable walks' don't need to be tracked.

So, using PAGE_TABLE_WALK_TRACKING would not be very accurate (as said
before, there are the locked ones).

--=-VybRhkfSRVywgfzTr45C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2WRz0ACgkQlQYWtz9S
ttT+TA/1FSJfZVTq1e5fFW17J/V8Y4SiHa0K5xFAs/GWhR8M24yCyXUhMXz/liQT
IDOViKxoVkc1e1NwSBePEDZkaEvl0XtMPPsGMbZ5Jb1XIJglqGKhr5mBSFXzd8nt
XjImtXNN8JGR/Tx/2C9ThYfdcqmbDmntDsmSBZyIZXqOJUiICJmrpZHx6/ZPmCPb
k0fdWqC8GE8H8DbvbW72a5iOh176EogGVduOryjx/N+vD9+xYhxj28lIWimRs/+A
pesIWhFCE0ZuRDz6/Ud/WSun2aqad1x/fLgW0xMuSTA9/pies0PdZtAMS/89yrRY
b4YPZM3iL6y/stdTfRc7Eu3S+gdCnp4avKWE+84MlwnM1Zq0p8+MTClRyX+tJbc2
s1QcmkOW8T70VkqnsBqGKkSa3RqNDDUySpuCJZKe9nr3ZRqyXEuXRwJkFmESAR9a
xmsGrPIG0vSKCijHdPsANOc4iXPN63YfxZBR0iszJvBadcBqVgMBQ/w4HnXQo8pX
h1jZSPaxosfSTWo/UHP3fQAhYMFZpRlx/EK0/LyS1EbO0acl+ZLUkJ0Hcg3fm2BM
VEhDNmphdCspj/+XWFscz3iSnZAaofFRHvxN3GDtz6VW0gahUaEUjpDuCk2C4fhL
9qPLuxKZoGWQG5F2t4QGqxz17CsUEP4YCWsvt4DjW46qMhreVQ==
=8m6H
-----END PGP SIGNATURE-----

--=-VybRhkfSRVywgfzTr45C--

