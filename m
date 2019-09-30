Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A369FC2621
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 20:56:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hs845M0CzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 04:56:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hrrW69XpzDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 04:43:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8UId4Tb128798; Mon, 30 Sep 2019 14:42:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vbnbpvx6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2019 14:42:54 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8UIdGG7129741;
 Mon, 30 Sep 2019 14:42:53 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vbnbpvx5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2019 14:42:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8UIextj010451;
 Mon, 30 Sep 2019 18:42:52 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 2v9y57w08c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2019 18:42:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8UIgpxs59310430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Sep 2019 18:42:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54C7EBE056;
 Mon, 30 Sep 2019 18:42:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D281EBE04F;
 Mon, 30 Sep 2019 18:42:46 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.58])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 Sep 2019 18:42:46 +0000 (GMT)
Message-ID: <673bcb94b7752e086cc4133fb6cceb24394c02c0.camel@linux.ibm.com>
Subject: Re: [PATCH v4 01/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Date: Mon, 30 Sep 2019 15:42:42 -0300
In-Reply-To: <48bf32ca-5d3e-5d69-4cd1-6720364a0d81@nvidia.com>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-2-leonardo@linux.ibm.com>
 <4ff1e8e8-929b-9cfc-9bf8-ee88e34de888@nvidia.com>
 <2533a13f226a6e1fab387669b6cced2aa8d2e129.camel@linux.ibm.com>
 <48bf32ca-5d3e-5d69-4cd1-6720364a0d81@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-9k3sG6ksgKhuBdahGQJu"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-30_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909300166
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


--=-9k3sG6ksgKhuBdahGQJu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-30 at 10:57 -0700, John Hubbard wrote:
> > As I told before, there are cases where this function is called from
> > 'real mode' in powerpc, which doesn't disable irqs and may have a
> > tricky behavior if we do. So, encapsulate the irq disable in this
> > function can be a bad choice.
>=20
> You still haven't explained how this works in that case. So far, the
> synchronization we've discussed has depended upon interrupt disabling
> as part of the solution, in order to hold off page splitting and page
> table freeing.

The irqs are already disabled by another mechanism (hw): MSR_EE=3D0.
So, serialize will work as expected.

> Simply skipping that means that an additional mechanism is required...whi=
ch
> btw might involve a new, ppc-specific routine, so maybe this is going to =
end
> up pretty close to what I pasted in after all...
> > Of course, if we really need that, we can add a bool parameter to the
> > function to choose about disabling/enabling irqs.
> > > * This is really a core mm function, so don't hide it away in arch la=
yers.
> > >     (If you're changing mm/ files, that's a big hint.)
> >=20
> > My idea here is to let the arch decide on how this 'register' is going
> > to work, as archs may have different needs (in powerpc for example, we
> > can't always disable irqs, since we may be in realmode).
> >=20
> > Maybe we can create a generic function instead of a dummy, and let it
> > be replaced in case the arch needs to do so.
>=20
> Yes, that might be what we need, if it turns out that ppc can't use this
> approach (although let's see about that).
>=20

I initially used the dummy approach because I did not see anything like
serialize in other archs.=20

I mean, even if I put some generic function here, if there is no
function to use the 'lockless_pgtbl_walk_count', it becomes only a
overhead.

>=20
> thanks,

Thank you!

--=-9k3sG6ksgKhuBdahGQJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2STKIACgkQlQYWtz9S
ttSxFg//Uqx1dqwNpWXo7xp/0GswLDO2WKQanbx0Qg4JKCL09MHD8khl2E9vx4IF
Icd6eXFRwYdzgdFfGKCCUpE9dEBMkT9zPeDS7tk8jhbZ57yJtXC3X3Pcx7j82bEO
n1x5ZL2jrTEqoWL4oYegJmVi7zzdHiGJi0O31QDIp9YGFdxUn2lPUCNMaypuLs/u
vejkf6DcmVUXCigXaxmT5NN85fDDUJxbph79+UXyEm6jy9Zuk+PSi3AgfmkCKftk
RdyU8pmX875qMJQGvoOAIaX/GBavIFVvujG9x7HBeL26G0pdttO0b/1nt5A3thWi
nx2y4jlfzoDvLhAfw4wsZ+zHQjzIIZlpdM1SaDseb5mNyR1+fpTPoqhsAtqcex6N
+LdR2q+osgMfKpklWyAhSgJVIqvvtViBEqmA5Itg4JOzQD0xJwg27DJjTd0mBv1E
za5iWYaUxBs4qw8W98gwSbw2lKgIRfKieKynDUwdSmq8GwjCSj7H9Iuvr/aQwGnm
E8o41KiK7frirDuS6jxdBYPvA3mtUqqVCN3pXZKktEc3CrZSd9C/J7AR5b+UZJOi
Umdeci9BnKsx2kFvCsrdcl6DEkmKELiVjJ+aDtZBbunKnwKtupCRE2UC4X2UE02y
Z9Mdw6OCS6VH+s+ArHVohA6MNm8+5OzhJdZV4oHv/EO5esStUTM=
=VegT
-----END PGP SIGNATURE-----

--=-9k3sG6ksgKhuBdahGQJu--

