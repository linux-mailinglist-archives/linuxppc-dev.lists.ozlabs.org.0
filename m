Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C2515A1C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 05:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqvmZ3tjBz3brt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 13:22:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kqvm85tjkz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 13:21:59 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R851e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0VBla4YD_1651288907; 
Received: from 30.32.86.96(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VBla4YD_1651288907) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 30 Apr 2022 11:21:50 +0800
Message-ID: <bcb4a3b0-4fcd-af3a-2a2c-fd662d9eaba9@linux.alibaba.com>
Date: Sat, 30 Apr 2022 11:22:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
 <20220429220214.4cfc5539@thinkpad>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20220429220214.4cfc5539@thinkpad>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, svens@linux.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/30/2022 4:02 AM, Gerald Schaefer wrote:
> On Fri, 29 Apr 2022 16:14:43 +0800
> Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> On some architectures (like ARM64), it can support CONT-PTE/PMD size
>> hugetlb, which means it can support not only PMD/PUD size hugetlb:
>> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
>> size specified.
>>
>> When unmapping a hugetlb page, we will get the relevant page table
>> entry by huge_pte_offset() only once to nuke it. This is correct
>> for PMD or PUD size hugetlb, since they always contain only one
>> pmd entry or pud entry in the page table.
>>
>> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
>> since they can contain several continuous pte or pmd entry with
>> same page table attributes, so we will nuke only one pte or pmd
>> entry for this CONT-PTE/PMD size hugetlb page.
>>
>> And now we only use try_to_unmap() to unmap a poisoned hugetlb page,
>> which means now we will unmap only one pte entry for a CONT-PTE or
>> CONT-PMD size poisoned hugetlb page, and we can still access other
>> subpages of a CONT-PTE or CONT-PMD size poisoned hugetlb page,
>> which will cause serious issues possibly.
>>
>> So we should change to use huge_ptep_clear_flush() to nuke the
>> hugetlb page table to fix this issue, which already considered
>> CONT-PTE and CONT-PMD size hugetlb.
>>
>> Note we've already used set_huge_swap_pte_at() to set a poisoned
>> swap entry for a poisoned hugetlb page.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/rmap.c | 34 +++++++++++++++++-----------------
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 7cf2408..1e168d7 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1564,28 +1564,28 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>   					break;
>>   				}
>>   			}
>> +			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> 
> Unlike in your patch 2/3, I do not see that this (huge) pteval would later
> be used again with set_huge_pte_at() instead of set_pte_at(). Not sure if
> this (huge) pteval could end up at a set_pte_at() later, but if yes, then
> this would be broken on s390, and you'd need to use set_huge_pte_at()
> instead of set_pte_at() like in your patch 2/3.

IIUC, As I said in the commit message, we will only unmap a poisoned 
hugetlb page by try_to_unmap(), and the poisoned hugetlb page will be 
remapped with a poisoned entry by set_huge_swap_pte_at() in 
try_to_unmap_one(). So I think no need change to use set_huge_pte_at() 
instead of set_pte_at() for other cases, since the hugetlb page will not 
hit other cases.

if (PageHWPoison(subpage) && !(flags & TTU_IGNORE_HWPOISON)) {
	pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
	if (folio_test_hugetlb(folio)) {
		hugetlb_count_sub(folio_nr_pages(folio), mm);
		set_huge_swap_pte_at(mm, address, pvmw.pte, pteval,
				     vma_mmu_pagesize(vma));
	} else {
		dec_mm_counter(mm, mm_counter(&folio->page));
		set_pte_at(mm, address, pvmw.pte, pteval);
	}

}

> 
> Please note that huge_ptep_get functions do not return valid PTEs on s390,
> and such PTEs must never be set directly with set_pte_at(), but only with
> set_huge_pte_at().
> 
> Background is that, for hugetlb pages, we are of course not really dealing
> with PTEs at this level, but rather PMDs or PUDs, depending on hugetlb size.
> On s390, the layout is quite different for PTEs and PMDs / PUDs, and
> unfortunately the hugetlb code is not properly reflecting this by using
> PMD or PUD types, like the THP code does.
> 
> So, as work-around, on s390, the huge_ptep_xxx functions will return
> only fake PTEs, which must be converted again to a proper PMD or PUD,
> before writing them to the page table, which is what happens in
> set_huge_pte_at(), but not in set_pte_at().

Thanks for your explanation. As I said as above, I think we've already 
handled the hugetlb with set_huge_swap_pte_at() in try_to_unmap_one().
