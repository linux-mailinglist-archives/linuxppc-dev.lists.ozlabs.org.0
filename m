Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B151E6972A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 01:19:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGdx74M3bz3chW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 11:19:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MEsq8X0b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MEsq8X0b;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGdw80HTSz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 11:18:31 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31EMNmqd013227;
	Wed, 15 Feb 2023 00:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ZIOaKjOU+rcSYMMBy/7LVWmWVyaqpN9clTirp3v7Lvk=;
 b=MEsq8X0bnkTYd+yVUWm9Oqpqg2P+drvljTBaV4GMat18Dar3tpa6Om6yalT1FDDjwyOH
 ivxNYuTLpFp4aWoB/w7xHpRE4hMIlSipi7vRqK2kbEl32kLMfWaf56YBZ/+A0m5eTsKD
 CbJ0GT16G0PC0C9uBp4yOddvDqSFrd9AwsGjLPakZGN0yfghTPNt76vLsHQPrc6kAtAa
 QuhdAmnA6p4v8Necf1OUc6KUHAJ2r1Gnb32Y2bypatr9cbqkNXj1+yJDJ7dOH6fWq6le
 lHsK1NCem7dgZYLmI2Zw40Z9MOIgwBCmUSWrn5DKg4WKOiH9LoUhIcdqjFsoOOAKHymO Yg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrk2cadst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 00:18:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E6RKmr007386;
	Wed, 15 Feb 2023 00:18:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3np29fbfhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 00:18:20 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31F0IHHt50266436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 00:18:18 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D719820049;
	Wed, 15 Feb 2023 00:18:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5420420040;
	Wed, 15 Feb 2023 00:18:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 00:18:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.15.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2EE0F600D2;
	Wed, 15 Feb 2023 11:18:11 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v6 2/7] powerpc/64s: mm: Introduce __pmdp_collapse_flush
 with mm_struct argument
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <d7ea2b97-ef14-e621-4b16-577c99f8198a@csgroup.eu>
Date: Wed, 15 Feb 2023 11:17:56 +1100
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA939CA4-75C6-441C-8289-EB669C9777D5@linux.ibm.com>
References: <20230214015939.1853438-1-rmclure@linux.ibm.com>
 <20230214015939.1853438-3-rmclure@linux.ibm.com>
 <d7ea2b97-ef14-e621-4b16-577c99f8198a@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OHKilRba738WuPah5IqfpwKewsyCyThi
X-Proofpoint-GUID: OHKilRba738WuPah5IqfpwKewsyCyThi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_16,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=967 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140202
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

> On 14 Feb 2023, at 5:02 pm, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 14/02/2023 =C3=A0 02:59, Rohan McLure a =C3=A9crit :
>> pmdp_collapse_flush has references in generic code with just three
>> parameters, due to the choice of mm context being implied by the =
vm_area
>> context parameter.
>>=20
>> Define __pmdp_collapse_flush to accept an additional mm_struct *
>> parameter, with pmdp_collapse_flush a macro that unpacks the vma and
>> calls __pmdp_collapse_flush. The mm_struct * parameter is needed in a
>> future patch providing Page Table Check support, which is defined in
>> terms of mm context objects.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> v6: New patch
>> ---
>>  arch/powerpc/include/asm/book3s/64/pgtable.h | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h =
b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index cb4c67bf45d7..9d8b4e25f5ed 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -1244,14 +1244,22 @@ static inline pmd_t =
pmdp_huge_get_and_clear(struct mm_struct *mm,
>>   return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
>>  }
>>=20
>> -static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>> - unsigned long address, pmd_t *pmdp)
>> +static inline pmd_t __pmdp_collapse_flush(struct vm_area_struct =
*vma, struct mm_struct *mm,
>> +  unsigned long address, pmd_t *pmdp)
>>  {
>>   if (radix_enabled())
>>   return radix__pmdp_collapse_flush(vma, address, pmdp);
>>   return hash__pmdp_collapse_flush(vma, address, pmdp);
>>  }
>> -#define pmdp_collapse_flush pmdp_collapse_flush
>> +#define pmdp_collapse_flush(vma, addr, pmdp) \
>> +({ \
>> + struct vm_area_struct *_vma =3D (vma); \
>> + pmd_t _r; \
>> + \
>> + _r =3D __pmdp_collapse_flush(_vma, _vma->vm_mm, (addr), (pmdp)); \
>> + \
>> + _r; \
>> +})
>=20
> Can you make it a static inline function instead of a ugly macro ?

Due to some header hell, it=E2=80=99s looking like this location only =
has access to
a prototype for struct vm_area_struct. Might have to remain a macro =
then.

Probably don=E2=80=99t need to expliclty declare a variable for the =
macro =E2=80=98return=E2=80=99
though.

>=20
>>=20
>>  #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
>>  pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,

