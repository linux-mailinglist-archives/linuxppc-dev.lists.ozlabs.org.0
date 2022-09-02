Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 759CC5AA85D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 08:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJpX13JT2z3c6R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 16:53:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SB5oXvFn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SB5oXvFn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SB5oXvFn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SB5oXvFn;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJpVw6pTZz303P
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 16:52:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662101526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K2hN84B8hnb1JPYdOSNGVn39QYSxDPmK/SyG1a0JjEM=;
	b=SB5oXvFnOA+/HxHuxJNyRCTc+DXyJaNpv+b7tPwXJarR94osENb7jeSKncukqAkXUxEU8n
	TJDp51jzw2F92KVYFPGehHNZ02dhUULsqrp1SNvPQKkpwoVp8UeKuk4BMsOFYqatP4exoy
	x4MNqguzGAavwa4R+r9hNAExUYT7bWw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662101526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K2hN84B8hnb1JPYdOSNGVn39QYSxDPmK/SyG1a0JjEM=;
	b=SB5oXvFnOA+/HxHuxJNyRCTc+DXyJaNpv+b7tPwXJarR94osENb7jeSKncukqAkXUxEU8n
	TJDp51jzw2F92KVYFPGehHNZ02dhUULsqrp1SNvPQKkpwoVp8UeKuk4BMsOFYqatP4exoy
	x4MNqguzGAavwa4R+r9hNAExUYT7bWw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-iBD98MBcOdm8V27JOFOjXw-1; Fri, 02 Sep 2022 02:51:56 -0400
X-MC-Unique: iBD98MBcOdm8V27JOFOjXw-1
Received: by mail-wm1-f71.google.com with SMTP id h82-20020a1c2155000000b003a64d0510d9so722353wmh.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 23:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=K2hN84B8hnb1JPYdOSNGVn39QYSxDPmK/SyG1a0JjEM=;
        b=Pm8BaSoJLRmPcKKQogprnH0Pedf4LO6hd6krH/7W7wt/LZcV+Z30Ew2tYRtIR+aPeX
         u5IsNPJWZhqNo+q3Ewi80dBQWg5tTE9gcvlu2fXWUeYqtxdBpkdTCI5jMZbxFw8jCP5N
         xOe0jhb9ONCwpkDdA7IPKd1wJ/J4TcKs/jaSWRASDzMKxrwONjKHAazjAsS64mnLynFL
         B5xuueFKGWC+mIBhIShAjbxWQ5VN4psduKcqgSgrRckPExa+eNsp1CzFW27FDWQlhMQB
         l0It+HPc085C9heGP8tbuTm8P31oXfW95tPkjPJsG9rQHsi5jQHQATFng3U+fwaTj/1i
         uG9g==
X-Gm-Message-State: ACgBeo3osUInJLvJ+EtD3+KTWTCQB/jextxJbu0+LpPupeIzJZdKU3kj
	1Cz+s59oBlUZ4iuUZwpYxXJnsIt79Ut9foJs+ebHPdOXFtMxCq8ZTTVxNIe+pENALA9t4o+o4vT
	SVVyUVQ7JeYVngo54TttSAzs5Rw==
X-Received: by 2002:a05:600c:348d:b0:3a6:b4e:ff6d with SMTP id a13-20020a05600c348d00b003a60b4eff6dmr1565258wmq.95.1662101515466;
        Thu, 01 Sep 2022 23:51:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR46CGLtC2fDdfzM/QpJfx4qdEeswbHmK0RWHhlnHIk5iORrxdcergyRIzSqDQ7HjT8Z5PbhQw==
X-Received: by 2002:a05:600c:348d:b0:3a6:b4e:ff6d with SMTP id a13-20020a05600c348d00b003a60b4eff6dmr1565249wmq.95.1662101515193;
        Thu, 01 Sep 2022 23:51:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:4800:2077:1bf6:40e7:2833? (p200300cbc714480020771bf640e72833.dip0.t-ipconnect.de. [2003:cb:c714:4800:2077:1bf6:40e7:2833])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003a31fd05e0fsm16660267wms.2.2022.09.01.23.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 23:51:54 -0700 (PDT)
Message-ID: <65b9abb4-45f7-f8e0-5148-6059b2c2ae6a@redhat.com>
Date: Fri, 2 Sep 2022 08:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/4] mm/migrate_device.c: Flush TLB while holding PTL
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
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
> When clearing a PTE the TLB should be flushed whilst still holding the
> PTL to avoid a potential race with madvise/munmap/etc. For example
> consider the following sequence:
> 
>   CPU0                          CPU1
>   ----                          ----
> 
>   migrate_vma_collect_pmd()
>   pte_unmap_unlock()
>                                 madvise(MADV_DONTNEED)
>                                 -> zap_pte_range()
>                                 pte_offset_map_lock()
>                                 [ PTE not present, TLB not flushed ]
>                                 pte_unmap_unlock()
>                                 [ page is still accessible via stale TLB ]
>   flush_tlb_range()
> 
> In this case the page may still be accessed via the stale TLB entry
> after madvise returns. Fix this by flushing the TLB while holding the
> PTL.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reported-by: Nadav Amit <nadav.amit@gmail.com>
> Reviewed-by: "Huang, Ying" <ying.huang@intel.com>
> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> Cc: stable@vger.kernel.org
> 
> ---
> 
> Changes for v4:
> 
>  - Added Review-by
> 
> Changes for v3:
> 
>  - New for v3
> ---
>  mm/migrate_device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 27fb37d..6a5ef9f 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -254,13 +254,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  		migrate->dst[migrate->npages] = 0;
>  		migrate->src[migrate->npages++] = mpfn;
>  	}
> -	arch_leave_lazy_mmu_mode();
> -	pte_unmap_unlock(ptep - 1, ptl);
>  
>  	/* Only flush the TLB if we actually modified any entries */
>  	if (unmapped)
>  		flush_tlb_range(walk->vma, start, end);
>  
> +	arch_leave_lazy_mmu_mode();
> +	pte_unmap_unlock(ptep - 1, ptl);
> +
>  	return 0;
>  }
>  
> 
> base-commit: ffcf9c5700e49c0aee42dcba9a12ba21338e8136


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

