Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED68564EF3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 09:46:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LbyYG1h9Jz3brj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:46:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ga2jJMrg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ga2jJMrg;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LbyXV32dtz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 17:45:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2645pITI003998;
	Mon, 4 Jul 2022 07:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jx9jrp+zMtjbLt1L1kP+dISVYnmEnkUTho7ij9jciAQ=;
 b=ga2jJMrg4hVbFOfTmD1qSJ9ZKEOMosCPduD6wDOxF6BeHBwEaViKV9DyMwf1X1XZgvxp
 gUctYUmiHHhbhegRoy/IZOH00xVv0kRgNkDNd0wC26BJ4ShkHwSI/p+Ltv6lrbRPMDav
 P0K4onGXZrDfF+A+fABiAhvuEnD2ziMzrj5G+j1+s6+XStTGMG3WnbFts59DTItge6Km
 AZZkajaYwpdg+U3mBOVcnNR4tZ+eRoJu5hzkTNGSDMdtLAxCm6stByiEeEk+zVnbMYDr
 eKgoJzbFbwJ79Ep8BkJAM0GSg/267wzqQhB5vDZ9q52RBBco+OFik0cIw6G6QLLFjya5 Mw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h3te328c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 07:45:33 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2647dbH7022526;
	Mon, 4 Jul 2022 07:45:31 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma02fra.de.ibm.com with ESMTP id 3h2dn91rhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 07:45:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2647jTDN23855548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Jul 2022 07:45:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB462A4054;
	Mon,  4 Jul 2022 07:45:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D214FA405B;
	Mon,  4 Jul 2022 07:45:27 +0000 (GMT)
Received: from [9.43.74.198] (unknown [9.43.74.198])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  4 Jul 2022 07:45:27 +0000 (GMT)
Message-ID: <91684e3f-c60c-e70f-4c04-fab40c2214b7@linux.ibm.com>
Date: Mon, 4 Jul 2022 13:15:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] powerpc/mm: Use is_vmalloc_addr to validate addr
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20220704063909.295546-1-aneesh.kumar@linux.ibm.com>
 <2daa07c5-db5f-a6c9-82a7-7b6f1524135b@csgroup.eu>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <2daa07c5-db5f-a6c9-82a7-7b6f1524135b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZLroijy9--9FVGk_iKWyDmShJlAjRMDh
X-Proofpoint-ORIG-GUID: ZLroijy9--9FVGk_iKWyDmShJlAjRMDh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207040030
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/4/22 12:43 PM, Christophe Leroy wrote:
> 
> 
> Le 04/07/2022 à 08:39, Aneesh Kumar K.V a écrit :
>> Instead of high_memory use is_vmalloc_addr to validate that the address is
>> not in the vmalloc range.
> 
> 
> Do we really need even more extra checks, and a function that is not 
> inlined anymore ?
> 
> virt_addr_valid() used to be pretty simple. Some extra tests were added 
> by commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit 
> Book3E & 32-bit") in order to work around some corner cases, and the 
> commit message say they are temporary.
> 
> virt_addr_valid() is there to check that an address is a valid linear 
> mapping, not that an address IS NOT a vmalloc address. What will happen 
> with your check if you pass an address that is from an ioremap done 
> prior to the start of the vmalloc system ?
> 

I was expecting the io range to be handled by pfn_valid(). IS there a memory layout
ascii diagram of book3e/64 like asm/book3s/64/radix.h:51 ? My goal with the
change was to make it more explicit what is it being validated. 

> WIth the series I send last week to add KASAN to book3e/64, we now have 
> VMALLOC above PAGE_OFFSET on all platforms so we should be able to come 
> back to the original virt_addr_valid(), based exclusively on pfn_valid() 
> for PPC64, and pfn_valid() && high_memory for PPC32 (Or maybe only for 
> PPC32 having HIGHMEM)
> 
> 
> Christophe
> 
> 
>>
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> -
>> ---
>>   arch/powerpc/include/asm/page.h | 10 ++++------
>>   arch/powerpc/mm/mem.c           | 11 +++++++++++
>>   2 files changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
>> index e5f75c70eda8..977835570db3 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -131,12 +131,10 @@ static inline bool pfn_valid(unsigned long pfn)
>>   #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
>>   #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
>>   #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
>> -
>> -#define virt_addr_valid(vaddr)	({					\
>> -	unsigned long _addr = (unsigned long)vaddr;			\
>> -	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
>> -	pfn_valid(virt_to_pfn(_addr));					\
>> -})
>> +#ifndef __ASSEMBLY__
>> +extern bool __virt_addr_valid(unsigned long kaddr);
>> +#endif
>> +#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
>>   
>>   /*
>>    * On Book-E parts we need __va to parse the device tree and we can't
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index 7b0d286bf9ba..622f8bac808b 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -406,3 +406,14 @@ int devmem_is_allowed(unsigned long pfn)
>>    * the EHEA driver. Drop this when drivers/net/ethernet/ibm/ehea is removed.
>>    */
>>   EXPORT_SYMBOL_GPL(walk_system_ram_range);
>> +
>> +bool __virt_addr_valid(unsigned long kaddr)
>> +{
>> +	if (kaddr < PAGE_OFFSET)
>> +		return false;
>> +	if (is_vmalloc_addr((void *) kaddr))
>> +		return false;
>> +	return pfn_valid(virt_to_pfn(kaddr));
>> +}
>> +EXPORT_SYMBOL(__virt_addr_valid);
>> +

