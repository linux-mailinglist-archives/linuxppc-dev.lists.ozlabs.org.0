Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F4B939009
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 15:41:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSLyg3Q21z3d4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 23:40:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSLyG3R10z2y8q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 23:40:35 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E204CFEC;
	Mon, 22 Jul 2024 06:40:27 -0700 (PDT)
Received: from [10.44.160.75] (e126510-lin.lund.arm.com [10.44.160.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E99F23F766;
	Mon, 22 Jul 2024 06:39:56 -0700 (PDT)
Message-ID: <b4f8b351-4c83-43b4-bfbe-8f67f3f56fb9@arm.com>
Date: Mon, 22 Jul 2024 15:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
To: Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com> <Zogmi1AogxHWlWWR@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Zogmi1AogxHWlWWR@arm.com>
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
Cc: szabolcs.nagy@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/07/2024 18:59, Catalin Marinas wrote:
> On Fri, May 03, 2024 at 02:01:35PM +0100, Joey Gouly wrote:
>> @@ -163,7 +182,8 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>>  #define pte_access_permitted_no_overlay(pte, write) \
>>  	(((pte_val(pte) & (PTE_VALID | PTE_USER)) == (PTE_VALID | PTE_USER)) && (!(write) || pte_write(pte)))
>>  #define pte_access_permitted(pte, write) \
>> -	pte_access_permitted_no_overlay(pte, write)
>> +	(pte_access_permitted_no_overlay(pte, write) && \
>> +	por_el0_allows_pkey(FIELD_GET(PTE_PO_IDX_MASK, pte_val(pte)), write, false))
> I'm still not entirely convinced on checking the keys during fast GUP
> but that's what x86 and powerpc do already, so I guess we'll follow the
> same ABI.

I've thought about this some more. In summary I don't think adding this
check to pte_access_permitted() is controversial, but we should decide
how POR_EL0 is set for kernel threads.

This change essentially means that fast GUP behaves like uaccess for
pages that are already present: in both cases POR_EL0 will be looked up
based on the POIndex of the page being accessed (by the hardware in the
uaccess case, and explicitly in the fast GUP case). Fast GUP always
operates on current->mm, so to me checking POR_EL0 in
pte_access_permitted() should be no more restrictive than a uaccess
check from a user perspective. In other words, POR_EL0 is checked when
the kernel accesses user memory on the user's behalf, whether through
uaccess or GUP.

It's also worth noting that the "slow" GUP path (which
get_user_pages_fast() falls back to if a page is missing) also checks
POR_EL0 by virtue of calling handle_mm_fault(), which in turn calls
arch_vma_access_permitted(). It would be pretty inconsistent for the
slow GUP path to do a pkey check but not the fast path. (That said, the
slow GUP path does not call arch_vma_access_permitted() if a page is
already present, so callers of get_user_pages() and similar will get
inconsistent checking. Not great, that may be worth fixing - but that's
clearly beyond the scope of this series.)

Now an interesting question is what happens with kernel threads that
access user memory, as is the case for the optional io_uring kernel
thread (IORING_SETUP_SQPOLL). The discussion above holds regardless of
the type of thread, so the sqpoll thread will have its POR_EL0 checked
when processing commands that involve uaccess or GUP. AFAICT, this
series does not have special handling for kernel threads w.r.t. POR_EL0,
which means that it is left unchanged when a new kernel thread is cloned
(create_io_thread() in the IORING_SETUP_SQPOLL case). The sqpoll thread
will therefore inherit POR_EL0 from the (user) thread that calls
io_uring_setup(). In other words, the sqpoll thread ends up with the
same view of user memory as that user thread - for instance if its
POR_EL0 prevents access to POIndex 1, then any I/O that the sqpoll
thread attempts on mappings with POIndex/pkey 1 will fail.

This behaviour seems potentially useful to me, as the io_uring SQ could
easily become a way to bypass POE without some restriction. However, it
feels like this should be documented, as one should keep it in mind when
using pkeys, and there may well be other cases where kernel threads are
impacted by POR_EL0. I am also unsure how x86/ppc handle this.

Kevin
