Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC2523BAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 19:36:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz2C95jbyz3cJn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 03:36:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SkUtB4u+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SkUtB4u+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SkUtB4u+; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SkUtB4u+; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz2BV0Qrqz3bWR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 03:36:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652290558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHJ9jDCm2aZov2g6klEdi92ZsrYHfyKzIwTmWcp9UH8=;
 b=SkUtB4u+Yg62tE7H3WQiavn2KpkGFOHV5VNYRy4Blpm8wiRvPueb0W067T/6AsgShBm35U
 zGE7x1BzpVfvaYWtvUW0pdGV3wdsAbcoJWoMk1qPfwOUVpCPmiQ/njSsB1OKY0dcMAEUkv
 AIW8f+P4rxrlLG3rpiSPgrswqfD9ndc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652290558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHJ9jDCm2aZov2g6klEdi92ZsrYHfyKzIwTmWcp9UH8=;
 b=SkUtB4u+Yg62tE7H3WQiavn2KpkGFOHV5VNYRy4Blpm8wiRvPueb0W067T/6AsgShBm35U
 zGE7x1BzpVfvaYWtvUW0pdGV3wdsAbcoJWoMk1qPfwOUVpCPmiQ/njSsB1OKY0dcMAEUkv
 AIW8f+P4rxrlLG3rpiSPgrswqfD9ndc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-vJSG9eD7PVimFZVhtOWetg-1; Wed, 11 May 2022 13:35:55 -0400
X-MC-Unique: vJSG9eD7PVimFZVhtOWetg-1
Received: by mail-wm1-f70.google.com with SMTP id
 26-20020a05600c021a00b003940660c053so930860wmi.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 10:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RHJ9jDCm2aZov2g6klEdi92ZsrYHfyKzIwTmWcp9UH8=;
 b=oKU2VADwp1qAb4qOWftUfIDiul3DW4s6q9vNR+1Tv+hQti9PxKemgBwrSYos+6KHjn
 5WJmEW3m4XVxokkMU8HZEyKoa8Q1RQTwgcz4gteep1KhOdO7vIzPrMTlU+0g1sRhza/O
 SDOHVZvQ/QoEzTf4qTobxfXgtDTTlb4LvIH64QwBhzGWqv9lxn8ddCw2/nWuLoX+VD6g
 kt/PQyHgF5rF7/1zSqvBulTEhyPr0VWTsX630pNIHST9QJXeIWmxvq2D0iVfot6ZT8fS
 U91F2p5r4Z+fPbUy4s2TxI4ovDPDA4+G4+oxLCIZYhTYqbC0PKWqPyfcHfdk3fLKjIsE
 P0jw==
X-Gm-Message-State: AOAM5316T2i7Xw+EYAFcOWUkMT2bCAHDtGcZPilH2rSxn1x01LwC+R5G
 txNp9RpeKeGUy/Iyqk3tXK8YrNt+/7PkEcwWftQEC59/QvGeFGiFf7P9774D6jW3TvadpljC0g5
 /iubbOJWqgnAWmSEPVHs42NnHPQ==
X-Received: by 2002:a05:6000:1f0f:b0:20c:87b6:df9d with SMTP id
 bv15-20020a0560001f0f00b0020c87b6df9dmr25088262wrb.115.1652290553803; 
 Wed, 11 May 2022 10:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxowLcNuhjX33XV+v3YeRfpwZS/+uKcfuTSz0ColENR5G1SBprMZ1XzQiN/ReI3dYYeeSg9JA==
X-Received: by 2002:a05:6000:1f0f:b0:20c:87b6:df9d with SMTP id
 bv15-20020a0560001f0f00b0020c87b6df9dmr25088227wrb.115.1652290553449; 
 Wed, 11 May 2022 10:35:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:700:2393:b0f4:ef08:bd51?
 (p200300cbc70107002393b0f4ef08bd51.dip0.t-ipconnect.de.
 [2003:cb:c701:700:2393:b0f4:ef08:bd51])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a7bc04c000000b003942a244ed6sm387130wmc.27.2022.05.11.10.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:35:52 -0700 (PDT)
Message-ID: <f1c904e7-0b16-2893-eb25-0b968817fb8c@redhat.com>
Date: Wed, 11 May 2022 19:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 mike.kravetz@oracle.com
References: <cover.1652270205.git.baolin.wang@linux.alibaba.com>
 <0a2e547238cad5bc153a85c3e9658cb9d55f9cac.1652270205.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <0a2e547238cad5bc153a85c3e9658cb9d55f9cac.1652270205.git.baolin.wang@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, songmuchun@bytedance.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, svens@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.05.22 14:04, Baolin Wang wrote:
> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> size specified.
> 
> When unmapping a hugetlb page, we will get the relevant page table
> entry by huge_pte_offset() only once to nuke it. This is correct
> for PMD or PUD size hugetlb, since they always contain only one
> pmd entry or pud entry in the page table.
> 
> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> since they can contain several continuous pte or pmd entry with
> same page table attributes, so we will nuke only one pte or pmd
> entry for this CONT-PTE/PMD size hugetlb page.
> 
> And now try_to_unmap() is only passed a hugetlb page in the case
> where the hugetlb page is poisoned. Which means now we will unmap
> only one pte entry for a CONT-PTE or CONT-PMD size poisoned hugetlb
> page, and we can still access other subpages of a CONT-PTE or CONT-PMD
> size poisoned hugetlb page, which will cause serious issues possibly.
> 
> So we should change to use huge_ptep_clear_flush() to nuke the
> hugetlb page table to fix this issue, which already considered
> CONT-PTE and CONT-PMD size hugetlb.
> 
> We've already used set_huge_swap_pte_at() to set a poisoned
> swap entry for a poisoned hugetlb page. Meanwhile adding a VM_BUG_ON()
> to make sure the passed hugetlb page is poisoned in try_to_unmap().
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  mm/rmap.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 4e96daf..219e287 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1528,6 +1528,11 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  
>  		if (folio_test_hugetlb(folio)) {
>  			/*
> +			 * The try_to_unmap() is only passed a hugetlb page
> +			 * in the case where the hugetlb page is poisoned.
> +			 */
> +			VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
> +			/*
>  			 * huge_pmd_unshare may unmap an entire PMD page.
>  			 * There is no way of knowing exactly which PMDs may
>  			 * be cached for this mm, so we must flush them all.
> @@ -1562,28 +1567,28 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  					break;
>  				}
>  			}
> +			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
>  		} else {
>  			flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
> -		}
> -
> -		/*
> -		 * Nuke the page table entry. When having to clear
> -		 * PageAnonExclusive(), we always have to flush.
> -		 */
> -		if (should_defer_flush(mm, flags) && !anon_exclusive) {
>  			/*
> -			 * We clear the PTE but do not flush so potentially
> -			 * a remote CPU could still be writing to the folio.
> -			 * If the entry was previously clean then the
> -			 * architecture must guarantee that a clear->dirty
> -			 * transition on a cached TLB entry is written through
> -			 * and traps if the PTE is unmapped.
> +			 * Nuke the page table entry. When having to clear
> +			 * PageAnonExclusive(), we always have to flush.
>  			 */
> -			pteval = ptep_get_and_clear(mm, address, pvmw.pte);
> +			if (should_defer_flush(mm, flags) && !anon_exclusive) {
> +				/*
> +				 * We clear the PTE but do not flush so potentially
> +				 * a remote CPU could still be writing to the folio.
> +				 * If the entry was previously clean then the
> +				 * architecture must guarantee that a clear->dirty
> +				 * transition on a cached TLB entry is written through
> +				 * and traps if the PTE is unmapped.
> +				 */
> +				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>  
> -			set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> -		} else {
> -			pteval = ptep_clear_flush(vma, address, pvmw.pte);
> +				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> +			} else {
> +				pteval = ptep_clear_flush(vma, address, pvmw.pte);
> +			}
>  		}
>  
>  		/*

LGTM

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

