Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301A382E0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkLK31xT6z30L4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:56:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mXPHfhSR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mXPHfhSR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkLJW1grWz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:56:10 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HDWvgp032222; Mon, 17 May 2021 09:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Us9UKM1phQm8WG0lDFhJ4ywiIounM6yTagUbweo+Yz0=;
 b=mXPHfhSRW7asfKCJTIohzx1mPjAhng1Ti8CIbkvFKLmQDeC/LpGxn9JcKSc3m5wlT5oL
 0jUHiDNVW496/gv24QfH+bGftI3SVi9QGAEVrf/5zC4E86aEpHC4kldAP3HA9sSleDRy
 391dS9UAOCoRID3nhwzKi/qxTe0EOXZF95o3YKr4rTM83dLB1ihjvtfqE+EK1lGet+/d
 sptpsGCsbAdil8DscFyFdn+CapWGAtYMT13FY4o2zIca4ygPOpgPfti/poyfpL4qyZe6
 XlHII5YLo8/FKYVMig9frXIgbYKrn5HOIhTDxS3pJdymyY4KAY3YkFzQWLJIQDAVZxVa qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38krxj1wxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 09:55:54 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14HDXbwm034065;
 Mon, 17 May 2021 09:55:54 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38krxj1wxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 09:55:54 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14HDqWFM014822;
 Mon, 17 May 2021 13:55:53 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 38j5x9kd2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 13:55:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14HDtqDO32375066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 13:55:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38A92BE079;
 Mon, 17 May 2021 13:55:52 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7FF2BE069;
 Mon, 17 May 2021 13:55:48 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.40.240])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 13:55:48 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines
 to take a page walk cache flush argument
In-Reply-To: <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
Date: Mon, 17 May 2021 19:25:46 +0530
Message-ID: <87pmxpqxb1.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AAIc0caZr1voZgopm7zPOn0y3KoI9oAF
X-Proofpoint-GUID: 28_3rmCyY6EIbEGvsKbm1T0JpgCp8-3M
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_05:2021-05-17,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170096
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:

> On 5/17/21 1:40 AM, Aneesh Kumar K.V wrote:
>> On 5/15/21 10:05 PM, Guenter Roeck wrote:
>>> On Thu, Apr 22, 2021 at 11:13:19AM +0530, Aneesh Kumar K.V wrote:

...

>>> =C2=A0 extern void radix__local_flush_all_mm(struct mm_struct *mm);
>>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powe=
rpc/include/asm/book3s/64/tlbflush.h
>>>> index 215973b4cb26..f9f8a3a264f7 100644
>>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>>> @@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hash__tlbiel_al=
l(TLB_INVAL_SCOPE_LPID);
>>>> =C2=A0 }
>>>> +static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lo=
ng start,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lo=
ng end,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool flush_=
pwc)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 if (radix_enabled())
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return radix__flush_pmd_tl=
b_range(vma, start, end, flush_pwc);
>>>> +=C2=A0=C2=A0=C2=A0 return hash__flush_tlb_range(vma, start, end);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>>> +}
>>=20
>> In this specific case we won't have=C2=A0 build errors because,
>>=20
>> static inline void hash__flush_tlb_range(struct vm_area_struct *vma,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long start, un=
signed long end)
>> {
>>=20
>
> Sorry, you completely lost me.
>
> Building parisc:allnoconfig ... failed
> --------------
> Error log:
> In file included from arch/parisc/include/asm/cacheflush.h:7,
>                   from include/linux/highmem.h:12,
>                   from include/linux/pagemap.h:11,
>                   from include/linux/ksm.h:13,
>                   from mm/mremap.c:14:
> mm/mremap.c: In function 'flush_pte_tlb_pwc_range':
> arch/parisc/include/asm/tlbflush.h:20:2: error: 'return' with a value, in=
 function returning void

As replied here
https://lore.kernel.org/mm-commits/8eedb441-a612-1ec8-8bf7-b40184de9f6f@lin=
ux.ibm.com/

That was the generic header change in the patch. I was commenting about the
ppc64 specific change causing build failures.

-aneesh

