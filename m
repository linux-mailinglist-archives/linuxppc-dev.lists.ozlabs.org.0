Return-Path: <linuxppc-dev+bounces-9029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB1AC8B04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 11:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7ynm2RB6z2xPc;
	Fri, 30 May 2025 19:37:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748597852;
	cv=none; b=Ex/2sVljKbFU9jq/cqeH0oJTQk9atezsDXSQjuEQsv59PRlAVfQKDVAJtl1+Ktfh6OwdbmVgHMdErxaCgGwajsxVuy3pwU4ttxUF8O+37l+/53OPMBkwBXF8OMwcSOf94efCcOR0cdKS1/q0UWqfIA4UZqlHH2SrrQABYb+RzlcB0F/XKPdvO+FyWK6pBl5BXc0vuiNN4hpVGJbCaRTAr9/ONnyU4uJbWdaS3r+uqWyzSg+Ip+4A15fqhCr72tg2Dg1AI0Y3XmYm6OV11IF/loRdObXU7sTqQEbO+1jbJbMUvRKOT0uSDidrp/+OR6AJIADAGjb/b/p8ahBqcBmywA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748597852; c=relaxed/relaxed;
	bh=yhyTHW9/iNSmJ3o1/+Kc2KlH+vX1ja7mHJ+mDxpkv9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNqrwh4u6G5r6nExgW5k6ysrzoiTlsa7sFSCoROBhVGL8wDi8WH6NosjCTdaU4DtxjyY9/sFWMgTn0yeR1UxaJYj6Eke1gmwod7ob3Gp9Lu2ylaOKNruNQN+ZcaUdGwHDkYpTE+yaHpQ/nHxIamOvY1ryKNo6HsKPshqMbKXu+kZwg0EAt+/ecYv6YKpRfgvl1twpu0kIE5g0jBTjoL88WicVXbhlEMjpGw3obYKxzr+EIZbmSHB48Dh83iXT898Bcw3Ll8a+LD+oC9I3OnfUu7JxcYPCpttEiQ3oxFxUE21uwG2WROK5o9iS7lof3KGHEoAGs3oDvm7dUyxfdKTvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3eRGqSf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3eRGqSf; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3eRGqSf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F3eRGqSf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7ynl27VNz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 19:37:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748597847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhyTHW9/iNSmJ3o1/+Kc2KlH+vX1ja7mHJ+mDxpkv9E=;
	b=F3eRGqSf/naq58IBMHrYtrb93TuXz2tHgKs5FOHBLNuv8r89hCK1Km5ApOAl0yWYRGmMKz
	JVQClIFiiHtw1veKrCx/07QzVPbyblJiLbS3KEbubfRtG1nRnjkOe7keuNTfgwZqYpycNU
	RXsk0x37kJcCr856Vm21+g1AtfR9I3o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748597847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhyTHW9/iNSmJ3o1/+Kc2KlH+vX1ja7mHJ+mDxpkv9E=;
	b=F3eRGqSf/naq58IBMHrYtrb93TuXz2tHgKs5FOHBLNuv8r89hCK1Km5ApOAl0yWYRGmMKz
	JVQClIFiiHtw1veKrCx/07QzVPbyblJiLbS3KEbubfRtG1nRnjkOe7keuNTfgwZqYpycNU
	RXsk0x37kJcCr856Vm21+g1AtfR9I3o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-opucJrWZPq-k3D6piKV6NQ-1; Fri, 30 May 2025 05:37:25 -0400
X-MC-Unique: opucJrWZPq-k3D6piKV6NQ-1
X-Mimecast-MFC-AGG-ID: opucJrWZPq-k3D6piKV6NQ_1748597844
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c96c1977so12781165e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 02:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597844; x=1749202644;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yhyTHW9/iNSmJ3o1/+Kc2KlH+vX1ja7mHJ+mDxpkv9E=;
        b=UHBb2/d059SpTUuIjAXZpJdepahfHy+UhAsd737bHl/yN3rVxVSWoQ7REJS+GKJyjs
         0NHWON87f2aGJoD1ZlVEJWDOvOr6H1fGzzuaN8ikOOVr3JZASbmbPrY45eSzG+NCBwxN
         1tidnbEQwRrVvVpTQjWuimJ+Cl6NqFXvo4MEhpXaRRRVeoZ++rL4mSSbt+I+NmVA17G9
         aJtW21BoE/C+v2VW2ONhIjaUAd3C34UyaDygb9oOTyCR/apR0sIC+ZvIS4cebQpKYST5
         842RNciXxO4Qh2HjpL9qnkZcc+ggsf5YUzsEmqhxrt6YMvv/43TB3+nSuWk6L9jTyAPb
         8iKg==
X-Forwarded-Encrypted: i=1; AJvYcCXNUa1nBHtl0CrB6dL9sPMZeTiDqieztEtscLe1i/GaBAJE/dPuiGrA2RRsoSD4dDMt/ofKXZ9g3KT4jzI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw02Obi7SUCO+ZKbqZ+XBZew16H7I41QVdVz6IfNBSY1w5XIgZG
	v8BDFlZ38Lb4n3R5xikqFs3SUJUHvs5hGb9ulnQ5MznlD2wne34Nm52y28sIzvxPwx2PIoPrHB6
	4OZEc4GH4Bg2txsyz8pQgrh2Bo0N8HDvIL4PekcqxwCkH/bqSgj9oiNhaDF1hHSuPkbg=
X-Gm-Gg: ASbGncvvZCbCuZfdxKVeLSl/npByIjEyqvgi5jON9x6H8rFx2wB7vN7K7idVPOvxwvb
	VZsdk/9u0K1PMNHz8SQupfrDg7nlagBLMg22anVUN/KhaCokSWTw2/SweHAJLtpsgdyPHYvP1wW
	ByeFXzv1AJ1lC2HgfJB5AS1yaawCud/3w+8KFFmImqSothZU75MEKpxMFklV6/Vz7jwSYqR6SeA
	nX8eJTl03emfkRoDWKqwNKeVK8nbppEIfnLsIn3v1jY6xhBpjvq8rK2nflUK9L6lBkbaeg/tqql
	X8ZzCgog6/N70VjGurKidwhOrDGPkkXgRftAaI9BinSIUgnaP39y2/X8Bjr5b04e4sP3orSdmK4
	jYa73GENUcoPuuszTEkHOKs22E9+XTUP/h6fT6Zs=
X-Received: by 2002:a05:600c:6207:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-450d885e38amr12675345e9.22.1748597844506;
        Fri, 30 May 2025 02:37:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGccFKRFTCgkkT3ae/QFUuhHOQzucrbv9tCboH5VNdb/K0MlBO6YnvTUAz5zFzNoWT7UAvZNw==
X-Received: by 2002:a05:600c:6207:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-450d885e38amr12675135e9.22.1748597844047;
        Fri, 30 May 2025 02:37:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d800671csm12953125e9.30.2025.05.30.02.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:37:22 -0700 (PDT)
Message-ID: <371b8fdd-129d-4fe3-bbc7-f0a1bc433b30@redhat.com>
Date: Fri, 30 May 2025 11:37:21 +0200
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
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nLpDbZcukBnJ8Ex7ZJasqtcx84zK4UrVfOSYagUqdJc_1748597844
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.05.25 08:32, Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>   fs/userfaultfd.c | 2 +-
>   mm/hmm.c         | 2 +-
>   mm/userfaultfd.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 22f4bf9..de671d3 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -304,7 +304,7 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
>   		goto out;
>   
>   	ret = false;
> -	if (!pmd_present(_pmd) || pmd_devmap(_pmd))
> +	if (!pmd_present(_pmd) || vma_is_dax(vmf->vma))
>   		goto out;
>   
>   	if (pmd_trans_huge(_pmd)) {
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 082f7b7..db12c0a 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -429,7 +429,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
>   		return hmm_vma_walk_hole(start, end, -1, walk);
>   	}
>   
> -	if (pud_leaf(pud) && pud_devmap(pud)) {
> +	if (pud_leaf(pud) && vma_is_dax(walk->vma)) {
>   		unsigned long i, npages, pfn;
>   		unsigned int required_fault;
>   		unsigned long *hmm_pfns;
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index e0db855..133f750 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1791,7 +1791,7 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
>   
>   		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
>   		if (ptl) {
> -			if (pmd_devmap(*src_pmd)) {
> +			if (vma_is_dax(src_vma)) {
>   				spin_unlock(ptl);
>   				err = -ENOENT;
>   				break;

I assume we could also just refuse dax folios, right?

If we decide to check VMAs, we should probably check earlier.

But I wonder, what about anonymous non-dax pages in COW mappings? Is it 
possible? Not supported?

If supported, checking the actual folio would be the right thing to do.

-- 
Cheers,

David / dhildenb


