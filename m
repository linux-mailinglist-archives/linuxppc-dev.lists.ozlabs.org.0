Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E67AAAE0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:55:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QyJ6PgR9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPhJ2nNjz3dlt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 17:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QyJ6PgR9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsPgQ2ycWz3cbS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 17:54:40 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a707bc2397so235795b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 00:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695369277; x=1695974077; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mChtpslVRDtABUDMXlRNyI2zcTWp8b7v1J11sWjz5UU=;
        b=QyJ6PgR9Ve42nKDErPgqhlxOW/bmSHQ4o3A9i85xVCZze8/Loe185etxQ+AXglSBCo
         Bk7OZyEvazfUZU4GRIf0g1Ju2qiWRHSEZ7MiUTrsj396keyTE89lBGvIfWhQjaTSYexS
         1kR9OqxYfu5qnoDMPzdW412np7irrt5l1AV7E+WpyZFBNmw9Ac/aGpAphSeEnhbvB5aF
         uknyIYzIOWxG/89tQ4ssG2wZ8CGWmaZ5OTWrTKkToDaK38HA7Yk8PIbI0wSxCB2hD6rA
         7L9jLwvRhllVUgw9qpHuKgju3MjQhQFyK3X85yvqrsEuV8SFFQ50rWZpRuEvNs24VgMy
         B/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695369277; x=1695974077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mChtpslVRDtABUDMXlRNyI2zcTWp8b7v1J11sWjz5UU=;
        b=FPA8+VvIdJ9atLGCUUpl64aDzU++dOehHrABPs0QVGd4+5Pihl8OMELUz0PJR+u4rj
         qX7+zK/r0Lmm6c+E3yp/FXfmK0vKwF8H0v631/Kb2dsZmL6RPTWkosr7nxseSoQ7SjQU
         y+BebZciM/yy0fULvWg45JyMEy2LV8jxrwLTdiiKPSvdJLnCYdqyvFSFNc9zeZOMgdV2
         vky2KroMgjmbHjPeqa84lJI3eTHBMo17/SUDS0PtAte74Am69Rrt5hyxvj97qrrsne2c
         ObCdTlqIpgZgnGJEdjMo2Br+urxV+2VDZQQ5PpVjqdXzOR/SIjjCWXWNIK7tde6FVEgt
         uFJw==
X-Gm-Message-State: AOJu0Yw2F64fi1eM60rNlCfFdP2EIzS/qZxkugG5zyZZ8C1hnoO1fWBJ
	NuLxFv2XV7P1GgbtqNVMdga+9g==
X-Google-Smtp-Source: AGHT+IGqQ4SE81KpOPQycLdX+PpQiCkrykKUFjbltxRe8gku3+WZ7tAnJ+OrDpFpcSdrC4r4spkfyg==
X-Received: by 2002:a05:6358:ee94:b0:143:688f:dc03 with SMTP id il20-20020a056358ee9400b00143688fdc03mr8397488rwb.2.1695369277251;
        Fri, 22 Sep 2023 00:54:37 -0700 (PDT)
Received: from [10.84.155.178] ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y19-20020aa78053000000b0066684d8115bsm2666191pfm.178.2023.09.22.00.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:54:36 -0700 (PDT)
Message-ID: <6db7e7e0-4db6-f742-436b-1f4d8ae4e490@bytedance.com>
Date: Fri, 22 Sep 2023 15:54:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v1 8/8] arm64: hugetlb: Fix set_huge_pte_at() to work with
 all swap entries
Content-Language: en-US
To: Ryan Roberts <ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-9-ryan.roberts@arm.com>
 <217bb956-b9f6-1057-914b-436d4c775a8b@bytedance.com>
 <3358e732-8df9-4408-8249-384b102f5d75@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <3358e732-8df9-4408-8249-384b102f5d75@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel
 .org, stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ryan,

On 2023/9/22 15:40, Ryan Roberts wrote:
> On 22/09/2023 03:54, Qi Zheng wrote:
>> Hi Ryan,
>>
>> On 2023/9/22 00:20, Ryan Roberts wrote:
>>> When called with a swap entry that does not embed a PFN (e.g.
>>> PTE_MARKER_POISONED or PTE_MARKER_UFFD_WP), the previous implementation
>>> of set_huge_pte_at() would either cause a BUG() to fire (if
>>> CONFIG_DEBUG_VM is enabled) or cause a dereference of an invalid address
>>> and subsequent panic.
>>>
>>> arm64's huge pte implementation supports multiple huge page sizes, some
>>> of which are implemented in the page table with contiguous mappings. So
>>> set_huge_pte_at() needs to work out how big the logical pte is, so that
>>> it can also work out how many physical ptes (or pmds) need to be
>>> written. It does this by grabbing the folio out of the pte and querying
>>> its size.
>>>
>>> However, there are cases when the pte being set is actually a swap
>>> entry. But this also used to work fine, because for huge ptes, we only
>>> ever saw migration entries and hwpoison entries. And both of these types
>>> of swap entries have a PFN embedded, so the code would grab that and
>>> everything still worked out.
>>>
>>> But over time, more calls to set_huge_pte_at() have been added that set
>>> swap entry types that do not embed a PFN. And this causes the code to go
>>> bang. The triggering case is for the uffd poison test, commit
>>> 99aa77215ad0 ("selftests/mm: add uffd unit test for UFFDIO_POISON"),
>>> which sets a PTE_MARKER_POISONED swap entry. But review shows there are
>>> other places too (PTE_MARKER_UFFD_WP).
>>>
>>> So the root cause is due to commit 18f3962953e4 ("mm: hugetlb: kill
>>> set_huge_swap_pte_at()"), which aimed to simplify the interface to the
>>> core code by removing set_huge_swap_pte_at() (which took a page size
>>> parameter) and replacing it with calls to set_huge_swap_pte_at() where
>>> the size was inferred from the folio, as descibed above. While that
>>> commit didn't break anything at the time,
>>
>> If it didn't break anything at that time, then shouldn't the Fixes tag
>> be added to this commit?
>>
>>> it did break the interface
>>> because it couldn't handle swap entries without PFNs. And since then new
>>> callers have come along which rely on this working.
>>
>> So the Fixes tag should be added only to the commit that introduces the
>> first new callers?
> 
> Well I guess it's a matter of point of view; My view is that 18f3962953e4 is the
> buggy change because it broke the interface to not be able to handle swap
> entries which do not contain PFNs. The fact that there were no callers that used
> the interface in this way at the time of the commit is irrelevant in my view.

I understand your point of view.

But IIUC, the Fixes tag is used to indicate the version that needs to
backport, but the version where the commit 18f3962953e4 is located
does not need to backport this bugfix patch.

> But I already added 2 fixes tags; one for the buggy commit, and the other for
> the commit containing the new user of the interface.

I think 2 fixes tags will cause inconvenience to the maintainers.

Thanks,
Qi

> 
>>
>> Other than that, LGTM.
> 
> Thanks!
> 
>>
>> Thanks,
>> Qi
>>
>>>
>>> Now that we have modified the set_huge_pte_at() interface to pass the
>>> vma, we can extract the huge page size from it and fix this issue.
>>>
>>> I'm tagging the commit that added the uffd poison feature, since that is
>>> what exposed the problem, as well as the original change that broke the
>>> interface. Hopefully this is valuable for people doing bisect.
>>>
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> Fixes: 18f3962953e4 ("mm: hugetlb: kill set_huge_swap_pte_at()")
>>> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
>>> ---
>>>    arch/arm64/mm/hugetlbpage.c | 17 +++--------------
>>>    1 file changed, 3 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>>> index 844832511c1e..a08601a14689 100644
>>> --- a/arch/arm64/mm/hugetlbpage.c
>>> +++ b/arch/arm64/mm/hugetlbpage.c
>>> @@ -241,13 +241,6 @@ static void clear_flush(struct mm_struct *mm,
>>>        flush_tlb_range(&vma, saddr, addr);
>>>    }
>>>    -static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t entry)
>>> -{
>>> -    VM_BUG_ON(!is_migration_entry(entry) && !is_hwpoison_entry(entry));
>>> -
>>> -    return page_folio(pfn_to_page(swp_offset_pfn(entry)));
>>> -}
>>> -
>>>    void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
>>>                    pte_t *ptep, pte_t pte)
>>>    {
>>> @@ -258,13 +251,10 @@ void set_huge_pte_at(struct vm_area_struct *vma,
>>> unsigned long addr,
>>>        unsigned long pfn, dpfn;
>>>        pgprot_t hugeprot;
>>>    -    if (!pte_present(pte)) {
>>> -        struct folio *folio;
>>> -
>>> -        folio = hugetlb_swap_entry_to_folio(pte_to_swp_entry(pte));
>>> -        ncontig = num_contig_ptes(folio_size(folio), &pgsize);
>>> +    ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>>>    -        for (i = 0; i < ncontig; i++, ptep++)
>>> +    if (!pte_present(pte)) {
>>> +        for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
>>>                set_pte_at(mm, addr, ptep, pte);
>>>            return;
>>>        }
>>> @@ -274,7 +264,6 @@ void set_huge_pte_at(struct vm_area_struct *vma, unsigned
>>> long addr,
>>>            return;
>>>        }
>>>    -    ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>>>        pfn = pte_pfn(pte);
>>>        dpfn = pgsize >> PAGE_SHIFT;
>>>        hugeprot = pte_pgprot(pte);
> 
