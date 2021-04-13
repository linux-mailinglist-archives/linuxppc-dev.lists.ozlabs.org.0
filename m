Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E782135D9F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 10:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJZV6F3Cz3bwM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 18:25:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=gcm9kE3G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gcm9kE3G; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJYp6QmVz3d8v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 18:24:45 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d124so10922640pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fA8bNJj6LVJhm+HnIXyLieBZMpOojGEeSw7XODwgERA=;
 b=gcm9kE3GFbiT0yagyPYRx8uaswQYKFAZxNpQc92RqHQ8tE6wT19CnX7P7dwCpWigYw
 HqjaeX+nrmQBix7Ghgk9RnnZ2eczFsAn+C6NbI2BVGqTp8cRKCCw3WuU8syDz0Z+XXPD
 AFZWwvOQoMye9MQTPSo+F6LiNI0VqoJkVRqKsrflLwU+djfKDFjM6kSjBb4f3VN04+ua
 zrjIonc+6Z60M7bXYNyr2LKVt1g52segOtXAo9KMRx2O/5Wm9AfSijYbcoFsHESvBYxW
 ifgibQKQ/WK7+W5+JzaR+t/YkEtNeb73XIrw5jfToqwhb6XkLgkP/sDovRCyp2YneV/N
 T+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fA8bNJj6LVJhm+HnIXyLieBZMpOojGEeSw7XODwgERA=;
 b=reEzZGG59mDzDzbfjfV5lNOtMhl1AL38TYKQVT2JVGvB9CwmSeA6fInwp7f4eOkOKg
 ni7tUt0QXlF8Y4QWAxbnWDw77l6H4uiq9zx126ZxavUruzLGIdm4o5NDirjVd9vKr/8v
 ip2BeNstZqYGRBRyAIFmZCBYX7/nKAdX/VnoJKTiDwEj9PQCGgBEhbp1JgTIGnWsUJsB
 NA+VtXtZGgqIAFHHXCXJSdYpRfecTXZM3Yiapg3AupIa9iXcJROAgYRJlMiJxBeEBBgw
 uJoGWQ3XcJ4C8eCi/plJ2pc5Qx6m3FltvdVCwA0wk+lLiCBQWbxT2N0eaJqUWczRUCWs
 VKcA==
X-Gm-Message-State: AOAM532VvMNTh82r3C9quIO8AC6n41ucze3UA4UVsvJB0yeC6A5fl1mL
 XHk4sFM1fY3Usj+i2CCI8TfcZg==
X-Google-Smtp-Source: ABdhPJzVOQPCyRUQOYGcBVPhhc91kioApHH/cKPIhluLrX5ViXxxS4G24Xm7QNhHXSKoRCa5lHf7tQ==
X-Received: by 2002:a62:187:0:b029:241:fc67:d41f with SMTP id
 129-20020a6201870000b0290241fc67d41fmr28497266pfb.55.1618302282076; 
 Tue, 13 Apr 2021 01:24:42 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id c129sm12229468pfb.141.2021.04.13.01.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 01:24:41 -0700 (PDT)
Message-ID: <5d7c85a1-967c-9ad3-e984-bd57fca3cb77@ozlabs.ru>
Date: Tue, 13 Apr 2021 18:24:35 +1000
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
 <e518d514-5f76-c88f-d38e-fb8a46a41597@ozlabs.ru>
 <7e2a7e3abb4e7df492fcb4209e7b1f2021ff17c5.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <7e2a7e3abb4e7df492fcb4209e7b1f2021ff17c5.camel@gmail.com>
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



On 13/04/2021 17:58, Leonardo Bras wrote:
> On Tue, 2021-04-13 at 17:41 +1000, Alexey Kardashevskiy wrote:
>>
>> On 13/04/2021 17:33, Leonardo Bras wrote:
>>> On Tue, 2021-04-13 at 17:18 +1000, Alexey Kardashevskiy wrote:
>>>>
>>>> On 13/04/2021 15:49, Leonardo Bras wrote:
>>>>> Thanks for the feedback!
>>>>>
>>>>> On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
>>>>>>> -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
>>>>>>> +static phys_addr_t ddw_memory_hotplug_max(void)
>>>>>>
>>>>>>
>>>>>> Please, forward declaration or a separate patch; this creates
>>>>>> unnecessary noise to the actual change.
>>>>>>
>>>>>
>>>>> Sure, done!
>>>>>
>>>>>>
>>>>>>> +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
>>>>>>> +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
>>>>>>> +		iommu_init_table(tbl, pci->phb->node, 0, 0);
>>>>>>
>>>>>>
>>>>>> It is 0,0 only if win_addr>0 which is not the QEMU case.
>>>>>>
>>>>>
>>>>> Oh, ok.
>>>>> I previously though it was ok to use 0,0 here as any other usage in
>>>>> this file was also 0,0.
>>>>>
>>>>> What should I use to get the correct parameters? Use the previous tbl
>>>>> it_reserved_start and tbl->it_reserved_end is enough?
>>>>
>>>> depends on whether you carry reserved start/end even if they are outside
>>>> of the dma window.
>>>>
>>>
>>> Oh, that makes sense.
>>> On a previous patch (5/14 IIRC), I changed the behavior to only store
>>> the valid range on tbl, but now I understand why it's important to
>>> store the raw value.
>>>
>>> Ok, I will change it back so the reserved range stays in tbl even if it
>>> does not intersect with the DMA window. This way I can reuse the values
>>> in case of indirect mapping with DDW.
>>>
>>> Is that ok? Are the reserved values are supposed to stay the same after
>>> changing from Default DMA window to DDW?
>>
>> I added them to know what bits in it_map to ignore when checking if
>> there is any active user of the table. If you have non zero reserved
>> start/end but they do not affect it_map, then it is rather weird way to
>> carry reserved start/end from DDW to no-DDW.
>>
> 
> Ok, agreed.
> 
>>   May be do not set these at
>> all for DDW with window start at 1<<59 and when going back to no-DDW (or
>> if DDW starts at 0) - just set them from MMIO32, just as they are
>> initialized in the first place.
>>
> 
> If I get it correctly from pci_of_scan.c, MMIO32 = {0, 32MB}, is that
> correct?

No, under QEMU it is 0x8000.0000-0x1.0000.0000:

/proc/device-tree/pci@800000020000000/ranges

7 cells for each resource, the second one is MMIO32 (the first is IO 
ports, the last is 64bit MMIO).

> 
> So, if DDW starts at any value in this range (most probably at zero),
> we should remove the rest, is that correct?
> 
> Could it always use iommu_init_table(..., 0, 32MB) here, so it always
> reserve any part of the DMA window that's in this range? Ot there may
> be other reserved values range?
> 
>> and when going back to no-DDW
> 
> After iommu_init_table() there should be no failure, so it looks like
> there is no 'going back to no-DDW'. Am I missing something?

Well, a random driver could request 32bit DMA and if the new window is 
1:1, then it would break but this does not seem to happen and we do not 
support it anyway so no loss here.


-- 
Alexey
