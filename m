Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9F3F08AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 18:04:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqXl94vcyz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 02:04:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c3J7mLhy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c3J7mLhy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=c3J7mLhy; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=c3J7mLhy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqXkN5wr7z2yfc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 02:03:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629302599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geMsOaSX8G2jQ6SrVG274+400JaUA+Ul+P9UImTHy3w=;
 b=c3J7mLhyhxmslFQ78BUgkcuSpjJ9f8K9O7nb4/W9BsoHa2mxPuuEpA/TbrSYS0D9QAjz3C
 xLmWGrU3E0eb5F4ikGSPqFJfGQS5STdM0gODXvL84t7B08ku8TSo6T4XH5ODfNkfaE4PkG
 1bt5BlIfBTWks38AfqIWasiDQ7nlM7c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629302599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geMsOaSX8G2jQ6SrVG274+400JaUA+Ul+P9UImTHy3w=;
 b=c3J7mLhyhxmslFQ78BUgkcuSpjJ9f8K9O7nb4/W9BsoHa2mxPuuEpA/TbrSYS0D9QAjz3C
 xLmWGrU3E0eb5F4ikGSPqFJfGQS5STdM0gODXvL84t7B08ku8TSo6T4XH5ODfNkfaE4PkG
 1bt5BlIfBTWks38AfqIWasiDQ7nlM7c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-zVclq6OIPu2PY6lh3NytjQ-1; Wed, 18 Aug 2021 12:03:18 -0400
X-MC-Unique: zVclq6OIPu2PY6lh3NytjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 10-20020a05600c024a00b002e6bf2ee820so2392701wmj.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 09:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=geMsOaSX8G2jQ6SrVG274+400JaUA+Ul+P9UImTHy3w=;
 b=Q1/tQinR1ciT+scnfnB43h0Z7BfZjpABq7QDTpUpbnXEb+yqyUlv+68X2XczI4JI7T
 ffaGkwtq3gigD8mNdp0OxaGsTzM5NxHzEUcaMupctzBeDAJZ+wqJt2RFyAZlorJFap8r
 iq5kBScBhzmaAgUICHpohBGJgdnhBdGrFHG3mf3ibo9c8DMLIObfcdu1z5Eh/ri5mfMy
 e2Ay47os0gON0mwaBx17hk1e80yx5bzOFlJxHwjmP4qzqqLKsPIYQtmi274AMyodVzqO
 W1H2qRZdtC3zQ+tDhVUioeZz5HTQb3SGDFLgt7TYMSmw1aRySePlabZ9OcovdUM3D78Z
 /i/Q==
X-Gm-Message-State: AOAM531qZUNL8I10nZ/QOuH0GuoyztiH9eMwV6+znxH3cnb5vIcYXC2E
 PGsWaMA4GqDMcS1yY7rPocK5ZbM3reEG0Aw+xKcKLh/Lf6SLGpGnfGDs5Ol0jYu1XP5hbjJL+aZ
 xlu2XZnZ8HfB7Wl1aY5l2+Qbgzg==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr9251242wme.74.1629302596803;
 Wed, 18 Aug 2021 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqQ4O1fShvS8d12r/Ta379U55FYE4B7YUvjAFZfdblVR0tYkFtq/pVYIC6v0kgE19S7J8DBw==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr9251212wme.74.1629302596534;
 Wed, 18 Aug 2021 09:03:16 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.22.194])
 by smtp.gmail.com with ESMTPSA id 19sm236316wmj.23.2021.08.18.09.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 09:03:16 -0700 (PDT)
Subject: Re: [PATCH v2] powerpc/mm: Fix set_memory_*() against concurrent
 accesses
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210818120518.3603172-1-mpe@ellerman.id.au>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <15f0e863-6c86-50ef-51ec-64bb981734e5@redhat.com>
Date: Wed, 18 Aug 2021 18:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818120518.3603172-1-mpe@ellerman.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: jniethe5@gmail.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com,
 farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/08/2021 14:05, Michael Ellerman wrote:
> Laurent reported that STRICT_MODULE_RWX was causing intermittent crashes
> on one of his systems:
> 
>   kernel tried to execute exec-protected page (c008000004073278) - exploit attempt? (uid: 0)
>   BUG: Unable to handle kernel instruction fetch
>   Faulting instruction address: 0xc008000004073278
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>   Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks ...
>   CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
>   Workqueue: events control_work_handler [virtio_console]
>   NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
>   REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
>   MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822 XER: 200400cf
>   ...
>   NIP fill_queue+0xf0/0x210 [virtio_console]
>   LR  fill_queue+0xf0/0x210 [virtio_console]
>   Call Trace:
>     fill_queue+0xb4/0x210 [virtio_console] (unreliable)
>     add_port+0x1a8/0x470 [virtio_console]
>     control_work_handler+0xbc/0x1e8 [virtio_console]
>     process_one_work+0x290/0x590
>     worker_thread+0x88/0x620
>     kthread+0x194/0x1a0
>     ret_from_kernel_thread+0x5c/0x64
> 
> Jordan, Fabiano & Murilo were able to reproduce and identify that the
> problem is caused by the call to module_enable_ro() in do_init_module(),
> which happens after the module's init function has already been called.
> 
> Our current implementation of change_page_attr() is not safe against
> concurrent accesses, because it invalidates the PTE before flushing the
> TLB and then installing the new PTE. That leaves a window in time where
> there is no valid PTE for the page, if another CPU tries to access the
> page at that time we see something like the fault above.
> 
> We can't simply switch to set_pte_at()/flush TLB, because our hash MMU
> code doesn't handle a set_pte_at() of a valid PTE. See [1].
> 
> But we do have pte_update(), which replaces the old PTE with the new,
> meaning there's no window where the PTE is invalid. And the hash MMU
> version hash__pte_update() deals with synchronising the hash page table
> correctly.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/
> 
> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/pageattr.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> v2: Use pte_update(..., ~0, pte_val(pte), ...) as suggested by Fabiano,
>     and ptep_get() as suggested by Christophe.
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 0876216ceee6..edea388e9d3f 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -18,16 +18,12 @@
>  /*
>   * Updates the attributes of a page in three steps:
>   *
> - * 1. invalidate the page table entry
> - * 2. flush the TLB
> - * 3. install the new entry with the updated attributes
> - *
> - * Invalidating the pte means there are situations where this will not work
> - * when in theory it should.
> - * For example:
> - * - removing write from page whilst it is being executed
> - * - setting a page read-only whilst it is being read by another CPU
> + * 1. take the page_table_lock
> + * 2. install the new entry with the updated attributes
> + * 3. flush the TLB
>   *
> + * This sequence is safe against concurrent updates, and also allows updating the
> + * attributes of a page currently being executed or accessed.
>   */
>  static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>  {
> @@ -36,9 +32,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>  
>  	spin_lock(&init_mm.page_table_lock);
>  
> -	/* invalidate the PTE so it's safe to modify */
> -	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	pte = ptep_get(ptep);
>  
>  	/* modify the PTE bits as desired, then apply */
>  	switch (action) {
> @@ -59,11 +53,14 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>  		break;
>  	}
>  
> -	set_pte_at(&init_mm, addr, ptep, pte);
> +	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);
>  
>  	/* See ptesync comment in radix__set_pte_at() */
>  	if (radix_enabled())
>  		asm volatile("ptesync": : :"memory");
> +
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
>  	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
> 
> base-commit: cbc06f051c524dcfe52ef0d1f30647828e226d30
> 

Tested-by: Laurent Vivier <lvivier@redhat.com>

