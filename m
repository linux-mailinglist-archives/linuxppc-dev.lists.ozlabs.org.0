Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96D20468F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 03:14:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rSxD45WDzDqbl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:14:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=R/PbpcnA; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rStH6pyYzDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 11:12:07 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d4so9102530pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 18:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8cJjMPVlfEKe8ggOR7iqr7b2lCeYFeiFU2/kH2vXHgg=;
 b=R/PbpcnA2/x5XAe1k1VP8Sq58QjfGBeNc7TzefWFZbkOgahrYMzWOHaK34y1RDUQCz
 Bf1uEJLa8gqvaDb2g4mFm07i1ElQK1L9au+kIYupKUWzrvG9wH+vuoHGDmORyDCK0elN
 jfNNFGYySuSY6CS7m9SwH9gpK+c294RVT+mqTHRIRW+Y0+NYTd3Jr8SqLPCDaN2N20Q9
 tKQE3q+v29HfSl2ZqAxeoefxWfylD1LYBWOU8uXGceaLPsXXQ+Dnrd3s69lZsLJnZaUr
 goipSUX04H4rsceW5pWLcvJ44TaNbVtglYUM3KzghlXx80XInfhI6h9Q9NQhsh0mpDV3
 p5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8cJjMPVlfEKe8ggOR7iqr7b2lCeYFeiFU2/kH2vXHgg=;
 b=XFDL9uywGRQtaLbWBkmQ5AlLwvB7PBh2hIMph4Ya+oFGPgL5+KGUEZaCtryXMejy7v
 96kAlWbsEGixJkxWnBIGR/BD0O1We0KKD/NaobrxhXQOZuRizsGtj6keYai1SF+HcjN9
 19HzZlJUIg9Pb8IhNyR8MHK4oqVII9bz9h7c0YxzCLO2hF2cYfYiB5Znj188tQ84LAob
 vOsNLDa7p4Q4RlgEPU20wN0jUN5l5WHGsizf+KxzbkOWBGyTX6xKEGH7j3jYp8VmS5Uy
 6CoAXKqQvAWIwySQHtX7X+Dz7FYcBrE7SoMxh4Qd7TxcuNsxlA7rHqlhnE0UoA1wpUjb
 RfLw==
X-Gm-Message-State: AOAM531iV15BzDbZB15yZqXueMfH/jH5LOf48+Ew7Bk+ZARzeddVv6jN
 JMnP3pCBz9+VHOxYTs9H2owIhg==
X-Google-Smtp-Source: ABdhPJzfqViZ5Bs5wlo3w6iS/CC1nRxROwkw068d74Z5M4c+XoUkgh6qQtcbuaRZUtivZr01zZW6hg==
X-Received: by 2002:a63:6741:: with SMTP id b62mr6038209pgc.58.1592874725482; 
 Mon, 22 Jun 2020 18:12:05 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id g21sm14795717pfh.134.2020.06.22.18.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 18:12:04 -0700 (PDT)
Subject: Re: [PATCH 2/4] powerpc/pseries/iommu: Implement
 ibm,reset-pe-dma-windows rtas call
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-3-leobras.c@gmail.com>
 <2f004ecc-4788-47b6-e9ae-0c08d4723008@ozlabs.ru>
 <4180fd9bb0409a9c7009fef3ccae8eb2ad46d0a2.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <c02fbebb-32ed-f328-ff93-ab2201844d61@ozlabs.ru>
Date: Tue, 23 Jun 2020 11:11:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4180fd9bb0409a9c7009fef3ccae8eb2ad46d0a2.camel@gmail.com>
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



On 23/06/2020 04:58, Leonardo Bras wrote:
> Hello Alexey, thanks for the feedback!
> 
> On Mon, 2020-06-22 at 20:02 +1000, Alexey Kardashevskiy wrote:
>>
>> On 19/06/2020 15:06, Leonardo Bras wrote:
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
>>>  arch/powerpc/platforms/pseries/iommu.c | 33 ++++++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index e5a617738c8b..5e1fbc176a37 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -1012,6 +1012,39 @@ static phys_addr_t ddw_memory_hotplug_max(void)
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
>>> +	u32 cfg_addr, ddw_ext[3];
>>> +	u64 buid;
>>> +	struct device_node *dn;
>>> +	struct pci_dn *pdn;
>>> +
>>> +	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
>>> +					 &ddw_ext[0], 3);
>>
>> s/3/2/ as for the reset extension you do not need the "64bit largest
>> block" extension.
> 
> Sure, I will update this.
> 
>>
>>
>>> +	if (ret)
>>> +		return;
>>> +
>>> +	dn = pci_device_to_OF_node(dev);
>>> +	pdn = PCI_DN(dn);
>>> +	buid = pdn->phb->buid;
>>> +	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
>>> +
>>> +	ret = rtas_call(ddw_ext[1], 3, 1, NULL, cfg_addr,
>>
>> Here the "reset" extention is in ddw_ext[1]. Hm. 1/4 has a bug then.
> 
> Humm, in 1/4 I used dd_ext[0] (how many extensions) and ddw_ext[2] (64-
> bit largest window count). I fail to see the bug here.

There is none, my bad :)


>> And I am pretty sure it won't compile as reset_dma_window() is not used
>> and it is static so fold it into one the next patches. Thanks,
> 
> Sure, I will do that. 
> I was questioning myself about this and thought it would be better to
> split for easier revision.

People separate things when a patch is really huge but even then I miss
the point - I'd really like to see a new function _and_ its uses in the
same patch, otherwise I either need to jump between mails or apply the
series, either is little but extra work :) Thanks,


>>
>>
>>> +			BUID_HI(buid), BUID_LO(buid));
>>> +	if (ret)
>>> +		dev_info(&dev->dev,
>>> +			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
>>> +			 ddw_ext[1], cfg_addr, BUID_HI(buid), BUID_LO(buid),
>>> +			 ret);
>>> +}
>>> +
>>>  /*
>>>   * If the PE supports dynamic dma windows, and there is space for a table
>>>   * that can map all pages in a linear offset, then setup such a table,
>>>
> 
> Best regards,
> Leonardo
> 

-- 
Alexey
