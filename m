Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF4424FE2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 11:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ5L035Fsz3bj6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 20:16:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lw7uvG7z;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8xCq5Ego;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Lw7uvG7z; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8xCq5Ego; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ5KJ3KVqz2xX2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 20:16:04 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C5D96203F6;
 Thu,  7 Oct 2021 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633598161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CxQ0ZV9cOOlrG2jRElhDboOH1/ncgOGYv8QD9De0aOg=;
 b=Lw7uvG7zBKms7sqR9dWZKsIPebzq3igxLuZw//KJ82jkCbX/WVCIt+ohnaMwcuCzgj/X1o
 5LlB2SJRb5Ft6RYdOCD+LQrhcspETJZ1NLEHzDutE/2DBaNkPZs15JDb3Rep0F/TldZLNc
 Z2meDzCll9YQpTWNJgF3nkYIoYernHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633598161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CxQ0ZV9cOOlrG2jRElhDboOH1/ncgOGYv8QD9De0aOg=;
 b=8xCq5EgoVY5xRbt7QHo29GOnRCfknfEkb/GRje1CC6D7omn0OivrSNXVnP7veEnFhiakWa
 e7XgNEG+K5LURCDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5941613A98;
 Thu,  7 Oct 2021 09:16:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dPciE9C6XmHkLgAAMHmgww
 (envelope-from <osalvador@suse.de>); Thu, 07 Oct 2021 09:16:00 +0000
Date: Thu, 7 Oct 2021 11:15:58 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 6/6] x86: remove memory hotplug support on X86_32
Message-ID: <YV66zoLEP3niIHEu@localhost.localdomain>
References: <20210929143600.49379-1-david@redhat.com>
 <20210929143600.49379-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929143600.49379-7-david@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 04:36:00PM +0200, David Hildenbrand wrote:
> CONFIG_MEMORY_HOTPLUG was marked BROKEN over one year and we just
> restricted it to 64 bit. Let's remove the unused x86 32bit implementation
> and simplify the Kconfig.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  arch/x86/Kconfig      |  6 +++---
>  arch/x86/mm/init_32.c | 31 -------------------------------
>  2 files changed, 3 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index ab83c22d274e..85f4762429f1 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -62,7 +62,7 @@ config X86
>  	select ARCH_32BIT_OFF_T			if X86_32
>  	select ARCH_CLOCKSOURCE_INIT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE && MIGRATION
> -	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64 || (X86_32 && HIGHMEM)
> +	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
>  	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if (PGTABLE_LEVELS > 2) && (X86_64 || X86_PAE)
>  	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
> @@ -1615,7 +1615,7 @@ config ARCH_SELECT_MEMORY_MODEL
>  
>  config ARCH_MEMORY_PROBE
>  	bool "Enable sysfs memory/probe interface"
> -	depends on X86_64 && MEMORY_HOTPLUG
> +	depends on MEMORY_HOTPLUG
>  	help
>  	  This option enables a sysfs memory/probe interface for testing.
>  	  See Documentation/admin-guide/mm/memory-hotplug.rst for more information.
> @@ -2395,7 +2395,7 @@ endmenu
>  
>  config ARCH_HAS_ADD_PAGES
>  	def_bool y
> -	depends on X86_64 && ARCH_ENABLE_MEMORY_HOTPLUG
> +	depends on ARCH_ENABLE_MEMORY_HOTPLUG
>  
>  config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  	def_bool y
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index bd90b8fe81e4..5cd7ea6d645c 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -779,37 +779,6 @@ void __init mem_init(void)
>  	test_wp_bit();
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTPLUG
> -int arch_add_memory(int nid, u64 start, u64 size,
> -		    struct mhp_params *params)
> -{
> -	unsigned long start_pfn = start >> PAGE_SHIFT;
> -	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	int ret;
> -
> -	/*
> -	 * The page tables were already mapped at boot so if the caller
> -	 * requests a different mapping type then we must change all the
> -	 * pages with __set_memory_prot().
> -	 */
> -	if (params->pgprot.pgprot != PAGE_KERNEL.pgprot) {
> -		ret = __set_memory_prot(start, nr_pages, params->pgprot);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return __add_pages(nid, start_pfn, nr_pages, params);
> -}
> -
> -void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
> -{
> -	unsigned long start_pfn = start >> PAGE_SHIFT;
> -	unsigned long nr_pages = size >> PAGE_SHIFT;
> -
> -	__remove_pages(start_pfn, nr_pages, altmap);
> -}
> -#endif
> -
>  int kernel_set_to_readonly __read_mostly;
>  
>  static void mark_nxdata_nx(void)
> -- 
> 2.31.1
> 
> 

-- 
Oscar Salvador
SUSE Labs
