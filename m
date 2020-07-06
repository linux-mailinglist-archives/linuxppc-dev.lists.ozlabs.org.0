Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDD21533E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 09:22:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0cTR5mf9zDqkc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 17:22:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0cRS6mFQzDqn2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 17:20:36 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06673KGE153490; Mon, 6 Jul 2020 03:20:30 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322m3btyqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 03:20:29 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0667GOlu030322;
 Mon, 6 Jul 2020 07:20:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 322hd7t0c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 07:20:27 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0667KPpt66191432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 07:20:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FA354203F;
 Mon,  6 Jul 2020 07:20:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5726042045;
 Mon,  6 Jul 2020 07:20:24 +0000 (GMT)
Received: from [9.85.98.83] (unknown [9.85.98.83])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 07:20:24 +0000 (GMT)
Subject: Re: [PATCH v5 10/26] powerpc/book3s64/pkeys: Convert pkey_total to
 max_pkey
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-11-aneesh.kumar@linux.ibm.com>
 <87tuyl5dko.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <15527f2f-1b50-2ff2-3e05-b03dec985391@linux.ibm.com>
Date: Mon, 6 Jul 2020 12:50:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87tuyl5dko.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_04:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 cotscore=-2147483648 phishscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007060055
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/6/20 12:34 PM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> max_pkey now represents max key value that userspace can allocate.
>>

I guess commit message is confusing.

>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/pkeys.h |  7 +++++--
>>   arch/powerpc/mm/book3s64/pkeys.c | 14 +++++++-------
>>   2 files changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
>> index 75d2a2c19c04..652bad7334f3 100644
>> --- a/arch/powerpc/include/asm/pkeys.h
>> +++ b/arch/powerpc/include/asm/pkeys.h
>> @@ -12,7 +12,7 @@
>>   #include <asm/firmware.h>
>>   
>>   DECLARE_STATIC_KEY_FALSE(pkey_disabled);
>> -extern int pkeys_total; /* total pkeys as per device tree */
>> +extern int max_pkey;
>>   extern u32 initial_allocation_mask; /*  bits set for the initially allocated keys */
>>   extern u32 reserved_allocation_mask; /* bits set for reserved keys */
>>   
>> @@ -44,7 +44,10 @@ static inline int vma_pkey(struct vm_area_struct *vma)
>>   	return (vma->vm_flags & ARCH_VM_PKEY_FLAGS) >> VM_PKEY_SHIFT;
>>   }
>>   
>> -#define arch_max_pkey() pkeys_total
>> +static inline int arch_max_pkey(void)
>> +{
>> +	return max_pkey;
>> +}
> 
> If pkeys_total = 32 then max_pkey = 31.

we have

#ifdef CONFIG_PPC_4K_PAGES
	/*
	 * The OS can manage only 8 pkeys due to its inability to represent them
	 * in the Linux 4K PTE. Mark all other keys reserved.
	 */
	max_pkey = min(8, pkeys_total);
#else
	max_pkey = pkeys_total;
#endif

so it is 32.

> 
> So we can't just substitute one for the other. ie. arch_max_pkey() must
> have been wrong, or it is wrong now.
> 
>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
>> index 87d882a9aaf2..a4d7287082a8 100644
>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>> @@ -14,7 +14,7 @@
>>   
>>   DEFINE_STATIC_KEY_FALSE(pkey_disabled);
>>   DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
>> -int  pkeys_total;		/* Total pkeys as per device tree */
>> +int  max_pkey;			/* Maximum key value supported */
>>   u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
>>   /*
>>    *  Keys marked in the reservation list cannot be allocated by  userspace
>> @@ -84,7 +84,7 @@ static int scan_pkey_feature(void)
>>   
>>   static int pkey_initialize(void)
>>   {
>> -	int os_reserved, i;
>> +	int pkeys_total, i;
>>   
>>   	/*
>>   	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
>> @@ -122,12 +122,12 @@ static int pkey_initialize(void)
>>   	 * The OS can manage only 8 pkeys due to its inability to represent them
>>   	 * in the Linux 4K PTE. Mark all other keys reserved.
>>   	 */
>> -	os_reserved = pkeys_total - 8;
>> +	max_pkey = min(8, pkeys_total);
> 
> Shouldn't it be 7 ?
> 
>>   #else
>> -	os_reserved = 0;
>> +	max_pkey = pkeys_total;
>>   #endif
>>   
>> -	if (unlikely((pkeys_total - os_reserved) <= execute_only_key)) {
>> +	if (unlikely(max_pkey <= execute_only_key)) {
> 
> Isn't that an off-by-one now?
> 
> This is one-off boot time code, there's no need to clutter it with
> unlikely.
> 
>>   		/*
>>   		 * Insufficient number of keys to support
>>   		 * execute only key. Mark it unavailable.
>> @@ -174,10 +174,10 @@ static int pkey_initialize(void)
>>   	default_uamor &= ~(0x3ul << pkeyshift(1));
>>   
>>   	/*
>> -	 * Prevent the usage of OS reserved the keys. Update UAMOR
>> +	 * Prevent the usage of OS reserved keys. Update UAMOR
>>   	 * for those keys.
>>   	 */
>> -	for (i = (pkeys_total - os_reserved); i < pkeys_total; i++) {
>> +	for (i = max_pkey; i < pkeys_total; i++) {
> 
> Another off-by-one? Shouldn't we start from max_pkey + 1 ?
> 
>>   		reserved_allocation_mask |= (0x1 << i);
>>   		default_uamor &= ~(0x3ul << pkeyshift(i));
>>   	}
> 

It is the commit message. It is max pkey such that userspace can 
allocate 0 - maxp_pkey -1.

-aneesh
