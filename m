Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA996211722
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 02:27:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xzSl5bBNzDqZS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:27:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=uyHygEaA; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xzQk46dZzDqCl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 10:25:50 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so5154936pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 17:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GiOiIEreHai68qndeky21ibubr5pF9HK5Dtgwh5kAUo=;
 b=uyHygEaAKTObiG0zFxV7a31D8FMziPZ1iUbzLv+GkJzSatoobsaUXCbrVNGjxWj0zb
 lQsdBsnuWzEkK/dzaI2VM5Ojq2GpJfZ5U1GiX6rGjU2vXoqlm6JLUOneKh8C8KEVegcv
 sxiyaEH1UPbA/APiH/DxVfYxAf3QUx9g/2Prb/+RiNGbfjzM8h7jqVgROTdpiQdRfhum
 DAc3BwurN7NWwZ1wflEzWjf+yC4ZwoH9UeUReWQV5jhUBgf4H6cyxCBWVnMDs4fhCpq4
 yRaewT4sKyDRZ2S4MShlcZghX3LMgg799DAEi9dtu3D/T7U/L9cCk/pqZ1rEmbfxVkMR
 TAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GiOiIEreHai68qndeky21ibubr5pF9HK5Dtgwh5kAUo=;
 b=BgNOTB8AsIZMt/XlCQXCTww38UKst4LYS0sQnkHGlh21GDkiEypO/B1ql1t27qMlpn
 srPIH4kHp4gR5imTAqZ6fOEbIweqGFw5sp16LCyTjknJnRnP7tMBErs1pJ+4uxM/Zz7I
 qGHB90XpXQ6+ZP6dzHHFNndi6U3CjU7GPI9YH4njwiELQii0vLwsFlumY6rmVpNDa5qM
 Oeuczb4tTcvOnezWkUU9a3Na6eAIfz262QNNv74Z1uXEW+PDhioaLwxvMA1dNeZgQ+PK
 G0nCdsODHxhMbuvStU+3t2jk+x9layzZHAfyEvycWV783uXnfUIpJfb6LwFKW5u1I0OH
 EIGg==
X-Gm-Message-State: AOAM532+X18I+q0RtOLt5x+ry7WlzjB8iANargpr8aidhLX5n+l5GsCD
 0MnibfcVnXxr5Av5nMFIRR4LUg==
X-Google-Smtp-Source: ABdhPJzHl4EnT9TB5i2KhQDNGRu369jdjci6JzB858wWBTY3siZFFliJqOAdrrZskngsHGT3Uyx7Wg==
X-Received: by 2002:a17:90a:1544:: with SMTP id
 y4mr29916282pja.130.1593649546466; 
 Wed, 01 Jul 2020 17:25:46 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id w29sm6837901pfq.128.2020.07.01.17.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 17:25:45 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-5-leobras.c@gmail.com>
 <e00340a3-1070-a787-5acc-0bfc37f73dff@ozlabs.ru>
 <42e7174bf60227caee4d1c353235e42b90305632.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <fa5ab90d-dc00-4b28-28e1-432720d4b614@ozlabs.ru>
Date: Thu, 2 Jul 2020 10:25:41 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <42e7174bf60227caee4d1c353235e42b90305632.camel@gmail.com>
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



On 02/07/2020 05:48, Leonardo Bras wrote:
> On Wed, 2020-07-01 at 18:17 +1000, Alexey Kardashevskiy wrote:
>>
>> On 24/06/2020 16:24, Leonardo Bras wrote:
>>> On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
>>> default DMA window for the device, before attempting to configure a DDW,
>>> in order to make the maximum resources available for the next DDW to be
>>> created.
>>>
>>> This is a requirement for some devices to use DDW, given they only
>>> allow one DMA window.
>>
>> Devices never know about these windows, it is purely PHB's side of
>> things. A device can access any address on the bus, the bus can generate
>> an exception if there is no window behind the address OR some other
>> device's MMIO. We could actually create a second window in addition to
>> the first one and allocate bus addresses from both, we just simplifying
>> this by merging two separate non-adjacent windows into one.
> 
> That's interesting, I was not aware of this. 
> I will try to improve this commit message with this info.
> Thanks for sharing!
> 
>>>>> If setting up a new DDW fails anywhere after the removal of this
>>> default DMA window, it's needed to restore the default DMA window.
>>> For this, an implementation of ibm,reset-pe-dma-windows rtas call is
>>> needed:
>>>
>>> Platforms supporting the DDW option starting with LoPAR level 2.7 implement
>>> ibm,ddw-extensions. The first extension available (index 2) carries the
>>> token for ibm,reset-pe-dma-windows rtas call, which is used to restore
>>> the default DMA window for a device, if it has been deleted.
>>>
>>> It does so by resetting the TCE table allocation for the PE to it's
>>> boot time value, available in "ibm,dma-window" device tree node.
>>>
>>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>>> ---
>>>  arch/powerpc/platforms/pseries/iommu.c | 70 ++++++++++++++++++++++----
>>>  1 file changed, 61 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index a8840d9e1c35..4fcf00016fb1 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -1029,6 +1029,39 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>>>  	return max_addr;
>>>  }
>>>  
>>> +/*
>>> + * Platforms supporting the DDW option starting with LoPAR level 2.7 implement
>>> + * ibm,ddw-extensions, which carries the rtas token for
>>> + * ibm,reset-pe-dma-windows.
>>> + * That rtas-call can be used to restore the default DMA window for the device.
>>> + */
>>> +static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
>>> +{
>>> +	int ret;
>>> +	u32 cfg_addr, ddw_ext[DDW_EXT_RESET_DMA_WIN + 1];
>>> +	u64 buid;
>>> +	struct device_node *dn;
>>> +	struct pci_dn *pdn;
>>> +
>>> +	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
>>> +					 &ddw_ext[0], DDW_EXT_RESET_DMA_WIN + 1);
>>> +	if (ret)
>>> +		return;
>>> +
>>> +	dn = pci_device_to_OF_node(dev);
>>> +	pdn = PCI_DN(dn);
>>> +	buid = pdn->phb->buid;
>>> +	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
>>> +
>>> +	ret = rtas_call(ddw_ext[DDW_EXT_RESET_DMA_WIN], 3, 1, NULL, cfg_addr,
>>> +			BUID_HI(buid), BUID_LO(buid));
>>> +	if (ret)
>>> +		dev_info(&dev->dev,
>>> +			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
>>> +			 ddw_ext[1], cfg_addr, BUID_HI(buid), BUID_LO(buid),
>>
>> s/ddw_ext[1]/ddw_ext[DDW_EXT_RESET_DMA_WIN]/
> 
> Good catch! I missed this one.
> 
>>
>>
>>> +			 ret);
>>> +}
>>> +
>>>  /*
>>>   * If the PE supports dynamic dma windows, and there is space for a table
>>>   * that can map all pages in a linear offset, then setup such a table,
>>> @@ -1049,8 +1082,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>  	u64 dma_addr, max_addr;
>>>  	struct device_node *dn;
>>>  	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>>> +
>>
>> Unrelated new empty line.
> 
> Fixed!
> 
>>
>>
>>>  	struct direct_window *window;
>>> -	struct property *win64;
>>> +	struct property *win64, *default_win = NULL, *ddw_ext = NULL;
>>>  	struct dynamic_dma_window_prop *ddwprop;
>>>  	struct failed_ddw_pdn *fpdn;
>>>  
>>> @@ -1085,7 +1119,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>  	if (ret)
>>>  		goto out_failed;
>>>  
>>> -       /*
>>> +	/*
>>>  	 * Query if there is a second window of size to map the
>>>  	 * whole partition.  Query returns number of windows, largest
>>>  	 * block assigned to PE (partition endpoint), and two bitmasks
>>> @@ -1096,15 +1130,31 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>  	if (ret != 0)
>>>  		goto out_failed;
>>>  
>>> +	/*
>>> +	 * If there is no window available, remove the default DMA window,
>>> +	 * if it's present. This will make all the resources available to the
>>> +	 * new DDW window.
>>> +	 * If anything fails after this, we need to restore it, so also check
>>> +	 * for extensions presence.
>>> +	 */
>>>  	if (query.windows_available == 0) {
>>
>> Does phyp really always advertise 0 windows for these VFs? What is in
>> the largest_available_block when windows_available==0?
> 
> For this VF, it always advertise 0 windows before removing the default
> DMA window. The largest available block size is the same as after the
> removal (256GB). The only value that changes after removal is the
> number of available windows. Here some debug prints:

> 
> [    3.473149] mlx5_core 4005:01:00.0: ibm,query-pe-dma-windows(53)
> 10000 8000000 29004005 returned 0
> [    3.473162] mlx5_core 4005:01:00.0: windows_available = 0,
> largest_block = 400000, page_size = 3, migration_capable = 3
> [    3.473332] mlx5_core 4005:01:00.0: ibm,query-pe-dma-windows(53)
> 10000 8000000 29004005 returned 0
> [    3.473345] mlx5_core 4005:01:00.0: windows_available = 1,
> largest_block = 400000, page_size = 3, migration_capable = 3



Ah, I see, thanks for the info. Ok, they really do not want us to have 2
windows. Oh well.



> 
>>
>>
>>> -		/*
>>> -		 * no additional windows are available for this device.
>>> -		 * We might be able to reallocate the existing window,
>>> -		 * trading in for a larger page size.
>>> -		 */
>>> -		dev_dbg(&dev->dev, "no free dynamic windows");
>>> -		goto out_failed;
>>> +		default_win = of_find_property(pdn, "ibm,dma-window", NULL);
>>> +		ddw_ext = of_find_property(pdn, "ibm,ddw-extensions", NULL);
>>> +		if (default_win && ddw_ext)
>>> +			remove_dma_window(pdn, ddw_avail, default_win);
>>> +
>>> +		/* Query again, to check if the window is available */
>>> +		ret = query_ddw(dev, ddw_avail, &query, pdn);
>>> +		if (ret != 0)
>>> +			goto out_failed;
>>> +
>>> +		if (query.windows_available == 0) {
>>> +			/* no windows are available for this device. */
>>> +			dev_dbg(&dev->dev, "no free dynamic windows");
>>> +			goto out_failed;
>>> +		}
>>>  	}
>>> +
>>
>> Unrelated new empty line. Thanks,
> Fixed!
> Thank you!
> 
>>
>>>  	if (query.page_size & 4) {
>>>  		page_shift = 24; /* 16MB */
>>>  	} else if (query.page_size & 2) {
>>> @@ -1194,6 +1244,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>  	kfree(win64);
>>>  
>>>  out_failed:
>>> +	if (default_win && ddw_ext)
>>> +		reset_dma_window(dev, pdn);
>>>  
>>>  	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
>>>  	if (!fpdn)
>>>
> 

-- 
Alexey
