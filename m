Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22F276AA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:21:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmgS2yqrzDqQW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:21:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=j26AqMSG; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxmGd53DDzDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 17:03:19 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id r19so1197854pls.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/zh4UOy6xq4nPNPs7UbUhF+dbhwKAFnwF4mgbqlS/ZM=;
 b=j26AqMSGHBrEEOemd6fbQQXtBoc5MFw7imnBbn9jhwtWu1PMhiOctFcLf53M2Yu/j+
 nJub70+VD+5O6U+eIS9ggVjCPcQFraMwdWBOdT3auFfviQzszbSOfNm5b8LCyslSv9YL
 mriFW1TyQdPY1CPG0EWN1qrtvBFchRJoaLwgS7Ew0jrjXmkaYQD9vrPolHWpGy5R/KYT
 8SiRfx6/dqZVv2pRoWBk5S2Rqm+9U1poRNOrH6aebBFOgnQn9o2jwhuQEd6+OrRLlTbJ
 NZvul1XMhQ8VrcjWo5h4HjQR0HlYxyxOxGTCsiMjtlsDe9vOPvAbIKNblvN18bK1qinZ
 3fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/zh4UOy6xq4nPNPs7UbUhF+dbhwKAFnwF4mgbqlS/ZM=;
 b=pMFY/wxof4tuP38j/MwqkrWy/18WvuuRstuHBljPcCkdD84f35IPVOqyONFozzr7Y4
 iIZapiVptnQT8aLFUEYqR+5+L2kXzsIDhBErrdgkgO67pHlDpwwhq0Qnt3BP+Mqs7b92
 m8/Ha3YK2ib/C+xFxp92mjcKqnj3D08BedJQ1hA9IGYz7Wef/LKXgdD8WhcHrqvIQO8j
 OCrt9IQU8ixlL1BGyRltGbOefq/2V7Fauffnl8VN4iFj3hfy3ZC/3JZqfvQO0s6+dqv5
 vA3VjtuqT0kHHzcwiJwwGLneVqM4im4TNwPXPuOZhleF8jCiS2Fs2a1p8QY3gnQzliTn
 iCRw==
X-Gm-Message-State: AOAM530chIRELBGZw3wt8qB0K7lulml4HYn4jsyyT/3EALJPan0ez2dv
 2PcCV7HytKovICT6Nqwwr5792Tr00kctyOnZ
X-Google-Smtp-Source: ABdhPJzav/+jnOCIdv+iUXMrx38Zi/0WvWD0FKpuP+jG+0o2P0TY1cl1uPSrCq0G3MIOtY2Dtn2/kw==
X-Received: by 2002:a17:902:ee83:b029:d0:cb2d:f271 with SMTP id
 a3-20020a170902ee83b02900d0cb2df271mr3386127pld.10.1600930996368; 
 Thu, 24 Sep 2020 00:03:16 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id n2sm1351102pja.41.2020.09.24.00.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 00:03:15 -0700 (PDT)
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
To: Christoph Hellwig <hch@lst.de>
References: <20200908015106.79661-1-aik@ozlabs.ru>
 <20200908054416.GA13585@lst.de>
 <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
 <20200908121937.GA31559@lst.de>
 <1746dd66810.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20200909075849.GA12282@lst.de>
 <0a7a992f-ad2e-e76a-7bee-1ed4ed607748@ozlabs.ru>
 <20200915065022.GA19658@lst.de>
 <93424419-3476-fc07-8a83-8d9d39062810@ozlabs.ru>
 <20200923141020.GA12374@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <1acaab45-1796-7420-b4fd-b6add7f0d28f@ozlabs.ru>
Date: Thu, 24 Sep 2020 17:03:11 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200923141020.GA12374@lst.de>
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
Cc: Oliver OHalloran <oliveroh@au1.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 24/09/2020 00:10, Christoph Hellwig wrote:
> On Tue, Sep 22, 2020 at 12:26:18PM +1000, Alexey Kardashevskiy wrote:
>>> Well, the original intent of dma_get_required_mask is to return the
>>> mask that the driver then uses to figure out what to set, so what aacraid
>>> does fits that use case. 
>>
>> What was the original intent exactly? The driver asks for the minimum or
>> maximum DMA mask the platform supports?
>>
>> As for now, we (ppc64/powernv) can do:
>> 1. bypass (==64bit)
>> 2. a DMA window which used to be limited by 2GB but not anymore.
>>
>> I can understand if the driver asked for required mask in expectation to
>> receive "less or equal than 32bit" and "more than 32 bit" and choose.
>> And this probably was the intent as at the time when the bug was
>> introduced, the window was always smaller than 4GB.
>>
>> But today the window is bigger than than (44 bits now, or a similar
>> value, depends on max page order) so the returned mask is >32. Which
>> still enables that DAC in aacraid but I suspect this is accidental.
> 
> I think for powernv returning 64-bit always would make a lot of sense.
> AFAIK all of powernv is PCIe and not legacy PCI, so returning anything
> less isn't going to help to optimize anything.

May be... The current behavior is not wrong (after the fix) but not
optimal either. Even with legacy PCI it should just result in failing
attempt to set 64bit mask which drivers should still handle, i.e. choose
a shorter mask.

Why not ditch the whole dma_get_required_mask() and just fail on setting
a bigger mask? Are these failures not handled in some drivers? Or there
are cases when a shorter mask is better? Thanks,


>>> Of course that idea is pretty bogus for
>>> PCIe devices.
>>
>> Why? From the PHB side, there are windows. From the device side, there
>> are many crippled devices, like, no GPU I saw in last years supported
>> more than 48bit.
> 
> Yes, but dma_get_required_mask is misnamed - the mask is not required,
> it is the optimal mask.  Even if the window is smaller we handle it
> some way, usually by using swiotlb, or by iommu tricks in your case.
>
>>> I suspect the right fix is to just not query dma_get_required_mask for
>>> PCIe devices in aacraid (and other drivers that do something similar).
>>
>> May be, if you write nice and big comment next to
>> dma_get_required_mask() explaining exactly what it does, then I will
>> realize I am getting this all wrong and we will move to fixing the
>> drivers :)
> 
> Yes, it needs a comment or two, and probaby be renamed to
> dma_get_optimal_dma_mask, and a cleanup of most users.  I've added it
> to my ever growing TODO list, but I would not be unhappy if someone
> else gives it a spin.
> 

-- 
Alexey
