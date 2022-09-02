Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAFF5AA85F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 08:54:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJpXx2vNFz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 16:53:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSAJyKI1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSAJyKI1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSAJyKI1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSAJyKI1;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJpXD4JB1z2xfv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 16:53:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662101594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+57PdWMxpBWbQjargyaqlxNH+Zcmno8dXbh3sZc6/c=;
	b=NSAJyKI1OzMusRWmc9xm0T7junBLWZK0BQb5u1L5PilV5/iWSLXHSRIk4rGxbMCA89aFiY
	1uObkmayh9HTYMYu457YqMOOaKnMltSEKQY+kDK5godGc8GaMw2nGMW6BGT8Q5KptkM87v
	QKsGWQl1S478qkp2kGPQPvTVMVor7Jg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662101594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+57PdWMxpBWbQjargyaqlxNH+Zcmno8dXbh3sZc6/c=;
	b=NSAJyKI1OzMusRWmc9xm0T7junBLWZK0BQb5u1L5PilV5/iWSLXHSRIk4rGxbMCA89aFiY
	1uObkmayh9HTYMYu457YqMOOaKnMltSEKQY+kDK5godGc8GaMw2nGMW6BGT8Q5KptkM87v
	QKsGWQl1S478qkp2kGPQPvTVMVor7Jg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-4yFUujH8PRCOC5Qz5gCOWw-1; Fri, 02 Sep 2022 02:53:13 -0400
X-MC-Unique: 4yFUujH8PRCOC5Qz5gCOWw-1
Received: by mail-wm1-f69.google.com with SMTP id r83-20020a1c4456000000b003a7b679981cso2495222wma.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 23:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=h+57PdWMxpBWbQjargyaqlxNH+Zcmno8dXbh3sZc6/c=;
        b=y3rlzIGPCRIJ/sDiGqvuoVqIsG+L4YT684JytlCQKKdgUqQhajhqZm0vVruo/HPyXZ
         1YNFJyt7lC2sRJr4YgXafT92CEZhlDxuNVydjNGf9HjXbkrAiURgs246xEx8spgas2Sx
         kbpFhxT4z31D3y6ilq50l4UPr3J+Nx8ohWULs1p/DNsZwHxEpOecwHoSi2czHCEPeIgW
         TctWmRKaA2hRcNGB03xSRaCsjMbX1pZU85U0RhFQnKieoBDfmvvuXy1cNB+UrRVDL3Qw
         nNEqYiT1whT4rpTtB7se6T4aM2EYEZVrRxCY9RMkjGOEAWpauRG1UN/EbcPcAFnMZGR/
         WO8g==
X-Gm-Message-State: ACgBeo03AoiPO1i673GY2hu4+s20JON7ROOCcFLjG4Y28cbJ4gdtAoc/
	xdLoN1VFNU189rlMafPCqc9oEiZkvcYMonDNq8RwVcIYPRxGyFsdKuH8JYhhEFEN78hAsUAWjli
	xTWMTaP8YE8M2Yqm1FjO4Med+JQ==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id c14-20020adffb0e000000b0021a34a25ca9mr16886167wrr.472.1662101592037;
        Thu, 01 Sep 2022 23:53:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR72FIltlXb2TQPeyqyCZoaRVMW4kclo3DOPj63oymphdPfUvZp/uulcrUG16hwS6UnSef2yNw==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id c14-20020adffb0e000000b0021a34a25ca9mr16886135wrr.472.1662101591768;
        Thu, 01 Sep 2022 23:53:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:4800:2077:1bf6:40e7:2833? (p200300cbc714480020771bf640e72833.dip0.t-ipconnect.de. [2003:cb:c714:4800:2077:1bf6:40e7:2833])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d654f000000b002211fc70174sm842621wrv.99.2022.09.01.23.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 23:53:11 -0700 (PDT)
Message-ID: <2fccd4c1-d12f-334c-3fab-24a84bcac007@redhat.com>
Date: Fri, 2 Sep 2022 08:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/4] mm/migrate_device.c: Copy pte dirty bit to page
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
 <dd48e4882ce859c295c1a77612f66d198b0403f9.1662078528.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <dd48e4882ce859c295c1a77612f66d198b0403f9.1662078528.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, "Huang, Ying" <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.09.22 02:35, Alistair Popple wrote:
> migrate_vma_setup() has a fast path in migrate_vma_collect_pmd() that
> installs migration entries directly if it can lock the migrating page.
> When removing a dirty pte the dirty bit is supposed to be carried over
> to the underlying page to prevent it being lost.
> 
> Currently migrate_vma_*() can only be used for private anonymous
> mappings. That means loss of the dirty bit usually doesn't result in
> data loss because these pages are typically not file-backed. However
> pages may be backed by swap storage which can result in data loss if an
> attempt is made to migrate a dirty page that doesn't yet have the
> PageDirty flag set.
> 
> In this case migration will fail due to unexpected references but the
> dirty pte bit will be lost. If the page is subsequently reclaimed data
> won't be written back to swap storage as it is considered uptodate,
> resulting in data loss if the page is subsequently accessed.
> 
> Prevent this by copying the dirty bit to the page when removing the pte
> to match what try_to_migrate_one() does.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: "Huang, Ying" <ying.huang@intel.com>
> Reported-by: "Huang, Ying" <ying.huang@intel.com>
> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> Cc: stable@vger.kernel.org
> 
> ---
> 
> Changes for v4:
> 
>  - Added Reviewed-by
> 
> Changes for v3:
> 
>  - Defer TLB flushing
>  - Split a TLB flushing fix into a separate change.
> 
> Changes for v2:
> 
>  - Fixed up Reported-by tag.
>  - Added Peter's Acked-by.
>  - Atomically read and clear the pte to prevent the dirty bit getting
>    set after reading it.
>  - Added fixes tag
> ---
>  mm/migrate_device.c |  9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 4cc849c..dbf6c7a 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -7,6 +7,7 @@
>  #include <linux/export.h>
>  #include <linux/memremap.h>
>  #include <linux/migrate.h>
> +#include <linux/mm.h>
>  #include <linux/mm_inline.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/oom.h>
> @@ -196,7 +197,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			flush_cache_page(vma, addr, pte_pfn(*ptep));
>  			anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
>  			if (anon_exclusive) {
> -				ptep_clear_flush(vma, addr, ptep);
> +				pte = ptep_clear_flush(vma, addr, ptep);
>  
>  				if (page_try_share_anon_rmap(page)) {
>  					set_pte_at(mm, addr, ptep, pte);
> @@ -206,11 +207,15 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  					goto next;
>  				}
>  			} else {
> -				ptep_get_and_clear(mm, addr, ptep);
> +				pte = ptep_get_and_clear(mm, addr, ptep);
>  			}
>  
>  			migrate->cpages++;
>  
> +			/* Set the dirty flag on the folio now the pte is gone. */
> +			if (pte_dirty(pte))
> +				folio_mark_dirty(page_folio(page));
> +
>  			/* Setup special migration page table entry */
>  			if (mpfn & MIGRATE_PFN_WRITE)
>  				entry = make_writable_migration_entry(


This matches what we do in try_to_unmap_one()

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

