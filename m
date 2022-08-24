Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741D59F51B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 10:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCJyR3FP7z3dqs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 18:23:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aL/uF7zL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aL/uF7zL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aL/uF7zL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aL/uF7zL;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCJws6GJ9z3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:22:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661329319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaKoJSFhkLs3j9BMMpW4Sul91GROScQNC38GatdEuPY=;
	b=aL/uF7zL0SDe+8HoCiMzGbNPnodmd4TwaNxkR5pzJp69ajU4KwvgX902KDeEHgJY1zwPe3
	A5jp03/2zsmVMMRVpIJD3jF1HuSE29W3lpGQJl7NJ5cCamGaILShNN3xa3sY9ejo7/SQ5g
	bW+y6u0f4h1mrZWVQUyEztBs3L+pqsE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661329319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaKoJSFhkLs3j9BMMpW4Sul91GROScQNC38GatdEuPY=;
	b=aL/uF7zL0SDe+8HoCiMzGbNPnodmd4TwaNxkR5pzJp69ajU4KwvgX902KDeEHgJY1zwPe3
	A5jp03/2zsmVMMRVpIJD3jF1HuSE29W3lpGQJl7NJ5cCamGaILShNN3xa3sY9ejo7/SQ5g
	bW+y6u0f4h1mrZWVQUyEztBs3L+pqsE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-VaE5_5LlPIm867qf0DXrOg-1; Wed, 24 Aug 2022 04:21:57 -0400
X-MC-Unique: VaE5_5LlPIm867qf0DXrOg-1
Received: by mail-wr1-f72.google.com with SMTP id i24-20020adfaad8000000b002251cb5e812so2622027wrc.14
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 01:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=kaKoJSFhkLs3j9BMMpW4Sul91GROScQNC38GatdEuPY=;
        b=g1mYI5Lv8k93dNGv2QiTSaP32KwrJwM/e1OmeR8TJNgNScaoamgeP+bHsq37uMbH9g
         DEOOw8ESoBhm2KbiACqabZwdoAviui57qYRTvq/gIYCPF7F+0JatH3InxKtgh5Wc7Zx1
         yFEvF4TMxf+g1xwMq57tHIt0zHVvxim5MlDWs5p78sIP4VY+zGufjeiLEMXz/0tcTMlS
         zpbEYkvRH/X44B9Labf0WegTXFKXYBcmi+8eFszEPFfAnPK7a/zHrlRljubdb/4/wcH+
         wN/TrdJaWoJB4M+1HZSYFOTcEFfgVF7Cig0wez1kH0s8XhYvblrIFLTSKpvUCPlNmQhl
         8WEA==
X-Gm-Message-State: ACgBeo0fR/HEG6IfG3NJsNNUi9rKB51giPgJkq0z7EoMnn6b7CcQ708e
	JgCIWoXrnORpG3WqaIjZr/9NTpRI/u2445zOmmF5uN5Ki6VLioDhr+YZGRB4mvlh6n7wPHwrZrD
	h9ly3XHXGaAzINH22BExePBE8pA==
X-Received: by 2002:adf:f644:0:b0:225:4cb4:c2f6 with SMTP id x4-20020adff644000000b002254cb4c2f6mr9491244wrp.552.1661329316185;
        Wed, 24 Aug 2022 01:21:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4X7X3tYyJSmiUUp6I0Ru0wIROQJojmCwOUf92jP2yjlZsNTJSwC4WCw77h1/+kLqgmchleqA==
X-Received: by 2002:adf:f644:0:b0:225:4cb4:c2f6 with SMTP id x4-20020adff644000000b002254cb4c2f6mr9491224wrp.552.1661329315912;
        Wed, 24 Aug 2022 01:21:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73? (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de. [2003:cb:c707:c500:5445:cf40:2e32:6e73])
        by smtp.gmail.com with ESMTPSA id v5-20020a1cac05000000b003a626055569sm1122379wme.16.2022.08.24.01.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:21:55 -0700 (PDT)
Message-ID: <86b0622d-06eb-cfab-2ff1-8a0eaf823f8a@redhat.com>
Date: Wed, 24 Aug 2022 10:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/3] mm/migrate_device.c: Flush TLB while holding PTL
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.08.22 05:03, Alistair Popple wrote:
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
> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> Cc: stable@vger.kernel.org
> 
> ---
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

I'm not a TLB-flushing expert, but this matches my understanding (and a
TLB flushing Linux documentation I stumbled over some while ago but
cannot quickly find).

In the ordinary try_to_migrate_one() path, flushing would happen via
ptep_clear_flush() (just like we do for the anon_exclusive case here as
well), correct?

-- 
Thanks,

David / dhildenb

