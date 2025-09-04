Return-Path: <linuxppc-dev+bounces-11744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D51B440F2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 17:48:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHkQn5pRhz2yhD;
	Fri,  5 Sep 2025 01:48:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757000897;
	cv=none; b=crbXWLBGZpnEoZIvf4MXzva5LdvUvE8TzcVvTjgJV3rsWAFSVR5N/sdSwSJa3Xmgv141ElGaGgbJJhrnDA40wTkRnjgZMw5f/iNDN8ltBKXWFbn3ynsRlpDOLjVzqc6P67R+e+HGaH5a4J3IoCa7vPnh5HmdJoqCDo8L2FG27QNg3EKpryRSxzf1512Wr7Y+gsxpvIHbswyBniLGixAb00EonqVBESPH8trnOE5uPRJ03T4F3+IWSf7On9NJF4WTVQ2Fusxb0u/0eqE1/JiHSv017dNiiAREkDzlCcETzSiEZBGJqYPwTOMxRW8JAMquRnjrkVuErHo88CnIDNSpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757000897; c=relaxed/relaxed;
	bh=7L6zmwF6yGggWJMfeGBoaeDd3ftd/sKTwPXe5q8sYhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9y+bqi9z7SPq5if7eI+G6MaSvnUT7BG0Aq8329MrhkYZJCkLM4L0FbGZi0ngFqZAAVWgjSYe0udOjCK+C6HQsMnOzVUJraGUjr9CPrsQqvf4lkO3IqVkcboMT0FEJE6WIfUMy+HnZJes82Bn41asX46R1KfnXurei8nqfFtCGegQaRDuiaGZvjNWUMHQLFU0MBWNCwejruJjLZfNCB5gC36sXE2hRUxHOi0ykamzrGWuYErhdecpZQCodykakIMc5GrA7AvEkYbkg8/+R5TepRTgi0VX2Bq438C+y1DKMOVtCv5soCnEr2jSeHNb7CcBRC37kelQaD2k35swwll4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHkQm5jXVz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 01:48:16 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F682339;
	Thu,  4 Sep 2025 08:47:35 -0700 (PDT)
Received: from [10.57.59.221] (unknown [10.57.59.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1309D3F6A8;
	Thu,  4 Sep 2025 08:47:35 -0700 (PDT)
Message-ID: <af6ea636-a5cb-4b78-aae0-ff7e7caa5e5d@arm.com>
Date: Thu, 4 Sep 2025 17:47:32 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <aLmq+dwZV9dyTYuq@e129823.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aLmq+dwZV9dyTYuq@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 04/09/2025 17:06, Yeoreum Yun wrote:
> Hi Kevin,
>
> [...]
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h              | 10 +++++++---
>>  .../include/asm/book3s/64/tlbflush-hash.h     |  9 ++++++---
>>  arch/powerpc/mm/book3s64/hash_tlb.c           | 10 ++++++----
>>  arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +++--
>>  arch/sparc/include/asm/tlbflush_64.h          |  5 +++--
>>  arch/sparc/mm/tlb.c                           |  6 ++++--
>>  arch/x86/include/asm/paravirt.h               |  6 ++++--
>>  arch/x86/include/asm/paravirt_types.h         |  2 ++
>>  arch/x86/xen/enlighten_pv.c                   |  2 +-
>>  arch/x86/xen/mmu_pv.c                         |  2 +-
>>  fs/proc/task_mmu.c                            |  5 +++--
>>  include/linux/mm_types.h                      |  3 +++
>>  include/linux/pgtable.h                       |  6 ++++--
>>  mm/madvise.c                                  | 20 ++++++++++---------
>>  mm/memory.c                                   | 20 +++++++++++--------
>>  mm/migrate_device.c                           |  5 +++--
>>  mm/mprotect.c                                 |  5 +++--
>>  mm/mremap.c                                   |  5 +++--
>>  mm/vmalloc.c                                  | 15 ++++++++------
>>  mm/vmscan.c                                   | 15 ++++++++------
>>  20 files changed, 97 insertions(+), 59 deletions(-)
> I think you miss the mm/kasan/shadow.c

Ah yes that's because my series is based on v6.17-rc4 but [1] isn't in
mainline yet. I'll rebase v2 on top of mm-stable.

[1]
https://lore.kernel.org/all/0d2efb7ddddbff6b288fbffeeb10166e90771718.1755528662.git.agordeev@linux.ibm.com/

> But here, the usage is like:
>
> static int kasan_populate_vmalloc_pte()
> {
> 	...
> 	arch_leave_lazy_mmu_mode();
> 	...
> 	arch_enter_lazy_mmu_mode();
> 	...
> }
>
> Might be you can call the arch_leave_lazy_mmu_mode() with LAZY_MMU_DEFAULT
> in here since I think kasan_populate_vmalloc_pte() wouldn't be called
> nestly.

In fact in that case it doesn't matter if the section is nested or not.
We're already assuming that lazy_mmu is enabled, and we want to fully
disable it so that PTE operations take effect immediately. For that to
happen we must call arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT). We will
then re-enable lazy_mmu, and the next call to leave() will do the right
thing whether it is nested or not.

It's worth nothing the same situation occurs in xen_flush_lazy_mmu() and
this patch handles it in the way I've just described.

I'll take care of that in v2, thanks for the heads-up!

- Kevin

