Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763029DE0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 01:48:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM6JD6VXdzDqWn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 11:48:44 +1100 (AEDT)
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
 header.s=20150623 header.b=wyUORgbJ; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM6GT0JBJzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 11:47:08 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id o129so917953pfb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 17:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ldq+BaCHFGxiQTunTg58Jqzdh7VCGURX37mdUjZn1eU=;
 b=wyUORgbJvh+A575hdAXGUhNMCPw2wjQqdKzftI+f9ACZ1VWqKMv2WzlcukXSGHIcQT
 O4SGKDkosOnrJcbFMx5mGpjzLYeu1wBdshKLKwvJo4ZtCVfJHt88nV6rwcNZRyLCcuBK
 WVKbePw2HHKJIMcwmeprnWx/gMfEJKOGWu1A6PQfxS5gXwsYa5EYNW9ZgkaRJD6NXdHy
 UwnvCCMf7VA/g3JCio7G29RkHOvr7uEbJawL51kzBquv9WVcdKW5CKAWL8Vu59p2Worl
 wlw/bljoUorb5DkysNzoumwxLEi0oHQk9XsUaS6x8RfbfndUZlGC1j9zvmQkwQnvSex5
 GGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ldq+BaCHFGxiQTunTg58Jqzdh7VCGURX37mdUjZn1eU=;
 b=IaM1v6fdADcLXp6e6K1SxfA+P/jXtDY3yFzEK1V1Bx98QH/dos52XTLlqlpYDTYeyb
 HJPnr5lVQH+J1f6xHhiSTURm6nu0jU444U7AWT5Be/48rT/aSpCYZONVlZ4uRbVXcXYA
 nMHiRZcir45Q3RNTV/i5R/wnsM2mpqmuXMYOouXLFA8u+i0MPb4k6hjYUoCBfdUsuOQd
 TkTIhOcOkE1MKEl71NvT0rxpGk5zNHSURKv4r6t8RQmWY+rtxSQ73gpJ7Q3W0yAzX3/T
 RLWyVoS9uEDegfTJHufjikM5QuIwzZ2p6kTBP7ozhNWwA4TX9OL/q8u2oBznE6uOlxjP
 XXSA==
X-Gm-Message-State: AOAM53047m+w0CwB5dqbCbUoRQtYI8oObVNETicBcVEwctbw6cM+FpuS
 WcFEHtpWoiRETlm0ZqCFawgb4w==
X-Google-Smtp-Source: ABdhPJwQeHwGAhLun9jUEWuolN0Z952UoAYpqBQvc1TiN1O0YqY/U4Wvi4c0j0oLKnp0h8WabeYK3g==
X-Received: by 2002:a63:b516:: with SMTP id y22mr1772608pge.154.1603932425075; 
 Wed, 28 Oct 2020 17:47:05 -0700 (PDT)
Received: from [192.168.10.88] (124-171-72-187.dyn.iinet.net.au.
 [124.171.72.187])
 by smtp.gmail.com with UTF8SMTPSA id v16sm533051pgk.26.2020.10.28.17.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 17:47:04 -0700 (PDT)
Subject: Re: [PATCH kernel v3 2/2] powerpc/dma: Fallback to dma_ops when
 persistent memory present
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20201028070030.60643-1-aik@ozlabs.ru>
 <20201028070030.60643-3-aik@ozlabs.ru> <87eelhx3t6.fsf@mpe.ellerman.id.au>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <2f285412-9e19-7888-1102-f50658c43b9d@ozlabs.ru>
Date: Thu, 29 Oct 2020 11:46:59 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101
 Thunderbird/83.0
MIME-Version: 1.0
In-Reply-To: <87eelhx3t6.fsf@mpe.ellerman.id.au>
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
Cc: iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/10/2020 11:40, Michael Ellerman wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>> index e4198700ed1a..91112e748491 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -1111,11 +1112,13 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
>>    */
>>   static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>   {
>> -	int len, ret;
>> +	int len = 0, ret;
>> +	bool pmem_present = of_find_node_by_type(NULL, "ibm,pmemory") != NULL;
> 
> That leaks a reference on the returned node.
> 
> 	dn = of_find_node_by_type(NULL, "ibm,pmemory");
> 	pmem_present = dn != NULL;
> 	of_node_put(dn);


ah, true. v4 then.


> 
> 
>> @@ -1126,7 +1129,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>   
>>   	mutex_lock(&direct_window_init_mutex);
>>   
>> -	dma_addr = find_existing_ddw(pdn);
>> +	dma_addr = find_existing_ddw(pdn, &len);
> 
> I don't see len used anywhere?
> 
>>   	if (dma_addr != 0)
>>   		goto out_unlock;
>>   
>> @@ -1212,14 +1215,26 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>   	}
>>   	/* verify the window * number of ptes will map the partition */
>>   	/* check largest block * page size > max memory hotplug addr */
>> -	max_addr = ddw_memory_hotplug_max();
>> -	if (query.largest_available_block < (max_addr >> page_shift)) {
>> -		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
>> -			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
>> -			  1ULL << page_shift);
>> +	/*
>> +	 * The "ibm,pmemory" can appear anywhere in the address space.
>> +	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
>> +	 * for the upper limit and fallback to max RAM otherwise but this
>> +	 * disables device::dma_ops_bypass.
>> +	 */
>> +	len = max_ram_len;
> 
> Here you override whatever find_existing_ddw() wrote to len?


Not always, there is a bunch of gotos before this line to the end of the 
function and one (which returns the existing window) is legit. Thanks,



> 
>> +	if (pmem_present) {
>> +		if (query.largest_available_block >=
>> +		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>> +			len = MAX_PHYSMEM_BITS - page_shift;
>> +		else
>> +			dev_info(&dev->dev, "Skipping ibm,pmemory");
>> +	}
>> +
>> +	if (query.largest_available_block < (1ULL << (len - page_shift))) {
>> +		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
>> +			1ULL << len, query.largest_available_block, 1ULL << page_shift);
>>   		goto out_failed;
>>   	}
>> -	len = order_base_2(max_addr);
>>   	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
>>   	if (!win64) {
>>   		dev_info(&dev->dev,
> 
> 
> cheers
> 

-- 
Alexey
