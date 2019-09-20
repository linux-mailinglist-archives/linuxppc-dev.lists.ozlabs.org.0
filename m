Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB9B9883
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 22:35:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZlpB3fQszDqRS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 06:35:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZlgH5xkYzF4FB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 06:29:15 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KKRUkP105910; Fri, 20 Sep 2019 16:28:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v53kcn9fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 16:28:53 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8KKS8FO108104;
 Fri, 20 Sep 2019 16:28:52 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v53kcn9fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 16:28:52 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KKOi38003907;
 Fri, 20 Sep 2019 20:28:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 2v3vbuw4t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 20:28:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KKSnjn50004434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 20:28:49 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA540C6057;
 Fri, 20 Sep 2019 20:28:49 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79BD1C6055;
 Fri, 20 Sep 2019 20:28:45 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 20:28:45 +0000 (GMT)
Message-ID: <24863d8904c6e05e5dd48cab57db4274675ae654.camel@linux.ibm.com>
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Sep 2019 17:28:41 -0300
In-Reply-To: <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-12-leonardo@linux.ibm.com>
 <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-EbNtHEwclx7KXmENRZAu"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200168
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


--=-EbNtHEwclx7KXmENRZAu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-20 at 13:11 -0700, John Hubbard wrote:
> On 9/20/19 12:50 PM, Leonardo Bras wrote:
> > Skips slow part of serialize_against_pte_lookup if there is no running
> > lockless pagetable walk.
> >=20
> > Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> > ---
> >  arch/powerpc/mm/book3s64/pgtable.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3=
s64/pgtable.c
> > index 13239b17a22c..41ca30269fa3 100644
> > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > @@ -95,7 +95,8 @@ static void do_nothing(void *unused)
> >  void serialize_against_pte_lookup(struct mm_struct *mm)
> >  {
> >  	smp_mb();
> > -	smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
> > +	if (running_lockless_pgtbl_walk(mm))
> > +		smp_call_function_many(mm_cpumask(mm), do_nothing, NULL, 1);
>=20
> Hi,
>=20
> If you do this, then you are left without any synchronization. So it will
> have race conditions: a page table walk could begin right after the above
> check returns "false", and then code such as hash__pmdp_huge_get_and_clea=
r()
> will continue on right away, under the false assumption that it has let
> all the current page table walks complete.
>=20
> The current code uses either interrupts or RCU to synchronize, and in
> either case, you end up scheduling something on each CPU. If you remove
> that entirely, I don't see anything left. ("Pure" atomic counting is not
> a synchronization technique all by itself.)
>=20
> thanks,

Hello John,
Thanks for the fast feedback.

See, before calling serialize_against_pte_lookup(), there is always an
update or clear on the pmd. So, if a page table walk begin right after
the check returns "false", there is no problem, since it will use the
updated pmd.

Think about serialize, on a process with a bunch of cpus. After you
check the last processor (wait part), there is no guarantee that the
first one is not starting a lockless pagetable walk.

The same mechanism protect both methods.

Does it make sense?

Best regards,
Leonardo Bras



--=-EbNtHEwclx7KXmENRZAu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2FNnkACgkQlQYWtz9S
ttSPMw//aJn7kdxYecY+MRvifVWoQyBdJ5umQJcly7LvttzqAl+3S5Q/uZgg75xp
1Bw5gwlD7/PUEkgryL3CjdYgywmVWZVP9gu+//oyj0wMCeICEgNmaswQdZHgUF4y
X86VJ2urZ1WSNesqcjoc7P65Q2WjxoBQiRwCAZfBRPaFKxELIc3jg2NuRDiTHPih
CoKC1167Kzrl3LsEhFUwcTUO6zDMsDCfUY/+I+XeuvBQyQNlV6oazPhxH0XzRj+I
e2dSZtnVQvzaD1a/GHbWQ4DdIl21kms6yQLVWE24h5voiAd8DloXlIcoL6oiEIeG
00KWNLd7pcWyZXGWHRG9F7StTkeiRVCcGIut+k3lia9WKeTULC53h9l5JzwIwO5Q
zVE+rPFuE9myUA8KRKTz4UyoLEpeuZEWD/EE8nRdcyvGYg0Eo7mYopiNb9vewhpi
9XSsMFmaUR4PS0A64bpByLJE5nzq7vWim4AAEPMMzIa13ey8jaOXgb22NKGfVKVU
b61o91K/miqsw17iGj+wknw8R6cR7fyWwRKQXJD7aF7zzW6P4acudkPdi/shKSNo
mIxf6PJ5qyM6AKy8ZWY3fd7SNZBiH/mprXnNFbMDonVBZH/viejZwCce7DN8K8z4
DBEkCKD1I/q7+QkFfylu/wz3m2gJg+CSCeivgY5wf7XlpZbK0co=
=98u8
-----END PGP SIGNATURE-----

--=-EbNtHEwclx7KXmENRZAu--

