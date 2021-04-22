Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C7367A38
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 08:53:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQp6Y0gh1z30Cw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 16:53:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ekJ/GDgC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ekJ/GDgC; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQp671WDKz2xZQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 16:53:18 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d6so14815609qtx.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=iAm0246eJyOaq+VpTTXw3YrglwQ5iHG6TngAXGPaQRw=;
 b=ekJ/GDgCQ9NOq6O1EftMPEmUOhEniGvpya5e8SR/jPXE4pX8ffj0wdPdXZLh01njBa
 5XU/c3Q1akLwfalBI/qlBGDXoAcS2ORsCDH7bjHm9JVWTzlEPrD/SEMvqoF4doKvliTI
 jf/0t33qLbsc1cnKZUu0t9s4kLhtz//kDPu8Syi2N5/q1+hkzD7CIZno6oIUccb78LdK
 PEBpEz7jKknpO7H1rk37NZ8UD6oe8OeGfS03+d35bWJIM+cORsoc0v8lzmSqt9HcSw1p
 F98iYt29KP018HS+tFvrSjv1TawFoFTeYxyhJ9oelRS4dBqCN+PP0m1eop5mtpTuXAv1
 DFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=iAm0246eJyOaq+VpTTXw3YrglwQ5iHG6TngAXGPaQRw=;
 b=WnilVSGj+rz3e4kksDLkeephHtudYNF2molG32eBzcJSpT4RHuJX69ezlPpAPTCDE4
 5vKEZRYSnxQpkKxVrA5/20zU8h6od7bZsHdC3FmA17TW7l3P7cXz9f6mDAvQKxoMBw3S
 /Ue8UYWLnshSPFwF4b7TqPtiUdqoefn6RCTI+7oetTjuvUhuKZAb+mcfUUrJB345Mj59
 BkJOhcrk9q1p/4sP+o1PQa/UCbfCQ286N5RlxEO0EtLyRH/SeOXAL8g4iuNIwK8JcTIO
 zx0mGCWnvemxX/eS8+UiJkkrYXKFw8k5297lT7Cpx0XrRlH7ocEE1pT25f6kZ/nff2Pl
 zSyw==
X-Gm-Message-State: AOAM533sxagZGpODlpG0ogzpKczMJ7KrRSGxx8i/sQjV+0z4RLSp44HS
 RACL1wqDIctoNs2x0KvBsHg=
X-Google-Smtp-Source: ABdhPJz6IVp3/kP3Nos6ocKWVEplVJWfejg+HRZjVHCd8geVXas43GYZo3VQvrSby2xDEgzF1C+HFA==
X-Received: by 2002:ac8:7089:: with SMTP id y9mr1695704qto.207.1619074396738; 
 Wed, 21 Apr 2021 23:53:16 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id d4sm1761854qtp.23.2021.04.21.23.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 23:53:16 -0700 (PDT)
Message-ID: <2f985cdb2a62c52ce2a26118f1966c00176cc4b9.camel@gmail.com>
Subject: Re: [PATCH 1/1] powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy
 <aik@ozlabs.ru>, Nicolin Chen <nicoleotsuka@gmail.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>
Date: Thu, 22 Apr 2021 03:53:13 -0300
In-Reply-To: <20210318174414.684630-1-leobras.c@gmail.com>
References: <20210318174414.684630-1-leobras.c@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This patch was also reviewed when it was part of another patchset:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200911170738.82818-4-leobras.c@gmail.com/

On Thu, 2021-03-18 at 14:44 -0300, Leonardo Bras wrote:
> Currently both iommu_alloc_coherent() and iommu_free_coherent() align the
> desired allocation size to PAGE_SIZE, and gets system pages and IOMMU
> mappings (TCEs) for that value.
> 
> When IOMMU_PAGE_SIZE < PAGE_SIZE, this behavior may cause unnecessary
> TCEs to be created for mapping the whole system page.
> 
> Example:
> - PAGE_SIZE = 64k, IOMMU_PAGE_SIZE() = 4k
> - iommu_alloc_coherent() is called for 128 bytes
> - 1 system page (64k) is allocated
> - 16 IOMMU pages (16 x 4k) are allocated (16 TCEs used)
> 
> It would be enough to use a single TCE for this, so 15 TCEs are
> wasted in the process.
> 
> Update iommu_*_coherent() to make sure the size alignment happens only
> for IOMMU_PAGE_SIZE() before calling iommu_alloc() and iommu_free().
> 
> Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
> with IOMMU_PAGE_ALIGN(n, tbl), which is easier to read and does the
> same.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/kernel/iommu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 5b69a6a72a0e..3329ef045805 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -851,6 +851,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>  	unsigned int order;
>  	unsigned int nio_pages, io_order;
>  	struct page *page;
> +	size_t size_io = size;
>  
> 
>  	size = PAGE_ALIGN(size);
>  	order = get_order(size);
> @@ -877,8 +878,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>  	memset(ret, 0, size);
>  
> 
>  	/* Set up tces to cover the allocated range */
> -	nio_pages = size >> tbl->it_page_shift;
> -	io_order = get_iommu_order(size, tbl);
> +	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
> +	nio_pages = size_io >> tbl->it_page_shift;
> +	io_order = get_iommu_order(size_io, tbl);
>  	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
>  			      mask >> tbl->it_page_shift, io_order, 0);
>  	if (mapping == DMA_MAPPING_ERROR) {
> @@ -893,10 +895,9 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
>  			 void *vaddr, dma_addr_t dma_handle)
>  {
>  	if (tbl) {
> -		unsigned int nio_pages;
> +		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
> +		unsigned int nio_pages = size_io >> tbl->it_page_shift;
>  
> 
> -		size = PAGE_ALIGN(size);
> -		nio_pages = size >> tbl->it_page_shift;
>  		iommu_free(tbl, dma_handle, nio_pages);
>  		size = PAGE_ALIGN(size);
>  		free_pages((unsigned long)vaddr, get_order(size));


