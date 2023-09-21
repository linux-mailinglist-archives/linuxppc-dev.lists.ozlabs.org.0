Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601EB7AAB43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:01:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPpz1hH2z3gKZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs1J11Vdzz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 02:36:32 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5882176C;
	Thu, 21 Sep 2023 09:36:37 -0700 (PDT)
Received: from [10.1.34.154] (XHFQ2J9959.cambridge.arm.com [10.1.34.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82BA63F59C;
	Thu, 21 Sep 2023 09:35:55 -0700 (PDT)
Message-ID: <7c5c2c00-d657-44fd-b478-743b43c57e8a@arm.com>
Date: Thu, 21 Sep 2023 17:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Fix set_huge_pte_at() panic on arm64
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921093026.230b2991be551093e397f462@linux-foundation.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20230921093026.230b2991be551093e397f462@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 17:56:48 +1000
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gr
 egkh@linuxfoundation.org>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/09/2023 17:30, Andrew Morton wrote:
> On Thu, 21 Sep 2023 17:19:59 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> Hi All,
>>
>> This series fixes a bug in arm64's implementation of set_huge_pte_at(), which
>> can result in an unprivileged user causing a kernel panic. The problem was
>> triggered when running the new uffd poison mm selftest for HUGETLB memory. This
>> test (and the uffd poison feature) was merged for v6.6-rc1. However, upon
>> inspection there are multiple other pre-existing paths that can trigger this
>> bug.
>>
>> Ideally, I'd like to get this fix in for v6.6 if possible? And I guess it should
>> be backported too, given there are call sites where this can theoretically
>> happen that pre-date v6.6-rc1 (I've cc'ed stable@vger.kernel.org).
> 
> This gets you a naggygram from Greg.  The way to request a backport is
> to add cc:stable to all the changelogs.  I'll make that change to my copy.

Ahh, sorry about that... I just got the same moan from the kernel test robot too.

> 
> 
>> Ryan Roberts (8):
>>   parisc: hugetlb: Convert set_huge_pte_at() to take vma
>>   powerpc: hugetlb: Convert set_huge_pte_at() to take vma
>>   riscv: hugetlb: Convert set_huge_pte_at() to take vma
>>   s390: hugetlb: Convert set_huge_pte_at() to take vma
>>   sparc: hugetlb: Convert set_huge_pte_at() to take vma
>>   mm: hugetlb: Convert set_huge_pte_at() to take vma
>>   arm64: hugetlb: Convert set_huge_pte_at() to take vma
>>   arm64: hugetlb: Fix set_huge_pte_at() to work with all swap entries
>>
>>  arch/arm64/include/asm/hugetlb.h              |  2 +-
>>  arch/arm64/mm/hugetlbpage.c                   | 22 ++++----------
>>  arch/parisc/include/asm/hugetlb.h             |  2 +-
>>  arch/parisc/mm/hugetlbpage.c                  |  4 +--
>>  .../include/asm/nohash/32/hugetlb-8xx.h       |  3 +-
>>  arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 +-
>>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  2 +-
>>  arch/powerpc/mm/nohash/8xx.c                  |  2 +-
>>  arch/powerpc/mm/pgtable.c                     |  7 ++++-
>>  arch/riscv/include/asm/hugetlb.h              |  2 +-
>>  arch/riscv/mm/hugetlbpage.c                   |  3 +-
>>  arch/s390/include/asm/hugetlb.h               |  8 +++--
>>  arch/s390/mm/hugetlbpage.c                    |  8 ++++-
>>  arch/sparc/include/asm/hugetlb.h              |  8 +++--
>>  arch/sparc/mm/hugetlbpage.c                   |  8 ++++-
>>  include/asm-generic/hugetlb.h                 |  6 ++--
>>  include/linux/hugetlb.h                       |  6 ++--
>>  mm/damon/vaddr.c                              |  2 +-
>>  mm/hugetlb.c                                  | 30 +++++++++----------
>>  mm/migrate.c                                  |  2 +-
>>  mm/rmap.c                                     | 10 +++----
>>  mm/vmalloc.c                                  |  5 +++-
>>  22 files changed, 80 insertions(+), 64 deletions(-)
> 
> Looks scary but it's actually a fairly modest patchset.  It could
> easily be all rolled into a single patch for ease of backporting. 
> Maybe Greg has an opinion?

Yes, I thought about doing that; or perhaps 2 patches - one for the interface
change across all arches and core code, and one for the actual bug fix?

But I thought the arch people might prefer to see exactly what's going on in
each arch. Let me know the preference and I can repost if necessary.

> 

