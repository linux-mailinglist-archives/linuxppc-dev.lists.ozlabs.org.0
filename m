Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9918BF46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 19:22:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jwH6518kzDrR9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 05:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=rmpVyB3d; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jwCm3ZkSzDrPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 05:19:15 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JI8wHq080123;
 Thu, 19 Mar 2020 18:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=HXvLR8/3np/VEn4lQcPgfkQDXtCeUG1sWXEv4yIwMjg=;
 b=rmpVyB3d0/cWvHtU9RvF5VWb6i7rdQSOdwNYMXZ5oeoLYOUo/sWN/JFVznP4TARCd8/j
 IOZcupF92YGaCAal0s1483+WIxGL9ohqg+S6vn4mv0ZLtI6i+73jqJUxy/++kh21IAx6
 psTm0iugjrftvG1vtreP8z/8AhtmTionvoNYc5FGURy0BlrOXCHHWs6w8IOKxIXmgPsA
 tqY9g4VPq5KdtvZmjA7fhcxui2F7jvT92/u+ESkjswUWFiQ6i3uOitEqbhB1XvsjWMBY
 YJa5yi8fzQ+JWcuU6zZ3KN4HO7sVh44X2X+NQ5wlD/8IIDNn78qOXnLf6dnarU3i3pwi Ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2yrq7m9tpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 18:17:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02JIGdv1032600;
 Thu, 19 Mar 2020 18:17:54 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ys8rmsrj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 18:17:54 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02JIHoi9022986;
 Thu, 19 Mar 2020 18:17:50 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Mar 2020 11:17:49 -0700
Subject: Re: [PATCH 1/4] hugetlbfs: add arch_hugetlb_valid_size
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-2-mike.kravetz@oracle.com>
 <c3071359-c5d3-4247-7f16-6f61b2fa0756@c-s.fr>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <c60fe230-462c-aa8c-be50-61c92840d7b7@oracle.com>
Date: Thu, 19 Mar 2020 11:17:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c3071359-c5d3-4247-7f16-6f61b2fa0756@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190076
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "David S.Miller" <davem@davemloft.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 12:00 AM, Christophe Leroy wrote:
> 
> Le 18/03/2020 à 23:06, Mike Kravetz a écrit :
>> The architecture independent routine hugetlb_default_setup sets up
>> the default huge pages size.  It has no way to verify if the passed
>> value is valid, so it accepts it and attempts to validate at a later
>> time.  This requires undocumented cooperation between the arch specific
>> and arch independent code.
>>
>> For architectures that support more than one huge page size, provide
>> a routine arch_hugetlb_valid_size to validate a huge page size.
>> hugetlb_default_setup can use this to validate passed values.
>>
>> arch_hugetlb_valid_size will also be used in a subsequent patch to
>> move processing of the "hugepagesz=" in arch specific code to a common
>> routine in arch independent code.
>>
>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>> ---
>>   arch/arm64/include/asm/hugetlb.h   |  2 ++
>>   arch/arm64/mm/hugetlbpage.c        | 19 ++++++++++++++-----
>>   arch/powerpc/include/asm/hugetlb.h |  3 +++
>>   arch/powerpc/mm/hugetlbpage.c      | 20 +++++++++++++-------
>>   arch/riscv/include/asm/hugetlb.h   |  3 +++
>>   arch/riscv/mm/hugetlbpage.c        | 28 ++++++++++++++++++----------
>>   arch/s390/include/asm/hugetlb.h    |  3 +++
>>   arch/s390/mm/hugetlbpage.c         | 18 +++++++++++++-----
>>   arch/sparc/include/asm/hugetlb.h   |  3 +++
>>   arch/sparc/mm/init_64.c            | 23 ++++++++++++++++-------
>>   arch/x86/include/asm/hugetlb.h     |  3 +++
>>   arch/x86/mm/hugetlbpage.c          | 21 +++++++++++++++------
>>   include/linux/hugetlb.h            |  7 +++++++
>>   mm/hugetlb.c                       | 16 +++++++++++++---
>>   14 files changed, 126 insertions(+), 43 deletions(-)
>>
> 
> [snip]
> 
>> diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
>> index bd6504c28c2f..3b5939016955 100644
>> --- a/arch/powerpc/include/asm/hugetlb.h
>> +++ b/arch/powerpc/include/asm/hugetlb.h
>> @@ -64,6 +64,9 @@ static inline void arch_clear_hugepage_flags(struct page *page)
>>   {
>>   }
>>   +#define arch_hugetlb_valid_size arch_hugetlb_valid_size
>> +extern bool __init arch_hugetlb_valid_size(unsigned long long size);
> 
> Don't add 'extern' keyword, it is irrelevant for a function declaration.
> 

Will do.  One of the other arch's did this and I got into a bad habit.

> checkpatch --strict doesn't like it either (https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/12318//artifact/linux/checkpatch.log)
> 
>> +
>>   #include <asm-generic/hugetlb.h>
>>     #else /* ! CONFIG_HUGETLB_PAGE */
>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>> index 33b3461d91e8..b78f660252f3 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -558,7 +558,7 @@ unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
>>       return vma_kernel_pagesize(vma);
>>   }
>>   -static int __init add_huge_page_size(unsigned long long size)
>> +bool __init arch_hugetlb_valid_size(unsigned long long size)
>>   {
>>       int shift = __ffs(size);
>>       int mmu_psize;
>> @@ -566,20 +566,26 @@ static int __init add_huge_page_size(unsigned long long size)
>>       /* Check that it is a page size supported by the hardware and
>>        * that it fits within pagetable and slice limits. */
>>       if (size <= PAGE_SIZE || !is_power_of_2(size))
>> -        return -EINVAL;
>> +        return false;
>>         mmu_psize = check_and_get_huge_psize(shift);
>>       if (mmu_psize < 0)
>> -        return -EINVAL;
>> +        return false;
>>         BUG_ON(mmu_psize_defs[mmu_psize].shift != shift);
>>   -    /* Return if huge page size has already been setup */
>> -    if (size_to_hstate(size))
>> -        return 0;
>> +    return true;
>> +}
>>   -    hugetlb_add_hstate(shift - PAGE_SHIFT);
>> +static int __init add_huge_page_size(unsigned long long size)
>> +{
>> +    int shift = __ffs(size);
>> +
>> +    if (!arch_hugetlb_valid_size(size))
>> +        return -EINVAL;
>>   +    if (!size_to_hstate(size))
>> +        hugetlb_add_hstate(shift - PAGE_SHIFT);
>>       return 0;
>>   }
>>   
> 
> [snip]
> 
>> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
>> index 5bfd5aef5378..51e6208fdeec 100644
>> --- a/arch/x86/mm/hugetlbpage.c
>> +++ b/arch/x86/mm/hugetlbpage.c
>> @@ -181,16 +181,25 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>>   #endif /* CONFIG_HUGETLB_PAGE */
>>     #ifdef CONFIG_X86_64
>> +bool __init arch_hugetlb_valid_size(unsigned long long size)
>> +{
>> +    if (size == PMD_SIZE)
>> +        return true;
>> +    else if (size == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES))
>> +        return true;
>> +    else
>> +        return false;
>> +}
>> +
>>   static __init int setup_hugepagesz(char *opt)
>>   {
>> -    unsigned long ps = memparse(opt, &opt);
>> -    if (ps == PMD_SIZE) {
>> -        hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
>> -    } else if (ps == PUD_SIZE && boot_cpu_has(X86_FEATURE_GBPAGES)) {
>> -        hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>> +    unsigned long long ps = memparse(opt, &opt);
>> +
>> +    if (arch_hugetlb_valid_size(ps)) {
>> +        hugetlb_add_hstate(ilog2(ps) - PAGE_SHIFT);
>>       } else {
>>           hugetlb_bad_size();
>> -        printk(KERN_ERR "hugepagesz: Unsupported page size %lu M\n",
>> +        printk(KERN_ERR "hugepagesz: Unsupported page size %llu M\n",
>>               ps >> 20);
> 
> Nowadays we use pr_err() instead of printk.
> 
> It would also likely allow you to have everything fit on a single line.

I may just leave this 'as is' as it will be removed in a later patch.

>>           return 0;
>>       }
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index b831e9fa1a26..33343eb980d0 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -678,6 +678,13 @@ static inline spinlock_t *huge_pte_lockptr(struct hstate *h,
>>       return &mm->page_table_lock;
>>   }
>>   +#ifndef arch_hugetlb_valid_size
>> +static inline bool arch_hugetlb_valid_size(unsigned long long size)
>> +{
>> +    return (size == HPAGE_SIZE);
> 
> Not sure the ( ) are necessary.

Likely not.  I will look at removing.

> 
>> +}
>> +#endif
>> +
>>   #ifndef hugepages_supported
>>   /*
>>    * Some platform decide whether they support huge pages at boot
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index d8ebd876871d..2f99359b93af 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3224,12 +3224,22 @@ static int __init hugetlb_nrpages_setup(char *s)
>>   }
>>   __setup("hugepages=", hugetlb_nrpages_setup);
>>   -static int __init hugetlb_default_setup(char *s)
>> +static int __init default_hugepagesz_setup(char *s)
>>   {
>> -    default_hstate_size = memparse(s, &s);
>> +    unsigned long long size;
> 
> Why unsigned long long ?
> 
> default_hstate_size is long.

Only because memparse is defined as unsigned long long.  I actually took
this from the existing powerpc hugetlb setup code.  There are no compiler
warnings/issues assigning unsigned long long to long on 64 bit builds.
Thought there would be on 32 bit platformes.

That was also the reason for making the argument to arch_hugetlb_valid_size
be unsigned long long.  So that it would match the type from memparse.
I suppose making these unsigned long and casting would be OK based on the
expected sizes.

> 
> I can't imagine 32 bits platforms having a hugepage with a 64 bits size.
> 
>> +    char *saved_s = s;
>> +
>> +    size = memparse(s, &s);
> 
> The updated s is not reused after that so you can pass NULL instead of &s and then you don't need the saved_s.
> 

Thanks for this and all the comments.  I will incorporate in v2.
-- 
Mike Kravetz
