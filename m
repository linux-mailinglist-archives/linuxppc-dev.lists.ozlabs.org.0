Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94F91DAD8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 11:00:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FRZQBMD+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FRZQBMD+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCKkW1dlgz3fsb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 19:00:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FRZQBMD+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FRZQBMD+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCKjq43MFz3fqH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 18:59:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719824379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9uYOVYe/S8vLD+pbmxnWXeRCdyZnIcQi9ch5IcOoz4I=;
	b=FRZQBMD++7EppFynmylyAN2C9CO/uJnyQ6JVKM3Kt8z6GKOStpdg/SBCIC77xM5GWFnyfX
	qJdoSECx8IixDhYjX0lRccv2SPUmm61QznYbmVIm/kLGpErxpWb8UZY4AqFU8FvXXjp67z
	oNBMuXX8LEYZ/1AmcXrMgJKBjFI+HDQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719824379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9uYOVYe/S8vLD+pbmxnWXeRCdyZnIcQi9ch5IcOoz4I=;
	b=FRZQBMD++7EppFynmylyAN2C9CO/uJnyQ6JVKM3Kt8z6GKOStpdg/SBCIC77xM5GWFnyfX
	qJdoSECx8IixDhYjX0lRccv2SPUmm61QznYbmVIm/kLGpErxpWb8UZY4AqFU8FvXXjp67z
	oNBMuXX8LEYZ/1AmcXrMgJKBjFI+HDQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-yDDcUh3kPYuH-QWYL_k1GQ-1; Mon, 01 Jul 2024 04:59:37 -0400
X-MC-Unique: yDDcUh3kPYuH-QWYL_k1GQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a72716df71eso209414766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 01:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824376; x=1720429176;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uYOVYe/S8vLD+pbmxnWXeRCdyZnIcQi9ch5IcOoz4I=;
        b=XTLSUktKxPbUIUSg/ih+ITKuqeqxSCPM7Va4j/z8EsyEs5A4hY5rKcS1gBPWvURtdO
         k6w6jHH/fsBgte7lGrdZ5/imyjVgf0SUau8DJ0w9V1et+ORov5EdlYVjcDw5Ja7TQhKs
         An+VbpGL3GBjMnj6TK3cfeyyl9EqGvYMsZxqZWxLwzlzjhm1rmmD3N9o+tiFIlllMDNk
         rdPFzcuWMWqhmWWfUncHwhQQg1muAxFKv2BIuJxl85cSXcvlrm9DGcFtDZ7OH1Nrx5kf
         8e19Vd82XdVXMVeNM4IbN2WhbUpsSEN2qgXhBhz9Bhc1I69GYaOCtkqAtIytZXiRQeyM
         LN0w==
X-Forwarded-Encrypted: i=1; AJvYcCU8QoTI2/kfHVGhp/3kJjpH6A8ynw35kiVf+iQSJIEBdVxEc2h9C6GNJbLlhVuAVTWzF99zaik9BvrwugDUIcQ4AkQR/lIg4/elmstYew==
X-Gm-Message-State: AOJu0Yw9b0pECQvgKCkPAzQC1KC54ZEzll2DK3x5+Fs2ODgKfHQFPLQ8
	ySNgEuS3O2day7bKR1OXpRgv003NQu4Gb0Z6vFlSzRhIGPu3n4r4Wqf6D2eCXl2x0VHdL/+EfSb
	ITG5V5IuUM0wlcoTY072ZEAgxVHpsgmapeb3bw+MUalUNyljPo/RAjHrVflTBetY=
X-Received: by 2002:a17:907:3e9f:b0:a6f:50ae:e02 with SMTP id a640c23a62f3a-a751446803fmr478916566b.4.1719824376387;
        Mon, 01 Jul 2024 01:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM3czGdSGmbeNbLrkMbgpMQyqMRvlRY7ksZCrI83uQ/r1Cugdq08d/zn9Zqwxvl5smKMdCgg==
X-Received: by 2002:a17:907:3e9f:b0:a6f:50ae:e02 with SMTP id a640c23a62f3a-a751446803fmr478913666b.4.1719824375888;
        Mon, 01 Jul 2024 01:59:35 -0700 (PDT)
Received: from [100.81.188.195] ([178.24.249.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab06565csm311746366b.103.2024.07.01.01.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:59:35 -0700 (PDT)
Message-ID: <f9539968-4b76-41a9-92d5-00082c7d1e96@redhat.com>
Date: Mon, 1 Jul 2024 10:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] gup: Don't allow FOLL_LONGTERM pinning of FS DAX
 pages
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
 <74a9fc9e018e54d7afbeae166479e2358e0a1225.1719386613.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <74a9fc9e018e54d7afbeae166479e2358e0a1225.1719386613.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, linux-doc@vger.kernel.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, willy@infradead.org, djwong@kernel.org, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27.06.24 02:54, Alistair Popple wrote:
> Longterm pinning of FS DAX pages should already be disallowed by
> various pXX_devmap checks. However a future change will cause these
> checks to be invalid for FS DAX pages so make
> folio_is_longterm_pinnable() return false for FS DAX pages.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>   include/linux/memremap.h | 11 +++++++++++
>   include/linux/mm.h       |  4 ++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 6505713..19a448e 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -193,6 +193,17 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
>   	return is_device_coherent_page(&folio->page);
>   }
>   
> +static inline bool is_device_dax_page(const struct page *page)
> +{
> +	return is_zone_device_page(page) &&
> +		page_dev_pagemap(page)->type == MEMORY_DEVICE_FS_DAX;
> +}
> +
> +static inline bool folio_is_device_dax(const struct folio *folio)
> +{
> +	return is_device_dax_page(&folio->page);
> +}
> +
>   #ifdef CONFIG_ZONE_DEVICE
>   void zone_device_page_init(struct page *page);
>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b84368b..4d1cdea 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2032,6 +2032,10 @@ static inline bool folio_is_longterm_pinnable(struct folio *folio)
>   	if (folio_is_device_coherent(folio))
>   		return false;
>   
> +	/* DAX must also always allow eviction. */
> +	if (folio_is_device_dax(folio))
> +		return false;
> +
>   	/* Otherwise, non-movable zone folios can be pinned. */
>   	return !folio_is_zone_movable(folio);
>   

Why is the check in check_vma_flags() insufficient? GUP-fast maybe?

-- 
Cheers,

David / dhildenb

