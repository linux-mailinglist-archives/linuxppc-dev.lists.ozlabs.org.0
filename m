Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6624E520AC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 03:35:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky0wh2qWRz3cJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 11:35:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky0wG6RxNz2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 11:35:09 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=30; SR=0;
 TI=SMTPD_---0VCo8IMN_1652146499; 
Received: from 30.15.214.13(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCo8IMN_1652146499) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 10 May 2022 09:35:01 +0800
Message-ID: <3c29b307-5af5-41f0-f97c-c9929f616f53@linux.alibaba.com>
Date: Tue, 10 May 2022 09:35:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] mm: change huge_ptep_clear_flush() to return the
 original pte
To: Mike Kravetz <mike.kravetz@oracle.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Muchun Song <songmuchun@bytedance.com>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
 <Ynek+b3k6PVN3x7J@FVFYT0MHHV2J.usts.net>
 <bf627d1a-42f8-77f3-6ac2-67edde2feb8a@linux.alibaba.com>
 <d5055b48-d722-e03d-fc32-16fd76e3fa22@csgroup.eu>
 <a6cc9765-1d8c-b725-978f-53f226d2fbb9@linux.alibaba.com>
 <de7ca6bf-6a82-acba-df63-ee78eee6ee2c@oracle.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <de7ca6bf-6a82-acba-df63-ee78eee6ee2c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "dalias@libc.org" <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "deller@gmx.de" <deller@gmx.de>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/10/2022 4:02 AM, Mike Kravetz wrote:
> On 5/9/22 01:46, Baolin Wang wrote:
>>
>>
>> On 5/9/2022 1:46 PM, Christophe Leroy wrote:
>>>
>>>
>>> Le 08/05/2022 à 15:09, Baolin Wang a écrit :
>>>>
>>>>
>>>> On 5/8/2022 7:09 PM, Muchun Song wrote:
>>>>> On Sun, May 08, 2022 at 05:36:39PM +0800, Baolin Wang wrote:
>>>>>> It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
>>>>>> table when unmapping or migrating a hugetlb page, and will change
>>>>>> to use huge_ptep_clear_flush() instead in the following patches.
>>>>>>
>>>>>> So this is a preparation patch, which changes the
>>>>>> huge_ptep_clear_flush()
>>>>>> to return the original pte to help to nuke a hugetlb page table.
>>>>>>
>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
>>>>>
>>>>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>>>>
>>>> Thanks for reviewing.
>>>>
>>>>>
>>>>> But one nit below:
>>>>>
>>>>> [...]
>>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>>> index 8605d7e..61a21af 100644
>>>>>> --- a/mm/hugetlb.c
>>>>>> +++ b/mm/hugetlb.c
>>>>>> @@ -5342,7 +5342,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct
>>>>>> *mm, struct vm_area_struct *vma,
>>>>>>             ClearHPageRestoreReserve(new_page);
>>>>>>             /* Break COW or unshare */
>>>>>> -        huge_ptep_clear_flush(vma, haddr, ptep);
>>>>>> +        (void)huge_ptep_clear_flush(vma, haddr, ptep);
>>>>>
>>>>> Why add a "(void)" here? Is there any warning if no "(void)"?
>>>>> IIUC, I think we can remove this, right?
>>>>
>>>> I did not meet any warning without the casting, but this is per Mike's
>>>> comment[1] to make the code consistent with other functions casting to
>>>> void type explicitly in hugetlb.c file.
>>>>
>>>> [1]
>>>> https://lore.kernel.org/all/495c4ebe-a5b4-afb6-4cb0-956c1b18d0cc@oracle.com/
>>>>
>>>
>>> As far as I understand, Mike said that you should be accompagnied with a
>>> big fat comment explaining why we ignore the returned value from
>>> huge_ptep_clear_flush(). >
>>> By the way huge_ptep_clear_flush() is not declared 'must_check' so this
>>> cast is just visual polution and should be removed.
>>>
>>> In the meantime the comment suggested by Mike should be added instead.
>> Sorry for my misunderstanding. I just follow the explicit void casting like other places in hugetlb.c file. And I am not sure if it is useful adding some comments like below, since we did not need the original pte value in the COW case mapping with a new page, and the code is more readable already I think.
>>
>> Mike, could you help to clarify what useful comments would you like? and remove the explicit void casting? Thanks.
>>
> 
> Sorry for the confusion.
> 
> In the original commit, it seemed odd to me that the signature of the
> function was changing and there was not an associated change to the only
> caller of the function.  I did suggest casting to void or adding a comment.
> As Christophe mentions, the cast to void is not necessary.  In addition,
> there really isn't a need for a comment as the calling code is not changed.

OK. Will drop the casting in next version.

> 
> The original version of the commit without either is actually preferable.
> The commit message does say this is a preparation patch and the return
> value will be used in later patches.

OK. Thanks Mike for making me clear. Also thanks to Muchun and Christophe.
