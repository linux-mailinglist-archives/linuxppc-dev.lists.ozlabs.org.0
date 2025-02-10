Return-Path: <linuxppc-dev+bounces-6048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED22FA2F769
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 19:41:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsD1G50Bbz30TK;
	Tue, 11 Feb 2025 05:41:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739212866;
	cv=none; b=AbcZjVNt6TYuhRwJhlPeR4+8X7eT0IGDvM874Y8a/gj2P6zG/jRSTGu/7HfNMdn1S1dWIytd4h9wUk+D/WRBt4cotRAlX/t+T4Hbd2ZU0W/6eiZjebQlc5kh8FxopCUZ9O5i65BekJ0XRn1clbJ3k9Ui7zBQ9u0LcrFjWOCNfhF1tCzVJBZD4Tt8zOAg4jNDyI7s13hnFh2ic/FlfAeoLFAZcjm2Sy7bp3Aqwo4h9nDuDp059bnZVrUdwxjRZ9DX8pmD3NdYSa+jtlS0FMuR4N6xxznfkg+qH7UmHWFd1Xbvtm8+VMh/s8S8bxdGYcGhCX4ChE7tGConvaz/nNS9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739212866; c=relaxed/relaxed;
	bh=g1KV9WSg/lyUU/31KD2wiBY4CVQnFn2Ocr7fjoXlBPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXD05hhNsfPt+Cj4qMRnKcQYuYRwwpZHxkWWzkCPkafWACBXYox3a10v9mIDSSIsXHi6EwaYksK8I6z2hxQALHsn+jV009Lcgp4KHyeTsdU8OIzeGlAksWZdRM6VK4LKEsBO41q/4b0p9XFDAioAjiay9C4tsjm06e7XxzfZKGSYlchGxGBerQacqdbx6ytlExkGt9wVjRqeLBnBnzfU+OoVXBEHK7ErUXYawcu8r+Alwav/wSuzxiwSeCVQ1k2POE+gWy7JP2G4NqtEkYstOumxh/X3W/fBf35lBxuofXEe8z+8yEo5sYVhQuZWNR/4JJIELdRHV12y+KelLxPPGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SHqJlH/I; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SHqJlH/I; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SHqJlH/I;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SHqJlH/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsD1F5kPrz3054
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 05:41:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g1KV9WSg/lyUU/31KD2wiBY4CVQnFn2Ocr7fjoXlBPA=;
	b=SHqJlH/I0s93cqBdCHvhtWrVbcz8fAEv8Q3Uqcm6Kio6XlHaMrG/Lq4suM5Ey7TnMKpnDQ
	fOvyNb8syIDiGjWsad+9ytXbgwSJL1uG65xiRqmmqRVK3fbXsxSvmNx54YsDxqSmtDV96m
	rcC/UV3IpIHwfaNWGgwMy3M/VhIHTNI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g1KV9WSg/lyUU/31KD2wiBY4CVQnFn2Ocr7fjoXlBPA=;
	b=SHqJlH/I0s93cqBdCHvhtWrVbcz8fAEv8Q3Uqcm6Kio6XlHaMrG/Lq4suM5Ey7TnMKpnDQ
	fOvyNb8syIDiGjWsad+9ytXbgwSJL1uG65xiRqmmqRVK3fbXsxSvmNx54YsDxqSmtDV96m
	rcC/UV3IpIHwfaNWGgwMy3M/VhIHTNI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-Z6w5iQcPP4aYqzkDrp1lRQ-1; Mon, 10 Feb 2025 13:41:00 -0500
X-MC-Unique: Z6w5iQcPP4aYqzkDrp1lRQ-1
X-Mimecast-MFC-AGG-ID: Z6w5iQcPP4aYqzkDrp1lRQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38de0201875so589629f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 10:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212859; x=1739817659;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g1KV9WSg/lyUU/31KD2wiBY4CVQnFn2Ocr7fjoXlBPA=;
        b=TN/REUFLXGAdXW2NoifJuVM9jI6w2zB4S372x87I45uBQJO2i8yVvsJ9sCeseilAoj
         IRwwOqsZEyVT7+mYGXSc22eNya4NDKXc1MJyU2a7kBR22BuXMt0TLnRmH8M3GLutbADP
         R88zLFqKH2BQQfwHtCj9WBnI4F40N0flyGjrDWYmKLrlC8P2f9/om1E28v+XrKD/X/I3
         seblAwgkeOyLAcyiQ/jGrKLU7TK1l9sfQb215LCAyDa+bI2Wb8hTUsMrbisHtykFT0jT
         TFTE+E8MWwUH/d97azDeTCCCQ/GrldpVUMF76L9WxonhA+nDMjJQYS7WeY/Ruf2C8O6I
         qncQ==
X-Forwarded-Encrypted: i=1; AJvYcCUflRfbmHtrbYEZAXUV8wgOVxhvObdW7IxlzrUNoKTyZRBbplsyWXKTN08gBEoO0mOIl/ZNUs+MAqAeKe0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkXJlXTOgrpThbnBff4flWgD2ryzL7RlyMzdg+JcivTg64NRXX
	Jl8sDo76oq6vlk1QdJbn7NvMUqFP1Bbp1s+ORmCJVBWjR5K7c3R8ID4ikyqulip5DJ93+z0QvIX
	bpbR8K6YjnUvfN4O8GeaXPWEiC1c+5a92kd5twfvTGf2+NmbkrGBH1AWsPq9RJ5g=
X-Gm-Gg: ASbGnctPCx9oNtwzfvuoRwhrdCy87kPLgRZyHYS4NDvVCvJ8vBBMhtCueB5MSHu55XI
	H2J76+A5CIsYKoJGk4FY2z6VIdBEzr+4NlYZ6inQLQVJKA2KJ+3An00qNO35MEgDZAUYzrixcX9
	9Lh+O3M4DVhOA6mThB9yNzRuB+Jw6bB+KA4horktGoLS3EgrTScwvMQ+rLnffH+5SKpFy6pmiX1
	ZBmrlYimYawRr1ghsONsfa8XP58bNhJ4WIkZQUwa+1iAPgCr4CKHAu5FZVqCnCDAxRrhRGOSWeQ
	5p90krN3t/nawrGDQi3eU+hSAiLLd6KhYjsteHX2Sntc53arYuxc+OO2nRAJ8eafi/9T9NkKPli
	KU1PCOBcp9S/JP/rqAx0MtFBSonAEtK6L
X-Received: by 2002:a05:6000:4023:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-38de4203c6fmr720453f8f.39.1739212859651;
        Mon, 10 Feb 2025 10:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGdyRFSrPW6CDaatY3A9b5Pbjiq+vqKKBwRSMaTLmNlwLMqalsMGCRptdeQalX+PBAO6tSww==
X-Received: by 2002:a05:6000:4023:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-38de4203c6fmr720406f8f.39.1739212859214;
        Mon, 10 Feb 2025 10:40:59 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439471bf782sm28276465e9.39.2025.02.10.10.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:40:58 -0800 (PST)
Message-ID: <0c8640f5-2a80-45ff-a922-476a5fd5f82d@redhat.com>
Date: Mon, 10 Feb 2025 19:40:56 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/20] mm/memory: Add vmf_insert_page_mkwrite()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <e98b7e6bed4c1c63feac7b907439168388ecc9fd.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e98b7e6bed4c1c63feac7b907439168388ecc9fd.1738709036.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PUZAF_DqVq5NOeWQgdJNXVl8Ek1U-f7RzaYgMjCKXqg_1739212860
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 04.02.25 23:48, Alistair Popple wrote:
> Currently to map a DAX page the DAX driver calls vmf_insert_pfn. This
> creates a special devmap PTE entry for the pfn but does not take a
> reference on the underlying struct page for the mapping. This is
> because DAX page refcounts are treated specially, as indicated by the
> presence of a devmap entry.
> 
> To allow DAX page refcounts to be managed the same as normal page
> refcounts introduce vmf_insert_page_mkwrite(). This will take a
> reference on the underlying page much the same as vmf_insert_page,
> except it also permits upgrading an existing mapping to be writable if
> requested/possible.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v7:
>   - Fix vmf_insert_page_mkwrite by removing pfn gunk as suggested by
>     David.
> 
> Updates from v2:
> 
>   - Rename function to make not DAX specific
> 
>   - Split the insert_page_into_pte_locked() change into a separate
>     patch.
> 
> Updates from v1:
> 
>   - Re-arrange code in insert_page_into_pte_locked() based on comments
>     from Jan Kara.
> 
>   - Call mkdrity/mkyoung for the mkwrite case, also suggested by Jan.
> ---
>   include/linux/mm.h |  2 ++
>   mm/memory.c        | 21 +++++++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7b1068d..6567ece 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3544,6 +3544,8 @@ int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
>   				unsigned long num);
>   int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
>   				unsigned long num);
> +vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
> +			bool write);
>   vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>   			unsigned long pfn);
>   vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
> diff --git a/mm/memory.c b/mm/memory.c
> index 41befd9..b88b488 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2622,6 +2622,27 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>   	return VM_FAULT_NOPAGE;
>   }
>   
> +vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
> +			bool write)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	pgprot_t pgprot = vma->vm_page_prot;

Probably could have avoided that temp without harming readability

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


