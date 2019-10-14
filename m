Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A3D6489
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 16:00:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sKvC25cfzDqsD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 01:00:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="e19PdnTI"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sKrc6kStzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 00:57:51 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id p30so10189973pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=w+qQ12zqF6/LBMHQ5Fp2IFcdj8n4Em4zE18BXC0o5qc=;
 b=e19PdnTITiRHT8BkzMqzQslGAm0ePSp/Ygo3EPANA7IZYnPaqVYFwlLTDbRE6C315S
 Fq2C21+LeOwUqC/5Q0/LhjsGkUjHkd4DrizycDmZ0CIZWjRjTpzT65GyR2KpdrUv/NzQ
 ty+P8L2qB0/AsSbQ6iwuWlgckd43Y8kX2DTOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=w+qQ12zqF6/LBMHQ5Fp2IFcdj8n4Em4zE18BXC0o5qc=;
 b=Q3Ll/ytPfM3Hh4AHSQ2mprTMCbEnDaZ9NZMFuSj52iiKbLVSZZju3TVJrWVUBV/MOa
 2nG//KZUbj4wyTlyOGK+7jYtr5IVake+J8IDbus4CtWOrHVKQXmLlI/4HT90xnqDbVU+
 TO2uZC07ZRgw/ixnKxc5TDt8oHyxNGY7JMtsr8Lj4BUnJP85G1XRUcUQE3voHUkKlGKT
 KRupDEevXcCbay/XOUlD6KDVcoGnNWrLdXNmSYKXSATeMc1YaD2cl1dsfsLVe3uR93gk
 kUR89SPaXA+0UzLb3MtHbVZYELFH96aFcAxMb+9uKiERKy0mB+8eGHVC9O8IYZtHX4rO
 MFig==
X-Gm-Message-State: APjAAAXj1ZuaKdwsjLWl4zyOje/OkQuTrWUsUEfIBUhUcb25rLPl8+pr
 Nl/Cf999LN3nluiIBpxBdO5bgQ==
X-Google-Smtp-Source: APXvYqxv6ZzjyfwcTFL8mtTDtffryluSc6uc9hQ8Klc9iZGNvmBj4sktnP0dv9DvdOb4Ap0KWjNLDQ==
X-Received: by 2002:a63:1d8:: with SMTP id 207mr17320083pgb.366.1571061468959; 
 Mon, 14 Oct 2019 06:57:48 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id z4sm15608752pjt.17.2019.10.14.06.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 06:57:48 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
Date: Tue, 15 Oct 2019 00:57:44 +1100
Message-ID: <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Andrey,


>> +	/*
>> +	 * Ensure poisoning is visible before the shadow is made visible
>> +	 * to other CPUs.
>> +	 */
>> +	smp_wmb();
>
> I'm not quite understand what this barrier do and why it needed.
> And if it's really needed there should be a pairing barrier
> on the other side which I don't see.

Mark might be better able to answer this, but my understanding is that
we want to make sure that we never have a situation where the writes are
reordered so that PTE is installed before all the poisioning is written
out. I think it follows the logic in __pte_alloc() in mm/memory.c:

	/*
	 * Ensure all pte setup (eg. pte page lock and page clearing) are
	 * visible before the pte is made visible to other CPUs by being
	 * put into page tables.
	 *
	 * The other side of the story is the pointer chasing in the page
	 * table walking code (when walking the page table without locking;
	 * ie. most of the time). Fortunately, these data accesses consist
	 * of a chain of data-dependent loads, meaning most CPUs (alpha
	 * being the notable exception) will already guarantee loads are
	 * seen in-order. See the alpha page table accessors for the
	 * smp_read_barrier_depends() barriers in page table walking code.
	 */
	smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */

I can clarify the comment.

>> +
>> +	spin_lock(&init_mm.page_table_lock);
>> +	if (likely(pte_none(*ptep))) {
>> +		set_pte_at(&init_mm, addr, ptep, pte);
>> +		page = 0;
>> +	}
>> +	spin_unlock(&init_mm.page_table_lock);
>> +	if (page)
>> +		free_page(page);
>> +	return 0;
>> +}
>> +
>
>
> ...
>
>> @@ -754,6 +769,8 @@ merge_or_add_vmap_area(struct vmap_area *va,
>>  	}
>>  
>>  insert:
>> +	kasan_release_vmalloc(orig_start, orig_end, va->va_start, va->va_end);
>> +
>>  	if (!merged) {
>>  		link_va(va, root, parent, link, head);
>>  		augment_tree_propagate_from(va);
>> @@ -2068,6 +2085,22 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
>>  
>>  	setup_vmalloc_vm(area, va, flags, caller);
>>  
>> +	/*
>> +	 * For KASAN, if we are in vmalloc space, we need to cover the shadow
>> +	 * area with real memory. If we come here through VM_ALLOC, this is
>> +	 * done by a higher level function that has access to the true size,
>> +	 * which might not be a full page.
>> +	 *
>> +	 * We assume module space comes via VM_ALLOC path.
>> +	 */
>> +	if (is_vmalloc_addr(area->addr) && !(area->flags & VM_ALLOC)) {
>> +		if (kasan_populate_vmalloc(area->size, area)) {
>> +			unmap_vmap_area(va);
>> +			kfree(area);
>> +			return NULL;
>> +		}
>> +	}
>> +
>>  	return area;
>>  }
>>  
>> @@ -2245,6 +2278,9 @@ static void __vunmap(const void *addr, int deallocate_pages)
>>  	debug_check_no_locks_freed(area->addr, get_vm_area_size(area));
>>  	debug_check_no_obj_freed(area->addr, get_vm_area_size(area));
>>  
>> +	if (area->flags & VM_KASAN)
>> +		kasan_poison_vmalloc(area->addr, area->size);
>> +
>>  	vm_remove_mappings(area, deallocate_pages);
>>  
>>  	if (deallocate_pages) {
>> @@ -2497,6 +2533,9 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
>>  	if (!addr)
>>  		return NULL;
>>  
>> +	if (kasan_populate_vmalloc(real_size, area))
>> +		return NULL;
>> +
>
> KASAN itself uses __vmalloc_node_range() to allocate and map shadow in memory online callback.
> So we should either skip non-vmalloc and non-module addresses here or teach kasan's memory online/offline
> callbacks to not use __vmalloc_node_range() (do something similar to kasan_populate_vmalloc() perhaps?). 

Ah, right you are. I haven't been testing that.

I am a bit nervous about further restricting kasan_populate_vmalloc: I
seem to remember having problems with code using the vmalloc family of
functions to map memory that doesn't lie within vmalloc space but which
still has instrumented accesses.

On the other hand, I'm not keen on rewriting any of the memory
on/offline code if I can avoid it!

I'll have a look and get back you as soon as I can.

Thanks for catching this.

Kind regards,
Daniel

>
> -- 
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/352cb4fa-2e57-7e3b-23af-898e113bbe22%40virtuozzo.com.
