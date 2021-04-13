Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE135D924
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 09:42:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKHcS3tvRz3c06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 17:42:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=rCYmKGAZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rCYmKGAZ; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKHc16K7Bz2yYx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 17:41:35 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so3718811pja.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nYEW/YdSx4gFeX8Dnay0maJJIIcaM0sBS/AM7GYItP8=;
 b=rCYmKGAZeeT0iDiiUQozOuqWLIt7b76+SrIGU1vp2fMocOw/XtEzdZiw7nVmdqHlb/
 TCweN4TcHexWr4f9Fe/WeCZcr42UKS0VUgIPd5KyCO/sRgCMnUwug0fPOf1k9WQzF3s0
 oBOMcg5O0Kw78LD4A0l9T8W6CFcPns9cPNptkZzk6LfErzm6zetpZCJPNZWt9/dlDExH
 2Oej1F6k392aHBO+fF5e1Lrvi06JVd3og6L8Va+8PHvlIpfFneT59RhDm978n1hvOz8p
 esmhY77KVtH3Asb3m4TAnpzvBSjCjBpBRiCxYsdB1kzSxewCgtKzFKfYEahjJCFrT2cA
 kRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYEW/YdSx4gFeX8Dnay0maJJIIcaM0sBS/AM7GYItP8=;
 b=V5Y49dHBmwJ7VikFBUxAeGQzemi1o3ITDmM/daDHhTvz7PNaDnCMsD1mr/AKaL1VcJ
 /VAbAr3AvQwv3LeOvBboyyGLxB5Q1oX8z3FhWeVIii2Sr9SNUQlAHxRCIuxVmBX7Ihqj
 xrMqqAMxVnq0peZJ8RvVuvuD7GL780bKY9DCADA5XINWEaCNicw+HOxnZ71Xkh0WPMzv
 JPEsBeEOdnHtrHXqugilA5TC7plC3yQsCknKHY1YKCLG2MsyZTvWgk4YmuC5uwXrR1xB
 waf55qGM+RNvPUPS66XL9YGzmg9k9Cj1i3muQcvy6ZqaDbDqckyiZLT4ZHMvy6alNu2B
 xgyw==
X-Gm-Message-State: AOAM530zt+SKpsF/FLRwfWuY8z8oXgP9ByUsxmXbuozaBenmylxfkCKI
 erBqIL1X6neP45BV3x90ytgx4A==
X-Google-Smtp-Source: ABdhPJze/D0LP17BKuSzXf6S/wJCz2e1EhoBEGlGFWQSncRUNQVu89yH6pfpim0Zul14c6A1aco8gw==
X-Received: by 2002:a17:902:8216:b029:ea:d2bc:2b15 with SMTP id
 x22-20020a1709028216b02900ead2bc2b15mr14453595pln.63.1618299691863; 
 Tue, 13 Apr 2021 00:41:31 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id h18sm13609178pgj.51.2021.04.13.00.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 00:41:31 -0700 (PDT)
Message-ID: <e518d514-5f76-c88f-d38e-fb8a46a41597@ozlabs.ru>
Date: Tue, 13 Apr 2021 17:41:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v2 13/14] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-14-leobras.c@gmail.com>
 <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
 <0c6eef8181aeb69d69ce72ec86c646dfa7591414.camel@gmail.com>
 <94ef78d5-467e-0492-4b7d-90077fe37343@ozlabs.ru>
 <e8789bb568c9cae99f07b1e6021f85c39d92f7ea.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <e8789bb568c9cae99f07b1e6021f85c39d92f7ea.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 13/04/2021 17:33, Leonardo Bras wrote:
> On Tue, 2021-04-13 at 17:18 +1000, Alexey Kardashevskiy wrote:
>>
>> On 13/04/2021 15:49, Leonardo Bras wrote:
>>> Thanks for the feedback!
>>>
>>> On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
>>>>> -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
>>>>> +static phys_addr_t ddw_memory_hotplug_max(void)
>>>>
>>>>
>>>> Please, forward declaration or a separate patch; this creates
>>>> unnecessary noise to the actual change.
>>>>
>>>
>>> Sure, done!
>>>
>>>>
>>>>> +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
>>>>> +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
>>>>> +		iommu_init_table(tbl, pci->phb->node, 0, 0);
>>>>
>>>>
>>>> It is 0,0 only if win_addr>0 which is not the QEMU case.
>>>>
>>>
>>> Oh, ok.
>>> I previously though it was ok to use 0,0 here as any other usage in
>>> this file was also 0,0.
>>>
>>> What should I use to get the correct parameters? Use the previous tbl
>>> it_reserved_start and tbl->it_reserved_end is enough?
>>
>> depends on whether you carry reserved start/end even if they are outside
>> of the dma window.
>>
> 
> Oh, that makes sense.
> On a previous patch (5/14 IIRC), I changed the behavior to only store
> the valid range on tbl, but now I understand why it's important to
> store the raw value.
> 
> Ok, I will change it back so the reserved range stays in tbl even if it
> does not intersect with the DMA window. This way I can reuse the values
> in case of indirect mapping with DDW.
> 
> Is that ok? Are the reserved values are supposed to stay the same after
> changing from Default DMA window to DDW?

I added them to know what bits in it_map to ignore when checking if 
there is any active user of the table. If you have non zero reserved 
start/end but they do not affect it_map, then it is rather weird way to 
carry reserved start/end from DDW to no-DDW. May be do not set these at 
all for DDW with window start at 1<<59 and when going back to no-DDW (or 
if DDW starts at 0) - just set them from MMIO32, just as they are 
initialized in the first place.



-- 
Alexey
