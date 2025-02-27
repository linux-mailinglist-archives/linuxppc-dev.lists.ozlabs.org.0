Return-Path: <linuxppc-dev+bounces-6531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A91A47B96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 12:14:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3THs4ZVJz2yb9;
	Thu, 27 Feb 2025 22:14:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740654857;
	cv=none; b=kjTOfuwS1ZWqlgSb/Zpczp7DZuRepjiFJqAsIOE2CGAKyvibkut6dR0DvmDrfFnsHt0K310Nl5bJI3Onhit9ARpFXKBRuy28FNhZeWlqxwcM0fmcv0gXnTN0gTjs9r+0jVzxSx5JT7WkZw0KYZi8jbCZFpBeN7BewmfWdtNPPhvpzMLYN59gcnbi0FcV8pxmRFT70VCwPJi824stXQg6LkFmbNw/dZ1vVloznLCXuAB969wSf8505JmxhFahnriQttMc/fb//ed5DSqjMLtPKsYUd7KFy4jApYXqXNDgygqh/KWI+Vr6AfnYxjDHmDyAjgN67g58sYN2QNzTjFwilg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740654857; c=relaxed/relaxed;
	bh=Xs5+klIHUgwyyyEQRPQsx98Pc5etma9f9hiPcjrGdko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNMVbsiJWp1lYiDhmL1eBQ1J9mHQ2BMLh1Uq0NTP7PL1FWjRDg7Y+bbJK2q82j7DPk0BUPjGMUxjptVRJUe233VdYqbM8qqS/I1oJ+OnjQCEAp4mzWmc6VDJVUIRvWLezRPg/2Ht3r+b/Y/SpJhf5TwXtqnpQCZ5t+oY0+/sB3iNCqwyGbMb1MNAsR0zq9CAl+QBkbWqO31lDRQpetawOG0Ufwlxeuoxl5kJQYVcJwC1S6DJ38LdthXVTyC1NiK3no+23hRtXYHRwa8xj0HSJrNial87g5cAafARa+hw87H5yYx8pAIZXHZAi5xnbwBbTRTWft/UBAGWB+TZZurAKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3THq2pq7z2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 22:14:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B356E2C1C;
	Thu, 27 Feb 2025 03:13:56 -0800 (PST)
Received: from [10.57.85.134] (unknown [10.57.85.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF103F6A8;
	Thu, 27 Feb 2025 03:13:31 -0800 (PST)
Message-ID: <16863478-2195-435e-a899-559df097bc59@arm.com>
Date: Thu, 27 Feb 2025 11:13:29 +0000
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] execmem: add support for cache of large ROX pages
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Dev Jain <dev.jain@arm.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Oleg Nesterov <oleg@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-8-rppt@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241023162711.2579610-8-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Mike,

Drive by review comments below...


On 23/10/2024 17:27, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Using large pages to map text areas reduces iTLB pressure and improves
> performance.
> 
> Extend execmem_alloc() with an ability to use huge pages with ROX
> permissions as a cache for smaller allocations.
> 
> To populate the cache, a writable large page is allocated from vmalloc with
> VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> ROX.
> 
> The direct map alias of that large page is exculded from the direct map.
> 
> Portions of that large page are handed out to execmem_alloc() callers
> without any changes to the permissions.
> 
> When the memory is freed with execmem_free() it is invalidated again so
> that it won't contain stale instructions.
> 
> An architecture has to implement execmem_fill_trapping_insns() callback
> and select ARCH_HAS_EXECMEM_ROX configuration option to be able to use
> the ROX cache.
> 
> The cache is enabled on per-range basis when an architecture sets
> EXECMEM_ROX_CACHE flag in definition of an execmem_range.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Tested-by: kdevops <kdevops@lists.linux.dev>
> ---

[...]

> +
> +static int execmem_cache_populate(struct execmem_range *range, size_t size)
> +{
> +	unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> +	unsigned long start, end;
> +	struct vm_struct *vm;
> +	size_t alloc_size;
> +	int err = -ENOMEM;
> +	void *p;
> +
> +	alloc_size = round_up(size, PMD_SIZE);
> +	p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);

Shouldn't this be passing PAGE_KERNEL_ROX? Otherwise I don't see how the
allocated memory is ROX? I don't see any call below where you change the permission.

Given the range has the pgprot in it, you could just drop passing the pgprot
explicitly here and have execmem_vmalloc() use range->pgprot directly?

Thanks,
Ryan

> +	if (!p)
> +		return err;
> +
> +	vm = find_vm_area(p);
> +	if (!vm)
> +		goto err_free_mem;
> +
> +	/* fill memory with instructions that will trap */
> +	execmem_fill_trapping_insns(p, alloc_size, /* writable = */ true);
> +
> +	start = (unsigned long)p;
> +	end = start + alloc_size;
> +
> +	vunmap_range(start, end);
> +
> +	err = execmem_set_direct_map_valid(vm, false);
> +	if (err)
> +		goto err_free_mem;
> +
> +	err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
> +				       PMD_SHIFT);
> +	if (err)
> +		goto err_free_mem;
> +
> +	err = execmem_cache_add(p, alloc_size);
> +	if (err)
> +		goto err_free_mem;
> +
> +	return 0;
> +
> +err_free_mem:
> +	vfree(p);
> +	return err;
> +}

[...]


