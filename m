Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEDF843D1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 11:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPzFh4RyXz3cGS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 21:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPzDN2MBVz3cV4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 21:44:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61E34DA7;
	Wed, 31 Jan 2024 02:44:15 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F0D3F5A1;
	Wed, 31 Jan 2024 02:43:24 -0800 (PST)
Message-ID: <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
Date: Wed, 31 Jan 2024 10:43:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/01/2024 12:46, David Hildenbrand wrote:
> Now that the rmap overhaul[1] is upstream that provides a clean interface
> for rmap batching, let's implement PTE batching during fork when processing
> PTE-mapped THPs.
> 
> This series is partially based on Ryan's previous work[2] to implement
> cont-pte support on arm64, but its a complete rewrite based on [1] to
> optimize all architectures independent of any such PTE bits, and to
> use the new rmap batching functions that simplify the code and prepare
> for further rmap accounting changes.
> 
> We collect consecutive PTEs that map consecutive pages of the same large
> folio, making sure that the other PTE bits are compatible, and (a) adjust
> the refcount only once per batch, (b) call rmap handling functions only
> once per batch and (c) perform batch PTE setting/updates.
> 
> While this series should be beneficial for adding cont-pte support on
> ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
> for large folios with minimal added overhead and further changes[4] that
> build up on top of the total mapcount.
> 
> Independent of all that, this series results in a speedup during fork with
> PTE-mapped THP, which is the default with THPs that are smaller than a PMD
> (for example, 16KiB to 1024KiB mTHPs for anonymous memory[5]).
> 
> On an Intel Xeon Silver 4210R CPU, fork'ing with 1GiB of PTE-mapped folios
> of the same size (stddev < 1%) results in the following runtimes
> for fork() (shorter is better):
> 
> Folio Size | v6.8-rc1 |      New | Change
> ------------------------------------------
>       4KiB | 0.014328 | 0.014035 |   - 2%
>      16KiB | 0.014263 | 0.01196  |   -16%
>      32KiB | 0.014334 | 0.01094  |   -24%
>      64KiB | 0.014046 | 0.010444 |   -26%
>     128KiB | 0.014011 | 0.010063 |   -28%
>     256KiB | 0.013993 | 0.009938 |   -29%
>     512KiB | 0.013983 | 0.00985  |   -30%
>    1024KiB | 0.013986 | 0.00982  |   -30%
>    2048KiB | 0.014305 | 0.010076 |   -30%

Just a heads up that I'm seeing some strange results on Apple M2. Fork for
order-0 is seemingly costing ~17% more. I'm using GCC 13.2 and was pretty sure I
didn't see this problem with version 1; although that was on a different
baseline and I've thrown the numbers away so will rerun and try to debug this.

| kernel      |   mean_rel |   std_rel |
|:------------|-----------:|----------:|
| mm-unstable |       0.0% |      1.1% |
| patch 1     |      -2.3% |      1.3% |
| patch 10    |      -2.9% |      2.7% |
| patch 11    |      13.5% |      0.5% |
| patch 12    |      15.2% |      1.2% |
| patch 13    |      18.2% |      0.7% |
| patch 14    |      20.5% |      1.0% |
| patch 15    |      17.1% |      1.6% |
| patch 15    |      16.7% |      0.8% |

fork for order-9 is looking good (-20%), and for the zap series, munmap is
looking good, but dontneed is looking poor for both order-0 and 9. But one thing
at a time... let's concentrate on fork order-0 first.

Note that I'm still using the "old" benchmark code. Could you resend me the link
to the new code? Although I don't think there should be any effect for order-0
anyway, if I understood your changes correctly?


> 
> Note that these numbers are even better than the ones from v1 (verified
> over multiple reboots), even though there were only minimal code changes.
> Well, I removed a pte_mkclean() call for anon folios, maybe that also
> plays a role.
> 
> But my experience is that fork() is extremely sensitive to code size,
> inlining, ... so I suspect we'll see on other architectures rather a change
> of -20% instead of -30%, and it will be easy to "lose" some of that speedup
> in the future by subtle code changes.
> 
> Next up is PTE batching when unmapping. Only tested on x86-64.
> Compile-tested on most other architectures.
> 
> v2 -> v3:
>  * Rebased on mm-unstable
>  * Picked up RB's
>  * Updated documentation of wrprotect_ptes().
> 
> v1 -> v2:
>  * "arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary"
>   -> Added patch from Ryan
>  * "arm/pgtable: define PFN_PTE_SHIFT"
>   -> Removed the arm64 bits
>  * "mm/pgtable: make pte_next_pfn() independent of set_ptes()"
>  * "arm/mm: use pte_next_pfn() in set_ptes()"
>  * "powerpc/mm: use pte_next_pfn() in set_ptes()"
>   -> Added to use pte_next_pfn() in some arch set_ptes() implementations
>      I tried to make use of pte_next_pfn() also in the others, but it's
>      not trivial because the other archs implement set_ptes() in their
>      asm/pgtable.h. Future work.
>  * "mm/memory: factor out copying the actual PTE in copy_present_pte()"
>   -> Move common folio_get() out of if/else
>  * "mm/memory: optimize fork() with PTE-mapped THP"
>   -> Add doc for wrprotect_ptes
>   -> Extend description to mention handling of pinned folios
>   -> Move common folio_ref_add() out of if/else
>  * "mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()"
>   -> Be more conservative with dirt/soft-dirty, let the caller specify
>      using flags
> 
> [1] https://lkml.kernel.org/r/20231220224504.646757-1-david@redhat.com
> [2] https://lkml.kernel.org/r/20231218105100.172635-1-ryan.roberts@arm.com
> [3] https://lkml.kernel.org/r/20230809083256.699513-1-david@redhat.com
> [4] https://lkml.kernel.org/r/20231124132626.235350-1-david@redhat.com
> [5] https://lkml.kernel.org/r/20231207161211.2374093-1-ryan.roberts@arm.com
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> 
> ---
> 
> Andrew asked for a resend based on latest mm-unstable. I am sending this
> out earlier than I would usually have sent out the next version, so we can
> pull it into mm-unstable again now that v1 was dropped.
> 
> David Hildenbrand (14):
>   arm/pgtable: define PFN_PTE_SHIFT
>   nios2/pgtable: define PFN_PTE_SHIFT
>   powerpc/pgtable: define PFN_PTE_SHIFT
>   riscv/pgtable: define PFN_PTE_SHIFT
>   s390/pgtable: define PFN_PTE_SHIFT
>   sparc/pgtable: define PFN_PTE_SHIFT
>   mm/pgtable: make pte_next_pfn() independent of set_ptes()
>   arm/mm: use pte_next_pfn() in set_ptes()
>   powerpc/mm: use pte_next_pfn() in set_ptes()
>   mm/memory: factor out copying the actual PTE in copy_present_pte()
>   mm/memory: pass PTE to copy_present_pte()
>   mm/memory: optimize fork() with PTE-mapped THP
>   mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()
>   mm/memory: ignore writable bit in folio_pte_batch()
> 
> Ryan Roberts (1):
>   arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary
> 
>  arch/arm/include/asm/pgtable.h      |   2 +
>  arch/arm/mm/mmu.c                   |   2 +-
>  arch/arm64/include/asm/pgtable.h    |  28 ++--
>  arch/nios2/include/asm/pgtable.h    |   2 +
>  arch/powerpc/include/asm/pgtable.h  |   2 +
>  arch/powerpc/mm/pgtable.c           |   5 +-
>  arch/riscv/include/asm/pgtable.h    |   2 +
>  arch/s390/include/asm/pgtable.h     |   2 +
>  arch/sparc/include/asm/pgtable_64.h |   2 +
>  include/linux/pgtable.h             |  33 ++++-
>  mm/memory.c                         | 212 ++++++++++++++++++++++------
>  11 files changed, 229 insertions(+), 63 deletions(-)
> 
> 
> base-commit: d162e170f1181b4305494843e1976584ddf2b72e

