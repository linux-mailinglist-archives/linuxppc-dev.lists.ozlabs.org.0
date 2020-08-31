Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E178C25714D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 02:49:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bfs663wwMzDqRb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 10:49:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aiQXvlVe; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bfs456sB2zDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 10:47:33 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id kx11so2104839pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 17:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L2uPUbd0diUizFH/aG7R18BTYC2GKF82YOhW5bfvmaE=;
 b=aiQXvlVe91+tRR7IJAiHSRYz8WLvkiqoR/eFB9uGZ6q2CXHTafY4a3fFMX3KOV14HY
 +45wopGPwmC7B/I03pHC5sonoGvQAZCo5Cldnzotx1/QyxhbsiN90zPjtEbXuaVZkwrA
 eQftUgpyE/nmiFSpRH7sguWZ6LJ19DI+dSkpgdgsZJq8I/pWfRQvosKcE5KTJ8geoXl1
 mw/tX+1aCJxkOjKZxJV+pAGFmmlUZZs2uF1CspjE9Jk1YGbzZJ5Nhck+hqLaX5qK1Z6z
 mdq1NTqhzd5dHXI39vZsGfs+NVx/W7Ii1HFYqQGkaRzUpNAnNEey/r9yJ4uxxXV4ajZM
 iQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=L2uPUbd0diUizFH/aG7R18BTYC2GKF82YOhW5bfvmaE=;
 b=qfysqt0ScfIRZVFXHEpzbIClUK44F1u8/I+I5dyWKtFZ2v3GJt1OnvZfmNSLVdRjN6
 wdbEizHfSPMlfWt4z/ezdha9qtpRQgoOcO6RQIcjHjdjPAam/RxOw4Uar3lRhYJxXfj0
 MSM+0rv3qvFuPk5ODq3VSe+FrqU/eSbi234YpnQtix+JAt7XHD4JzAMEez9sYNTY+WVA
 K2JhjdlLZ7LPfC7OR0HKfmqpQHfmHg0L+oJuzJETNdJAqWnSHxhr2BhYcV17L9vxkWRc
 K2i+MVrK+OE/7LOIWfKRB/GdHo8oqsgoooq4yak9U4F1OTDnoPplpp2a83cMIEMeiWKz
 1YRw==
X-Gm-Message-State: AOAM531+fHsouPf+f6RP5/p2L53zicpz+Xm/CYvD8JRpIIMzxvNkZxRT
 A2Obxo0UOkTPyL2/csyUCIFR/g==
X-Google-Smtp-Source: ABdhPJydC1w3S16BGGStxnLDdFfR75Yp9pasz1f4+1XeLYpZYCUrddpUbDNkliDxUay5FW50KnSoJA==
X-Received: by 2002:a17:902:c402:: with SMTP id
 k2mr7001722plk.308.1598834849823; 
 Sun, 30 Aug 2020 17:47:29 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id u21sm5197991pjn.27.2020.08.30.17.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 17:47:29 -0700 (PDT)
Subject: Re: [PATCH v1 02/10] powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE on iommu_*_coherent()
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-3-leobras.c@gmail.com>
 <7b9640e0-568f-1470-40f4-a3ccec8abcf2@ozlabs.ru>
 <c67c66e466ad27d15aa2b970c48d2336d95b2971.camel@gmail.com>
 <da473389-f921-075a-ec8e-ea516de4f177@ozlabs.ru>
 <2aacd45f047489642da1731c92d3555ad101e3c7.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <81f106bd-8962-22f2-f14a-378d3486f57e@ozlabs.ru>
Date: Mon, 31 Aug 2020 10:47:22 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2aacd45f047489642da1731c92d3555ad101e3c7.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/08/2020 06:41, Leonardo Bras wrote:
> On Fri, 2020-08-28 at 11:40 +1000, Alexey Kardashevskiy wrote:
>>> I think it would be better to keep the code as much generic as possible
>>> regarding page sizes. 
>>
>> Then you need to test it. Does 4K guest even boot (it should but I would
>> not bet much on it)?
> 
> Maybe testing with host 64k pagesize and IOMMU 16MB pagesize in qemu
> should be enough, is there any chance to get indirect mapping in qemu
> like this? (DDW but with smaller DMA window available) 


You will have to hack the guest kernel to always do indirect mapping or
hack QEMU's rtas_ibm_query_pe_dma_window() to return a small number of
available TCEs. But you will be testing QEMU/KVM which behave quite
differently to pHyp in this particular case.



>>>> Because if we want the former (==support), then we'll have to align the
>>>> size up to the bigger page size when allocating/zeroing system pages,
>>>> etc. 
>>>
>>> This part I don't understand. Why do we need to align everything to the
>>> bigger pagesize? 
>>>
>>> I mean, is not that enough that the range [ret, ret + size[ is both
>>> allocated by mm and mapped on a iommu range?
>>>
>>> Suppose a iommu_alloc_coherent() of 16kB on PAGESIZE = 4k and
>>> IOMMU_PAGE_SIZE() == 64k.
>>> Why 4 * cpu_pages mapped by a 64k IOMMU page is not enough? 
>>> All the space the user asked for is allocated and mapped for DMA.
>>
>> The user asked to map 16K, the rest - 48K - is used for something else
>> (may be even mapped to another device) but you are making all 64K
>> accessible by the device which only should be able to access 16K.
>>
>> In practice, if this happens, H_PUT_TCE will simply fail.
> 
> I have noticed mlx5 driver getting a few bytes in a buffer, and using
> iommu_map_page(). It does map a whole page for as few bytes as the user


Whole 4K system page or whole 64K iommu page?

> wants mapped, and the other bytes get used for something else, or just
> mapped on another DMA page.
> It seems to work fine.  



With 4K system page and 64K IOMMU page? In practice it would take an
effort or/and bad luck to see it crashing. Thanks,



> 
>>
>>
>>>> Bigger pages are not the case here as I understand it.
>>>
>>> I did not get this part, what do you mean?
>>
>> Possible IOMMU page sizes are 4K, 64K, 2M, 16M, 256M, 1GB, and the
>> supported set of sizes is different for P8/P9 and type of IO (PHB,
>> NVLink/CAPI).
>>
>>
>>>>> Update those functions to guarantee alignment with requested size
>>>>> using IOMMU_PAGE_ALIGN() before doing iommu_alloc() / iommu_free().
>>>>>
>>>>> Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
>>>>> with IOMMU_PAGE_ALIGN(n, tbl), which seems easier to read.
>>>>>
>>>>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>>>>> ---
>>>>>  arch/powerpc/kernel/iommu.c | 17 +++++++++--------
>>>>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>>>>> index 9704f3f76e63..d7086087830f 100644
>>>>> --- a/arch/powerpc/kernel/iommu.c
>>>>> +++ b/arch/powerpc/kernel/iommu.c
>>>>> @@ -237,10 +237,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
>>>>>  	}
>>>>>  
>>>>>  	if (dev)
>>>>> -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
>>>>> -				      1 << tbl->it_page_shift);
>>>>> +		boundary_size = IOMMU_PAGE_ALIGN(dma_get_seg_boundary(dev) + 1, tbl);
>>>>
>>>> Run checkpatch.pl, should complain about a long line.
>>>
>>> It's 86 columns long, which is less than the new limit of 100 columns
>>> Linus announced a few weeks ago. checkpatch.pl was updated too:
>>> https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Deprecates-80-Col
>>
>> Yay finally :) Thanks,
> 
> :)
> 
>>
>>
>>>>
>>>>>  	else
>>>>> -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
>>>>> +		boundary_size = IOMMU_PAGE_ALIGN(1UL << 32, tbl);
>>>>>  	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
>>>>>  
>>>>>  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
>>>>> @@ -858,6 +857,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>>>>>  	unsigned int order;
>>>>>  	unsigned int nio_pages, io_order;
>>>>>  	struct page *page;
>>>>> +	size_t size_io = size;
>>>>>  
>>>>>  	size = PAGE_ALIGN(size);
>>>>>  	order = get_order(size);
>>>>> @@ -884,8 +884,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>>>>>  	memset(ret, 0, size);
>>>>>  
>>>>>  	/* Set up tces to cover the allocated range */
>>>>> -	nio_pages = size >> tbl->it_page_shift;
>>>>> -	io_order = get_iommu_order(size, tbl);
>>>>> +	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
>>>>> +	nio_pages = size_io >> tbl->it_page_shift;
>>>>> +	io_order = get_iommu_order(size_io, tbl);
>>>>>  	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
>>>>>  			      mask >> tbl->it_page_shift, io_order, 0);
>>>>>  	if (mapping == DMA_MAPPING_ERROR) {
>>>>> @@ -900,11 +901,11 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
>>>>>  			 void *vaddr, dma_addr_t dma_handle)
>>>>>  {
>>>>>  	if (tbl) {
>>>>> -		unsigned int nio_pages;
>>>>> +		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
>>>>> +		unsigned int nio_pages = size_io >> tbl->it_page_shift;
>>>>>  
>>>>> -		size = PAGE_ALIGN(size);
>>>>> -		nio_pages = size >> tbl->it_page_shift;
>>>>>  		iommu_free(tbl, dma_handle, nio_pages);
>>>>> +
>>>>
>>>> Unrelated new line.
>>>
>>> Will be removed. Thanks!
>>>
>>>>
>>>>>  		size = PAGE_ALIGN(size);
>>>>>  		free_pages((unsigned long)vaddr, get_order(size));
>>>>>  	}
>>>>>
> 

-- 
Alexey
