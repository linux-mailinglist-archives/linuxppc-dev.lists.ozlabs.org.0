Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251ED4947
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 22:24:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qfYW28TVzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 07:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=virtuozzo.com
 (client-ip=185.231.240.75; helo=relay.sw.ru;
 envelope-from=aryabinin@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=virtuozzo.com
X-Greylist: delayed 1475 seconds by postgrey-1.36 at bilbo;
 Sat, 12 Oct 2019 07:22:28 AEDT
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qfWm1FlmzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 07:22:25 +1100 (AEDT)
Received: from [172.16.25.5] by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iJ12k-00055b-MW; Fri, 11 Oct 2019 22:57:42 +0300
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
Date: Fri, 11 Oct 2019 22:57:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001065834.8880-2-dja@axtens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/1/19 9:58 AM, Daniel Axtens wrote:
 
>  core_initcall(kasan_memhotplug_init);
>  #endif
> +
> +#ifdef CONFIG_KASAN_VMALLOC
> +static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
> +				      void *unused)
> +{
> +	unsigned long page;
> +	pte_t pte;
> +
> +	if (likely(!pte_none(*ptep)))
> +		return 0;
> +
> +	page = __get_free_page(GFP_KERNEL);
> +	if (!page)
> +		return -ENOMEM;
> +
> +	memset((void *)page, KASAN_VMALLOC_INVALID, PAGE_SIZE);
> +	pte = pfn_pte(PFN_DOWN(__pa(page)), PAGE_KERNEL);
> +
> +	/*
> +	 * Ensure poisoning is visible before the shadow is made visible
> +	 * to other CPUs.
> +	 */
> +	smp_wmb();

I'm not quite understand what this barrier do and why it needed.
And if it's really needed there should be a pairing barrier
on the other side which I don't see.

> +
> +	spin_lock(&init_mm.page_table_lock);
> +	if (likely(pte_none(*ptep))) {
> +		set_pte_at(&init_mm, addr, ptep, pte);
> +		page = 0;
> +	}
> +	spin_unlock(&init_mm.page_table_lock);
> +	if (page)
> +		free_page(page);
> +	return 0;
> +}
> +


...

> @@ -754,6 +769,8 @@ merge_or_add_vmap_area(struct vmap_area *va,
>  	}
>  
>  insert:
> +	kasan_release_vmalloc(orig_start, orig_end, va->va_start, va->va_end);
> +
>  	if (!merged) {
>  		link_va(va, root, parent, link, head);
>  		augment_tree_propagate_from(va);
> @@ -2068,6 +2085,22 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
>  
>  	setup_vmalloc_vm(area, va, flags, caller);
>  
> +	/*
> +	 * For KASAN, if we are in vmalloc space, we need to cover the shadow
> +	 * area with real memory. If we come here through VM_ALLOC, this is
> +	 * done by a higher level function that has access to the true size,
> +	 * which might not be a full page.
> +	 *
> +	 * We assume module space comes via VM_ALLOC path.
> +	 */
> +	if (is_vmalloc_addr(area->addr) && !(area->flags & VM_ALLOC)) {
> +		if (kasan_populate_vmalloc(area->size, area)) {
> +			unmap_vmap_area(va);
> +			kfree(area);
> +			return NULL;
> +		}
> +	}
> +
>  	return area;
>  }
>  
> @@ -2245,6 +2278,9 @@ static void __vunmap(const void *addr, int deallocate_pages)
>  	debug_check_no_locks_freed(area->addr, get_vm_area_size(area));
>  	debug_check_no_obj_freed(area->addr, get_vm_area_size(area));
>  
> +	if (area->flags & VM_KASAN)
> +		kasan_poison_vmalloc(area->addr, area->size);
> +
>  	vm_remove_mappings(area, deallocate_pages);
>  
>  	if (deallocate_pages) {
> @@ -2497,6 +2533,9 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
>  	if (!addr)
>  		return NULL;
>  
> +	if (kasan_populate_vmalloc(real_size, area))
> +		return NULL;
> +

KASAN itself uses __vmalloc_node_range() to allocate and map shadow in memory online callback.
So we should either skip non-vmalloc and non-module addresses here or teach kasan's memory online/offline
callbacks to not use __vmalloc_node_range() (do something similar to kasan_populate_vmalloc() perhaps?). 
