Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id EEFF08D3260
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 10:56:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=In7miBU2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=In7miBU2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq3386v8sz79H4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 18:49:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=In7miBU2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=In7miBU2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq32P06RZz3vXH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 18:48:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716972521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=znIpA3udPqKI4MZkxSxCZR6WCKKDK3sQ7qzxLXZGsaI=;
	b=In7miBU205BHJqcmbYRN7dkSXzYRmcxx5I8pEgO2Fn989rgoRInV5N+M/DxQmWS356xWud
	VmbuMkUo2g34ZComvu5IRu1cHS6RCX632hMi2gX/pRDfxuxr0iIcolzn/gbeFXbO/Z3qO+
	9EKxxzZni3MgKvf/E9HtV6mQhd4VpeU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716972521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=znIpA3udPqKI4MZkxSxCZR6WCKKDK3sQ7qzxLXZGsaI=;
	b=In7miBU205BHJqcmbYRN7dkSXzYRmcxx5I8pEgO2Fn989rgoRInV5N+M/DxQmWS356xWud
	VmbuMkUo2g34ZComvu5IRu1cHS6RCX632hMi2gX/pRDfxuxr0iIcolzn/gbeFXbO/Z3qO+
	9EKxxzZni3MgKvf/E9HtV6mQhd4VpeU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-fYMqePKiMEm9xRyDkphb7w-1; Wed, 29 May 2024 04:48:37 -0400
X-MC-Unique: fYMqePKiMEm9xRyDkphb7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90DC185A58C;
	Wed, 29 May 2024 08:48:36 +0000 (UTC)
Received: from localhost (unknown [10.72.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDD611C0D104;
	Wed, 29 May 2024 08:48:34 +0000 (UTC)
Date: Wed, 29 May 2024 16:48:31 +0800
From: Baoquan He <bhe@redhat.com>
To: Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v3] mm/mm_init: use node's number of cpus in
 deferred_page_init_max_threads
Message-ID: <Zlbr38h/kwxMWLLs@MiWiFi-R3L-srv>
References: <20240528185455.643227-4-echanude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528185455.643227-4-echanude@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Nick Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, linux-arm-kernel@lists.infradead.org, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/28/24 at 02:54pm, Eric Chanudet wrote:
> When DEFERRED_STRUCT_PAGE_INIT=y, use a node's cpu count as maximum
> thread count for the deferred initialization of struct pages via padata.
> This should result in shorter boot times for these configurations by
> going through page_alloc_init_late() faster as systems tend not to be
> under heavy load that early in the bootstrap.
> 
> Only x86_64 does that now. Make it archs agnostic when
> DEFERRED_STRUCT_PAGE_INIT is set. With the default defconfigs, that
> includes powerpc and s390.
> 
> It used to be so before offering archs to override the function for
> tuning with commit ecd096506922 ("mm: make deferred init's max threads
> arch-specific").
> 
> Setting DEFERRED_STRUCT_PAGE_INIT and testing on a few arm64 platforms
> shows faster deferred_init_memmap completions:
> |         | x13s        | SA8775p-ride | Ampere R137-P31 | Ampere HR330 |
> |         | Metal, 32GB | VM, 36GB     | VM, 58GB        | Metal, 128GB |
> |         | 8cpus       | 8cpus        | 8cpus           | 32cpus       |
> |---------|-------------|--------------|-----------------|--------------|
> | threads |  ms     (%) | ms       (%) |  ms         (%) |  ms      (%) |
> |---------|-------------|--------------|-----------------|--------------|
> | 1       | 108    (0%) | 72      (0%) | 224        (0%) | 324     (0%) |
> | cpus    |  24  (-77%) | 36    (-50%) |  40      (-82%) |  56   (-82%) |
> 
> Michael Ellerman on a powerpc machine (1TB, 40 cores, 4KB pages) reports
> faster deferred_init_memmap from 210-240ms to 90-110ms between nodes.
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> ---
> - v1: https://lore.kernel.org/linux-arm-kernel/20240520231555.395979-5-echanude@redhat.com
> - Changes since v1:
>  - Make the generic function return the number of cpus of the node as
>    max threads limit instead overriding it for arm64.
>  - Drop Baoquan He's R-b on v1 since the logic changed.
>  - Add CCs according to patch changes (ppc and s390 set
>    DEFERRED_STRUCT_PAGE_INIT by default).
> 
> - v2: https://lore.kernel.org/linux-arm-kernel/20240522203758.626932-4-echanude@redhat.com/
> - Changes since v2:
>  - deferred_page_init_max_threads returns unsigned and use max instead
>    of max_t.
>  - Make deferred_page_init_max_threads static since there are no more
>    override.
>  - Rephrase description.
>  - Add T-b and report from Michael Ellerman.
> 
>  arch/x86/mm/init_64.c    | 12 ------------
>  include/linux/memblock.h |  2 --
>  mm/mm_init.c             |  5 ++---
>  3 files changed, 2 insertions(+), 17 deletions(-)

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 7e177856ee4f..adec42928ec1 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1354,18 +1354,6 @@ void __init mem_init(void)
>  	preallocate_vmalloc_pages();
>  }
>  
> -#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
> -int __init deferred_page_init_max_threads(const struct cpumask *node_cpumask)
> -{
> -	/*
> -	 * More CPUs always led to greater speedups on tested systems, up to
> -	 * all the nodes' CPUs.  Use all since the system is otherwise idle
> -	 * now.
> -	 */
> -	return max_t(int, cpumask_weight(node_cpumask), 1);
> -}
> -#endif
> -
>  int kernel_set_to_readonly;
>  
>  void mark_rodata_ro(void)
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index e2082240586d..40c62aca36ec 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -335,8 +335,6 @@ void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
>  	for (; i != U64_MAX;					  \
>  	     __next_mem_pfn_range_in_zone(&i, zone, p_start, p_end))
>  
> -int __init deferred_page_init_max_threads(const struct cpumask *node_cpumask);
> -
>  #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
>  
>  /**
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index f72b852bd5b8..acfeba508796 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -2122,11 +2122,10 @@ deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
>  	}
>  }
>  
> -/* An arch may override for more concurrency. */
> -__weak int __init
> +static unsigned int __init
>  deferred_page_init_max_threads(const struct cpumask *node_cpumask)
>  {
> -	return 1;
> +	return max(cpumask_weight(node_cpumask), 1U);
>  }
>  
>  /* Initialise remaining memory on a node */
> -- 
> 2.44.0
> 

