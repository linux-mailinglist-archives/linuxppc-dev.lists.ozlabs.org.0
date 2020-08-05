Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A923C58B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 08:03:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM1Jt3mw0zDqgj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 16:03:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=W01QLqJS; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=E8NAZYU6; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM1FK4HkxzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 16:00:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596607233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GMI2VHEJj5qxJst+Mnz2rfpYmYwR7lvZPX1P81/rYkI=;
 b=W01QLqJSYRCvkDBUaeUzw2rICAKQvikUzNICP83Nskt6rJ5VZbc4ywgmlh6BJiPq8zenLG
 n/xLX122B0v4gRXOt41cGJzs0glTcGtNRvdJy2SjCIbS1SzZKJqRf2QDknPCXIH7CiMwMR
 FyDeLi1aKDt/0zlEwZWm1fXoRSfx/Ik=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596607234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GMI2VHEJj5qxJst+Mnz2rfpYmYwR7lvZPX1P81/rYkI=;
 b=E8NAZYU6ONDxqWANDBPBrJfiM2zBZJEnoxc1r/kZLXQXe8JlxRAtLEsPfepJwquKeegU0W
 o4Ms51fC8Qi1rVOExQfqUQAptLRGAeV2Z3iZQ2xXZKq9AWYXPXWIQUDIQErmK6przGKo7c
 DhXrA8+fxOliKuKcq75C0SMgACXywtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-i88hwEKrNImuiQFvk1P0-w-1; Wed, 05 Aug 2020 02:00:30 -0400
X-MC-Unique: i88hwEKrNImuiQFvk1P0-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D7338064AC;
 Wed,  5 Aug 2020 06:00:13 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5810726A3;
 Wed,  5 Aug 2020 06:00:08 +0000 (UTC)
Date: Wed, 5 Aug 2020 14:00:06 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 14/17] x86/setup: simplify reserve_crashkernel()
Message-ID: <20200805060006.GU10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-15-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/02/20 at 07:35pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> * Replace magic numbers with defines
> * Replace memblock_find_in_range() + memblock_reserve() with
>   memblock_phys_alloc_range()
> * Stop checking for low memory size in reserve_crashkernel_low(). The
>   allocation from limited range will anyway fail if there is no enough
>   memory, so there is no need for extra traversal of memblock.memory
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/x86/kernel/setup.c | 40 ++++++++++++++--------------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)

Applied this patch on top of 5.8, crashkernel reservation works well.
And the code change looks good.

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index d8de4053c5e8..d7ced6982524 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -419,13 +419,13 @@ static int __init reserve_crashkernel_low(void)
>  {
>  #ifdef CONFIG_X86_64
>  	unsigned long long base, low_base = 0, low_size = 0;
> -	unsigned long total_low_mem;
> +	unsigned long low_mem_limit;
>  	int ret;
>  
> -	total_low_mem = memblock_mem_size(1UL << (32 - PAGE_SHIFT));
> +	low_mem_limit = min(memblock_phys_mem_size(), CRASH_ADDR_LOW_MAX);
>  
>  	/* crashkernel=Y,low */
> -	ret = parse_crashkernel_low(boot_command_line, total_low_mem, &low_size, &base);
> +	ret = parse_crashkernel_low(boot_command_line, low_mem_limit, &low_size, &base);
>  	if (ret) {
>  		/*
>  		 * two parts from kernel/dma/swiotlb.c:
> @@ -443,23 +443,17 @@ static int __init reserve_crashkernel_low(void)
>  			return 0;
>  	}
>  
> -	low_base = memblock_find_in_range(0, 1ULL << 32, low_size, CRASH_ALIGN);
> +	low_base = memblock_phys_alloc_range(low_size, CRASH_ALIGN, 0, CRASH_ADDR_LOW_MAX);
>  	if (!low_base) {
>  		pr_err("Cannot reserve %ldMB crashkernel low memory, please try smaller size.\n",
>  		       (unsigned long)(low_size >> 20));
>  		return -ENOMEM;
>  	}
>  
> -	ret = memblock_reserve(low_base, low_size);
> -	if (ret) {
> -		pr_err("%s: Error reserving crashkernel low memblock.\n", __func__);
> -		return ret;
> -	}
> -
> -	pr_info("Reserving %ldMB of low memory at %ldMB for crashkernel (System low RAM: %ldMB)\n",
> +	pr_info("Reserving %ldMB of low memory at %ldMB for crashkernel (low RAM limit: %ldMB)\n",
>  		(unsigned long)(low_size >> 20),
>  		(unsigned long)(low_base >> 20),
> -		(unsigned long)(total_low_mem >> 20));
> +		(unsigned long)(low_mem_limit >> 20));
>  
>  	crashk_low_res.start = low_base;
>  	crashk_low_res.end   = low_base + low_size - 1;
> @@ -503,13 +497,13 @@ static void __init reserve_crashkernel(void)
>  		 * unless "crashkernel=size[KMG],high" is specified.
>  		 */
>  		if (!high)
> -			crash_base = memblock_find_in_range(CRASH_ALIGN,
> -						CRASH_ADDR_LOW_MAX,
> -						crash_size, CRASH_ALIGN);
> +			crash_base = memblock_phys_alloc_range(crash_size,
> +						CRASH_ALIGN, CRASH_ALIGN,
> +						CRASH_ADDR_LOW_MAX);
>  		if (!crash_base)
> -			crash_base = memblock_find_in_range(CRASH_ALIGN,
> -						CRASH_ADDR_HIGH_MAX,
> -						crash_size, CRASH_ALIGN);
> +			crash_base = memblock_phys_alloc_range(crash_size,
> +						CRASH_ALIGN, CRASH_ALIGN,
> +						CRASH_ADDR_HIGH_MAX);
>  		if (!crash_base) {
>  			pr_info("crashkernel reservation failed - No suitable area found.\n");
>  			return;
> @@ -517,19 +511,13 @@ static void __init reserve_crashkernel(void)
>  	} else {
>  		unsigned long long start;
>  
> -		start = memblock_find_in_range(crash_base,
> -					       crash_base + crash_size,
> -					       crash_size, 1 << 20);
> +		start = memblock_phys_alloc_range(crash_size, SZ_1M, crash_base,
> +						  crash_base + crash_size);
>  		if (start != crash_base) {
>  			pr_info("crashkernel reservation failed - memory is in use.\n");
>  			return;
>  		}
>  	}
> -	ret = memblock_reserve(crash_base, crash_size);
> -	if (ret) {
> -		pr_err("%s: Error reserving crashkernel memblock.\n", __func__);
> -		return;
> -	}
>  
>  	if (crash_base >= (1ULL << 32) && reserve_crashkernel_low()) {
>  		memblock_free(crash_base, crash_size);
> -- 
> 2.26.2
> 

