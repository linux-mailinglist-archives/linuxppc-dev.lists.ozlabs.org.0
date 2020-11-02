Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB942A26E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 10:21:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPnVD1tN7zDqRr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 20:21:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Zu2waH4r; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zu2waH4r; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPnSH4GrxzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 20:19:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604308796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Fw8UzFDCnhqj5U8VjwS50spEGfFEI10XeNVmZ9tLlQ=;
 b=Zu2waH4rE7HiHb8vMFx50g3SRWcFwIeC9vwC5230amnmz6+2qLjk7kGj6qnwAweLREBQGl
 8hehoUD/zJQMD757k02qVeREU07/2dGmQLzOae6n0KP2SFvXGK8W31b/zZ0qWbcIV55Dyo
 Min5rcJKiPEunm2gWp8iNzhe+JHHBI8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604308796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Fw8UzFDCnhqj5U8VjwS50spEGfFEI10XeNVmZ9tLlQ=;
 b=Zu2waH4rE7HiHb8vMFx50g3SRWcFwIeC9vwC5230amnmz6+2qLjk7kGj6qnwAweLREBQGl
 8hehoUD/zJQMD757k02qVeREU07/2dGmQLzOae6n0KP2SFvXGK8W31b/zZ0qWbcIV55Dyo
 Min5rcJKiPEunm2gWp8iNzhe+JHHBI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-r38_d9yVPFKybO8Ug1IDcw-1; Mon, 02 Nov 2020 04:19:52 -0500
X-MC-Unique: r38_d9yVPFKybO8Ug1IDcw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 482D2809DCF;
 Mon,  2 Nov 2020 09:19:47 +0000 (UTC)
Received: from [10.36.113.163] (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E85FB1002C16;
 Mon,  2 Nov 2020 09:19:36 +0000 (UTC)
Subject: Re: [PATCH v3 2/4] PM: hibernate: make direct map manipulations more
 explicit
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-3-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <55cd2a4a-cfa8-d420-66b3-a25fcdd9b876@redhat.com>
Date: Mon, 2 Nov 2020 10:19:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201101170815.9795-3-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01.11.20 18:08, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page may be
> not present in the direct map and has to be explicitly mapped before it
> could be copied.
> 
> Introduce hibernate_map_page() that will explicitly use
> set_direct_map_{default,invalid}_noflush() for ARCH_HAS_SET_DIRECT_MAP case
> and debug_pagealloc_map_pages() for DEBUG_PAGEALLOC case.
> 
> The remapping of the pages in safe_copy_page() presumes that it only
> changes protection bits in an existing PTE and so it is safe to ignore
> return value of set_direct_map_{default,invalid}_noflush().
> 
> Still, add a WARN_ON() so that future changes in set_memory APIs will not
> silently break hibernation.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>   include/linux/mm.h      | 12 ------------
>   kernel/power/snapshot.c | 30 ++++++++++++++++++++++++++++--
>   2 files changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1fc0609056dc..14e397f3752c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2927,16 +2927,6 @@ static inline bool debug_pagealloc_enabled_static(void)
>   #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
>   extern void __kernel_map_pages(struct page *page, int numpages, int enable);
>   
> -/*
> - * When called in DEBUG_PAGEALLOC context, the call should most likely be
> - * guarded by debug_pagealloc_enabled() or debug_pagealloc_enabled_static()
> - */
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable)
> -{
> -	__kernel_map_pages(page, numpages, enable);
> -}
> -
>   static inline void debug_pagealloc_map_pages(struct page *page,
>   					     int numpages, int enable)
>   {
> @@ -2948,8 +2938,6 @@ static inline void debug_pagealloc_map_pages(struct page *page,
>   extern bool kernel_page_present(struct page *page);
>   #endif	/* CONFIG_HIBERNATION */
>   #else	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable) {}
>   static inline void debug_pagealloc_map_pages(struct page *page,
>   					     int numpages, int enable) {}
>   #ifdef CONFIG_HIBERNATION
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index 46b1804c1ddf..054c8cce4236 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -76,6 +76,32 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
>   static inline void hibernate_restore_unprotect_page(void *page_address) {}
>   #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
>   
> +static inline void hibernate_map_page(struct page *page, int enable)
> +{
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> +		unsigned long addr = (unsigned long)page_address(page);
> +		int ret;
> +
> +		/*
> +		 * This should not fail because remapping a page here means
> +		 * that we only update protection bits in an existing PTE.
> +		 * It is still worth to have WARN_ON() here if something
> +		 * changes and this will no longer be the case.
> +		 */
> +		if (enable)
> +			ret = set_direct_map_default_noflush(page);
> +		else
> +			ret = set_direct_map_invalid_noflush(page);
> +
> +		if (WARN_ON(ret))
> +			return;

People seem to prefer pr_warn() now that production kernels have panic 
on warn enabled. It's weird.

> +
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	} else {
> +		debug_pagealloc_map_pages(page, 1, enable);

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

