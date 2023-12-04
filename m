Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B3780314F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 12:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkLc06CJbz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 22:12:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkLbT3SlRz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 22:12:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F63E152B;
	Mon,  4 Dec 2023 03:12:17 -0800 (PST)
Received: from [10.57.73.130] (unknown [10.57.73.130])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CCCE3F6C4;
	Mon,  4 Dec 2023 03:11:27 -0800 (PST)
Message-ID: <01aad92f-b1e0-4f31-b905-8b1c2012ebab@arm.com>
Date: Mon, 4 Dec 2023 11:11:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Peter Xu <peterx@redhat.com>
References: <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org> <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org> <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n> <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
 <ZV-sJsdFfXiCkylv@x1n> <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
 <ZWDKV0XNjplc_vUP@x1n> <ZWj_EgljG3NwS5r1@x1n>
 <283da12c-14f1-4255-b3c4-ab933f3373c4@csgroup.eu>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <283da12c-14f1-4255-b3c4-ab933f3373c4@csgroup.eu>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/12/2023 13:33, Christophe Leroy wrote:
> 
> 
> Le 30/11/2023 à 22:30, Peter Xu a écrit :
>> On Fri, Nov 24, 2023 at 11:07:51AM -0500, Peter Xu wrote:
>>> On Fri, Nov 24, 2023 at 09:06:01AM +0000, Ryan Roberts wrote:
>>>> I don't have any micro-benchmarks for GUP though, if that's your question. Is
>>>> there an easy-to-use test I can run to get some numbers? I'd be happy to try it out.
>>>
>>> Thanks Ryan.  Then nothing is needed to be tested if gup is not yet touched
>>> from your side, afaict.  I'll see whether I can provide some rough numbers
>>> instead in the next post (I'll probably only be able to test it in a VM,
>>> though, but hopefully that should still reflect mostly the truth).
>>
>> An update: I finished a round of 64K cont_pte test, in the slow gup micro
>> benchmark I see ~15% perf degrade with this patchset applied on a VM on top
>> of Apple M1.
>>
>> Frankly that's even less than I expected, considering not only how slow gup
>> THP used to be, but also on the fact that that's a tight loop over slow
>> gup, which in normal cases shouldn't happen: "present" ptes normally goes
>> to fast-gup, while !present goes into a fault following it.  I assume
>> that's why nobody cared slow gup for THP before.  I think adding cont_pte
>> support shouldn't be very hard, but that will include making cont_pte idea
>> global just for arm64 and riscv Svnapot.
> 
> Is there any documentation on what cont_pte is ? I have always wondered 
> if it could also fit powerpc 8xx need ?

pte_cont() (and pte_mkcont() and pte_mknoncont()) test and manipulte the
"contiguous bit" in the arm64 PTE entries. Those helpers are arm64-specific
(AFAIK). The contiguous bit is a hint to the HW to tell it that a block of PTEs
are mapping a physically contiguous and naturally aligned piece of memory. The
HW can use this to coalesce entries in the TLB. When using 4K base pages, the
contpte size is 64K (16 PTEs). For 16K base pages, its 2M (128 PTEs) and for 64K
base pages, its 2M (32 PTEs).

> 
> On powerpc, for 16k pages, we have to define 4 consecutive PTEs. All 4 
> PTE are flagged with the SPS bit telling it's a 16k pages, but for TLB 
> misses the HW needs one entrie for each 4k fragment.

From that description, it sounds like the SPS bit might be similar to arm64
contiguous bit? Although sounds like you are currently using it in a slightly
different way - telling kernel that the base page is 16K but mapping each 16K
page with 4x 4K entries (plus the SPS bit set)?

> 
> There is also a similar approach for 512k pages, we have 128 contiguous 
> identical PTEs for them.
> 
> And whatever PAGE_SIZE is (either 4k or 16k), the HW needs one 'unsigned 
> long' pte for each 4k fragment. So at the time being when we define 
> PAGE_SIZE as 16k, we need a special pte_t which is a table of 4x 
> unsigned long.
> 
> Wondering if the cont_pte concept is similar and whether it could help.

To be honest, while I understand pte_cont() and friends, I don't understand
their relevance (or at least potential future relevance) to GUP?

> 
> Thanks
> Christophe

