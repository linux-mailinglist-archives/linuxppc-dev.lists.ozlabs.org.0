Return-Path: <linuxppc-dev+bounces-9422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B2ADC6FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:49:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM2CH3940z30VF;
	Tue, 17 Jun 2025 19:49:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750153771;
	cv=none; b=iIxxz1XNyzzFVbkHrzSdqghOhNYaTsB04dg3GVvaUyR/7kEDpfL3FXw0EkaG2FgVYx1hHnQEPkv6kDbYkXnGs794hTPEq3FmbuH04OGRsG4idPXPLoh7MYQ9tb3WFijETkoB15Qqxds7I7pCyrUwfeDB7Sfdfwpij2dNt3GiYiNuqemPsNkoo5Mp/5oAbY7qBeDQxBJR4hVFdizH+5pHHrLIKNuLP2BPzj7UcLhAWjnFCW6kZAJ36Rk5zFEpNpVde80hy2geVoSEKxqTf+jpeeR9hwaRh9t83/DI2LGK4ENZUUhhZ/tVEk0pDY7hGFj8kaNkQkRHmFcBy8ZUu37QUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750153771; c=relaxed/relaxed;
	bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSewYgJ1vBrQj2Fa5ybyN3UFsIhTOEVx8yRj9oG3rxn+T/L964GjLkccBadp4SaoKVJRRVd4uu1qRCwfqGCvK17KsJEdTTGV4HMpJvUKc63et8lzvBeNYFCqbIr++3njpfqfQHOR0mk65VGwkkG8l0mSKKadbIg6tw8GhDBicJS+NZe6mmex3jXn0kcWVV/rbTVkdIDT6MOe33MkpZ9UdkrDppOrdu0b+C8vfi1jRJ1MxQ9/l+pWGIonOUkvBFGdlR+J3urgwLStM4X9hBSR7so0kdYJfKcCPhg3dcQZ8D0noDyxcX4Rp/LNGFRpaLCYRtNejtcsdQrT+daE9r9c1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UpQAbzNb; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UpQAbzNb; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UpQAbzNb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UpQAbzNb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bM2CG4KnZz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:49:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
	b=UpQAbzNbfcxkxUSckAcUX3iZLoVcOTnY46OoHChR8KHYXTquRib+dcdNBNSn9QfPq8hDWp
	uBP4EFI5PwyL3hnZROwKwEVN+5BiiLDZoNXx9SK4kGS9XY5tkEzbo0LbMhLFV0YabT1FJe
	CSjJH3jILiN48SXQJLmyOr3tqU5kZXg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
	b=UpQAbzNbfcxkxUSckAcUX3iZLoVcOTnY46OoHChR8KHYXTquRib+dcdNBNSn9QfPq8hDWp
	uBP4EFI5PwyL3hnZROwKwEVN+5BiiLDZoNXx9SK4kGS9XY5tkEzbo0LbMhLFV0YabT1FJe
	CSjJH3jILiN48SXQJLmyOr3tqU5kZXg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-Kpu5Iy82OCCrqEz2dkT_Jg-1; Tue, 17 Jun 2025 05:49:24 -0400
X-MC-Unique: Kpu5Iy82OCCrqEz2dkT_Jg-1
X-Mimecast-MFC-AGG-ID: Kpu5Iy82OCCrqEz2dkT_Jg_1750153763
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450df53d461so45170785e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 02:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153763; x=1750758563;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
        b=bL4UURBARaRyf77d7XJqylBVpNR1V4ZSiKnBElfk5edwma6j10DHBCA9B+YJTcG3zg
         apn/ME+x78zd7JKo3qhsr0k9DrMKy5w5qbrmem6hiQGm+p81PIVv+dXNxN5ABEABZg9e
         zkSC5jAjJTJPQ4cWef1xoCfrSm+sLjVE9cP6Nx/zLCeitXxIBDhg8h5XfGcmipTYazSR
         Qg4iIUkMJAbL2SM8FDgWue3isKz3Q++YxagB9yoryY/6i7yTB1FBsIGs6zqDI7n4P5ku
         KhAXvrkWMlE+1AMrQLSZc3d8YIhJJwhu1BLvyxnxgRWcG1UtV2FMnsuRG0lJ3Ynk3fEI
         BhSw==
X-Forwarded-Encrypted: i=1; AJvYcCWHE/Z2aHYO4QEgi4dWVDxI1BdgYS3xjv3NOo7MWUT1Ja4JoxqAB20ZSaF2hMv7wovdsY4DZXLzF9VAQ4M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzy3KXDRTk4DkDMuLGQ5Tn/Idw5lDAZz6NRUjtEuqMF7+NiylPc
	0exBDBJdwMVkKsCyOgumBRGHnv2jNZMh1NtYI6OqqefwSVF48huNFfcXK2qMKnXSP1yTDy4ls0w
	ly79mpiOULLKvQXIyQa0GE8dXYjz+kA8yadXs5RCWNJ8Ub9kYwD5l9tMuvXVCmGIhT80=
X-Gm-Gg: ASbGncsyOY76J3Rn7TA0gw95kVyE8Ly8XRZX+FaSISMZ0JQIRjCqivvMjS/LrH7UAHI
	OnMOKP9/k3FKLxRmLOpxz7ATPvXWXRNW6RS5bQmj7B+ocbZzgukyLI0xmn3W9M6QUnxyzsSR4Fo
	6QbZv4y7SHLslmPEiYSTh0w4YKsyDithx1qJARecQWl9ZppS26wntOxAjVR+0VoFnwK8Eva0Mar
	6lbVr50WPcq+LzNlTHpLSIx1ZdxkQLtvbex+jFguG56Erz4enbhkCuMCTIYdeFNuNL8H6drLEl+
	ZQ7UMt/rcI5nOmKe/vBOhwkBneAamGr7awqCwJNcincCLmyM9/gujM4KqoJVKexaBGxOcuvzzZ9
	hitIF1me+ql6c4al85TbgQnNaWDLBO5txQxWrCr7vk8Gz2lY=
X-Received: by 2002:a05:600c:8b66:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-4533ca71c4cmr120176315e9.9.1750153763452;
        Tue, 17 Jun 2025 02:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXZNQ8PD9qufR5L3UGiEianFrRGislf+YnSmpb1KcTqInns51iN3qzkWWM7hMwKXRBlIkEGg==
X-Received: by 2002:a05:600c:8b66:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-4533ca71c4cmr120175955e9.9.1750153763021;
        Tue, 17 Jun 2025 02:49:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a578510edcsm9430995f8f.8.2025.06.17.02.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:49:22 -0700 (PDT)
Message-ID: <6bb233ef-5e56-4546-b571-6a5f052d8b45@redhat.com>
Date: Tue, 17 Jun 2025 11:49:20 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] mm/huge_memory: Remove pXd_devmap usage from
 insert_pXd_pfn()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <67bc382c49ed8b165cfbd927886372272c35f508.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <67bc382c49ed8b165cfbd927886372272c35f508.1750075065.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K8Baza7G-xOBWfYRUbqZ0Xyz4bP88vfGlMbJSSLUzuc_1750153763
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 16.06.25 13:58, Alistair Popple wrote:
> Nothing uses PFN_DEV anymore so no need to create devmap pXd's when
> mapping a PFN. Instead special mappings will be created which ensures
> vm_normal_page_pXd() will not return pages which don't have an
> associated page. This could change behaviour slightly on architectures
> where pXd_devmap() does not imply pXd_special() as the normal page
> checks would have fallen through to checking VM_PFNMAP/MIXEDMAP instead,
> which in theory at least could have returned a page.
> 
> However vm_normal_page_pXd() should never have been returning pages for
> pXd_devmap() entries anyway, so anything relying on that would have been
> a bug.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes since v1:
> 
>   - New for v2
> ---
>   mm/huge_memory.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index b096240..6514e25 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1415,11 +1415,7 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>   	} else {
>   		entry = pmd_mkhuge(pfn_t_pmd(fop.pfn, prot));
> -
> -		if (pfn_t_devmap(fop.pfn))
> -			entry = pmd_mkdevmap(entry);
> -		else
> -			entry = pmd_mkspecial(entry);
> +		entry = pmd_mkspecial(entry);
>   	}
>   	if (write) {
>   		entry = pmd_mkyoung(pmd_mkdirty(entry));
> @@ -1565,11 +1561,7 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
>   		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
>   	} else {
>   		entry = pud_mkhuge(pfn_t_pud(fop.pfn, prot));
> -
> -		if (pfn_t_devmap(fop.pfn))
> -			entry = pud_mkdevmap(entry);
> -		else
> -			entry = pud_mkspecial(entry);
> +		entry = pud_mkspecial(entry);
>   	}
>   	if (write) {
>   		entry = pud_mkyoung(pud_mkdirty(entry));


Why not squash this patch into #3, and remove the pmd_special() check 
from vm_normal_page_pmd() in the same go? Seems wrong to handle the 
PMD/PUD case separately.

But now I am confused why some pte_devmap() checks are removed in patch 
#3, while others are removed in #7.

Why not split it up into (a) stop setting p*_devmap() and (b) remove 
p*_devmap().

Logically makes more sense to me ... :)

-- 
Cheers,

David / dhildenb


