Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253787B5BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 01:19:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rUTKPPO1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw7L61DM1z3dXX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 11:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rUTKPPO1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw7KL2hyzz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 11:19:01 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42DLxSXT009282;
	Thu, 14 Mar 2024 00:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ij+R7IVB0uc61rJEHd4GlyzueViUctFffkK8nmeFG34=;
 b=rUTKPPO1lfCxhKHPBIanjC6M42k4sQ5Yi3bnJgBbwINXeM+qPTw4EwvDnNDy+OJ9JFc1
 2OWTiGSDRqkMdQ9DyFXT4f6t8KONsPLtSlNXk3nHN7Mbr+8enTin4VoZrlupV3kBl53K
 BBe+BZEWS05O7YA5bVEmdaZV9PE8LUY22Zo71ZR361EpSmbnLHQsAS7muswFuPkPkgqh
 oNc/3NC0Tt4Znygp+sw+bbrJLfpv1WW0G2BpJnnrirpoYRqPO1hlXh5dfA9fh9/31dsi
 Sm2QGWZrTRjN+iQj01r6Na2un84sPKjzLnN89sayoeLHoWmmrg5ORmoh0WbfCfTb0KlI 8Q== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wue9txvb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 00:18:42 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42DLRej0014855;
	Thu, 14 Mar 2024 00:18:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws33p1e7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 00:18:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42E0Ibj733817030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Mar 2024 00:18:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B2402004F;
	Thu, 14 Mar 2024 00:18:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5BFA2004E;
	Thu, 14 Mar 2024 00:18:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Mar 2024 00:18:36 +0000 (GMT)
Received: from [9.69.66.164] (unknown [9.69.66.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8AC3A600F0;
	Thu, 14 Mar 2024 11:18:32 +1100 (AEDT)
Message-ID: <5876331b7a1bcff949ae158b404e98435948bd89.camel@linux.ibm.com>
Subject: Re: [PATCH v10 09/12] powerpc: mm: Add common pud_pfn stub for all
 platforms
From: LTC IMAP <rmclure@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 14 Mar 2024 11:18:00 +1100
In-Reply-To: <339a9b64-cba4-42df-82c5-9f0b1113312c@csgroup.eu>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
	 <20240313042118.230397-10-rmclure@linux.ibm.com>
	 <339a9b64-cba4-42df-82c5-9f0b1113312c@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2ZVABDO7QBjAP0t_L2EYR-WdFAMTx6GX
X-Proofpoint-GUID: 2ZVABDO7QBjAP0t_L2EYR-WdFAMTx6GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_11,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403140000
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

On Wed, 2024-03-13 at 11:08 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 13/03/2024 =C3=A0 05:21, Rohan McLure a =C3=A9crit=C2=A0:
> > Prior to this commit, pud_pfn was implemented with BUILD_BUG as the
> > inline
> > function for 64-bit Book3S systems but is never included, as its
> > invocations in generic code are guarded by calls to pud_devmap
> > which return
> > zero on such systems. A future patch will provide support for page
> > table
> > checks, the generic code for which depends on a pud_pfn stub being
> > implemented, even while the patch will not interact with puds
> > directly.
> >=20
> > Remove the 64-bit Book3S stub and define pud_pfn to warn on all
> > platforms. pud_pfn may be defined properly on a per-platform basis
> > should it grow real usages in future.

Apologies, I don't actually remove the 64-bit, Book3S stub, as it
currently correctly reflects how transparent hugepages should work.

Also the stub that was previously implemented for all platforms has
been removed in commit 27af67f35631 ("powerpc/book3s64/mm: enable
transparent pud hugepage").

>=20
> Can you please re-explain why that's needed ? I remember we discussed
> it=20
> already in the past, but I checked again today and can't see the
> need:
>=20
> In mm/page_table_check.c, the call to pud_pfn() is gated by a call to
> pud_user_accessible_page(pud). If I look into arm64 version of=20
> pud_user_accessible_page(), it depends on pud_leaf(). When pud_leaf()
> is=20
> constant 0, pud_user_accessible_page() is always false and the call
> to=20
> pud_pfn() should be folded away.

As it will be folded away on non 64-bit Book3S platforms, I could
even replace the WARN_ONCE with a BUILD_BUG for your stated reason.
The __page_table_check_pud_set() function will still be included in the
build and references this routine so a fallback stub is still
necessary.

>=20
> >=20
> > Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> > ---
> > =C2=A0 arch/powerpc/include/asm/pgtable.h | 14 ++++++++++++++
> > =C2=A0 1 file changed, 14 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/pgtable.h
> > b/arch/powerpc/include/asm/pgtable.h
> > index 0c0ffbe7a3b5..13f661831333 100644
> > --- a/arch/powerpc/include/asm/pgtable.h
> > +++ b/arch/powerpc/include/asm/pgtable.h
> > @@ -213,6 +213,20 @@ static inline bool
> > arch_supports_memmap_on_memory(unsigned long vmemmap_size)
> > =C2=A0=20
> > =C2=A0 #endif /* CONFIG_PPC64 */
> > =C2=A0=20
> > +/*
> > + * Currently only consumed by page_table_check_pud_{set,clear}.
> > Since clears
> > + * and sets to page table entries at any level are done through
> > + * page_table_check_pte_{set,clear}, provide stub implementation.
> > + */
> > +#ifndef pud_pfn
> > +#define pud_pfn pud_pfn
> > +static inline int pud_pfn(pud_t pud)
> > +{
> > +	WARN_ONCE(1, "pud: platform does not use pud entries
> > directly");
> > +	return 0;
> > +}
> > +#endif
> > +
> > =C2=A0 #endif /* __ASSEMBLY__ */
> > =C2=A0=20
> > =C2=A0 #endif /* _ASM_POWERPC_PGTABLE_H */

