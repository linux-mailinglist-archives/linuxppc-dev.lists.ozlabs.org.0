Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB74BD52D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 01:00:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dGrB74lpzDqg4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 09:00:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="YbauMZdR"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dGp85b0xzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 08:58:56 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8a9fb20001>; Tue, 24 Sep 2019 15:58:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 24 Sep 2019 15:58:52 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 24 Sep 2019 15:58:52 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Sep
 2019 22:58:51 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Sep
 2019 22:58:51 +0000
Subject: Re: [PATCH v3 00/11] Introduces new count-based method for monitoring
 lockless pagetable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <kvm-ppc@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>
References: <20190924212427.7734-1-leonardo@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <8635e9b3-45a3-803f-5c91-a7aa4c4e7ce3@nvidia.com>
Date: Tue, 24 Sep 2019 15:58:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924212427.7734-1-leonardo@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569365939; bh=Iw/k6TLxzfAppFc3jVsxWucfWJjX+ZeZ0ypbmLc8VzA=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=YbauMZdRz5L77ci7mBBPVArFMGeUPOatZt47qBuFCs+wfEzr0s1nG2omvf2orBL/U
 EmxS2/ldHTjZc0liJt7LE57JFKWTo9jZs1iHDth0yhWpVA/NlMAomwYO8bV8Xesj7G
 sF0/H7fsptyv+0bUlKN+I5CBiSAG+o8jOcwoc5zmzGMQsRQ1vm1F9LXupdHnwOBwr/
 UFeFavjHnFvr3b8aIJv07rRMNuYv4BKf7hNiBZ2LH1VT7VykVpS5yPnHieqwVXLPr6
 tuEsA3eI63NRG9s83g38gISwSXaYqWM+Hr6sbubgG4GoimEoJVywvor/KO2mFFUaiO
 ID6KEAgdWJc9w==
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
Cc: Keith Busch <keith.busch@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Ganesh
 Goudar <ganeshgr@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/24/19 2:24 PM, Leonardo Bras wrote:
> If a process (qemu) with a lot of CPUs (128) try to munmap() a large
> chunk of memory (496GB) mapped with THP, it takes an average of 275
> seconds, which can cause a lot of problems to the load (in qemu case,
> the guest will lock for this time).
> 
> Trying to find the source of this bug, I found out most of this time is
> spent on serialize_against_pte_lookup(). This function will take a lot
> of time in smp_call_function_many() if there is more than a couple CPUs
> running the user process. Since it has to happen to all THP mapped, it
> will take a very long time for large amounts of memory.
> 
> By the docs, serialize_against_pte_lookup() is needed in order to avoid
> pmd_t to pte_t casting inside find_current_mm_pte(), or any lockless
> pagetable walk, to happen concurrently with THP splitting/collapsing.
> 
> It does so by calling a do_nothing() on each CPU in mm->cpu_bitmap[],
> after interrupts are re-enabled.
> Since, interrupts are (usually) disabled during lockless pagetable
> walk, and serialize_against_pte_lookup will only return after
> interrupts are enabled, it is protected.
> 
> So, by what I could understand, if there is no lockless pagetable walk
> running, there is no need to call serialize_against_pte_lookup().
> 
> So, to avoid the cost of running serialize_against_pte_lookup(), I
> propose a counter that keeps track of how many find_current_mm_pte()
> are currently running, and if there is none, just skip
> smp_call_function_many().
> 
> The related functions are:
> start_lockless_pgtbl_walk(mm)
> 	Insert before starting any lockless pgtable walk
> end_lockless_pgtbl_walk(mm)
> 	Insert after the end of any lockless pgtable walk
> 	(Mostly after the ptep is last used)
> running_lockless_pgtbl_walk(mm)
> 	Returns the number of lockless pgtable walks running
> 
> On my workload (qemu), I could see munmap's time reduction from 275
> seconds to 418ms.
> 
> Changes since v2:
>  Rebased to v5.3
>  Adds support on __get_user_pages_fast
>  Adds usage decription to *_lockless_pgtbl_walk()
>  Better style to dummy functions
>  Link: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131839

Hi Leonardo,

Thanks for adding linux-mm to CC for this next round of reviews. For the benefit
of any new reviewers, I'd like to add that there are some issues that were discovered
while reviewing the v2 patchset, that are not (yet) addressed in this v3 series.

Since those issues are not listed in the cover letter above, I'll list them here:

1. The locking model requires a combination of disabling interrupts and
atomic counting and memory barriers, but

	a) some memory barriers are missing (start/end_lockless_pgtbl_walk), and
	b) some cases (patch #8) fail to disable interrupts

...so the synchronization appears to be inadequate. (And if it *is* adequate, then
definitely we need the next item, to explain it.)

2. Documentation of the synchronization/locking model needs to exist, once we
figure out the exact details of (1).

3. Related to (1), I've asked to change things so that interrupt controls and 
atomic inc/dec are in the same start/end calls--assuming, of course, that the
caller can tolerate that. 

4. Please see the v2 series for any other details I've missed.

thanks,
-- 
John Hubbard
NVIDIA

>  
> Changes since v1:
>  Isolated atomic operations in functions *_lockless_pgtbl_walk()
>  Fixed behavior of decrementing before last ptep was used
>  Link: http://patchwork.ozlabs.org/patch/1163093/
>  
> Leonardo Bras (11):
>   powerpc/mm: Adds counting method to monitor lockless pgtable walks
>   asm-generic/pgtable: Adds dummy functions to monitor lockless pgtable
>     walks
>   mm/gup: Applies counting method to monitor gup_pgd_range
>   powerpc/mce_power: Applies counting method to monitor lockless pgtbl
>     walks
>   powerpc/perf: Applies counting method to monitor lockless pgtbl walks
>   powerpc/mm/book3s64/hash: Applies counting method to monitor lockless
>     pgtbl walks
>   powerpc/kvm/e500: Applies counting method to monitor lockless pgtbl
>     walks
>   powerpc/kvm/book3s_hv: Applies counting method to monitor lockless
>     pgtbl walks
>   powerpc/kvm/book3s_64: Applies counting method to monitor lockless
>     pgtbl walks
>   powerpc/book3s_64: Enables counting method to monitor lockless pgtbl
>     walk
>   powerpc/mm/book3s64/pgtable: Uses counting method to skip serializing
> 
>  arch/powerpc/include/asm/book3s/64/mmu.h     |  3 ++
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  5 +++
>  arch/powerpc/kernel/mce_power.c              | 13 +++++--
>  arch/powerpc/kvm/book3s_64_mmu_hv.c          |  2 +
>  arch/powerpc/kvm/book3s_64_mmu_radix.c       | 20 +++++++++-
>  arch/powerpc/kvm/book3s_64_vio_hv.c          |  4 ++
>  arch/powerpc/kvm/book3s_hv_nested.c          |  8 ++++
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c          |  9 ++++-
>  arch/powerpc/kvm/e500_mmu_host.c             |  4 ++
>  arch/powerpc/mm/book3s64/hash_tlb.c          |  2 +
>  arch/powerpc/mm/book3s64/hash_utils.c        |  7 ++++
>  arch/powerpc/mm/book3s64/mmu_context.c       |  1 +
>  arch/powerpc/mm/book3s64/pgtable.c           | 40 +++++++++++++++++++-
>  arch/powerpc/perf/callchain.c                |  5 ++-
>  include/asm-generic/pgtable.h                | 15 ++++++++
>  mm/gup.c                                     |  8 ++++
>  16 files changed, 138 insertions(+), 8 deletions(-)
> 
