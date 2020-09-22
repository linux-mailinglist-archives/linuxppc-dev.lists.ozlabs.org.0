Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B00273873
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 04:28:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwQFp0sbHzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 12:27:58 +1000 (AEST)
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
 header.s=20150623 header.b=ybOKee4C; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwQD75B4FzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 12:26:26 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id x123so11048539pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pu0UCNU8a+/iVZS/XXkRFlt74wFB5FTnfIKuU4mGCVE=;
 b=ybOKee4ClYwnKomF/9bBGhUHbxGpBKV/qhY/uc7ZgMHyIxlFS3b8uQtTMkSVFuvury
 VRmgTWGWG1NXU7jfbn6rtBnaPAIBd9DibiuB5XQBJUq+bK/wD/93FWka2Ox3AsU1B/6K
 fELfk6TcMRASeGcAaTWS4cRrSONVoyUpJk0dFCPK0OKNyEjCkLPW3vgxq3unvl86R1fJ
 sCSKXwuyFYx8HjaY6ah/c9ivPhEbVQeV3+jbP3mBx8j2ZjFC64sPUmNRtq4ciL7+ovoA
 fA8mWoidtt7dtf9ZiaFpxgueD0jl/pG0baqp57IX5GuN7u5WXyJr3HnsXtKWPO7hpR81
 9J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pu0UCNU8a+/iVZS/XXkRFlt74wFB5FTnfIKuU4mGCVE=;
 b=i1ZZSyov2UTq370mrnn6ybR7zTKv5dFgo49paf2DV5R3/w+Du4LcoJm5jw2ouM18lc
 Q0E7gVfmcPKfdDWORXut41BQodo+W4er3E/UafNyI94KnqcDVyqRTg1BrgRHnq27SO8U
 MHjf9coXLfzuc+N98dG5Qq7NEcI21wVriKmErBltavnrSHR7atGn9WlNRG/wZwIwav+A
 MzmyfKR1I0TIPGRIidPZJC96aDcmY5AJPtVJy5dbl1rGdrChVWRHkWku2+0xnM97Hhxq
 AVoRR7im4yLzFBcP9uD5B55slf8FwI0aAASIfhi85TonW8QLVsazeNobjQQH/52ffUVG
 qszw==
X-Gm-Message-State: AOAM530uwy7RvPxm6OCfDYdAXqbwd+4GqNU9uFsKSL2VeuVcJzcfRjm6
 3yg65h0OPYEsQjlFFCDUfp73NkEBMkxr1W8j
X-Google-Smtp-Source: ABdhPJzihIVUiHkkoDmwb7dD0TVGqibm6P0FTrPvxIqzr+qLpE+juchSR41nsWtL2W6kKnGCq2ubZw==
X-Received: by 2002:a63:5d61:: with SMTP id o33mr1878993pgm.355.1600741583323; 
 Mon, 21 Sep 2020 19:26:23 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id a2sm13001658pfk.201.2020.09.21.19.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 19:26:22 -0700 (PDT)
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
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <93424419-3476-fc07-8a83-8d9d39062810@ozlabs.ru>
Date: Tue, 22 Sep 2020 12:26:18 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200915065022.GA19658@lst.de>
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



On 15/09/2020 16:50, Christoph Hellwig wrote:
> On Wed, Sep 09, 2020 at 07:36:04PM +1000, Alexey Kardashevskiy wrote:
>> I want dma_get_required_mask() to return the bigger mask always.
>>
>> Now it depends on (in dma_alloc_direct()):
>> 1. dev->dma_ops_bypass: set via pci_set_(coherent_)dma_mask();
>> 2. dev->coherent_dma_mask - the same;
>> 3. dev->bus_dma_limit - usually not set at all.
>>
>> So until we set the mask, dma_get_required_mask() returns smaller mask.
>> So aacraid and likes (which calls dma_get_required_mask() before setting
>> it) will remain prone for breaks.
> 
> Well, the original intent of dma_get_required_mask is to return the
> mask that the driver then uses to figure out what to set, so what aacraid
> does fits that use case. 

What was the original intent exactly? The driver asks for the minimum or
maximum DMA mask the platform supports?

As for now, we (ppc64/powernv) can do:
1. bypass (==64bit)
2. a DMA window which used to be limited by 2GB but not anymore.

I can understand if the driver asked for required mask in expectation to
receive "less or equal than 32bit" and "more than 32 bit" and choose.
And this probably was the intent as at the time when the bug was
introduced, the window was always smaller than 4GB.

But today the window is bigger than than (44 bits now, or a similar
value, depends on max page order) so the returned mask is >32. Which
still enables that DAC in aacraid but I suspect this is accidental.


> Of course that idea is pretty bogus for
> PCIe devices.

Why? From the PHB side, there are windows. From the device side, there
are many crippled devices, like, no GPU I saw in last years supported
more than 48bit.


> I suspect the right fix is to just not query dma_get_required_mask for
> PCIe devices in aacraid (and other drivers that do something similar).

May be, if you write nice and big comment next to
dma_get_required_mask() explaining exactly what it does, then I will
realize I am getting this all wrong and we will move to fixing the
drivers :)


-- 
Alexey
