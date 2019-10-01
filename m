Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C20ADC413D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 21:43:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jV7M6qsLzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 05:43:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jV5D3vb8zDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 05:41:35 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91JbQEJ044555; Tue, 1 Oct 2019 15:41:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vc9mb7sat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 15:41:10 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91Jca0P047351;
 Tue, 1 Oct 2019 15:41:10 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vc9mb7saf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 15:41:10 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91JduDl012707;
 Tue, 1 Oct 2019 19:41:09 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 2v9y576310-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:41:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91Jf7WL46072254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 19:41:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4989878064;
 Tue,  1 Oct 2019 19:41:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BF3B7805F;
 Tue,  1 Oct 2019 19:41:02 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.47])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 19:41:02 +0000 (GMT)
Message-ID: <1f5f2f689385ceeb1240b4cc66ef3f4b66638ab0.camel@linux.ibm.com>
Subject: Re: [PATCH v4 03/11] mm/gup: Applies counting method to monitor
 gup_pgd_range
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 01 Oct 2019 16:40:59 -0300
In-Reply-To: <a5e86058-7950-b832-b042-8cc864de761d@nvidia.com>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-4-leonardo@linux.ibm.com>
 <ce0a4110-9f83-36db-dc85-6a727d30d030@nvidia.com>
 <2cebe169221ae9270963d4bc4fd8e43066745f98.camel@linux.ibm.com>
 <a5e86058-7950-b832-b042-8cc864de761d@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-4Fh/TZDFlMRM8Gq0A1+I"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010159
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
Cc: Dan Williams <dan.j.williams@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Keith Busch <keith.busch@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-4Fh/TZDFlMRM8Gq0A1+I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-10-01 at 12:04 -0700, John Hubbard wrote:
> On 10/1/19 10:56 AM, Leonardo Bras wrote:
> > On Mon, 2019-09-30 at 14:51 -0700, John Hubbard wrote:
> > > On 9/27/19 4:40 PM, Leonardo Bras wrote:
> ...
> > > > diff --git a/mm/gup.c b/mm/gup.c
> > > > index 98f13ab37bac..7105c829cf44 100644
> > > > --- a/mm/gup.c
> > > > +++ b/mm/gup.c
> > > > @@ -2325,6 +2325,7 @@ static bool gup_fast_permitted(unsigned long =
start, unsigned long end)
> > > >  int __get_user_pages_fast(unsigned long start, int nr_pages, int w=
rite,
> > > >  			  struct page **pages)
> > > >  {
> > > > +	struct mm_struct *mm;
> > >=20
> > > I don't think that this local variable adds any value, so let's not u=
se it.
> > > Similar point in a few other patches too.
> >=20
> > It avoids 1 deference of current->mm, it's a little performance gain.
> >=20
>=20
> No, it isn't. :)=20
>=20
> Longer answer: at this level (by which I mean, "wrote the C code, haven't=
 looked
> at the generated asm yet, and haven't done a direct perf test yet"), none=
 of us
> C programmers are entitled to imagine that we can second guess both the c=
ompiler=20
> and the CPU well enough to claim that  declaring a local pointer variable=
 on the
> stack will even *affect* performance, much less know which way it will go=
!
>=20

I did this based on how costly can be 'current', and I could notice
reduction in assembly size most of the time. (powerpc)
But I get what you mean, maybe the (possible) performance gain don't
worth the extra work.

> The compiler at -O2 will *absolutely* optimize away any local variables t=
hat
> it doesn't need.
>=20
> And that leads to how kernel programmers routinely decide about that kind=
 of=20
> variable: "does the variable's added clarity compensate for the extra vis=
ual=20
> noise and for the need to manage the variable?"

That's a good way to decide it. :)

>=20
> Here, and in most (all?) other points in the patchset where you've added =
an
> mm local variable, the answer is no.
>=20

Well, IMHO it's cleaner that way. But I get that other people may
disagree.=20

>=20
> ...	start_lockless_pgtbl_walk(mm);
> > > Minor: I'd like to rename this register_lockless_pgtable_walker().
> > >=20
> > > >  		local_irq_disable();
> > > >  		gup_pgd_range(addr, end, gup_flags, pages, &nr);
> > > >  		local_irq_enable();
> > > > +		end_lockless_pgtbl_walk(mm);
> > >=20
> > > ...and deregister_lockless_pgtable_walker().
> > >=20
> >=20
> > I have no problem changing the name, but I don't register/deregister
> > are good terms for this.=20
> >=20
> > I would rather use start/finish, begin/end, and so on. Register sounds
> > like something more complicated than what we are trying to achieve
> > here.=20
> >=20
>=20
> OK, well, I don't want to bikeshed on naming more than I usually do, and=
=20
> what you have is reasonable, so I'll leave that alone. :)
>=20
> thanks,

Thank for the feedback,


--=-4Fh/TZDFlMRM8Gq0A1+I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2Tq8sACgkQlQYWtz9S
ttT8qxAAne6RW5q0WKv5peF0RKabbsIJL1OCaP6zH9hop0gMkhg22WNHTZvFgjXl
OEtQ351gFTykOpobpF/1R7xkVELLy7utygCckNBGlSNa16DtHdpp9HWXMb94oNYx
NrMrKA1+keF3gli3I2b2pVDgpRMp2qt5BNOm6D3kvmH64WWG43BnSq+okS6Cg8KS
vkQzJKJ0kmoqPWy/uvV0SWGIGj4xWL5TII1ZiS0cnTSYFRyb0YJKmlL6BnT5kmLC
qcFaZTfck+d6xSqAuoXeXLTKXsAH0enh/E0ignLxqOcaHULOeQ+jN7jg0vWFpMl6
Udb8pD4mH9Ff9nXadz7+w9aGxwJSSzMXMCIyemP1ny9Msl+5r/9yObv+cQ65fOiw
q6+PQOx6DgHakjDNXa/RQiBOu0YyIKpP5RWRu/i1BBPkFipzjMnnvqvrNiZMhABT
Isfod8XDatUBtXqXqzHsgTjnjuRwixriQ0EQbqaLOlIwoBq6aZcZ4QPGU6Vta1wj
kFJZdzq9puwo14lZeMMsfGP+s+FT+9+zrrN05Ij1rYPDIdmmVFe3w7F7lDnP5alg
RuXvFvBmhE1Xl2UqzB1VVcBWiphAjoE5vVlD21smjVYr5Y6+h9usTzp2BTQHeLVA
VG39+Wsr6CYPVLw1Yab3YSJIFmCFxihM9Oui1yOh4vcBKrxa4ew=
=37MB
-----END PGP SIGNATURE-----

--=-4Fh/TZDFlMRM8Gq0A1+I--

