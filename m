Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4863C5AB97C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 22:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK8pK2fhsz3042
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 06:36:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LOaUOPM+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LOaUOPM+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LOaUOPM+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LOaUOPM+;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK8nX6RhKz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 06:35:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662150954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fn+Zoib7z+3jWmLDklpcVUHy37Y7jPpJPmAY6A3wSS4=;
	b=LOaUOPM+0g1fV3vmOxCNWUD3Fg3hkb32WKMEejN+6RcUMezkeNxKZ96pjjblMFl9aVgAVg
	EhrP6n36Rh8frH554AvbSuMRvBoxyBL6GrPTT+36rz7Yv9eBBrX6Ojy4JXXuzjlTCiog78
	7VSTmueentetr//7iGR08cI187F9Ok8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662150954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fn+Zoib7z+3jWmLDklpcVUHy37Y7jPpJPmAY6A3wSS4=;
	b=LOaUOPM+0g1fV3vmOxCNWUD3Fg3hkb32WKMEejN+6RcUMezkeNxKZ96pjjblMFl9aVgAVg
	EhrP6n36Rh8frH554AvbSuMRvBoxyBL6GrPTT+36rz7Yv9eBBrX6Ojy4JXXuzjlTCiog78
	7VSTmueentetr//7iGR08cI187F9Ok8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-8dVThSo6OMK-ig42s4e4tg-1; Fri, 02 Sep 2022 16:35:51 -0400
X-MC-Unique: 8dVThSo6OMK-ig42s4e4tg-1
Received: by mail-qk1-f199.google.com with SMTP id s9-20020a05620a254900b006b54dd4d6deso2833166qko.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 13:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fn+Zoib7z+3jWmLDklpcVUHy37Y7jPpJPmAY6A3wSS4=;
        b=6nTRxzGis5LlNDTGd49hbF35dBwXM8r6/5g/zhudQBDX0GolzZlJ8I2AJQWiM9rcSl
         UXVN1fk4yHAblnHdVP3JIfv70x4ZRPVOt6v39qumn6O3wZfk/7ujYgvbnXP0qFFSLIpM
         +Ss9wv8VVgEo8jQgJ1Mcwn/S0U0tlNC5dgjZycP54arBsiwS/3m9fZvtyLR7yjzxAiz/
         VpJxjPbWyCzhQaaKa+0m54U5NKuYqvZqkdac1M6igzz6lOAA7x9ow28+NtmMOe9m9LkG
         j82ocPhVKFxsGhbLP+yPhfk4vivWGe5xYV7OTCK8DNpIUA7I9vMDs5c2UmnOf0rkEuSn
         MNsQ==
X-Gm-Message-State: ACgBeo39ZPaN92MMETZWyWdhnzy5TXocE5WGWlCZCT3umXKPB7tGThO8
	oA+RGeaepdGMQJr3RA7jrr64L4zU8eWYOuzN6tke1T8r6ps50L1Z9lrttVe/C10KIW2Jr3gWhPi
	Qz6SABkYs4H3aEYCvmnhkrMCp9g==
X-Received: by 2002:a05:6214:cca:b0:499:216a:bb53 with SMTP id 10-20020a0562140cca00b00499216abb53mr12361617qvx.98.1662150950682;
        Fri, 02 Sep 2022 13:35:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6kIdR84rwbeR6TPg15NwPgQnYmK4+injhS/K8qL1Ci4QeM6ILUyA6WUnfYAugNgzwk5mCQRQ==
X-Received: by 2002:a05:6214:cca:b0:499:216a:bb53 with SMTP id 10-20020a0562140cca00b00499216abb53mr12361578qvx.98.1662150950432;
        Fri, 02 Sep 2022 13:35:50 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id i7-20020a05620a404700b006b5cc25535fsm2262614qko.99.2022.09.02.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:35:50 -0700 (PDT)
Date: Fri, 2 Sep 2022 16:35:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v4 1/4] mm/migrate_device.c: Flush TLB while holding PTL
Message-ID: <YxJpIwPn0FGOka0C@xz-m1.local>
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, "Huang, Ying" <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 10:35:51AM +1000, Alistair Popple wrote:
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

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

