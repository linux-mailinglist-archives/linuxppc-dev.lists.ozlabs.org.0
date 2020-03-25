Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C255F191F80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 04:00:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nCXr2jl9zDqVS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 14:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=longpeng2@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nCW74R2zzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:58:59 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2FC8EC61B4371320B3C4;
 Wed, 25 Mar 2020 10:58:52 +0800 (CST)
Received: from [10.173.228.124] (10.173.228.124) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Mar
 2020 10:58:47 +0800
Subject: Re: [PATCH 1/4] hugetlbfs: add arch_hugetlb_valid_size
To: Mike Kravetz <mike.kravetz@oracle.com>, Dave Hansen
 <dave.hansen@intel.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <sparclinux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-2-mike.kravetz@oracle.com>
 <831a0773-1ba6-4d72-44b9-7472123b8528@intel.com>
 <5aceea6a-8dc0-a44b-80c6-94511b5c75ca@oracle.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <5ea6313e-ec4f-a043-632b-ef2901ce2cc9@huawei.com>
Date: Wed, 25 Mar 2020 10:58:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5aceea6a-8dc0-a44b-80c6-94511b5c75ca@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.228.124]
X-CFilter-Loop: Reflected
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2020/3/19 6:52, Mike Kravetz wrote:
> On 3/18/20 3:15 PM, Dave Hansen wrote:
>> Hi Mike,
>>
>> The series looks like a great idea to me.  One nit on the x86 bits,
>> though...
>>
>>> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
>>> index 5bfd5aef5378..51e6208fdeec 100644
>>> --- a/arch/x86/mm/hugetlbpage.c
>>> +++ b/arch/x86/mm/hugetlbpage.c
>>> @@ -181,16 +181,25 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>>>  #endif /* CONFIG_HUGETLB_PAGE */
>>>  
>>>  #ifdef CONFIG_X86_64
>>> +bool __init arch_hugetlb_valid_size(unsigned long long size)
>>> +{
>>> +	if (size == PMD_SIZE)
>>> +		return true;
>>> +	else if (size == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES))
>>> +		return true;
>>> +	else
>>> +		return false;
>>> +}
>>
>> I'm pretty sure it's possible to have a system without 2M/PMD page
>> support.  We even have a handy-dandy comment about it in
>> arch/x86/include/asm/required-features.h:
>>
>> 	#ifdef CONFIG_X86_64
>> 	#ifdef CONFIG_PARAVIRT
>> 	/* Paravirtualized systems may not have PSE or PGE available */
>> 	#define NEED_PSE        0
>> 	...
>>
>> I *think* you need an X86_FEATURE_PSE check here to be totally correct.
>>
>> 	if (size == PMD_SIZE && cpu_feature_enabled(X86_FEATURE_PSE))
>> 		return true;
>>
>> BTW, I prefer cpu_feature_enabled() to boot_cpu_has() because it
>> includes disabled-features checking.  I don't think any of it matters
>> for these specific features, but I generally prefer it on principle.
> 
> Sounds good.  I'll incorporate those changes into a v2, unless someone
> else with has a different opinion.
> 
> BTW, this patch should not really change the way the code works today.
> It is mostly a movement of code.  Unless I am missing something, the
> existing code will always allow setup of PMD_SIZE hugetlb pages.
> 
Hi Mike,

Inspired by Dave's opinion, it seems the x86-specific hugepages_supported should
also need to use cpu_feature_enabled instead.

Also, I wonder if the hugepages_supported is correct ? There're two arch
specific hugepages_supported:
x86:
#define hugepages_supported() boot_cpu_has(X86_FEATURE_PSE)
and
s390:
#define hugepages_supported() (MACHINE_HAS_EDAT1)

Is it possible that x86 has X86_FEATURE_GBPAGES but hasn't X86_FEATURE_GBPAGES
or s390 has MACHINE_HAS_EDAT2 but hasn't MACHINE_HAS_EDAT1 ?

---
Regards,
Longpeng(Mike)
