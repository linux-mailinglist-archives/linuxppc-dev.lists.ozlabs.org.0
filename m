Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D076972C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 01:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGfQt6VMtz3chK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 11:41:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NoGVxs4W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NoGVxs4W;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGfPx3R15z3c6m
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 11:40:53 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ENub3p030012;
	Wed, 15 Feb 2023 00:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=nWqSESsvYA88OenfGxrQbjkGyJS06YHu6heN3Ku1Iq0=;
 b=NoGVxs4WGHG9UuxL4fJUFeAXdyee7MHmxfXQsm7AqOwtS3kBnwd4hz/ANAD+iABftqlb
 nvmSwcA6ChgT6nCwc3A+a3ecW0+QzGf8AJyrgf4Z8oqZ7tKhTzU/fLDoawOyxZNVdjgP
 /2C5Kb2W0xexWn1+5Ai4r5v6XjJ/5175D3Y8Sv+Q0VOSfTfo82g6J0I5Xk/2Kteqgbxf
 hFRyTqw+hDRe+hV/h+s455PLGBZg/unAWI47FSEeRJxqVmwO/CRfGsAL3llhF0fN1Blv
 T+qkcN+1yhEhbXaRXjDCfkdLIyp42iecq9d+7/q5lLQ/B40xQN4dJZwwczfonegxLIFs dQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrmdqrqq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 00:40:47 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31ENfOoh029130;
	Wed, 15 Feb 2023 00:40:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3np2n6kfva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 00:40:45 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31F0ehvx51184010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 00:40:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3300520043;
	Wed, 15 Feb 2023 00:40:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A41A920040;
	Wed, 15 Feb 2023 00:40:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 00:40:42 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.15.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 00E4260217;
	Wed, 15 Feb 2023 11:40:37 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v6 2/7] powerpc/64s: mm: Introduce __pmdp_collapse_flush
 with mm_struct argument
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <FA939CA4-75C6-441C-8289-EB669C9777D5@linux.ibm.com>
Date: Wed, 15 Feb 2023 11:40:22 +1100
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD3ED59C-DCD0-4439-8964-179096E79E2A@linux.ibm.com>
References: <20230214015939.1853438-1-rmclure@linux.ibm.com>
 <20230214015939.1853438-3-rmclure@linux.ibm.com>
 <d7ea2b97-ef14-e621-4b16-577c99f8198a@csgroup.eu>
 <FA939CA4-75C6-441C-8289-EB669C9777D5@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: COv9JGJmJDn0996cpv4-2UBee8OYwm1c
X-Proofpoint-GUID: COv9JGJmJDn0996cpv4-2UBee8OYwm1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=863 phishscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140207
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

> On 15 Feb 2023, at 11:17 am, Rohan McLure <rmclure@linux.ibm.com> =
wrote:
>=20
>> On 14 Feb 2023, at 5:02 pm, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>>=20
>>=20
>>=20
>> Le 14/02/2023 =C3=A0 02:59, Rohan McLure a =C3=A9crit :
>>> pmdp_collapse_flush has references in generic code with just three
>>> parameters, due to the choice of mm context being implied by the =
vm_area
>>> context parameter.
>>>=20
>>> Define __pmdp_collapse_flush to accept an additional mm_struct *
>>> parameter, with pmdp_collapse_flush a macro that unpacks the vma and
>>> calls __pmdp_collapse_flush. The mm_struct * parameter is needed in =
a
>>> future patch providing Page Table Check support, which is defined in
>>> terms of mm context objects.
>>>=20
>>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>>> ---
>>> v6: New patch
>>> ---
>>> arch/powerpc/include/asm/book3s/64/pgtable.h | 14 +++++++++++---
>>> 1 file changed, 11 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h =
b/arch/powerpc/include/asm/book3s/64/pgtable.h
>>> index cb4c67bf45d7..9d8b4e25f5ed 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>>> @@ -1244,14 +1244,22 @@ static inline pmd_t =
pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>  return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
>>> }
>>>=20
>>> -static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>>> - unsigned long address, pmd_t *pmdp)
>>> +static inline pmd_t __pmdp_collapse_flush(struct vm_area_struct =
*vma, struct mm_struct *mm,
>>> +  unsigned long address, pmd_t *pmdp)
>>> {
>>>  if (radix_enabled())
>>>  return radix__pmdp_collapse_flush(vma, address, pmdp);
>>>  return hash__pmdp_collapse_flush(vma, address, pmdp);
>>> }
>>> -#define pmdp_collapse_flush pmdp_collapse_flush
>>> +#define pmdp_collapse_flush(vma, addr, pmdp) \
>>> +({ \
>>> + struct vm_area_struct *_vma =3D (vma); \
>>> + pmd_t _r; \
>>> + \
>>> + _r =3D __pmdp_collapse_flush(_vma, _vma->vm_mm, (addr), (pmdp)); \
>>> + \
>>> + _r; \
>>> +})
>>=20
>> Can you make it a static inline function instead of a ugly macro ?
>=20
> Due to some header hell, it=E2=80=99s looking like this location only =
has access to
> a prototype for struct vm_area_struct. Might have to remain a macro =
then.
>=20
> Probably don=E2=80=99t need to expliclty declare a variable for the =
macro =E2=80=98return=E2=80=99
> though.

It=E2=80=99s the same solution opted for by ptep_test_and_clear_young.

#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
#define ptep_test_and_clear_young(__vma, __addr, __ptep)	\
({								\
	__ptep_test_and_clear_young((__vma)->vm_mm, __addr, __ptep); \
})

>=20
>>=20
>>>=20
>>> #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
>>> pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,


