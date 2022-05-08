Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC0B51EDA3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 15:09:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kx4Qp0WD9z3cK9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 23:09:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kx4QJ6LTHz3bd7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 23:09:26 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0VCaceu-_1652015354; 
Received: from 30.15.195.77(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCaceu-_1652015354) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 08 May 2022 21:09:16 +0800
Message-ID: <bf627d1a-42f8-77f3-6ac2-67edde2feb8a@linux.alibaba.com>
Date: Sun, 8 May 2022 21:09:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] mm: change huge_ptep_clear_flush() to return the
 original pte
To: Muchun Song <songmuchun@bytedance.com>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
 <Ynek+b3k6PVN3x7J@FVFYT0MHHV2J.usts.net>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <Ynek+b3k6PVN3x7J@FVFYT0MHHV2J.usts.net>
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



On 5/8/2022 7:09 PM, Muchun Song wrote:
> On Sun, May 08, 2022 at 05:36:39PM +0800, Baolin Wang wrote:
>> It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
>> table when unmapping or migrating a hugetlb page, and will change
>> to use huge_ptep_clear_flush() instead in the following patches.
>>
>> So this is a preparation patch, which changes the huge_ptep_clear_flush()
>> to return the original pte to help to nuke a hugetlb page table.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> 
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks for reviewing.

> 
> But one nit below:
> 
> [...]
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 8605d7e..61a21af 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -5342,7 +5342,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
>>   		ClearHPageRestoreReserve(new_page);
>>   
>>   		/* Break COW or unshare */
>> -		huge_ptep_clear_flush(vma, haddr, ptep);
>> +		(void)huge_ptep_clear_flush(vma, haddr, ptep);
> 
> Why add a "(void)" here? Is there any warning if no "(void)"?
> IIUC, I think we can remove this, right?

I did not meet any warning without the casting, but this is per Mike's 
comment[1] to make the code consistent with other functions casting to 
void type explicitly in hugetlb.c file.

[1] 
https://lore.kernel.org/all/495c4ebe-a5b4-afb6-4cb0-956c1b18d0cc@oracle.com/
