Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33A61E6FC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 23:49:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N58fy4ky0z3cLm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 09:48:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d8vRpqhH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d8vRpqhH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N58f000jtz3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 09:48:07 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6IGj4K011966;
	Sun, 6 Nov 2022 22:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=xLO5t0iG6QPFAnmkD2ARhajIK1fVPnMTFXIx1eXFsLQ=;
 b=d8vRpqhHQjoFT1qtNHBIo98jYNOZfZ9tuK0VoJAsM9WEo78QMHzjMm+wV65oTRV3kIok
 XLBrKyhgO3b13ggi2pNLalrow77FLdcAHJ/ipOru9IM/DUeMKV4RqyT4Nut8ZN41g0jU
 Spsl7k4FXkPy2AS+g5I7x5jnTRseFgssT69arzkKqJrE7BTeCwjBGEuqJ9LLn3l8vvI3
 yb+qblj/T34BRB0B1SyM6PWXp+XlTDk9yLSIVTY7V63qQD0/OMpnKP+prATztMOMoDkE
 Ik+f4fwbRhgcI5Xa/m+m3ScIOo84bGrZfcqbvEDUnJRpoQh84E/wZ7fKe39Wiecl26pb kw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1teegkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 22:48:01 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A6MajYn022859;
	Sun, 6 Nov 2022 22:47:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma05fra.de.ibm.com with ESMTP id 3kngpss89c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 22:47:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A6Mlvf03932852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Nov 2022 22:47:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 391D95204E;
	Sun,  6 Nov 2022 22:47:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8ED6D5204F;
	Sun,  6 Nov 2022 22:47:56 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E96956036F;
	Mon,  7 Nov 2022 09:47:44 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v3 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <1e757f97-79da-40f9-b039-88a569189778@csgroup.eu>
Date: Mon, 7 Nov 2022 09:47:34 +1100
Content-Transfer-Encoding: quoted-printable
Message-Id: <5CF641D1-F9EB-424A-8F88-6AFD97184FC0@linux.ibm.com>
References: <20221024003541.1347364-1-rmclure@linux.ibm.com>
 <20221024003541.1347364-2-rmclure@linux.ibm.com>
 <1e757f97-79da-40f9-b039-88a569189778@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bV230ctooGyb2oqzv_f_MjtmgjmO6Al-
X-Proofpoint-ORIG-GUID: bV230ctooGyb2oqzv_f_MjtmgjmO6Al-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_14,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060201
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 3 Nov 2022, at 7:02 pm, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 24/10/2022 =C3=A0 02:35, Rohan McLure a =C3=A9crit :
>> Add the following helpers for detecting whether a page table entry
>> is a leaf and is accessible to user space.
>>=20
>>  * pte_user_accessible_page
>>  * pmd_user_accessible_page
>>  * pud_user_accessible_page
>>=20
>> Also implement missing pud_user definitions for both Book3S/nohash =
64-bit
>> systems, and pmd_user for Book3S/nohash 32-bit systems.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V2: Provide missing pud_user implementations, use p{u,m}d_is_leaf.
>> V3: Provide missing pmd_user implementations as stubs in 32-bit.
>> ---
>>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++++
>>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++++++++
>>  arch/powerpc/include/asm/nohash/32/pgtable.h |  1 +
>>  arch/powerpc/include/asm/nohash/64/pgtable.h | 10 ++++++++++
>>  arch/powerpc/include/asm/pgtable.h           | 15 +++++++++++++++
>>  5 files changed, 40 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h =
b/arch/powerpc/include/asm/book3s/32/pgtable.h
>> index 40041ac713d9..8bf1c538839a 100644
>> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
>> @@ -531,6 +531,10 @@ static inline pte_t pte_modify(pte_t pte, =
pgprot_t newprot)
>>   return __pte((pte_val(pte) & _PAGE_CHG_MASK) | =
pgprot_val(newprot));
>>  }
>>=20
>> +static inline bool pmd_user(pmd_t pmd)
>> +{
>> + return 0;
>> +}
>>=20
>>=20
>>  /* This low level function performs the actual PTE insertion
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h =
b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index f9aefa492df0..3083111f9d0a 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -621,6 +621,16 @@ static inline bool pte_user(pte_t pte)
>>   return !(pte_raw(pte) & cpu_to_be64(_PAGE_PRIVILEGED));
>>  }
>>=20
>> +static inline bool pmd_user(pmd_t pmd)
>> +{
>> + return !(pmd_raw(pmd) & cpu_to_be64(_PAGE_PRIVILEGED));
>> +}
>> +
>> +static inline bool pud_user(pud_t pud)
>> +{
>> + return !(pud_raw(pud) & cpu_to_be64(_PAGE_PRIVILEGED));
>> +}
>> +
>>  #define pte_access_permitted pte_access_permitted
>>  static inline bool pte_access_permitted(pte_t pte, bool write)
>>  {
>> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h =
b/arch/powerpc/include/asm/nohash/32/pgtable.h
>> index 9091e4904a6b..b92044d9d778 100644
>> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
>> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
>> @@ -354,6 +354,7 @@ static inline int pte_young(pte_t pte)
>>  #endif
>>=20
>>  #define pmd_page(pmd) pfn_to_page(pmd_pfn(pmd))
>> +#define pmd_user(pmd) 0
>>  /*
>>   * Encode and decode a swap entry.
>>   * Note that the bits we use in a PTE for representing a swap entry
>> diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h =
b/arch/powerpc/include/asm/nohash/64/pgtable.h
>> index 599921cc257e..23c5135178d1 100644
>> --- a/arch/powerpc/include/asm/nohash/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
>> @@ -123,6 +123,11 @@ static inline pte_t pmd_pte(pmd_t pmd)
>>   return __pte(pmd_val(pmd));
>>  }
>>=20
>> +static inline bool pmd_user(pmd_t pmd)
>> +{
>> + return (pmd_val(pmd) & _PAGE_USER) =3D=3D _PAGE_USER;
>> +}
>> +
>>  #define pmd_none(pmd) (!pmd_val(pmd))
>>  #define pmd_bad(pmd) (!is_kernel_addr(pmd_val(pmd)) \
>>    || (pmd_val(pmd) & PMD_BAD_BITS))
>> @@ -158,6 +163,11 @@ static inline pte_t pud_pte(pud_t pud)
>>   return __pte(pud_val(pud));
>>  }
>>=20
>> +static inline bool pud_user(pud_t pud)
>> +{
>> + return (pud_val(pud) & _PAGE_USER) =3D=3D _PAGE_USER;
>> +}
>> +
>>  static inline pud_t pte_pud(pte_t pte)
>>  {
>>   return __pud(pte_val(pte));
>> diff --git a/arch/powerpc/include/asm/pgtable.h =
b/arch/powerpc/include/asm/pgtable.h
>> index 36956fb440e1..3cb5de9f1aa4 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -172,6 +172,21 @@ static inline int pud_pfn(pud_t pud)
>>  }
>>  #endif
>>=20
>> +static inline bool pte_user_accessible_page(pte_t pte)
>> +{
>> + return pte_present(pte) && pte_user(pte);
>> +}
>> +
>> +static inline bool pmd_user_accessible_page(pmd_t pmd)
>> +{
>> + return pmd_is_leaf(pmd) && pmd_present(pmd) && pmd_user(pmd);
>=20
> pmd_is_leaf() is specific to powerpc and we may want to get rid of it.
>=20
> Can you use pmd_leaf() instead ?
>=20
>> +}
>> +
>> +static inline bool pud_user_accessible_page(pud_t pud)
>> +{
>> + return pud_is_leaf(pud) && pud_present(pud) && pud_user(pud);
>=20
> pud_is_leaf() is specific to powerpc and we may want to get rid of it.
>=20
> Can you use pud_leaf() instead ?

Going to resend, replacing all usages/definitions of p{m,u,4}d_is_leaf()
with p{m,u,4}_leaf() in arch/powerpc prior to this patch.

>=20
>> +}
>> +
>>  #endif /* __ASSEMBLY__ */
>>=20
>>  #endif /* _ASM_POWERPC_PGTABLE_H */


