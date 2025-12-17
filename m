Return-Path: <linuxppc-dev+bounces-14834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E272CC6C9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 10:26:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWT2n0ptCz2yps;
	Wed, 17 Dec 2025 20:26:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765963616;
	cv=none; b=SCvnEzglL6EYFNNXuSqTsF4OpU2aXsFhx2zdPY4eazNqk6mXqTxMFN5LhMOef7wxP2ilSOWSe6pZzPUfUl1iOcbUf76aZQRIkO32GJtUt7IDwmKulhLmcYaUp25NGD4YBl5K2ao66gyw1Oqb3jPlaFtOGhzzHyEMMPJSu1mQLAUs+2L6i5zxn6SLRqMGUsfCu+821jhnBlnT/r/ZE9L6grw0/WK7NoTlmaASTf8EivJ9feIaDjHTAcXkelVndtXeIHE1GPTWav/sj7sT41+nBCPQQALvx7iwGTRsbiLIGlSqCjh9TUdBeORo7oq8sXopTcHN9BhYGSZMQ4lGJASuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765963616; c=relaxed/relaxed;
	bh=ZwihpIkffId1o87zl/G9jlo/Pzu9AzPacFtF7GHeHUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7giNNY6FSMt7/hQODHO1nBFS6Lalug1Pj6uECNtABikPQJCU+dl2JmTlB290VK7LbhupxEZ+Pec5rl57UHD+2lK26SkSUFv+0qpZc0wquSIVMZ6rHwcn/rQ32EDTLRkS9VpZhNir4t5cSTQTxNsEgDkffn2CyMbFwiJYB/4dMmMW5HPzKYzjVpLP9O89ncahSRhXTIvHGPIFgrh/X1SrgHLEFVFughvtKr0H+0e9/sv5Vec6dTGsvhyf2ucr+5IrXv9Xs1Eh0SBJZc9wZVE/yqydbOkxf1Wr17PxZnTWmHpvXusj0S6GdxTGRctu7eAQ2cOQpsmDL8IekBsQRp6jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWT2l6bhHz2yjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 20:26:54 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B975914BF;
	Wed, 17 Dec 2025 01:26:14 -0800 (PST)
Received: from [10.57.47.3] (unknown [10.57.47.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6A93F762;
	Wed, 17 Dec 2025 01:26:14 -0800 (PST)
Message-ID: <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com>
Date: Wed, 17 Dec 2025 10:26:12 +0100
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
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-15-kevin.brodsky@arm.com>
 <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/12/2025 05:14, Andrew Morton wrote:
> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>
>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>> ensure that it appears active when it should, depending on how
>> enable/disable and pause/resume pairs are nested.
> I needed this for powerpc allmodconfig;
>
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -30,6 +30,7 @@
>  #include <trace/events/thp.h>
>  
>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>  
>  /*
>   * A linux PTE was changed and the corresponding hash table entry
> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>  		flush_hash_range(i, local);
>  	batch->index = 0;
>  }
> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>  
>  void hash__tlb_flush(struct mmu_gather *tlb)
>  {
> _

Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
refer to those symbols on powerpc... Maybe a bit overkill to export
those just for a test module, but I'm not sure there's a good
alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.

- Kevin

