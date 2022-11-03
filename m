Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7674F617371
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:40:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2lKb2nzrz3bjj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 11:40:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dl70edVJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dl70edVJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2lJb07Ctz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 11:39:41 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2N94lU024969;
	Thu, 3 Nov 2022 00:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ie5doJFM9m4gkt+vU6YBHYK4caZEk27PA5LZ7oSxQag=;
 b=Dl70edVJaUemzNOi/PlnlmxJklHx15CdGRubCz1B5k5YZCdox9d+mKzoB8XdC+Rj8m/Y
 H6EqkyXfSrUVjNdNFEk6TeMYIa4V0h88TCbScOlpMatSJZqvWOL5ZojeOS60VjYyUftp
 iWBLV5A0rJ9o7gJWb6AgnsWFInWKTMDG/kHd7IIen8Z+vbWdaxMdjj35bSZXMrpyx/oE
 skGNkIbOVFojsD3w/okmvl4a/MVTMzpiFG4PSjFNNPJPeuopvXWsVz54vdKfOZRUHw3L
 UP0j/kf2RA579nQEKANtfJj0Np9wONC8tjXAz2KX06CllIHeq7spDdXItS5TL7Ow+DXL hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkwetj0db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 00:39:29 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A30KvLL004188;
	Thu, 3 Nov 2022 00:39:29 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkwetj0cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 00:39:28 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A30ZVxQ013080;
	Thu, 3 Nov 2022 00:39:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma01fra.de.ibm.com with ESMTP id 3kgut9dtk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 00:39:26 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A30dOMv3146422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Nov 2022 00:39:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32C1B11C04A;
	Thu,  3 Nov 2022 00:39:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8758511C050;
	Thu,  3 Nov 2022 00:39:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  3 Nov 2022 00:39:23 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4E3A660100;
	Thu,  3 Nov 2022 11:39:20 +1100 (AEDT)
Message-ID: <b2d1c870311672650798c0e7eee5532b505a0176.camel@linux.ibm.com>
Subject: Re: [PATCH v9 5/7] powerpc/tlb: Add local flush for page given
 mm_struct and psize
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 03 Nov 2022 11:39:19 +1100
In-Reply-To: <6c13afb6-3b58-f673-a396-1ae80931b80b@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
	 <20221025044409.448755-6-bgray@linux.ibm.com>
	 <6c13afb6-3b58-f673-a396-1ae80931b80b@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rUSdjHiHQi69jiVrQXbDqV9VnSvJof3b
X-Proofpoint-GUID: p6u9Ep7uSimhb_wmpEcXZSAOrSAOnilF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211030001
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-02 at 09:56 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 25/10/2022 =C3=A0 06:44, Benjamin Gray a =C3=A9crit=C2=A0:
> > Adds a local TLB flush operation that works given an mm_struct, VA
> > to
> > flush, and page size representation. Most implementations mirror
> > the
> > surrounding code. The book3s/32/tlbflush.h implementation is left
> > as
> > a WARN_ONCE_ON because it is more complicated and not required for
>=20
> s/ONCE_ON/ONCE
>=20
> > anything as yet.
>=20
> Is a WARN_ONCE() really needed ? Can't a BUILD_BUG() be used instead
> ?

Looks like BUILD_BUG is safe. Tested with 83xx/mpc834x_mds_defconfig,
it doesn't break the build.

> >=20
> > This removes the need to create a vm_area_struct, which the
> > temporary
> > patching mm work does not need.
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > ---
> > v9:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Replace book3s/32/tlbflush.h impleme=
ntation with warning
> > ---
> > =C2=A0 arch/powerpc/include/asm/book3s/32/tlbflush.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 9 +++++++++
> > =C2=A0 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 +++++
> > =C2=A0 arch/powerpc/include/asm/book3s/64/tlbflush.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 8 ++++++++
> > =C2=A0 arch/powerpc/include/asm/nohash/tlbflush.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++++++
> > =C2=A0 4 files changed, 30 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > index ba1743c52b56..14d989d41f75 100644
> > --- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > +++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > @@ -2,6 +2,8 @@
> > =C2=A0 #ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
> > =C2=A0 #define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
> > =C2=A0=20
> > +#include <asm/bug.h>
> > +
> > =C2=A0 #define MMU_NO_CONTEXT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0)
> > =C2=A0 /*
> > =C2=A0=C2=A0 * TLB flushing for "classic" hash-MMU 32-bit CPUs, 6xx, 7x=
x,
> > 7xxx
> > @@ -74,6 +76,13 @@ static inline void local_flush_tlb_page(struct
> > vm_area_struct *vma,
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flush_tlb_page(vma, vma=
ddr);
> > =C2=A0 }
> > +
> > +static inline void local_flush_tlb_page_psize(struct mm_struct
> > *mm,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long vmaddr,
> > int psize)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ONCE(true, "local TLB f=
lush not implemented");
>=20
> Is it possible to use BUILD_BUG() instead ?

Yep, above

> > +}
> > +
> > =C2=A0 static inline void local_flush_tlb_mm(struct mm_struct *mm)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flush_tlb_mm(mm);
> > diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> > b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> > index fab8332fe1ad..8fd9dc49b2a1 100644
> > --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> > +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> > @@ -94,6 +94,11 @@ static inline void
> > hash__local_flush_tlb_page(struct vm_area_struct *vma,
> > =C2=A0 {
> > =C2=A0 }
> > =C2=A0=20
> > +static inline void hash__local_flush_tlb_page_psize(struct
> > mm_struct *mm,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long
> > vmaddr, int psize)
> > +{
> > +}
> > +
>=20
> Is it worth an empty function ?

See end

> > =C2=A0 static inline void hash__flush_tlb_page(struct vm_area_struct
> > *vma,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long vmaddr)
> > =C2=A0 {
> > diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> > b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> > index 67655cd60545..2d839dd5c08c 100644
> > --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> > +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> > @@ -92,6 +92,14 @@ static inline void local_flush_tlb_page(struct
> > vm_area_struct *vma,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return hash__local_flus=
h_tlb_page(vma, vmaddr);
> > =C2=A0 }
> > =C2=A0=20
> > +static inline void local_flush_tlb_page_psize(struct mm_struct
> > *mm,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long vmaddr,
> > int psize)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return radix__local_flush_tlb_page_psize(mm,
> > vmaddr, psize);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return hash__local_flush_tlb=
_page_psize(mm, vmaddr, psize);
>=20
> Those functions are 'void', shouldn't need the "return".
>=20
> Could just be:
>=20
> +static inline void local_flush_tlb_page_psize(struct mm_struct *mm,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long vmaddr,
> int psize)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0radix__local_flush_tlb_page_psize(mm, vmaddr, psize);
> +}

See end

> > +}
> > +
> > =C2=A0 static inline void local_flush_all_mm(struct mm_struct *mm)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (radix_enabled())
> > diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h
> > b/arch/powerpc/include/asm/nohash/tlbflush.h
> > index bdaf34ad41ea..432bca4cac62 100644
> > --- a/arch/powerpc/include/asm/nohash/tlbflush.h
> > +++ b/arch/powerpc/include/asm/nohash/tlbflush.h
> > @@ -45,6 +45,12 @@ static inline void local_flush_tlb_page(struct
> > vm_area_struct *vma, unsigned lon
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile ("tlbie %0=
; sync" : : "r" (vmaddr) :
> > "memory");
> > =C2=A0 }
> > =C2=A0=20
> > +static inline void local_flush_tlb_page_psize(struct mm_struct
> > *mm,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long vmaddr,
> > int psize)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile ("tlbie %0; syn=
c" : : "r" (vmaddr) :
> > "memory");
> > +}
> > +
> > =C2=A0 static inline void flush_tlb_kernel_range(unsigned long start,
> > unsigned long end)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0start &=3D PAGE_MASK;
> > @@ -58,6 +64,8 @@ static inline void
> > flush_tlb_kernel_range(unsigned long start, unsigned long end
> > =C2=A0 extern void flush_tlb_kernel_range(unsigned long start, unsigned
> > long end);
> > =C2=A0 extern void local_flush_tlb_mm(struct mm_struct *mm);
> > =C2=A0 extern void local_flush_tlb_page(struct vm_area_struct *vma,
> > unsigned long vmaddr);
> > +extern void local_flush_tlb_page_psize(struct mm_struct *mm,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned long vmaddr, int
> > psize);
>=20
> That function doesn't seem to be defined anywhere. Is this prototype=20
> just to make compiler happy ? If so a static inline with a BUILD_BUG=20
> would likely be better, it would allow detection of a build problem
> at=20
> compile time instead of link time.

I think I just missed the implementation. It's easy to implement though
based on local_flush_tlb_page in mm/nohash/tlb.c, so I'll just add it

  void local_flush_tlb_page_psize(struct mm_struct *mm,
  				unsigned long vmaddr, int psize)
  {
  	__local_flush_tlb_page(mm, vmaddr, mmu_get_tsize(psize), 0);
  }
  EXPORT_SYMBOL(local_flush_tlb_page_psize);

>=20
> By the way, 'extern' keyword is pointless and deprecated for
> functions=20
> prototypes, please don't add new ones, even if other historical=20
> prototypes have one.

This and the above commented parts match the style of the surrounding
implementations. For example,

	static inline void local_flush_tlb_mm(struct mm_struct *mm)
	{
		if (radix_enabled())
			return radix__local_flush_tlb_mm(mm);
		return hash__local_flush_tlb_mm(mm);
	}

I am not going to add code that is inconsistent with the surrounding
code. That just causes confusion later down the line when readers
wonder why this function is special compared to the others. If it needs
to use modern style, then I would be happy to include a patch that
modernises the surrounding code first.

Though why the hash__* functions are empty I'm not sure... If they were
not implemented I would have expected a BUILD_BUG(). If they are
unnecessary due to hash itself, it's odd that they exist (as you point
out for the new one).
