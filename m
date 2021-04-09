Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD70359400
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 06:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGlhh5WqRz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 14:36:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=vDm2UqdH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vDm2UqdH; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGlhF0Wdyz2yyr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 14:36:25 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso2538591pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 21:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wWIik5o9vKwDxjZ12ImRVE+tNFcCgq5ha/Lt8ATmpA8=;
 b=vDm2UqdHvNXMfFgi+JFVb1GVsaFgcUyPicA9Z4fUpjlWTgTVv8Ap0QRndjcu8CZSOF
 NPMNymblOI+WCmJaXezX4CmTmAyubTQFoV456ZG0xuSuaUguBgTVBYQL82tcDAJJaJS/
 ZbcgZdAjxM6Foi5jOOSBoZZSbiL/tDe5o/durCST44NlyOTSg2q7QcUK9EIRQMCgK6Cm
 fN5KNR+zxE0czNFIP5MsFW/e781tXQ1bfvHQ90q0F6Uq3vwR/OV1bImhfWkmMPdGr4kZ
 l8GVQRuSbD5xNVmeOG8S6n6KUz+2RWTaZHZxQrZnPPXAgTpwPGibGN+RQuh2TEtHoeQs
 IMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wWIik5o9vKwDxjZ12ImRVE+tNFcCgq5ha/Lt8ATmpA8=;
 b=IO304FG+0SKDWOBVCcx9AEMmcBgFhinDYBBeZCsDQ42mUzeL5ysbWRSaX70lt40Q8T
 wI+KoFEiMBFDd0FNLqbnbJmEiwYPvok6b4b6BKkYNDdKl7wJF9C0L5BSX2Q4cdA9t1zY
 DSrYFOE1dr+NJ7Y+3aoYmR8uCGlC6bIyBnAo7GFyz+JcDx722fKhxDW/X6ZrthoXEXLa
 r67bTfAygakvTe9vE2DJxpOnuOo3yYS4YqdtkcznS3huoWZWXBYP1ic89AWikMdzyPx5
 EKYnvjwS6byH39JkcQ1fr7YGmaae7iTGO2cTxdqG0kvjPydLHLQUL27ULGisZ4YsgN96
 H14g==
X-Gm-Message-State: AOAM530KWnIslwW02COlnXYXlGvL0Zo5PUp+WxGHRdUgDDenwHMFKe73
 vQpZq4wbRWvmiTs+35w/ljygFA==
X-Google-Smtp-Source: ABdhPJxMDidL72/tx0AzpGsymuailC0gyjbujAOFUWUW0p7+H1u0G8/5Wxc2QFI8+VuvJw3hQTvvMg==
X-Received: by 2002:a17:90a:ae10:: with SMTP id
 t16mr4845377pjq.86.1617942981433; 
 Thu, 08 Apr 2021 21:36:21 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id h6sm844523pfb.157.2021.04.08.21.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 21:36:21 -0700 (PDT)
Message-ID: <21407a96-5b20-3fae-f1c8-895973b655ef@ozlabs.ru>
Date: Fri, 9 Apr 2021 14:36:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Leonardo Bras
 <leobras.c@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, brking@linux.vnet.ibm.com
References: <20210407195613.131140-1-leobras.c@gmail.com>
 <87im4xe3pk.fsf@mpe.ellerman.id.au>
 <8e1ce7e9-415b-92ea-0437-a4331ed3c7f9@ozlabs.ru>
 <87ft01du50.fsf@mpe.ellerman.id.au>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87ft01du50.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/04/2021 19:04, Michael Ellerman wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> On 08/04/2021 15:37, Michael Ellerman wrote:
>>> Leonardo Bras <leobras.c@gmail.com> writes:
>>>> According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
>>>> will let the OS know all possible pagesizes that can be used for creating a
>>>> new DDW.
>>>>
>>>> Currently Linux will only try using 3 of the 8 available options:
>>>> 4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
>>>> 128M, 256M and 16G.
>>>
>>> Do we know of any hardware & hypervisor combination that will actually
>>> give us bigger pages?
>>
>>
>> On P8 16MB host pages and 16MB hardware iommu pages worked.
>>
>> On P9, VM's 16MB IOMMU pages worked on top of 2MB host pages + 2MB
>> hardware IOMMU pages.
> 
> The current code already tries 16MB though.
> 
> I'm wondering if we're going to ask for larger sizes that have never
> been tested and possibly expose bugs. But it sounds like this is mainly
> targeted at future platforms.


I tried for fun to pass through a PCI device to a guest with this patch as:

pbuild/qemu-killslof-aiku1904le-ppc64/qemu-system-ppc64 \
-nodefaults \
-chardev stdio,id=STDIO0,signal=off,mux=on \
-device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
-mon id=MON0,chardev=STDIO0,mode=readline \
-nographic \
-vga none \
-enable-kvm \
-m 16G \
-kernel ./vmldbg \
-initrd /home/aik/t/le.cpio \
-device vfio-pci,id=vfio0001_01_00_0,host=0001:01:00.0 \
-mem-prealloc \
-mem-path qemu_hp_1G_node0 \
-global spapr-pci-host-bridge.pgsz=0xffffff000 \
-machine cap-cfpc=broken,cap-ccf-assist=off \
-smp 1,threads=1 \
-L /home/aik/t/qemu-ppc64-bios/ \
-trace events=qemu_trace_events \
-d guest_errors,mmu \
-chardev socket,id=SOCKET0,server=on,wait=off,path=qemu.mon.1_1_0_0 \
-mon chardev=SOCKET0,mode=control


The guest created a huge window:

xhci_hcd 0000:00:00.0: ibm,create-pe-dma-window(2027) 0 8000000 20000000 
22 22 returned 0 (liobn = 0x80000001 starting addr = 8000000 0)

The first "22" is page_shift in hex (16GB), the second "22" is 
window_shift (so we have 1 TCE).

On the host side the window#1 was created with 1GB pages:
pci 0001:01     : [PE# fd] Setting up window#1 
800000000000000..80007ffffffffff pg=40000000


The XHCI seems working. Without the patch 16MB was the maximum.


> 
>>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>>> index 9fc5217f0c8e..6cda1c92597d 100644
>>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>>> @@ -53,6 +53,20 @@ enum {
>>>>    	DDW_EXT_QUERY_OUT_SIZE = 2
>>>>    };
>>>
>>> A comment saying where the values come from would be good.
>>>
>>>> +#define QUERY_DDW_PGSIZE_4K	0x01
>>>> +#define QUERY_DDW_PGSIZE_64K	0x02
>>>> +#define QUERY_DDW_PGSIZE_16M	0x04
>>>> +#define QUERY_DDW_PGSIZE_32M	0x08
>>>> +#define QUERY_DDW_PGSIZE_64M	0x10
>>>> +#define QUERY_DDW_PGSIZE_128M	0x20
>>>> +#define QUERY_DDW_PGSIZE_256M	0x40
>>>> +#define QUERY_DDW_PGSIZE_16G	0x80
>>>
>>> I'm not sure the #defines really gain us much vs just putting the
>>> literal values in the array below?
>>
>> Then someone says "uuuuu magic values" :) I do not mind either way. Thanks,
> 
> Yeah that's true. But #defining them doesn't make them less magic, if
> you only use them in one place :)

Defining them with "QUERY_DDW" in the names kinda tells where they are 
from. Can also grep QEMU using these to see how the other side handles 
it. Dunno.

btw the bot complained about __builtin_ctz(SZ_16G) which should be 
__builtin_ctzl(SZ_16G) so we have to ask Leonardo to repost anyway :)



-- 
Alexey
