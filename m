Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE0F20469A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 03:18:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rT1N2cqXzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:18:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=l1qx8u9c; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rStl16CmzDqX8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 11:12:31 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z63so9295068pfb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 18:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/7XR6S9g27LrNoW7SahuTQXav9iuulJHPvZf+1oIkLI=;
 b=l1qx8u9cWzxLM0XtTP73o7PHYhZn7hihCC4+j3tGSKNZDh9eIQP8pc0B+kPiupwGlQ
 WffBBEY8vHATJ8e5s/gOkJIoPGa5YuE2hyFaG1dcXnlYS8oNCzxvQAi5Avecr0jq1gBC
 FeO9zP9oNUonNGiftL9YyDAAVY/VCvmQt7QrFk+PJlXMJjrWxJwV6ff9WCZwRWFv+lWE
 ErjusiYff3etyBx0VGhHIyXnfGycgAHdhoNWUp0hpihLnUFlxc476TZzUmEfzsMgVuY1
 kNNR6qw5+k7qU8DwlfjdCk4SX6bE+QZfDNVSSITlDPklExzWMhPqWn5PSO+mUgvl7Htc
 RZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/7XR6S9g27LrNoW7SahuTQXav9iuulJHPvZf+1oIkLI=;
 b=TCiW9QlEfM75d9QzMR9FPmXCHFx1l7MltFzdiuFUTD2avNEs6twzg8V06Kv2r7l3jB
 WRKyPckall3TxB5+FDid0/q2JLfwImfDM7/LXIkTEP7Fzc4AgCQBfi9xwDJb5VwaXgFb
 4d8XyWI2vJULwLDzmyvl8sLWc/NQagufmVFPP4a94JVK0h/kxHwTd3+KiJsaw52W/S9P
 DvxzbbuRwmz1x4Amzjqdti5in+E5MvX/LJ3lMj7W+rLVxWM+hYj5rXPR5e1akpYnxutY
 jJqlIiQTb7YS2klQe3/NtcVMWtI9akVqNcoeimXBXhlJQtf3aQaFHwpg4biRkeQeeeuu
 g6TA==
X-Gm-Message-State: AOAM5319n/4HK45dKROs9bxlVVJ16QEO6TjuSRdU2WiTrV7FqUucZHgG
 dNh5pr9wQJDgzlOr+FAKhfqSKA==
X-Google-Smtp-Source: ABdhPJzAiZpRxeFlsrHyOBRofUMfnB5vUt9EyrVv1wkiJeLeylTnr2J6QKw5XmWE5GjUmCpk3lrPWA==
X-Received: by 2002:a63:308:: with SMTP id 8mr16055812pgd.112.1592874749279;
 Mon, 22 Jun 2020 18:12:29 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id h4sm612040pjq.55.2020.06.22.18.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 18:12:28 -0700 (PDT)
Subject: Re: [PATCH 3/4] powerpc/pseries/iommu: Move window-removing part of
 remove_ddw into remove_dma_window
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-4-leobras.c@gmail.com>
 <51201582-efe5-85df-7e65-a998e91ab63f@ozlabs.ru>
 <ccf7b591f2bf61ba4705699b2e2b050c3cf48d99.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <887bf30e-ae9e-b0cb-0388-dc555692ff0a@ozlabs.ru>
Date: Tue, 23 Jun 2020 11:12:22 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ccf7b591f2bf61ba4705699b2e2b050c3cf48d99.camel@gmail.com>
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
Cc: Oliver <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/06/2020 04:59, Leonardo Bras wrote:
> Hello Alexey, thanks for the feedback!
> 
> On Mon, 2020-06-22 at 20:02 +1000, Alexey Kardashevskiy wrote:
>>
>> On 19/06/2020 15:06, Leonardo Bras wrote:
>>> Move the window-removing part of remove_ddw into a new function
>>> (remove_dma_window), so it can be used to remove other DMA windows.
>>>
>>> It's useful for removing DMA windows that don't create DIRECT64_PROPNAME
>>> property, like the default DMA window from the device, which uses
>>> "ibm,dma-window".
>>>
>>> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
>>> ---
>>>  arch/powerpc/platforms/pseries/iommu.c | 53 +++++++++++++++-----------
>>>  1 file changed, 31 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index 5e1fbc176a37..de633f6ae093 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -767,25 +767,14 @@ static int __init disable_ddw_setup(char *str)
>>>  
>>>  early_param("disable_ddw", disable_ddw_setup);
>>>  
>>> -static void remove_ddw(struct device_node *np, bool remove_prop)
>>> +static void remove_dma_window(struct device_node *pdn, u32 *ddw_avail,
>>
>> You do not need the entire ddw_avail here, pass just the token you need.
> 
> Well, I just emulated the behavior of create_ddw() and query_ddw() as
> both just pass the array instead of the token, even though they only
> use a single token. 

True, there is a pattern.

> I think it's to make the rest of the code independent of the design of
> the "ibm,ddw-applicable" array, and if it changes, only local changes
> on the functions will be needed.

The helper removes a window, if you are going to call other operations
in remove_dma_window(), then you'll have to change its name ;)


>> Also, despite this particular file, the "pdn" name is usually used for
>> struct pci_dn (not device_node), let's keep it that way.
> 
> Sure, I got confused for some time about this, as we have:
> static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn).
> but on *_ddw() we have "struct pci_dn *pdn".

True again, not the cleanest style here.


> I will also add a patch that renames those 'struct device_node *pdn' to
> something like 'struct device_node *parent_dn'.

I would not go that far, we (well, Oliver) are getting rid of many
occurrences of pci_dn and Oliver may have a stronger opinion here.


> 
>>> +			      struct property *win)
>>>  {
>>>  	struct dynamic_dma_window_prop *dwp;
>>> -	struct property *win64;
>>> -	u32 ddw_avail[3];
>>>  	u64 liobn;
>>> -	int ret = 0;
>>> -
>>> -	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
>>> -					 &ddw_avail[0], 3);
>>> -
>>> -	win64 = of_find_property(np, DIRECT64_PROPNAME, NULL);
>>> -	if (!win64)
>>> -		return;
>>> -
>>> -	if (ret || win64->length < sizeof(*dwp))
>>> -		goto delprop;
>>> +	int ret;
>>>  
>>> -	dwp = win64->value;
>>> +	dwp = win->value;
>>>  	liobn = (u64)be32_to_cpu(dwp->liobn);
>>>  
>>>  	/* clear the whole window, note the arg is in kernel pages */
>>> @@ -793,24 +782,44 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
>>>  		1ULL << (be32_to_cpu(dwp->window_shift) - PAGE_SHIFT), dwp);
>>>  	if (ret)
>>>  		pr_warn("%pOF failed to clear tces in window.\n",
>>> -			np);
>>> +			pdn);
>>>  	else
>>>  		pr_debug("%pOF successfully cleared tces in window.\n",
>>> -			 np);
>>> +			 pdn);
>>>  
>>>  	ret = rtas_call(ddw_avail[2], 1, 1, NULL, liobn);
>>>  	if (ret)
>>>  		pr_warn("%pOF: failed to remove direct window: rtas returned "
>>>  			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
>>> -			np, ret, ddw_avail[2], liobn);
>>> +			pdn, ret, ddw_avail[2], liobn);
>>>  	else
>>>  		pr_debug("%pOF: successfully removed direct window: rtas returned "
>>>  			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
>>> -			np, ret, ddw_avail[2], liobn);
>>> +			pdn, ret, ddw_avail[2], liobn);
>>> +}
>>> +
>>> +static void remove_ddw(struct device_node *np, bool remove_prop)
>>> +{
>>> +	struct property *win;
>>> +	u32 ddw_avail[3];
>>> +	int ret = 0;
>>> +
>>> +	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
>>> +					 &ddw_avail[0], 3);
>>> +	if (ret)
>>> +		return;
>>> +
>>> +	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
>>> +	if (!win)
>>> +		return;
>>> +
>>> +	if (win->length >= sizeof(struct dynamic_dma_window_prop))
>>
>> Any good reason not to make it "=="? Is there something optional or we
>> expect extension (which may not grow from the end but may add cells in
>> between). Thanks,
> 
> Well, it comes from the old behavior of remove_ddw():
> -	if (ret || win64->length < sizeof(*dwp))
> -		goto delprop;
> As I reversed the logic from 'if (test) go out' to 'if (!test) do
> stuff', I also reversed (a < b) to !(a < b) => (a >= b).
> 
> I have no problem changing that to '==', but it will produce a
> different behavior than before. 

I missed than, never mind then.


> 
>>
>>
>>> +		remove_dma_window(np, ddw_avail, win);
>>> +
>>> +	if (!remove_prop)
>>> +		return;
>>>  
>>> -delprop:
>>> -	if (remove_prop)
>>> -		ret = of_remove_property(np, win64);
>>> +	ret = of_remove_property(np, win);
>>>  	if (ret)
>>>  		pr_warn("%pOF: failed to remove direct window property: %d\n",
>>>  			np, ret);
>>>
> 
> Best regards,
> Leonardo
> 

-- 
Alexey
