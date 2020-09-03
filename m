Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F125B9DB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 06:42:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bhp8G2FJszDqxh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 14:42:54 +1000 (AEST)
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
 header.s=20150623 header.b=VmXMkI7L; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhp6S1H0HzDqww
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 14:41:18 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id k15so1210822pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 21:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eA+xIfXWVIHr3w0+94yVdeO2PAT7eX4zIV3zNGN5GIw=;
 b=VmXMkI7Lhn3k3cCdPsJ3a2d2gqZnwbSPE5q1n+jkkEgR5SMhhHlmpeSCya+G+TmLBT
 hbdGlxuhpktrNxBY9I15Gcf09Aom9Z5j38jasj9zcpzHsBXGnlQkGxWVhKOQduCnu3bc
 OTDuTft1TCQZFaChE5Pe7s8GUGKMoK8024Qz4n54IjLP/Nfxin7Oe5+GyXBdzfg1UNsK
 D2JC4QtyoBm71Y2xGTHXpStcSMLqXWZ/iMeKknzrr2EDc7jhya2pr8eJJiH6W8sYEjSN
 NEBTUiR3KF4NF8ysq9M+ihTRfD+2oHolyfLfBKQvT6fZVvJdcU6x1ueygECd6cyPQIKG
 VY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eA+xIfXWVIHr3w0+94yVdeO2PAT7eX4zIV3zNGN5GIw=;
 b=jv0uGH/vNNYoOHLORu3o4wnv2UtWFIrl9cVI0XY6fmh9GsIBneK3CSV3YOUYOyGUMl
 jMZmorA2w3vQ6zrW9HEwmCysN1+ys6UudMwQq45Onig0e18zDgORnRLofPFbjuTJj+QD
 JPFY9wws9qc7deTKiNJkVsPF0lpR7nndn2JbeBtWUcQuOnFM4sZWkHOADjTI3q1WNReE
 RUcDY6hFabigDhQesoY2byAJC8zpENtis4nxD3zOlntr7uHkuvaj4fi/jfFXBNMi0qO2
 lBYz59wdMBTpin4ZBUZUihmFWD/2IiCfDoCkrI6O0e9lGuUQr2t683Ouie7qjwAJCWSQ
 3nfg==
X-Gm-Message-State: AOAM532mjRIwO3OIW3DljyU9KWjnxVzMzK6hhIq6Vy+0ShxaJl6DrDxG
 XyUaIXSnWS/5vXSMGJYAf4KXqg==
X-Google-Smtp-Source: ABdhPJw0qDKU1E5oEoxpvZ6enfboVD0sQdksKixhSM6Pl6ZD2er3EKyEgMx49g5Kq+IhScfezXx4vA==
X-Received: by 2002:a17:902:7fc1:: with SMTP id
 t1mr1904321plb.24.1599108076007; 
 Wed, 02 Sep 2020 21:41:16 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id y29sm1256749pfp.141.2020.09.02.21.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 21:41:15 -0700 (PDT)
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
 <81f106bd-8962-22f2-f14a-378d3486f57e@ozlabs.ru>
 <39ad3a9c103faf9c5fc2fd5700d8606eb4a2b67e.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <8f569f68-5145-676e-50a1-b13f3fbd69cc@ozlabs.ru>
Date: Thu, 3 Sep 2020 14:41:08 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <39ad3a9c103faf9c5fc2fd5700d8606eb4a2b67e.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 02/09/2020 08:34, Leonardo Bras wrote:
> On Mon, 2020-08-31 at 10:47 +1000, Alexey Kardashevskiy wrote:
>>>
>>> Maybe testing with host 64k pagesize and IOMMU 16MB pagesize in qemu
>>> should be enough, is there any chance to get indirect mapping in qemu
>>> like this? (DDW but with smaller DMA window available)
>>
>> You will have to hack the guest kernel to always do indirect mapping or
>> hack QEMU's rtas_ibm_query_pe_dma_window() to return a small number of
>> available TCEs. But you will be testing QEMU/KVM which behave quite
>> differently to pHyp in this particular case.
>>
> 
> As you suggested before, building for 4k cpu pagesize should be the
> best approach. It would allow testing for both pHyp and qemu scenarios.
> 
>>>>>> Because if we want the former (==support), then we'll have to align the
>>>>>> size up to the bigger page size when allocating/zeroing system pages,
>>>>>> etc.
>>>>>
>>>>> This part I don't understand. Why do we need to align everything to the
>>>>> bigger pagesize?
>>>>>
>>>>> I mean, is not that enough that the range [ret, ret + size[ is both
>>>>> allocated by mm and mapped on a iommu range?
>>>>>
>>>>> Suppose a iommu_alloc_coherent() of 16kB on PAGESIZE = 4k and
>>>>> IOMMU_PAGE_SIZE() == 64k.
>>>>> Why 4 * cpu_pages mapped by a 64k IOMMU page is not enough?
>>>>> All the space the user asked for is allocated and mapped for DMA.
>>>>
>>>> The user asked to map 16K, the rest - 48K - is used for something else
>>>> (may be even mapped to another device) but you are making all 64K
>>>> accessible by the device which only should be able to access 16K.
>>>>
>>>> In practice, if this happens, H_PUT_TCE will simply fail.
>>>
>>> I have noticed mlx5 driver getting a few bytes in a buffer, and using
>>> iommu_map_page(). It does map a whole page for as few bytes as the user
>>
>> Whole 4K system page or whole 64K iommu page?
> 
> I tested it in 64k system page + 64k iommu page.
> 
> The 64K system page may be used for anything, and a small portion of it
> (say 128 bytes) needs to be used for DMA.
> The whole page is mapped by IOMMU, and the driver gets info of the
> memory range it should access / modify.


This works because the whole system page belongs to the same memory 
context and IOMMU allows a device to access that page. You can still 
have problems if there is a bug within the page but it will go mostly 
unnoticed as it will be memory corruption.

If you system page is smaller (4K) than IOMMU page (64K), then the 
device gets wider access than it should but it is still going to be 
silent memory corruption.


> 
>>
>>> wants mapped, and the other bytes get used for something else, or just
>>> mapped on another DMA page.
>>> It seems to work fine.
>>
>>
>> With 4K system page and 64K IOMMU page? In practice it would take an
>> effort or/and bad luck to see it crashing. Thanks,
> 
> I haven't tested it yet. On a 64k system page and 4k/64k iommu page, it
> works as described above.
> 
> I am new to this, so I am trying to understand how a memory page mapped
> as DMA, and used for something else could be a problem.

 From the device prospective, there is PCI space and everything from 0 
till 1<<64 is accessible and what is that mapped to - the device does 
not know. PHB's IOMMU is the thing to notice invalid access and raise 
EEH but PHB only knows about PCI->physical memory mapping (with IOMMU 
pages) but nothing about the host kernel pages. Does this help? Thanks,


> 
> Thanks!
> 
>>
>>>>
>>>>>> Bigger pages are not the case here as I understand it.
>>>>>
>>>>> I did not get this part, what do you mean?
>>>>
>>>> Possible IOMMU page sizes are 4K, 64K, 2M, 16M, 256M, 1GB, and the
>>>> supported set of sizes is different for P8/P9 and type of IO (PHB,
>>>> NVLink/CAPI).
>>>>
>>>>
>>>>>>> Update those functions to guarantee alignment with requested size
>>>>>>> using IOMMU_PAGE_ALIGN() before doing iommu_alloc() / iommu_free().
>>>>>>>
>>>>>>> Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
>>>>>>> with IOMMU_PAGE_ALIGN(n, tbl), which seems easier to read.
>>>>>>>
>>>>>>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>>>>>>> ---
>>>>>>>   arch/powerpc/kernel/iommu.c | 17 +++++++++--------
>>>>>>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>>>>>>> index 9704f3f76e63..d7086087830f 100644
>>>>>>> --- a/arch/powerpc/kernel/iommu.c
>>>>>>> +++ b/arch/powerpc/kernel/iommu.c
>>>>>>> @@ -237,10 +237,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
>>>>>>>   	}
>>>>>>>   
>>>>>>>   	if (dev)
>>>>>>> -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
>>>>>>> -				      1 << tbl->it_page_shift);
>>>>>>> +		boundary_size = IOMMU_PAGE_ALIGN(dma_get_seg_boundary(dev) + 1, tbl);
>>>>>>
>>>>>> Run checkpatch.pl, should complain about a long line.
>>>>>
>>>>> It's 86 columns long, which is less than the new limit of 100 columns
>>>>> Linus announced a few weeks ago. checkpatch.pl was updated too:
>>>>> https://www.phoronix.com/scan.php?page=news_item&px=Linux-Kernel-Deprecates-80-Col
>>>>
>>>> Yay finally :) Thanks,
>>>
>>> :)
>>>
>>>>
>>>>>>>   	else
>>>>>>> -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
>>>>>>> +		boundary_size = IOMMU_PAGE_ALIGN(1UL << 32, tbl);
>>>>>>>   	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
>>>>>>>   
>>>>>>>   	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
>>>>>>> @@ -858,6 +857,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>>>>>>>   	unsigned int order;
>>>>>>>   	unsigned int nio_pages, io_order;
>>>>>>>   	struct page *page;
>>>>>>> +	size_t size_io = size;
>>>>>>>   
>>>>>>>   	size = PAGE_ALIGN(size);
>>>>>>>   	order = get_order(size);
>>>>>>> @@ -884,8 +884,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>>>>>>>   	memset(ret, 0, size);
>>>>>>>   
>>>>>>>   	/* Set up tces to cover the allocated range */
>>>>>>> -	nio_pages = size >> tbl->it_page_shift;
>>>>>>> -	io_order = get_iommu_order(size, tbl);
>>>>>>> +	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
>>>>>>> +	nio_pages = size_io >> tbl->it_page_shift;
>>>>>>> +	io_order = get_iommu_order(size_io, tbl);
>>>>>>>   	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
>>>>>>>   			      mask >> tbl->it_page_shift, io_order, 0);
>>>>>>>   	if (mapping == DMA_MAPPING_ERROR) {
>>>>>>> @@ -900,11 +901,11 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
>>>>>>>   			 void *vaddr, dma_addr_t dma_handle)
>>>>>>>   {
>>>>>>>   	if (tbl) {
>>>>>>> -		unsigned int nio_pages;
>>>>>>> +		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
>>>>>>> +		unsigned int nio_pages = size_io >> tbl->it_page_shift;
>>>>>>>   
>>>>>>> -		size = PAGE_ALIGN(size);
>>>>>>> -		nio_pages = size >> tbl->it_page_shift;
>>>>>>>   		iommu_free(tbl, dma_handle, nio_pages);
>>>>>>> +
>>>>>>
>>>>>> Unrelated new line.
>>>>>
>>>>> Will be removed. Thanks!
>>>>>
>>>>>>>   		size = PAGE_ALIGN(size);
>>>>>>>   		free_pages((unsigned long)vaddr, get_order(size));
>>>>>>>   	}
>>>>>>>
> 

-- 
Alexey
