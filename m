Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C229CE6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 07:57:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLfWh0w6xzDqRx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 17:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1zT8ojDO; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLfV03PnVzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 17:55:32 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id a200so2358605pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0gyGFaDOcOeQhjWoBvvUrgMjgi73degQBGCdgvQxJWw=;
 b=1zT8ojDOkSyqm3LHsLojKFZue3lfDkmgiWdwR7z3MDg2KVVJQGN/8bLcvGve/9V3pS
 kBPxpkrMojKBM57d5lD99sAlDJiRCtLv7Obo9mUqTw5lqcvJb+a3sVumt4NQIsPQ0c+h
 5ZiQ3KTjFB4WDGRRJNKwnOHtY4CoJgy7lr08/ICOLvF0N/EXWRGrijyARFNwUBVjBxLJ
 JD1q1WUh/pnebnTDXWA7JpJeffYh5IFKaVEz7/CsXrXi+69HYzxfY3pQ40hxcM2sJt05
 gx5BSOdWvwBaK+xQ8yZ7PrpnOnogk80Pda4TRHVztUF6Mzv244Yy5pHVvOTgs09BfV59
 A7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0gyGFaDOcOeQhjWoBvvUrgMjgi73degQBGCdgvQxJWw=;
 b=LS0HsSs//nbVuqSWwL3eKBrYRXN1hzJ0cytUQosw0zoCeowA8EvGymTDERzvzJtZZ/
 wAjFux3M3Xk5Nki98rKu5Madbu6aFF9IabRBJDz8lgDSUnAYi7YZkR8P3pxM8A1tQLxV
 xzGR83xTwBw/VkLJsoaPDge0/WnzHWoZth5hFNvON/vPlY5GVt16P3Mu8iPJKT4XmHQd
 tTJh+zbJrgvjUHJCkraXL51Uumklk+7Xo6bbm5ZJxDOVRRud3u560Rl3Fgxp0Dxh28+t
 30CjnNJypmWV1j8aFiC7HaUr12l5kM+2GDC3SjQ8IzWDRcNXoRgH8ggAX2DaNGY46L1l
 hpiQ==
X-Gm-Message-State: AOAM532hYZuSX12pjMKUTt/mkMvr9hZwOWnZA1PfMi1Zj0VmFjqfVRJy
 TywYAQvX0JjF0i8UXW3+fCjZdA==
X-Google-Smtp-Source: ABdhPJwLK7sVbIf76eH/CksvHl+Gf+oPqZSizyfuyOV5tzPAtqjO0/LOeSMI+tR01QpsT10hmjc/Cg==
X-Received: by 2002:a62:a10a:0:b029:154:fd62:ba90 with SMTP id
 b10-20020a62a10a0000b0290154fd62ba90mr5423227pff.62.1603868128933; 
 Tue, 27 Oct 2020 23:55:28 -0700 (PDT)
Received: from [192.168.10.88] (124-171-72-187.dyn.iinet.net.au.
 [124.171.72.187])
 by smtp.gmail.com with UTF8SMTPSA id b6sm4288883pjq.42.2020.10.27.23.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:55:27 -0700 (PDT)
Subject: Re: [PATCH kernel v2 1/2] dma: Allow mixing bypass and normal IOMMU
 operation
To: Christoph Hellwig <hch@lst.de>
References: <20201027101841.96056-1-aik@ozlabs.ru>
 <20201027101841.96056-2-aik@ozlabs.ru> <20201027164858.GA30651@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <28147035-500d-f3cd-f283-257066343697@ozlabs.ru>
Date: Wed, 28 Oct 2020 17:55:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101
 Thunderbird/83.0
MIME-Version: 1.0
In-Reply-To: <20201027164858.GA30651@lst.de>
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
Cc: iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 28/10/2020 03:48, Christoph Hellwig wrote:
>> +static inline bool dma_handle_direct(struct device *dev, dma_addr_t dma_handle)
>> +{
>> +       return dma_handle >= dev->archdata.dma_offset;
>> +}
> 
> This won't compile except for powerpc, and directly accesing arch members
> in common code is a bad idea.  Maybe both your helpers need to be
> supplied by arch code to better abstract this out.


rats, overlooked it :( bus_dma_limit is generic but dma_offset is in 
archdata :-/


> 
>>   	if (dma_map_direct(dev, ops))
>>   		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	else if (dev->bus_dma_limit &&
>> +		 can_map_direct(dev, (phys_addr_t) page_to_phys(page) + offset + size))
>> +		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
>> +#endif
> 
> I don't think page_to_phys needs a phys_addr_t on the return value.
> I'd also much prefer if we make this a little more beautiful, here
> are a few suggestions:
> 
>   - hide the bus_dma_limit check inside can_map_direct, and provide a
>     stub so that we can avoid the ifdef
>   - use a better name for can_map_direct, and maybe also a better calling
>     convention by passing the page (the sg code also has the page), 

It is passing an address of the end of the mapped area so passing a page 
struct means passing page and offset which is an extra parameter and we 
do not want to do anything with the page in those hooks anyway so I'd 
keep it as is.


> and
>     maybe even hide the dma_map_direct inside it.

Call dma_map_direct() from arch_dma_map_page_direct() if 
arch_dma_map_page_direct() is defined? Seems suboptimal as it is going 
to be bypass=true in most cases and we save one call by avoiding calling 
arch_dma_map_page_direct(). Unless I missed something?


> 
> 	if (dma_map_direct(dev, ops) ||
> 	    arch_dma_map_page_direct(dev, page, offset, size))
> 		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> 
>>   	BUG_ON(!valid_dma_direction(dir));
>>   	if (dma_map_direct(dev, ops))
>>   		dma_direct_unmap_page(dev, addr, size, dir, attrs);
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	else if (dev->bus_dma_limit && dma_handle_direct(dev, addr + size))
>> +		dma_direct_unmap_page(dev, addr, size, dir, attrs);
>> +#endif
> 
> Same here.
> 
>>   	if (dma_map_direct(dev, ops))
>>   		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	else if (dev->bus_dma_limit) {
>> +		struct scatterlist *s;
>> +		bool direct = true;
>> +		int i;
>> +
>> +		for_each_sg(sg, s, nents, i) {
>> +			direct = can_map_direct(dev, sg_phys(s) + s->offset + s->length);
>> +			if (!direct)
>> +				break;
>> +		}
>> +		if (direct)
>> +			ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>> +		else
>> +			ents = ops->map_sg(dev, sg, nents, dir, attrs);
>> +	}
>> +#endif
> 
> This needs to go into a helper as well.  I think the same style as
> above would work pretty nicely as well:

Yup. I'll repost v3 soon with this change. Thanks for the review.


> 
>   	if (dma_map_direct(dev, ops) ||
> 	    arch_dma_map_sg_direct(dev, sg, nents))
>   		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>   	else
>   		ents = ops->map_sg(dev, sg, nents, dir, attrs);
> 
>> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
>> +	if (dev->bus_dma_limit) {
>> +		struct scatterlist *s;
>> +		bool direct = true;
>> +		int i;
>> +
>> +		for_each_sg(sg, s, nents, i) {
>> +			direct = dma_handle_direct(dev, s->dma_address + s->length);
>> +			if (!direct)
>> +				break;
>> +		}
>> +		if (direct) {
>> +			dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
>> +			return;
>> +		}
>> +	}
>> +#endif
> 
> One more time here..
> 

-- 
Alexey
