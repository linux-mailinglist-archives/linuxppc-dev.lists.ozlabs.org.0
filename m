Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475C916812
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 14:38:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=VFfc4wLG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7ks05mtVz3fnQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 22:38:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=VFfc4wLG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=baolin.wang@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7krH66Mvz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 22:37:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1719319065; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bJn97TumoRX3Pu50ftatVSkCYSiOnpy7WcOfg1YpSwM=;
	b=VFfc4wLG3kOEfUqwPEv0TfW5Z/rjL1HUuogtqIbRFTkinTFvg0chaER0SSws3Fb4D8zuNaNkt+mFt/OEUf9ZM/PWk0EFRXDp2R0u/99Rzu3liFaCfVQYfvXLTIcnifiDhx8uw9ta6cFD6DoPAsy/8nH4LD/fJ0cgNc3eGj0rTX0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0W9Fpw2x_1719319059;
Received: from 30.97.56.75(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W9Fpw2x_1719319059)
          by smtp.aliyun-inc.com;
          Tue, 25 Jun 2024 20:37:40 +0800
Message-ID: <43a5986a-52ea-4090-9333-90af137a4735@linux.alibaba.com>
Date: Tue, 25 Jun 2024 20:37:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/18] arm64/mm: Automatically fold contpte mappings
To: Ryan Roberts <ryan.roberts@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, Barry Song <21cnbao@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Yang Shi <shy828301@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Yin, Fengwei" <fengwei.yin@intel.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-19-ryan.roberts@arm.com>
 <1285eb59-fcc3-4db8-9dd9-e7c4d82b1be0@huawei.com>
 <8d57ed0d-fdd0-4fc6-b9f1-a6ac11ce93ce@arm.com>
 <018b5e83-789e-480f-82c8-a64515cdd14a@huawei.com>
 <b75aa60d-e058-4b5c-877a-9c0cd295e96f@linux.alibaba.com>
 <b6b485ee-7af0-42b8-b0ca-5a75f76a69e2@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <b6b485ee-7af0-42b8-b0ca-5a75f76a69e2@arm.com>
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
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2024/6/25 19:40, Ryan Roberts wrote:
> On 25/06/2024 08:23, Baolin Wang wrote:
>>
>>
>> On 2024/6/25 11:16, Kefeng Wang wrote:
>>>
>>>
>>> On 2024/6/24 23:56, Ryan Roberts wrote:
>>>> + Baolin Wang and Yin Fengwei, who maybe able to help with this.
>>>>
>>>>
>>>> Hi Kefeng,
>>>>
>>>> Thanks for the report!
>>>>
>>>>
>>>> On 24/06/2024 15:30, Kefeng Wang wrote:
>>>>> Hi Ryan,
>>>>>
>>>>> A big regression on page-fault3("Separate file shared mapping page
>>>>> fault") testcase from will-it-scale on arm64, no issue on x86,
>>>>>
>>>>> ./page_fault3_processes -t 128 -s 5
>>>>
>>>> I see that this program is mkstmp'ing a file at "/tmp/willitscale.XXXXXX". Based
>>>> on your description, I'm inferring that /tmp is backed by ext4 with your large
>>>> folio patches enabled?
>>>
>>> Yes, mount /tmp by ext4, sorry to forget to mention that.
>>>
>>>>
>>>>>
>>>>> 1) large folio disabled on ext4:
>>>>>      92378735
>>>>> 2) large folio  enabled on ext4 +  CONTPTE enabled
>>>>>      16164943
>>>>> 3) large folio  enabled on ext4 +  CONTPTE disabled
>>>>>      80364074
>>>>> 4) large folio  enabled on ext4 +  CONTPTE enabled + large folio mapping
>>>>> enabled
>>>>> in finish_fault()[2]
>>>>>      299656874
>>>>>
>>>>> We found *contpte_convert* consume lots of CPU(76%) in case 2),
>>>>
>>>> contpte_convert() is expensive and to be avoided; In this case I expect it is
>>>> repainting the PTEs with the PTE_CONT bit added in, and to do that it needs to
>>>> invalidate the tlb for the virtual range. The code is there to mop up user space
>>>> patterns where each page in a range is temporarily made RO, then later changed
>>>> back. In this case, we want to re-fold the contpte range once all pages have
>>>> been serviced in RO mode.
>>>>
>>>> Of course this path is only intended as a fallback, and the more optimium
>>>> approach is to set_ptes() the whole folio in one go where possible - kind of
>>>> what you are doing below.
>>>>
>>>>> and disappeared
>>>>> by following change[2], it is easy to understood the different between case 2)
>>>>> and case 4) since case 2) always map one page
>>>>> size, but always try to fold contpte mappings, which spend a lot of
>>>>> time. Case 4) is a workaround, any other better suggestion?
>>>>
>>>> See below.
>>>>
>>>>>
>>>>> Thanks.
>>>>>
>>>>> [1] https://github.com/antonblanchard/will-it-scale
>>>>> [2] enable large folio mapping in finish_fault()
>>>>>
>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>> index 00728ea95583..5623a8ce3a1e 100644
>>>>> --- a/mm/memory.c
>>>>> +++ b/mm/memory.c
>>>>> @@ -4880,7 +4880,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>>>>>            * approach also applies to non-anonymous-shmem faults to avoid
>>>>>            * inflating the RSS of the process.
>>>>>            */
>>>>> -       if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma))) {
>>>>> +       if (unlikely(userfaultfd_armed(vma))) {
>>>>
>>>> The change to make finish_fault() handle multiple pages in one go are new; added
>>>> by Baolin Wang at [1]. That extra conditional that you have removed is there to
>>>> prevent RSS reporting bloat. See discussion that starts at [2].
>>>>
>>>> Anyway, it was my vague understanding that the fault around mechanism
>>>> (do_fault_around()) would ensure that (by default) 64K worth of pages get mapped
>>>> together in a single set_ptes() call, via filemap_map_pages() ->
>>>> filemap_map_folio_range(). Looking at the code, I guess fault around only
>>>> applies to read faults. This test is doing a write fault.
>>>>
>>>> I guess we need to do a change a bit like what you have done, but also taking
>>>> into account fault_around configuration?
>>
>> For the writable mmap() of tmpfs, we will use mTHP interface to control the size
>> of folio to allocate, as discussed in previous meeting [1], so I don't think
>> fault_around configuration will be helpful for tmpfs.
> 
> Yes agreed. But we are talking about ext4 here.
> 
>>
>> For other filesystems, like ext4, I did not found the logic to determin what
>> size of folio to allocate in writable mmap() path
> 
> Yes I'd be keen to understand this to. When I was doing contpte, page cache
> would only allocate large folios for readahead. So that's why I wouldn't have

You mean non-large folios, right?

> seen this.
> 
>> (Kefeng, please correct me if
>> I missed something). If there is a control like mTHP, we can rely on that
>> instead of 'fault_around'?
> 
> Page cache doesn't currently expose any controls for folio allocation size.
> Personally, I'd like to see some in future becaudse I suspect it will be
> neccessary to limit physical fragmentation. But that is another conversation...

Yes, agree. If writable mmap() path wants to allocate large folios, we 
should rely on some controls or hints (maybe mTHP?).

>> [1] https://lore.kernel.org/all/f1783ff0-65bd-4b2b-8952-52b6822a0835@redhat.com/
>>
>>> Yes, the current changes is not enough, I hint some issue and still debugging,
>>> so our direction is trying to map large folio for do_shared_fault(), right?
> 
> We just need to make sure that if finish_fault() has a (non-shmem) large folio,
> it never maps more than fault_around_pages, and it does it in a way that is
> naturally aligned in virtual space (like do_fault_around() does).
> do_fault_around() actually tries to get other folios from the page cache to map.
> We don't want to do that; we just want to make sure that we don't inflate a
> process's RSS by mapping unbounded large folios.
> 
> Another (orthogonal, longer term) strategy would be to optimize
> contpte_convert(). arm64 has a feature called "BBM level 2"; we could
> potentially elide the TLBIs for systems that support this. But ultimately its
> best to avoid the need for folding in the first place.
> 
> Thanks,
> Ryan
> 
>>
>> I think this is the right direction to do. I add this '!vma_is_anon_shmem(vma)'
>> conditon to gradually implement support for large folio mapping buidling,
>> especially for writable mmap() support in tmpfs.
>>

[snip]
