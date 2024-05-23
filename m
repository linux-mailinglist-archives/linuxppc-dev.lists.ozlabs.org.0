Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id AF9288CD6C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 17:11:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dsR/erEG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlWcb2Zpqz78wj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 01:02:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dsR/erEG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlWbq2wrgz3vZb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 01:01:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A23DB62853;
	Thu, 23 May 2024 15:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F92C32781;
	Thu, 23 May 2024 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716476511;
	bh=vjt+cmVcTd/Pb33Pdy5i3IcyArhpy6Hbpole/X6gRcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsR/erEGWqTrpUYgBr8bhaGLVokjd8cGzstRgXhQ2zvCED20LY5mA0MnJl4aB4HJc
	 La4XclaMTB3PLF5t0NJgcHpcBikZatrx9W4WY9ygCpu1jkJvp4V89pXQqDXr566CAL
	 gTkjCgb0GVECIIBAC7rE9Vcc1BNWnE1kQBSn89vMljOj6PktOdWsJ4kFOSyrO2FQOr
	 YJRZELiVBmkHdkK9xYQW0SBB5IY9tYW95xCXMJLE7tBB8hjy9m3a/szl7vBydpvJgo
	 1cI8r/UjUvpLRpRRJc65nGhaaJ0KJTCyhyGWqb4hhOTwLwf4mJQ8SN2F9cBm49eRrj
	 334Kp8GdszKmQ==
Date: Thu, 23 May 2024 17:59:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v2] mm/mm_init: use node's number of cpus in
 deferred_page_init_max_threads
Message-ID: <Zk9Z7S_wbumOekP6@kernel.org>
References: <20240522203758.626932-4-echanude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522203758.626932-4-echanude@redhat.com>
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, Baoquan He <bhe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Nick Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 22, 2024 at 04:38:01PM -0400, Eric Chanudet wrote:
> x86_64 is already using the node's cpu as maximum threads. Make that the
> default for all archs setting DEFERRED_STRUCT_PAGE_INIT.
> 
> This returns to the behavior prior making the function arch-specific
> with commit ecd096506922 ("mm: make deferred init's max threads
> arch-specific").
> 
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> 
> ---
> Setting DEFERRED_STRUCT_PAGE_INIT and testing on a few arm64 platforms
> shows faster deferred_init_memmap completions:
> 
> |         | x13s        | SA8775p-ride | Ampere R137-P31 | Ampere HR330 |
> |         | Metal, 32GB | VM, 36GB     | VM, 58GB        | Metal, 128GB |
> |         | 8cpus       | 8cpus        | 8cpus           | 32cpus       |
> |---------|-------------|--------------|-----------------|--------------|
> | threads |  ms     (%) | ms       (%) |  ms         (%) |  ms      (%) |
> |---------|-------------|--------------|-----------------|--------------|
> | 1       | 108    (0%) | 72      (0%) | 224        (0%) | 324     (0%) |
> | cpus    |  24  (-77%) | 36    (-50%) |  40      (-82%) |  56   (-82%) |
> 
> - v1: https://lore.kernel.org/linux-arm-kernel/20240520231555.395979-5-echanude@redhat.com
> - Changes since v1:
>  - Make the generic function return the number of cpus of the node as
>    max threads limit instead overriding it for arm64.
> - Drop Baoquan He's R-b on v1 since the logic changed.
> - Add CCs according to patch changes (ppc and s390 set
>   DEFERRED_STRUCT_PAGE_INIT by default).
> 
>  arch/x86/mm/init_64.c | 12 ------------
>  mm/mm_init.c          |  2 +-
>  2 files changed, 1 insertion(+), 13 deletions(-)
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
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index f72b852bd5b8..e0023aa68555 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -2126,7 +2126,7 @@ deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
>  __weak int __init

If s390 folks confirm there's no regression for them I think we can make
this static.

>  deferred_page_init_max_threads(const struct cpumask *node_cpumask)
>  {
> -	return 1;
> +	return max_t(int, cpumask_weight(node_cpumask), 1);
>  }
>  
>  /* Initialise remaining memory on a node */
> -- 
> 2.44.0
> 

-- 
Sincerely yours,
Mike.
