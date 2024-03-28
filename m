Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02788F761
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 06:45:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RDR/iIjf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4svW1Wbrz3vnt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 16:45:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RDR/iIjf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4stm1vjMz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 16:44:47 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42S4SIqh013913;
	Thu, 28 Mar 2024 05:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=j0SWms8hODj0cUzE9l0AaXEGYpd3vYPfb3RMtj2pLNY=;
 b=RDR/iIjfEk0SJAnO9sYtDRf/fCuthJ1wBEqMaB8Fb9xjGQpYmlVmxUOQvpLyPK6GOJBs
 vtw3wKzpo/+B8O7S55UCTCoFvX2f25u54RLP/618T9QBAgTqIHj9gycBsJWRhuJJQYKL
 hjVZW7fx6PHWzZU9ea9bjzRKQ5SJz3d1lgzmgmcKsXh8L/p0uXmlqu6lyzatmUGdsUjy
 z5tFSTweHYAR9a3sxvOGIcxbyqA9sDWbqWSyjsEhZxB6+pFPpVDWEew+NZlxRVLGaaA1
 yAifRtS0jWfGVt/B9gFqq/gwQBHqneyXJzDXObojM1Gga0dRDzWCuRLzmhznKAhe2IDl YA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x51hj05b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 05:44:32 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42S4oUhs028623;
	Thu, 28 Mar 2024 05:44:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2adpkjhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 05:44:30 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42S5iQZR16056650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Mar 2024 05:44:28 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D5672004E;
	Thu, 28 Mar 2024 05:44:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B90332004B;
	Thu, 28 Mar 2024 05:44:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Mar 2024 05:44:25 +0000 (GMT)
Received: from [9.66.88.97] (unknown [9.66.88.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A2EBF60112;
	Thu, 28 Mar 2024 16:44:18 +1100 (AEDT)
Message-ID: <2f25b9a2ec5d8b0fb4020e4f2e699ee067496b0a.camel@linux.ibm.com>
Subject: Re: [PATCH v11 09/11] poweprc: mm: Implement
 *_user_accessible_page() for ptes
From: Rohan McLure <rmclure@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 28 Mar 2024 16:44:13 +1100
In-Reply-To: <3fcc8331-28ed-458f-b7f6-ba1f161eb09e@csgroup.eu>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
	 <20240328045535.194800-12-rmclure@linux.ibm.com>
	 <3fcc8331-28ed-458f-b7f6-ba1f161eb09e@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oPvmNjuTccY20fJQn4lge45k9qzXGhwL
X-Proofpoint-ORIG-GUID: oPvmNjuTccY20fJQn4lge45k9qzXGhwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_04,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=845 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403280034
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2024-03-28 at 05:40 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 28/03/2024 =C3=A0 05:55, Rohan McLure a =C3=A9crit=C2=A0:
> > Page table checking depends on architectures providing an
> > implementation of p{te,md,ud}_user_accessible_page. With
> > refactorisations made on powerpc/mm, the pte_access_permitted() and
> > similar methods verify whether a userland page is accessible with
> > the
> > required permissions.
> >=20
> > Since page table checking is the only user of
> > p{te,md,ud}_user_accessible_page(), implement these for all
> > platforms,
> > using some of the same preliminary checks taken by
> > pte_access_permitted()
> > on that platform.
> >=20
> > Since Commit 8e9bd41e4ce1 ("powerpc/nohash: Replace pte_user() by
> > pte_read()")
> > pte_user() is no longer required to be present on all platforms as
> > it
> > may be equivalent to or implied by pte_read(). Hence
> > implementations of
> > pte_user_accessible_page() are specialised.
> >=20
> > Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> > ---
> > v9: New implementation
> > v10: Let book3s/64 use pte_user(), but otherwise default other
> > platforms
> > to using the address provided with the call to infer whether it is
> > a
> > user page or not. pmd/pud variants will warn on all other
> > platforms, as
> > they should not be used for user page mappings
> > v11: Conditionally define p{m,u}d_user_accessible_page(), as not
> > all
> > platforms have p{m,u}d_leaf(), p{m,u}d_pte() stubs.
>=20
> See my comment to v10 patch 10.
>=20
> p{m,u}d_leaf() is defined for all platforms (There is a fallback=20
> definition in include/linux/pgtable.h) so
> p{m,u}d_user_accessible_page()=20
> can be defined for all platforms, no need for a conditionally define.

The issue I see is that the definition in include/linux/pgtable.h
occurs after this header is included. Prior to the removal of a local
definition of p{m,u}d_leaf() etc we didn't run into this issue, but we
still do now.

Not insistent on doing it this way with ifndef, so amenable to
suggestions if you have a preference.

>=20
> > ---
> > =C2=A0 arch/powerpc/include/asm/book3s/32/pgtable.h |=C2=A0 5 +++++
> > =C2=A0 arch/powerpc/include/asm/book3s/64/pgtable.h | 17
> > +++++++++++++++++
> > =C2=A0 arch/powerpc/include/asm/nohash/pgtable.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 +++++
> > =C2=A0 arch/powerpc/include/asm/pgtable.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++++++
> > =C2=A0 4 files changed, 35 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h
> > b/arch/powerpc/include/asm/book3s/32/pgtable.h
> > index 52971ee30717..83f7b98ef49f 100644
> > --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> > +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> > @@ -436,6 +436,11 @@ static inline bool pte_access_permitted(pte_t
> > pte, bool write)
> > =C2=A0=C2=A0	return true;
> > =C2=A0 }
> > =C2=A0=20
> > +static inline bool pte_user_accessible_page(pte_t pte, unsigned
> > long addr)
> > +{
> > +	return pte_present(pte) && !is_kernel_addr(addr);
> > +}
> > +
> > =C2=A0 /* Conversion functions: convert a page and protection to a page
> > entry,
> > =C2=A0=C2=A0 * and a page entry and page directory to the page they ref=
er to.
> > =C2=A0=C2=A0 *
> > diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h
> > b/arch/powerpc/include/asm/book3s/64/pgtable.h
> > index fac5615e6bc5..d8640ddbcad1 100644
> > --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> > +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> > @@ -538,6 +538,11 @@ static inline bool pte_access_permitted(pte_t
> > pte, bool write)
> > =C2=A0=C2=A0	return arch_pte_access_permitted(pte_val(pte), write, 0);
> > =C2=A0 }
> > =C2=A0=20
> > +static inline bool pte_user_accessible_page(pte_t pte, unsigned
> > long addr)
> > +{
> > +	return pte_present(pte) && pte_user(pte);
> > +}
> > +
> > =C2=A0 /*
> > =C2=A0=C2=A0 * Conversion functions: convert a page and protection to a=
 page
> > entry,
> > =C2=A0=C2=A0 * and a page entry and page directory to the page they ref=
er to.
> > @@ -1441,5 +1446,17 @@ static inline bool pud_leaf(pud_t pud)
> > =C2=A0=C2=A0	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> > =C2=A0 }
> > =C2=A0=20
> > +#define pmd_user_accessible_page pmd_user_accessible_page
> > +static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned
> > long addr)
> > +{
> > +	return pmd_leaf(pmd) &&
> > pte_user_accessible_page(pmd_pte(pmd), addr);
> > +}
> > +
> > +#define pud_user_accessible_page pud_user_accessible_page
> > +static inline bool pud_user_accessible_page(pud_t pud, unsigned
> > long addr)
> > +{
> > +	return pud_leaf(pud) &&
> > pte_user_accessible_page(pud_pte(pud), addr);
> > +}
> > +
> > =C2=A0 #endif /* __ASSEMBLY__ */
> > =C2=A0 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
> > diff --git a/arch/powerpc/include/asm/nohash/pgtable.h
> > b/arch/powerpc/include/asm/nohash/pgtable.h
> > index 427db14292c9..413d01a51e6f 100644
> > --- a/arch/powerpc/include/asm/nohash/pgtable.h
> > +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> > @@ -213,6 +213,11 @@ static inline bool pte_access_permitted(pte_t
> > pte, bool write)
> > =C2=A0=C2=A0	return true;
> > =C2=A0 }
> > =C2=A0=20
> > +static inline bool pte_user_accessible_page(pte_t pte, unsigned
> > long addr)
> > +{
> > +	return pte_present(pte) && !is_kernel_addr(addr);
> > +}
> > +
> > =C2=A0 /* Conversion functions: convert a page and protection to a page
> > entry,
> > =C2=A0=C2=A0 * and a page entry and page directory to the page they ref=
er to.
> > =C2=A0=C2=A0 *
> > diff --git a/arch/powerpc/include/asm/pgtable.h
> > b/arch/powerpc/include/asm/pgtable.h
> > index ee8c82c0528f..f1ceae778cb1 100644
> > --- a/arch/powerpc/include/asm/pgtable.h
> > +++ b/arch/powerpc/include/asm/pgtable.h
> > @@ -219,6 +219,14 @@ static inline int pud_pfn(pud_t pud)
> > =C2=A0 }
> > =C2=A0 #endif
> > =C2=A0=20
> > +#ifndef pmd_user_accessible_page
> > +#define pmd_user_accessible_page(pmd, addr)	false
> > +#endif
> > +
> > +#ifndef pud_user_accessible_page
> > +#define pud_user_accessible_page(pud, addr)	false
> > +#endif
> > +
> > =C2=A0 #endif /* __ASSEMBLY__ */
> > =C2=A0=20
> > =C2=A0 #endif /* _ASM_POWERPC_PGTABLE_H */

