Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A22B98EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 23:27:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zmz02dpSzF4L1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 07:27:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="p/Qv+J/O"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zmvc5XWrzDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 07:25:00 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8543ae0000>; Fri, 20 Sep 2019 14:25:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 20 Sep 2019 14:24:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 20 Sep 2019 14:24:56 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Sep
 2019 21:24:56 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Sep
 2019 21:24:55 +0000
Subject: Re: [PATCH v2 00/11] Introduces new count-based method for monitoring
 lockless pagetable wakls
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <1f5d9380418ad8bb90c6bbdac34716c650b917a0.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <95a6e165-cc71-e584-8d17-df05c4a95aaa@nvidia.com>
Date: Fri, 20 Sep 2019 14:24:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1f5d9380418ad8bb90c6bbdac34716c650b917a0.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569014702; bh=7mb607kPCYdMb6CIQs+YSAHMRbWUkfZiqvJ+hX6HxuU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=p/Qv+J/O63xzA8dj9O6aHi3OzMNTLsLFe51P4gW7MAl1ZL9Dwzke1xvZUXeX5wv3q
 kzQi6QNgb0Dx/pLZa6YgpbfSFh13Nlgfz9QnOia+i4GikN1a/2BPPALir/fMA3JYB3
 1+DsoGzgAF3YF/eqnpOt17sUc+ltPjAi4Ynv3v0Ovi6iOexvBTsjLBXysvi4mTXFp+
 SE9xxwnpcig2NN9uRA2ADS+srZadcjfU1bGRogNuUl43yF/IJEjUpLQ0tkqvMqcJQ+
 CuH3vsDa6uW2BjCwk2W2bmxU2HBbN1u/lCqxWQMYpWI8TtE5ahRS2sHsGW8BtBADQP
 MhuLe8jIWepLQ==
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>,
 Keith Busch <keith.busch@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/19 1:12 PM, Leonardo Bras wrote:
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

Just noticed that this really should also include linux-mm, maybe
it's best to repost the patchset with them included?

In particular, there is likely to be some feedback about adding more
calls, in addition to local_irq_disable/enable, around the gup_fast() path,
separately from my questions about the synchronization cases in ppc.

thanks,
-- 
John Hubbard
NVIDIA

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
> 
> On my workload (qemu), I could see munmap's time reduction from 275
> seconds to 418ms.
> 
>> Leonardo Bras (11):
>>   powerpc/mm: Adds counting method to monitor lockless pgtable walks
>>   asm-generic/pgtable: Adds dummy functions to monitor lockless pgtable
>>     walks
>>   mm/gup: Applies counting method to monitor gup_pgd_range
>>   powerpc/mce_power: Applies counting method to monitor lockless pgtbl
>>     walks
>>   powerpc/perf: Applies counting method to monitor lockless pgtbl walks
>>   powerpc/mm/book3s64/hash: Applies counting method to monitor lockless
>>     pgtbl walks
>>   powerpc/kvm/e500: Applies counting method to monitor lockless pgtbl
>>     walks
>>   powerpc/kvm/book3s_hv: Applies counting method to monitor lockless
>>     pgtbl walks
>>   powerpc/kvm/book3s_64: Applies counting method to monitor lockless
>>     pgtbl walks
>>   powerpc/book3s_64: Enables counting method to monitor lockless pgtbl
>>     walk
>>   powerpc/mm/book3s64/pgtable: Uses counting method to skip serializing
>>
>>  arch/powerpc/include/asm/book3s/64/mmu.h     |  3 +++
>>  arch/powerpc/include/asm/book3s/64/pgtable.h |  5 +++++
>>  arch/powerpc/kernel/mce_power.c              | 13 ++++++++++---
>>  arch/powerpc/kvm/book3s_64_mmu_hv.c          |  2 ++
>>  arch/powerpc/kvm/book3s_64_mmu_radix.c       | 20 ++++++++++++++++++--
>>  arch/powerpc/kvm/book3s_64_vio_hv.c          |  4 ++++
>>  arch/powerpc/kvm/book3s_hv_nested.c          |  8 ++++++++
>>  arch/powerpc/kvm/book3s_hv_rm_mmu.c          |  9 ++++++++-
>>  arch/powerpc/kvm/e500_mmu_host.c             |  4 ++++
>>  arch/powerpc/mm/book3s64/hash_tlb.c          |  2 ++
>>  arch/powerpc/mm/book3s64/hash_utils.c        |  7 +++++++
>>  arch/powerpc/mm/book3s64/mmu_context.c       |  1 +
>>  arch/powerpc/mm/book3s64/pgtable.c           | 20 +++++++++++++++++++-
>>  arch/powerpc/perf/callchain.c                |  5 ++++-
>>  include/asm-generic/pgtable.h                |  9 +++++++++
>>  mm/gup.c                                     |  4 ++++
>>  16 files changed, 108 insertions(+), 8 deletions(-)
>>
