Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E066D91665E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 13:41:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7jbH3yVKz3dJn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 21:41:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7jZr5C8bz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 21:41:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FB97339;
	Tue, 25 Jun 2024 04:40:54 -0700 (PDT)
Received: from [10.1.39.170] (XHFQ2J9959.cambridge.arm.com [10.1.39.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB9883F73B;
	Tue, 25 Jun 2024 04:40:25 -0700 (PDT)
Message-ID: <b6b485ee-7af0-42b8-b0ca-5a75f76a69e2@arm.com>
Date: Tue, 25 Jun 2024 12:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/18] arm64/mm: Automatically fold contpte mappings
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <b75aa60d-e058-4b5c-877a-9c0cd295e96f@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
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

On 25/06/2024 08:23, Baolin Wang wrote:
> 
> 
> On 2024/6/25 11:16, Kefeng Wang wrote:
>>
>>
>> On 2024/6/24 23:56, Ryan Roberts wrote:
>>> + Baolin Wang and Yin Fengwei, who maybe able to help with this.
>>>
>>>
>>> Hi Kefeng,
>>>
>>> Thanks for the report!
>>>
>>>
>>> On 24/06/2024 15:30, Kefeng Wang wrote:
>>>> Hi Ryan,
>>>>
>>>> A big regression on page-fault3("Separate file shared mapping page
>>>> fault") testcase from will-it-scale on arm64, no issue on x86,
>>>>
>>>> ./page_fault3_processes -t 128 -s 5
>>>
>>> I see that this program is mkstmp'ing a file at "/tmp/willitscale.XXXXXX". Based
>>> on your description, I'm inferring that /tmp is backed by ext4 with your large
>>> folio patches enabled?
>>
>> Yes, mount /tmp by ext4, sorry to forget to mention that.
>>
>>>
>>>>
>>>> 1) large folio disabled on ext4:
>>>>     92378735
>>>> 2) large folio  enabled on ext4 +  CONTPTE enabled
>>>>     16164943
>>>> 3) large folio  enabled on ext4 +  CONTPTE disabled
>>>>     80364074
>>>> 4) large folio  enabled on ext4 +  CONTPTE enabled + large folio mapping
>>>> enabled
>>>> in finish_fault()[2]
>>>>     299656874
>>>>
>>>> We found *contpte_convert* consume lots of CPU(76%) in case 2),
>>>
>>> contpte_convert() is expensive and to be avoided; In this case I expect it is
>>> repainting the PTEs with the PTE_CONT bit added in, and to do that it needs to
>>> invalidate the tlb for the virtual range. The code is there to mop up user space
>>> patterns where each page in a range is temporarily made RO, then later changed
>>> back. In this case, we want to re-fold the contpte range once all pages have
>>> been serviced in RO mode.
>>>
>>> Of course this path is only intended as a fallback, and the more optimium
>>> approach is to set_ptes() the whole folio in one go where possible - kind of
>>> what you are doing below.
>>>
>>>> and disappeared
>>>> by following change[2], it is easy to understood the different between case 2)
>>>> and case 4) since case 2) always map one page
>>>> size, but always try to fold contpte mappings, which spend a lot of
>>>> time. Case 4) is a workaround, any other better suggestion?
>>>
>>> See below.
>>>
>>>>
>>>> Thanks.
>>>>
>>>> [1] https://github.com/antonblanchard/will-it-scale
>>>> [2] enable large folio mapping in finish_fault()
>>>>
>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>> index 00728ea95583..5623a8ce3a1e 100644
>>>> --- a/mm/memory.c
>>>> +++ b/mm/memory.c
>>>> @@ -4880,7 +4880,7 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
>>>>           * approach also applies to non-anonymous-shmem faults to avoid
>>>>           * inflating the RSS of the process.
>>>>           */
>>>> -       if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma))) {
>>>> +       if (unlikely(userfaultfd_armed(vma))) {
>>>
>>> The change to make finish_fault() handle multiple pages in one go are new; added
>>> by Baolin Wang at [1]. That extra conditional that you have removed is there to
>>> prevent RSS reporting bloat. See discussion that starts at [2].
>>>
>>> Anyway, it was my vague understanding that the fault around mechanism
>>> (do_fault_around()) would ensure that (by default) 64K worth of pages get mapped
>>> together in a single set_ptes() call, via filemap_map_pages() ->
>>> filemap_map_folio_range(). Looking at the code, I guess fault around only
>>> applies to read faults. This test is doing a write fault.
>>>
>>> I guess we need to do a change a bit like what you have done, but also taking
>>> into account fault_around configuration?
> 
> For the writable mmap() of tmpfs, we will use mTHP interface to control the size
> of folio to allocate, as discussed in previous meeting [1], so I don't think
> fault_around configuration will be helpful for tmpfs.

Yes agreed. But we are talking about ext4 here.

> 
> For other filesystems, like ext4, I did not found the logic to determin what
> size of folio to allocate in writable mmap() path 

Yes I'd be keen to understand this to. When I was doing contpte, page cache
would only allocate large folios for readahead. So that's why I wouldn't have
seen this.

> (Kefeng, please correct me if
> I missed something). If there is a control like mTHP, we can rely on that
> instead of 'fault_around'?

Page cache doesn't currently expose any controls for folio allocation size.
Personally, I'd like to see some in future becaudse I suspect it will be
neccessary to limit physical fragmentation. But that is another conversation...

> 
> [1] https://lore.kernel.org/all/f1783ff0-65bd-4b2b-8952-52b6822a0835@redhat.com/
> 
>> Yes, the current changes is not enough, I hint some issue and still debugging,
>> so our direction is trying to map large folio for do_shared_fault(), right?

We just need to make sure that if finish_fault() has a (non-shmem) large folio,
it never maps more than fault_around_pages, and it does it in a way that is
naturally aligned in virtual space (like do_fault_around() does).
do_fault_around() actually tries to get other folios from the page cache to map.
We don't want to do that; we just want to make sure that we don't inflate a
process's RSS by mapping unbounded large folios.

Another (orthogonal, longer term) strategy would be to optimize
contpte_convert(). arm64 has a feature called "BBM level 2"; we could
potentially elide the TLBIs for systems that support this. But ultimately its
best to avoid the need for folding in the first place.

Thanks,
Ryan

> 
> I think this is the right direction to do. I add this '!vma_is_anon_shmem(vma)'
> conditon to gradually implement support for large folio mapping buidling,
> especially for writable mmap() support in tmpfs.
> 
>>> [1]
>>> https://lore.kernel.org/all/3a190892355989d42f59cf9f2f98b94694b0d24d.1718090413.git.baolin.wang@linux.alibaba.com/
>>> [2]
>>> https://lore.kernel.org/linux-mm/13939ade-a99a-4075-8a26-9be7576b7e03@arm.com/
>>>
>>>
>>>>                  nr_pages = 1;
>>>>          } else if (nr_pages > 1) {
>>>>                  pgoff_t idx = folio_page_idx(folio, page);
>>>>
>>>>
>>>> On 2024/2/15 18:32, Ryan Roberts wrote:
>>>>> There are situations where a change to a single PTE could cause the
>>>>> contpte block in which it resides to become foldable (i.e. could be
>>>>> repainted with the contiguous bit). Such situations arise, for example,
>>>>> when user space temporarily changes protections, via mprotect, for
>>>>> individual pages, such can be the case for certain garbage collectors.
>>>>>
>>>>> We would like to detect when such a PTE change occurs. However this can
>>>>> be expensive due to the amount of checking required. Therefore only
>>>>> perform the checks when an indiviual PTE is modified via mprotect
>>>>> (ptep_modify_prot_commit() -> set_pte_at() -> set_ptes(nr=1)) and only
>>>>> when we are setting the final PTE in a contpte-aligned block.
>>>>>
>>>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>>>> ---
>>>>>    arch/arm64/include/asm/pgtable.h | 26 +++++++++++++
>>>>>    arch/arm64/mm/contpte.c          | 64 ++++++++++++++++++++++++++++++++
>>>>>    2 files changed, 90 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/include/asm/pgtable.h
>>>>> b/arch/arm64/include/asm/pgtable.h
>>>>> index 8310875133ff..401087e8a43d 100644
>>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>>> @@ -1185,6 +1185,8 @@ extern void ptep_modify_prot_commit(struct
>>>>> vm_area_struct *vma,
>>>>>     * where it is possible and makes sense to do so. The PTE_CONT bit is
>>>>> considered
>>>>>     * a private implementation detail of the public ptep API (see below).
>>>>>     */
>>>>> +extern void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
>>>>> +                pte_t *ptep, pte_t pte);
>>>>>    extern void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>>>>                    pte_t *ptep, pte_t pte);
>>>>>    extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
>>>>> @@ -1206,6 +1208,29 @@ extern int contpte_ptep_set_access_flags(struct
>>>>> vm_area_struct *vma,
>>>>>                    unsigned long addr, pte_t *ptep,
>>>>>                    pte_t entry, int dirty);
>>>>>    +static __always_inline void contpte_try_fold(struct mm_struct *mm,
>>>>> +                unsigned long addr, pte_t *ptep, pte_t pte)
>>>>> +{
>>>>> +    /*
>>>>> +     * Only bother trying if both the virtual and physical addresses are
>>>>> +     * aligned and correspond to the last entry in a contig range. The core
>>>>> +     * code mostly modifies ranges from low to high, so this is the likely
>>>>> +     * the last modification in the contig range, so a good time to fold.
>>>>> +     * We can't fold special mappings, because there is no associated folio.
>>>>> +     */
>>>>> +
>>>>> +    const unsigned long contmask = CONT_PTES - 1;
>>>>> +    bool valign = ((addr >> PAGE_SHIFT) & contmask) == contmask;
>>>>> +
>>>>> +    if (unlikely(valign)) {
>>>>> +        bool palign = (pte_pfn(pte) & contmask) == contmask;
>>>>> +
>>>>> +        if (unlikely(palign &&
>>>>> +            pte_valid(pte) && !pte_cont(pte) && !pte_special(pte)))
>>>>> +            __contpte_try_fold(mm, addr, ptep, pte);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    static __always_inline void contpte_try_unfold(struct mm_struct *mm,
>>>>>                    unsigned long addr, pte_t *ptep, pte_t pte)
>>>>>    {
>>>>> @@ -1286,6 +1311,7 @@ static __always_inline void set_ptes(struct mm_struct
>>>>> *mm, unsigned long addr,
>>>>>        if (likely(nr == 1)) {
>>>>>            contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>>>>>            __set_ptes(mm, addr, ptep, pte, 1);
>>>>> +        contpte_try_fold(mm, addr, ptep, pte);
>>>>>        } else {
>>>>>            contpte_set_ptes(mm, addr, ptep, pte, nr);
>>>>>        }
>>>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>>>> index 50e0173dc5ee..16788f07716d 100644
>>>>> --- a/arch/arm64/mm/contpte.c
>>>>> +++ b/arch/arm64/mm/contpte.c
>>>>> @@ -73,6 +73,70 @@ static void contpte_convert(struct mm_struct *mm, unsigned
>>>>> long addr,
>>>>>        __set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
>>>>>    }
>>>>>    +void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
>>>>> +            pte_t *ptep, pte_t pte)
>>>>> +{
>>>>> +    /*
>>>>> +     * We have already checked that the virtual and pysical addresses are
>>>>> +     * correctly aligned for a contpte mapping in contpte_try_fold() so the
>>>>> +     * remaining checks are to ensure that the contpte range is fully
>>>>> +     * covered by a single folio, and ensure that all the ptes are valid
>>>>> +     * with contiguous PFNs and matching prots. We ignore the state of the
>>>>> +     * access and dirty bits for the purpose of deciding if its a contiguous
>>>>> +     * range; the folding process will generate a single contpte entry which
>>>>> +     * has a single access and dirty bit. Those 2 bits are the logical OR of
>>>>> +     * their respective bits in the constituent pte entries. In order to
>>>>> +     * ensure the contpte range is covered by a single folio, we must
>>>>> +     * recover the folio from the pfn, but special mappings don't have a
>>>>> +     * folio backing them. Fortunately contpte_try_fold() already checked
>>>>> +     * that the pte is not special - we never try to fold special mappings.
>>>>> +     * Note we can't use vm_normal_page() for this since we don't have the
>>>>> +     * vma.
>>>>> +     */
>>>>> +
>>>>> +    unsigned long folio_start, folio_end;
>>>>> +    unsigned long cont_start, cont_end;
>>>>> +    pte_t expected_pte, subpte;
>>>>> +    struct folio *folio;
>>>>> +    struct page *page;
>>>>> +    unsigned long pfn;
>>>>> +    pte_t *orig_ptep;
>>>>> +    pgprot_t prot;
>>>>> +
>>>>> +    int i;
>>>>> +
>>>>> +    if (!mm_is_user(mm))
>>>>> +        return;
>>>>> +
>>>>> +    page = pte_page(pte);
>>>>> +    folio = page_folio(page);
>>>>> +    folio_start = addr - (page - &folio->page) * PAGE_SIZE;
>>>>> +    folio_end = folio_start + folio_nr_pages(folio) * PAGE_SIZE;
>>>>> +    cont_start = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>>>>> +    cont_end = cont_start + CONT_PTE_SIZE;
>>>>> +
>>>>> +    if (folio_start > cont_start || folio_end < cont_end)
>>>>> +        return;
>>>>> +
>>>>> +    pfn = ALIGN_DOWN(pte_pfn(pte), CONT_PTES);
>>>>> +    prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
>>>>> +    expected_pte = pfn_pte(pfn, prot);
>>>>> +    orig_ptep = ptep;
>>>>> +    ptep = contpte_align_down(ptep);
>>>>> +
>>>>> +    for (i = 0; i < CONT_PTES; i++) {
>>>>> +        subpte = pte_mkold(pte_mkclean(__ptep_get(ptep)));
>>>>> +        if (!pte_same(subpte, expected_pte))
>>>>> +            return;
>>>>> +        expected_pte = pte_advance_pfn(expected_pte, 1);
>>>>> +        ptep++;
>>>>> +    }
>>>>> +
>>>>> +    pte = pte_mkcont(pte);
>>>>> +    contpte_convert(mm, addr, orig_ptep, pte);
>>>>> +}
>>>>> +EXPORT_SYMBOL(__contpte_try_fold);
>>>>> +
>>>>>    void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>>>>                pte_t *ptep, pte_t pte)
>>>>>    {
>>>
>>>

