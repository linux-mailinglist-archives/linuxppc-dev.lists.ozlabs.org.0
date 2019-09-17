Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F22B5770
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 23:23:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xx1V2Qd5zF0QC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 07:23:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XwzF6DTJzF3j9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 07:21:44 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HLHnVL042838; Tue, 17 Sep 2019 17:21:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v35wtu7b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 17:21:30 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8HLIFKP044425;
 Tue, 17 Sep 2019 17:21:30 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v35wtu7av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 17:21:30 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HLJi7P026267;
 Tue, 17 Sep 2019 21:21:29 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2v0tcyks9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 21:21:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HLLTEM39649586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 21:21:29 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1D83AC06A;
 Tue, 17 Sep 2019 21:21:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44E3EAC065;
 Tue, 17 Sep 2019 21:21:26 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.58])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 21:21:26 +0000 (GMT)
Message-ID: <bd6a2e6bc8981ced1b6693fdcfa1e111b1c609b7.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc: mm: Check if
 serialize_against_pte_lookup() really needs to run
From: Leonardo Bras <leonardo@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Sep 2019 18:21:22 -0300
In-Reply-To: <c1ff17e2-902d-87e6-3c1d-fc5db2428b69@linux.ibm.com>
References: <20190916205527.1859-1-leonardo@linux.ibm.com>
 <c1ff17e2-902d-87e6-3c1d-fc5db2428b69@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-6lXjFATey8w+YYYmxG+7"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170197
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 "Tobin C. Harding" <tobin@kernel.org>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Christoph Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-6lXjFATey8w+YYYmxG+7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Aneesh, thanks for the feedback!

On Tue, 2019-09-17 at 08:26 +0530, Aneesh Kumar K.V wrote:
> We could possibly avoid that serialize for a full task exit unmap. ie,=
=20
> when tlb->fullmm =3D=3D 1 . But that won't help the Qemu case because it=
=20
> does an umap of the guest ram range for which tlb->fullmm !=3D 1.
Yes, in qemu we can hot-add memory to guests using memory allocated by
qemu using mmap(). If we want/need to free this memory to other
processes (or guests), we remove it from this guest and do a common
munmap(). This happens without exiting qemu, or pausing the guest.


> That is not correct. We need to keep the count updated  across the=20
> local_irq_disable()/local_irq_enable().=20
So, by that you mean incrementing the counter before
local_irq_{disable,save} and decrementing only after
local_irq_{enable,restore}?

> That is we mostly should have a variant like=20
> start_lockless_pgtbl_walk()/end_lockless_pgtbl_walk().=20
And with that, you mean replacing the current local_irq_{disable,save}
with a start_lockless_pgtbl_walk() (that contains increment + irq
disable)? (and doing similarly with local_irq_{enable,restore} and
end_lockless_pgtbl_walk())=20

> Also there is hash_page_mm which we need to make sure we are protected=
=20
> against w.r.t collapse pmd.
I did not get what I need to do here.=20
Is it a new thing to protect?=20
If so, I need to better understand how to protect it.
If not, I would like to understand how it's protected by current
behavior.=20

> Move that to ppc64 specific mm_context_t.
Ok, fixed! I will send that on v2.

Best regards,
Leonardo Bras

--=-6lXjFATey8w+YYYmxG+7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2BTlIACgkQlQYWtz9S
ttTDMQ/9GtlMAVSX2mm7qIMVQyFd+TRDw0cTzYWqgWeI0bLCL2hpGQzsITDp5g79
xwmr1luIfWZHIy2xWZuVL/EkLEtFyKQ6qCM7PVPzn+TdQsySiZMARYQV6BzqXAGl
yzst2hxelN3OpXS+ukaBd/xfwXJHgV1XA8vsmkozjYRIglor1ADwR/czs3XPXC9c
I9/oEg604NBBXmiN9n0rwuep9QF6IeRW7HrX8lv1qfUwlv98goK570MqVxf/JQF+
jLpmO4U9/LtqEw1VcWbHSu/68saubEeZRPc60n2vrtZ5k0g5yu5NK2WYGV/bJpRo
lDub6d1SJvsugf3CXCbTvAm3aOHhzLy0BFNWkAVfGJcD9vg01Suyeul6wyGny5Es
ntBvyrSX4u9Xc4WKnapEi0l/wonf0IxptnEVek5081vJDr0dNIV22jIztXWSIbju
cD93sWKPH6P1PBrqqR+A7C2e3tVTGnyUClz0JID9/QcUeCy3cC/SkEx3gzAV/0Wp
aHyZuY/IaR3pdcd04MdZfRtIqe9CEJ/z/OC6vqZvwrOlfY9e3yJUxwtdJWhtAJiu
KM+5db9kPtGWn1JMXhROs+ZMdoFz74P3YwwsvFlhIOzxclGPcpkp8cpHnUlGUm2+
xjTdyvucWrZZBsT8vcTJDJR+jf0gdIzhrIhx+QC59YepJB3BAis=
=T/Yh
-----END PGP SIGNATURE-----

--=-6lXjFATey8w+YYYmxG+7--

