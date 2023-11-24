Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00C7F6F1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 10:07:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc8JR65CBz3vcn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 20:07:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc8HQ70ZKz3dW4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 20:06:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B74521063;
	Fri, 24 Nov 2023 01:06:52 -0800 (PST)
Received: from [10.57.71.2] (unknown [10.57.71.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64DC23F73F;
	Fri, 24 Nov 2023 01:06:03 -0800 (PST)
Message-ID: <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
Date: Fri, 24 Nov 2023 09:06:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Content-Language: en-GB
To: Peter Xu <peterx@redhat.com>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com> <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n> <ZV21GCbG48nTLDzn@infradead.org>
 <ZV90JcnQ1RGud/0R@casper.infradead.org> <ZV-KQ0e0y9BTsHGv@x1n>
 <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com> <ZV-sJsdFfXiCkylv@x1n>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZV-sJsdFfXiCkylv@x1n>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/11/2023 19:46, Peter Xu wrote:
> On Thu, Nov 23, 2023 at 07:11:19PM +0000, Ryan Roberts wrote:
>> Hi,
>>
>> I'm not sure I've 100% understood the crossover between this series and my work
>> to support arm64's contpte mappings generally for anonymous and file-backed memory.
> 
> No worry, there's no confliction.  If you worked on that it's only be
> something nice on top.  Also, I'm curious if you have performance numbers,

I have perf numbers for high level use cases (kernel compilation and Speedometer
Java Script benchmarks) at
https://lore.kernel.org/linux-arm-kernel/20230622144210.2623299-1-ryan.roberts@arm.com/

I don't have any micro-benchmarks for GUP though, if that's your question. Is
there an easy-to-use test I can run to get some numbers? I'd be happy to try it out.

> because I'm going to do some test for hugetlb cont_ptes (which is only the
> current plan), and if you got those it'll be a great baseline for me,
> because it should be similar in you case even though the goal is slightly
> different.
> 
>>
>> My approach is to transparently use contpte mappings when core-mm request pte
>> mappings that meet the requirements; and its all based around intercepting the
>> normal (non-hugetlb) helpers (e.g. set_ptes(), ptep_get() and friends). There is
>> no semantic change to the core-mm. See [1]. It relies on 1) the page cache using
>> large folios and 2) my "small-sized THP" series which starts using arbitrary
>> sized large folios for anonymous memory [2].
>>
>> If I've understood this conversation correctly there is an object called hugepd,
>> which today is only supported by powerpc, but which could allow the core-mm to
>> control the mapping granularity? I can see some value in exposing that control
>> to core-mm in the (very) long term.
> 
> For me it's needed immediately, because hugetlb_follow_page_mask() will be
> gone after the last patch.
> 
>>
>> [1] https://lore.kernel.org/all/20231115163018.1303287-1-ryan.roberts@arm.com/
>> [2] https://lore.kernel.org/linux-mm/20231115132734.931023-1-ryan.roberts@arm.com/
> 
> AFAICT you haven't yet worked on gup then, after I glimpsed the above
> series.

No, I haven't touched GUP at all. The approach is fully inside the arm64 arch
code (except 1 patch to core-mm which enables an optimization). So as far as GUP
and the rest of the core-mm is concerned, there are still only page-sized ptes
and they can all be iterated over and accessed as normal.

> 
> It's a matter of whether one follow_page_mask() call can fetch more than
> one page* for a cont_pte entry on aarch64 for a large non-hugetlb folio
> (and if this series lands, it'll be the same to hugetlb or non-hugetlb).
> Now the current code can only fetch one page I think.
> 
> Thanks,
> 

