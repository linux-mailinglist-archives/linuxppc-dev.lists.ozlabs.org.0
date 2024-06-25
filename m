Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD54916AE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 16:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7njF52nxz3fsL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 00:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7nhr32dtz3flk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 00:46:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD45339;
	Tue, 25 Jun 2024 07:46:24 -0700 (PDT)
Received: from [10.1.39.170] (XHFQ2J9959.cambridge.arm.com [10.1.39.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF0363F73B;
	Tue, 25 Jun 2024 07:45:55 -0700 (PDT)
Message-ID: <de83daf9-e899-4415-bf85-5e7d69f9693e@arm.com>
Date: Tue, 25 Jun 2024 15:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/18] arm64/mm: Automatically fold contpte mappings
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>
References: <20240215103205.2607016-19-ryan.roberts@arm.com>
 <1285eb59-fcc3-4db8-9dd9-e7c4d82b1be0@huawei.com>
 <8d57ed0d-fdd0-4fc6-b9f1-a6ac11ce93ce@arm.com>
 <018b5e83-789e-480f-82c8-a64515cdd14a@huawei.com>
 <b75aa60d-e058-4b5c-877a-9c0cd295e96f@linux.alibaba.com>
 <b6b485ee-7af0-42b8-b0ca-5a75f76a69e2@arm.com>
 <43a5986a-52ea-4090-9333-90af137a4735@linux.alibaba.com>
 <306874fe-9bc1-4dec-a856-0125e4541971@arm.com>
 <ZnrAzjm5Fqg0d1CL@casper.infradead.org>
 <dbeb71ca-8aba-4aed-9123-c4d07c3da004@arm.com>
 <ZnrO4clYoEH_67Ur@casper.infradead.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZnrO4clYoEH_67Ur@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, "Yin, Fengwei" <fengwei.yin@intel.com>, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/06/2024 15:06, Matthew Wilcox wrote:
> On Tue, Jun 25, 2024 at 02:41:18PM +0100, Ryan Roberts wrote:
>> On 25/06/2024 14:06, Matthew Wilcox wrote:
>>> On Tue, Jun 25, 2024 at 01:41:02PM +0100, Ryan Roberts wrote:
>>>> On 25/06/2024 13:37, Baolin Wang wrote:
>>>>
>>>> [...]
>>>>
>>>>>>> For other filesystems, like ext4, I did not found the logic to determin what
>>>>>>> size of folio to allocate in writable mmap() path
>>>>>>
>>>>>> Yes I'd be keen to understand this to. When I was doing contpte, page cache
>>>>>> would only allocate large folios for readahead. So that's why I wouldn't have
>>>>>
>>>>> You mean non-large folios, right?
>>>>
>>>> No I mean that at the time I wrote contpte, the policy was to allocate an
>>>> order-0 folio for any writes that missed in the page cache, and allocate large
>>>> folios only when doing readahead from storage into page cache. The test that is
>>>> regressing is doing writes.
>>>
>>> mmap() faults also use readahead.
>>>
>>> filemap_fault():
>>>
>>>         folio = filemap_get_folio(mapping, index);
>>>         if (likely(!IS_ERR(folio))) {
>>>                 if (!(vmf->flags & FAULT_FLAG_TRIED))
>>>                         fpin = do_async_mmap_readahead(vmf, folio);
>>> which does:
>>>         if (folio_test_readahead(folio)) {
>>>                 fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>>>                 page_cache_async_ra(&ractl, folio, ra->ra_pages);
>>>
>>> which has been there in one form or another since 2007 (3ea89ee86a82).
>>
>> OK sounds like I'm probably misremembering something I read on LWN... You're
>> saying that its been the case for a while that if we take a write fault for a
>> portion of a file, then we will still end up taking the readahead path and
>> allocating a large folio (filesystem permitting)? Does that apply in the case
>> where the file has never been touched but only ftruncate'd, as is happening in
>> this test? There is obviously no need for IO in that case, but have we always
>> taken a path where a large folio may be allocated for it? I thought that bit was
>> newer for some reason.
> 
> The pagecache doesn't know whether the file contains data or holes.
> It allocates folios and then invites the filesystem to fill them; the
> filesystem checks its data structures and then either issues reads if
> there's data on media or calls memset if the records indicate there's
> a hole.
> 
> Whether it chooses to allocate large folios or not is going to depend
> on the access pattern; a sequential write pattern will use large folios
> and a random write pattern won't.
> 
> Now, I've oversimplified things a bit by talking about filemap_fault.
> Before we call filemap_fault, we call filemap_map_pages() which looks
> for any suitable folios in the page cache between start and end, and
> maps those.

OK that all makes sense, thanks. I guess it just means I don't have an excuse
for the perf regression. :)


