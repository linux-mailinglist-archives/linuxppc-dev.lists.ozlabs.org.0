Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9820468E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 03:13:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rSvZ565HzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=B2TwJJWf; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rSsm70dtzDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 11:11:40 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x207so9287841pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 18:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Te6XH2WWyEtRg5fASpEaNBfBqM39Xth0m8KZYGivb7M=;
 b=B2TwJJWfdkW6MI5l3/qOwyEp3NDCIvhTwwAwBTsIOTMdv5HQZvDwiIy4CN9NhAIZqt
 xliyzZG3p30/oDCmH/5B6mdkWCBBUQyk0cF5EmCFpe8baQPEVAbKFXFKT/yPDn0A3IU+
 fRH9aECmd+HN0f7HWyUjpZ3Dnxc+PE90JBHkqlOPN7QhwldfYoqICimfLm2g5mpwVCvL
 Mi0+nUSdzDOeDsh0ynoufeaxroEobJhjgFHLQXpyqmH1o2pNQzhXlgjT2//goy5hgAMC
 oIo85mZpkKwur0XKp4IKq+EMScjt+7HFFyO1wfPptpZ8FrXmcXphxoJyByPu5bbZIb6b
 UV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Te6XH2WWyEtRg5fASpEaNBfBqM39Xth0m8KZYGivb7M=;
 b=d0cpw4mKE0v/2Qiir2MiWBgAH4yyt74ZAnrDzjZIBOsZiF/7zFeXE/yc7CceUn+3SC
 rfb5JBm+ls8dXp45GpG5tn6dZPwDn4fAdOMnTIZWkgTQ7GlWduXxiLtvJZDX77Z8sqYv
 cKxkL9kGAkBEDlKk1vwGT6Brd8oG0rZnSxKWoXOgXsV7BWYBvIttX8PciiZWu+OTXck6
 W9t4RRmEPkVzp8t0qoXTeBoK3tqQjUQ/mad+Pz4OpxRw+2M9ogzWQLDpiKPy04Dcep+i
 2co5BZexMSZFnCBK8NkNeq8RaUNpifdqrjjYbl3LSNSI19eKrUj93I5V+ZgdagBhdUSs
 5UyQ==
X-Gm-Message-State: AOAM531rpW6YSIJpy8oG27eeC5KSkc2AR1eh0CKQ0m7pkyrHDG3vDQsK
 EgP+RQQWwyfGSwxIYmN9plwzKA==
X-Google-Smtp-Source: ABdhPJwfbE3Ru0ihdqxIvSrcwdsOKqEUA7ctbu2FCwCIfLHeirfKyifxth3k7F1rQoGlaSgiohqD/A==
X-Received: by 2002:a63:dc50:: with SMTP id f16mr14373788pgj.19.1592874697707; 
 Mon, 22 Jun 2020 18:11:37 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id d7sm15345413pfh.78.2020.06.22.18.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 18:11:36 -0700 (PDT)
Subject: Re: [PATCH 4/4] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-5-leobras.c@gmail.com>
 <ade15776-61d1-b660-db74-7aeba4eddfdf@ozlabs.ru>
 <4bf1d32da3d13a44e3c2e4b04f369fe52c24a023.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <afd1c5ac-d291-5281-1592-a345ee3c0c8c@ozlabs.ru>
Date: Tue, 23 Jun 2020 11:11:31 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4bf1d32da3d13a44e3c2e4b04f369fe52c24a023.camel@gmail.com>
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



On 23/06/2020 04:59, Leonardo Bras wrote:
> Hello Alexey, thanks for the feedback!
> 
> On Mon, 2020-06-22 at 20:02 +1000, Alexey Kardashevskiy wrote:
>>
>> On 19/06/2020 15:06, Leonardo Bras wrote:
>>> On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
>>> default DMA window for the device, before attempting to configure a DDW,
>>> in order to make the maximum resources available for the next DDW to be
>>> created.
>>>
>>> This is a requirement for some devices to use DDW, given they only
>>> allow one DMA window.
>>>
>>> If setting up a new DDW fails anywhere after the removal of this
>>> default DMA window, restore it using reset_dma_window.
>>
>> Nah... If we do it like this, then under pHyp we lose 32bit DMA for good
>> as pHyp can only create a single window and it has to map at
>> 0x800.0000.0000.0000. They probably do not care though.
>>
>> Under KVM, this will fail as VFIO allows creating  2 windows and it
>> starts from 0 but the existing iommu_bypass_supported_pSeriesLP() treats
>> the window address == 0 as a failure. And we want to keep both DMA
>> windows for PCI adapters with both 64bit and 32bit PCI functions (I
>> heard AMD GPU video + audio are like this) or someone could hotplug
>> 32bit DMA device on a vphb with already present 64bit DMA window so we
>> do not remove the default window.
> 
> Well, then I would suggest doing something like this:
> 	query_ddw(...);
>   	if (query.windows_available == 0){
> 		remove_dma_window(...,default_win);
> 		query_ddw(...);
> 	}
> 
> This would make sure to cover cases of windows available == 1
> and windows available > 1; 


Is "1" what pHyp returns on query? And was it always like that? Then it
is probably ok. I just never really explored the idea of removing the
default window as we did not have to.


>> The last discussed thing I remember was that there was supposed to be a
>> new bit in "ibm,architecture-vec-5" (forgot the details), we could use
>> that to decide whether to keep the default window or not, like this.
> 
> I checked on the latest LoPAR draft (soon to be published), for the
> ibm,architecture-vec 'option array 5' and this entry was the only
> recently added one that is related to this patchset:
> 
> Byte 8 - Bit 0:
> SRIOV Virtual Functions Support Dynamic DMA Windows (DDW):
> 0: SRIOV Virtual Functions do not support DDW
> 1: SRIOV Virtual Functions do support DDW
> 
> Isn't this equivalent to having a "ibm,ddw-applicable" property?

I am not sure, is there anything else to this new bit? I'd think if the
client supports it, then pHyp will create one 64bit window per a PE and
DDW API won't be needed. Thanks,


> 
> 
>>
>>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>>> ---
>>>  arch/powerpc/platforms/pseries/iommu.c | 20 +++++++++++++++++---
>>>  1 file changed, 17 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index de633f6ae093..68d1ea957ac7 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -1074,8 +1074,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>  	u64 dma_addr, max_addr;
>>>  	struct device_node *dn;
>>>  	u32 ddw_avail[3];
>>> +
>>>  	struct direct_window *window;
>>> -	struct property *win64;
>>> +	struct property *win64, *dfl_win;
>>
>> Make it "default_win" or "def_win", "dfl" hurts to read :)
> 
> Sure, no problem :)
> 
>>
>>>  	struct dynamic_dma_window_prop *ddwprop;
>>>  	struct failed_ddw_pdn *fpdn;
>>>  
>>> @@ -1110,8 +1111,19 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>  	if (ret)
>>>  		goto out_failed;
>>>  
>>> -       /*
>>> -	 * Query if there is a second window of size to map the
>>> +	/*
>>> +	 * First step of setting up DDW is removing the default DMA window,
>>> +	 * if it's present. It will make all the resources available to the
>>> +	 * new DDW window.
>>> +	 * If anything fails after this, we need to restore it.
>>> +	 */
>>> +
>>> +	dfl_win = of_find_property(pdn, "ibm,dma-window", NULL);
>>> +	if (dfl_win)
>>> +		remove_dma_window(pdn, ddw_avail, dfl_win);
>>
>> Before doing so, you want to make sure that the "reset" is actually
>> supported. Thanks,
> 
> Good catch, I will improve that.
> 
>>
>>
>>> +
>>> +	/*
>>> +	 * Query if there is a window of size to map the
>>>  	 * whole partition.  Query returns number of windows, largest
>>>  	 * block assigned to PE (partition endpoint), and two bitmasks
>>>  	 * of page sizes: supported and supported for migrate-dma.
>>> @@ -1219,6 +1231,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>>  	kfree(win64);
>>>  
>>>  out_failed:
>>> +	if (dfl_win)
>>> +		reset_dma_window(dev, pdn);
>>>  
>>>  	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
>>>  	if (!fpdn)
>>>
> 
> Best regards,
> Leonardo
> 

-- 
Alexey
