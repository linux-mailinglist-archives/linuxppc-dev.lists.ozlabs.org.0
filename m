Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C087AAE3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 11:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsRww0hS8z3dgG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:36:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsRwP6cckz3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 19:36:02 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4668EDA7;
	Fri, 22 Sep 2023 02:36:08 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A26293F5A1;
	Fri, 22 Sep 2023 02:35:26 -0700 (PDT)
Message-ID: <9e8d66fb-1d8d-4ce0-86a7-4c8b04557cca@arm.com>
Date: Fri, 22 Sep 2023 10:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: hugetlb: Fix set_huge_pte_at() to work with
 all swap entries
Content-Language: en-GB
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-9-ryan.roberts@arm.com>
 <217bb956-b9f6-1057-914b-436d4c775a8b@bytedance.com>
 <3358e732-8df9-4408-8249-384b102f5d75@arm.com>
 <6db7e7e0-4db6-f742-436b-1f4d8ae4e490@bytedance.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <6db7e7e0-4db6-f742-436b-1f4d8ae4e490@bytedance.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel
 .org, stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/09/2023 08:54, Qi Zheng wrote:
> Hi Ryan,
> 
> On 2023/9/22 15:40, Ryan Roberts wrote:
>> On 22/09/2023 03:54, Qi Zheng wrote:
>>> Hi Ryan,
>>>
>>> On 2023/9/22 00:20, Ryan Roberts wrote:
>>>> When called with a swap entry that does not embed a PFN (e.g.
>>>> PTE_MARKER_POISONED or PTE_MARKER_UFFD_WP), the previous implementation
>>>> of set_huge_pte_at() would either cause a BUG() to fire (if
>>>> CONFIG_DEBUG_VM is enabled) or cause a dereference of an invalid address
>>>> and subsequent panic.
>>>>
>>>> arm64's huge pte implementation supports multiple huge page sizes, some
>>>> of which are implemented in the page table with contiguous mappings. So
>>>> set_huge_pte_at() needs to work out how big the logical pte is, so that
>>>> it can also work out how many physical ptes (or pmds) need to be
>>>> written. It does this by grabbing the folio out of the pte and querying
>>>> its size.
>>>>
>>>> However, there are cases when the pte being set is actually a swap
>>>> entry. But this also used to work fine, because for huge ptes, we only
>>>> ever saw migration entries and hwpoison entries. And both of these types
>>>> of swap entries have a PFN embedded, so the code would grab that and
>>>> everything still worked out.
>>>>
>>>> But over time, more calls to set_huge_pte_at() have been added that set
>>>> swap entry types that do not embed a PFN. And this causes the code to go
>>>> bang. The triggering case is for the uffd poison test, commit
>>>> 99aa77215ad0 ("selftests/mm: add uffd unit test for UFFDIO_POISON"),
>>>> which sets a PTE_MARKER_POISONED swap entry. But review shows there are
>>>> other places too (PTE_MARKER_UFFD_WP).
>>>>
>>>> So the root cause is due to commit 18f3962953e4 ("mm: hugetlb: kill
>>>> set_huge_swap_pte_at()"), which aimed to simplify the interface to the
>>>> core code by removing set_huge_swap_pte_at() (which took a page size
>>>> parameter) and replacing it with calls to set_huge_swap_pte_at() where
>>>> the size was inferred from the folio, as descibed above. While that
>>>> commit didn't break anything at the time,
>>>
>>> If it didn't break anything at that time, then shouldn't the Fixes tag
>>> be added to this commit?
>>>
>>>> it did break the interface
>>>> because it couldn't handle swap entries without PFNs. And since then new
>>>> callers have come along which rely on this working.
>>>
>>> So the Fixes tag should be added only to the commit that introduces the
>>> first new callers?
>>
>> Well I guess it's a matter of point of view; My view is that 18f3962953e4 is the
>> buggy change because it broke the interface to not be able to handle swap
>> entries which do not contain PFNs. The fact that there were no callers that used
>> the interface in this way at the time of the commit is irrelevant in my view.
> 
> I understand your point of view.
> 
> But IIUC, the Fixes tag is used to indicate the version that needs to
> backport, but the version where the commit 18f3962953e4 is located
> does not need to backport this bugfix patch.
> 
>> But I already added 2 fixes tags; one for the buggy commit, and the other for
>> the commit containing the new user of the interface.
> 
> I think 2 fixes tags will cause inconvenience to the maintainers.
> 

I did some Archaeology:

$ git rev-list --no-walk=sorted --pretty=oneline \
	05e90bd05eea33fc77d6b11e121e2da01fee379f \
	60dfaad65aa97fb6755b9798a6b3c9e79bcd5930 \
	8a13897fb0daa8f56821f263f0c63661e1c6acae \
	18f3962953e40401b7ed98e8524167282c3e626e \
	v6.5 v5.18 v5.17 v5.19 v6.5-rc6 v6.5-rc7

2dde18cd1d8fac735875f2e4987f11817cc0bc2c Linux 6.5
706a741595047797872e669b3101429ab8d378ef Linux 6.5-rc7
8a13897fb0daa8f56821f263f0c63661e1c6acae mm: userfaultfd: support UFFDIO_POISON for hugetlbfs
2ccdd1b13c591d306f0401d98dedc4bdcd02b421 Linux 6.5-rc6
3d7cb6b04c3f3115719235cc6866b10326de34cd Linux 5.19
18f3962953e40401b7ed98e8524167282c3e626e mm: hugetlb: kill set_huge_swap_pte_at()
4b0986a3613c92f4ec1bdc7f60ec66fea135991f Linux 5.18
05e90bd05eea33fc77d6b11e121e2da01fee379f mm/hugetlb: only drop uffd-wp special pte if required
60dfaad65aa97fb6755b9798a6b3c9e79bcd5930 mm/hugetlb: allow uffd wr-protect none ptes
f443e374ae131c168a065ea1748feac6b2e76613 Linux 5.17


So it turns out that the PTE_MARKER_UFFD_WP markers were added first, using 
set_huge_pte_at(). At the time, this should have used set_huge_swap_pte_at(), so 
was arguably buggy for that reason. However, arm64 does not support UFFD_WP so 
none of the call sites that set the PTE_MARKER_UFFD_WP marker to the pte ever 
trigger on arm64.

Then "mm: hugetlb: kill set_huge_swap_pte_at()" came along and "broke" the
interface, but there were no callers relying on the behavoir that was broken.

Then "mm: userfaultfd: support UFFDIO_POISON for hugetlbfs" came along in 
v6.5-rc7 and started relying on the broken behaviour of set_huge_pte_at().

So on that basis, I agree that the first commit where broken behaviour is 
observable is "mm: userfaultfd: support UFFDIO_POISON for hugetlbfs". So I will 
tag that one as "Fixes". (Although if set_huge_pte_at() was an exported symbol, 
then we would want to mark "mm: hugetlb: kill set_huge_swap_pte_at()").

Thanks,
Ryan




> Thanks,
> Qi
> 
>>
>>>
>>> Other than that, LGTM.
>>
>> Thanks!
>>
>>>
>>> Thanks,
>>> Qi
>>>
