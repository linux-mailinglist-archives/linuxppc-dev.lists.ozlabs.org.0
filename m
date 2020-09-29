Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90127BBD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:12:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0mDx5zpKzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IGD60WvZ; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0lvz18lPzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:57:35 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id o20so3209291pfp.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S+WHVEos7hsrTLxKt/OYQ2riNmZLyL9uWssWFhdQpeA=;
 b=IGD60WvZ6SxlVskxMNhmMyyYI/yhTChijdXrRLtYgMd78pOnBtLzMQX8G6FUNdhkpf
 JyEaN796lZTF3VElDDQ8jlenorTTnLnEP7hrK4g9f9F7IQBkP4pB1sT66Pit51NAWPcE
 2e5A3mYZ4Pkb9O6KWnV7eqjN6fVQA7ihP4ODjTYQug6hHZKU7WvjKs5UTqhbH7N2DZyC
 08tMJDIiVADy0HidLMRqKQ6bpvfaExeIFH9FZPfLSn9yZ2P+vhEE2goa7kREDL2sMVHc
 SFivqUqXUzKiEwaM+mh4HpSh7HSLEMQOmeL7IYov0avmob2kVWR6D+gUlN5ccwVMchFl
 RCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S+WHVEos7hsrTLxKt/OYQ2riNmZLyL9uWssWFhdQpeA=;
 b=bEEHFerRyiHh2g24sOcjJtQZwePsjh26XjZma9l+wfBMlgpsMccvq5YA6Ls6GIbdfM
 UQR5U1Vs+50gj7gwfeZ+M4Ot4oCdVyiiFDhwnPdIF4nNjoPariMoSQ6pL91ckwbTk/0j
 SX8F1ao1O1DDaqpMJEzO8NckTZhIYN0EbCKW4b86tElfU6SimdHh7vmJGhaRFEIBpA+S
 9YHr3ZxG3Od+pmTGo/1Z6TNHygEL+PQNyI/zvjdQwxpnqRYgd7C+VT/WvEBdPVyusRy/
 jaPOvIyB7RUtbCjTE1djfeBwDoMG4qau/uH9LTMzi86LeijFWl1qpu58aq2se6ZtqHp9
 TqCw==
X-Gm-Message-State: AOAM532fxpGaVvyjkARwDXjbe6QyW9bOUSRBG5K14r6kIoBDLk7+wKMm
 SrNdDpcge0/d2lRaf5swdg8yW3OFvBHA1lL7
X-Google-Smtp-Source: ABdhPJxjUJQo30hdUVbtu61wuUdw5siwBBpglUFqZnlzXDs+WDQgW07lufDo+4cDjDEhF0/FbkuYWA==
X-Received: by 2002:a63:e804:: with SMTP id s4mr1681866pgh.165.1601351852175; 
 Mon, 28 Sep 2020 20:57:32 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id l7sm2617048pjz.56.2020.09.28.20.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:57:31 -0700 (PDT)
Subject: Re: [PATCH v2 03/14] powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-4-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <357690de-1ccc-b8f8-6580-73add103489c@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:57:25 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-4-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/09/2020 03:07, Leonardo Bras wrote:
> Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> 
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


This seems alright but rather unrelated to the series, probably makes 
sense to post it separately.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/kernel/iommu.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 9704f3f76e63..7961645a6980 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -237,10 +237,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
>   	}
>   
>   	if (dev)
> -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> -				      1 << tbl->it_page_shift);
> +		boundary_size = IOMMU_PAGE_ALIGN(dma_get_seg_boundary(dev) + 1, tbl);
>   	else
> -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
> +		boundary_size = IOMMU_PAGE_ALIGN(1UL << 32, tbl);
>   	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
>   
>   	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> @@ -858,6 +857,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>   	unsigned int order;
>   	unsigned int nio_pages, io_order;
>   	struct page *page;
> +	size_t size_io = size;
>   
>   	size = PAGE_ALIGN(size);
>   	order = get_order(size);
> @@ -884,8 +884,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>   	memset(ret, 0, size);
>   
>   	/* Set up tces to cover the allocated range */
> -	nio_pages = size >> tbl->it_page_shift;
> -	io_order = get_iommu_order(size, tbl);
> +	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
> +	nio_pages = size_io >> tbl->it_page_shift;
> +	io_order = get_iommu_order(size_io, tbl);
>   	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
>   			      mask >> tbl->it_page_shift, io_order, 0);
>   	if (mapping == DMA_MAPPING_ERROR) {
> @@ -900,10 +901,9 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
>   			 void *vaddr, dma_addr_t dma_handle)
>   {
>   	if (tbl) {
> -		unsigned int nio_pages;
> +		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
> +		unsigned int nio_pages = size_io >> tbl->it_page_shift;
>   
> -		size = PAGE_ALIGN(size);
> -		nio_pages = size >> tbl->it_page_shift;
>   		iommu_free(tbl, dma_handle, nio_pages);
>   		size = PAGE_ALIGN(size);
>   		free_pages((unsigned long)vaddr, get_order(size));
> 

-- 
--
Alexey
