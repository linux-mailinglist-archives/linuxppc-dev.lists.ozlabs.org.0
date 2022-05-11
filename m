Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385EF522AAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 06:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyh4t0wmKz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 13:59:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyh4Q5mZGz3bfC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 13:59:32 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0VCu38tE_1652241558; 
Received: from 30.30.99.144(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCu38tE_1652241558) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 11 May 2022 11:59:22 +0800
Message-ID: <84209c7b-ac3e-fa3b-75fc-d76ec7c99d68@linux.alibaba.com>
Date: Wed, 11 May 2022 11:59:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 migration
To: Andrew Morton <akpm@linux-foundation.org>, mike.kravetz@oracle.com,
 catalin.marinas@arm.com, will@kernel.org, songmuchun@bytedance.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 ysato@users.osdn.me, dalias@libc.org, davem@davemloft.net, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
 <ea5abf529f0997b5430961012bfda6166c1efc8c.1652147571.git.baolin.wang@linux.alibaba.com>
 <20220510161739.fdea4d78dde8471033aab22b@linux-foundation.org>
 <20220510162847.d9cf3c767e755a54699fb121@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20220510162847.d9cf3c767e755a54699fb121@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/11/2022 7:28 AM, Andrew Morton wrote:
> On Tue, 10 May 2022 16:17:39 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
>>> +
>>> +static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>>> +					  unsigned long addr, pte_t *ptep)
>>> +{
>>> +	return ptep_get(ptep);
>>> +}
>>> +
>>> +static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>>> +				   pte_t *ptep, pte_t pte)
>>> +{
>>> +}
>>>   #endif	/* CONFIG_HUGETLB_PAGE */
>>>   
>>
>> This blows up nommu (arm allnoconfig):
>>
>> In file included from fs/io_uring.c:71:
>> ./include/linux/hugetlb.h: In function 'huge_ptep_clear_flush':
>> ./include/linux/hugetlb.h:1100:16: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
>>   1100 |         return ptep_get(ptep);
>>        |                ^~~~~~~~
>>
>>
>> huge_ptep_clear_flush() is only used in CONFIG_NOMMU=n files, so I simply
>> zapped this change.
>>
> 
> Well that wasn't a great success.  Doing this instead.  It's pretty
> nasty - something nicer would be nicer please.

Thanks for fixing the building issue. I'll look at this to simplify the 
dummy function. Myabe just remove the ptep_get().

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1097,7 +1097,7 @@ static inline void set_huge_swap_pte_at(struct 
mm_struct *mm, unsigned long addr
  static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
                                           unsigned long addr, pte_t *ptep)
  {
-       return ptep_get(ptep);
+       return *ptep;
  }

> 
> --- a/include/linux/hugetlb.h~mm-rmap-fix-cont-pte-pmd-size-hugetlb-issue-when-migration-fix
> +++ a/include/linux/hugetlb.h
> @@ -1094,6 +1094,7 @@ static inline void set_huge_swap_pte_at(
>   {
>   }
>   
> +#ifdef CONFIG_MMU
>   static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>   					  unsigned long addr, pte_t *ptep)
>   {
> @@ -1104,6 +1105,7 @@ static inline void set_huge_pte_at(struc
>   				   pte_t *ptep, pte_t pte)
>   {
>   }
> +#endif
>   #endif	/* CONFIG_HUGETLB_PAGE */
>   
>   static inline spinlock_t *huge_pte_lock(struct hstate *h,
> _
