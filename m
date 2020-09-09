Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEFA262C15
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 11:38:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmcQk2QD9zDqTR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 19:38:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=K5guSpfI; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmcMx5QhgzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 19:36:12 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id md22so1079322pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VF5oJuxgFTtCT5oe4tEW43NjHl9Bmt0FUeRffBKQurw=;
 b=K5guSpfI44P26cOxJ0RNKwWl4f8DXNqVem33TF/5xv6jP2Z5pvdz9X+7J50S2AFGck
 R8fkRZLfeUD2dGTc1WCIrmZhY5UIBz3l7omUmO46AbS50Zrn5hT3cEbEm8UHb/soWr64
 Xsw67IN6o0Qra3Eq4Df1+I8uHI2iOjWSKQQ6wBa0PJTC6kcthBwRAK73s1pmYvsufNxD
 4Fu2ddKTbQfKcUI39UIamjI+LRBH6REbcNb89/cj0fRxzg1IlM6Es8WEONXtM81rb0YP
 zxwbgUWGhd7K7Q83q823+IfFXhsod6f1R30x2Prg4eWMx8K3Aio7jS+ldaRlzes7PNOJ
 flxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VF5oJuxgFTtCT5oe4tEW43NjHl9Bmt0FUeRffBKQurw=;
 b=JbyZWNpjCeEfo4xG5/6BIKioArwm+71OWZS6nu410/SZ0QqrQUQ/x/ToOaZHdyts3S
 X7B7lwt74dwdk6LpXijzoEopzZAEZY1FPVX4kTcigc27R2hSo8ewftTwZJWQZFlp6LJt
 V6pdBEX5+Z3WLfSa009bTeHxum+noLu2zU+LC2YJonTusoFUme5ShV94CZbuFJnM4zZC
 QhaJ6qE1P1ZJdra81nczpYW+0n2neaIKRmg1Y56LchQU2D8yNn9LfKzZu0L/woGKqAND
 gWQLPLSuDIO1CfjnuRJeGHFVraZCA6vU4IM2Tzd7oNrECZ5Ru4DMxZ9wuk2bdqUEshEo
 xQeQ==
X-Gm-Message-State: AOAM531E3bN310eYPCzZFp0H36Xc9IrIM0O4hEm2w0MvKjNXYfokWqGX
 vxDsWi6tNMY7MgENOxB52eIcDG9NXyWaPGdy
X-Google-Smtp-Source: ABdhPJzeuGYTsgnYUrQsWBVdRj7IBFv4KO9n0pBbsGagc2pC2DIDCAMHtOhxayD0+LTUisdUCidTRw==
X-Received: by 2002:a17:90a:e545:: with SMTP id ei5mr63181pjb.45.1599644168651; 
 Wed, 09 Sep 2020 02:36:08 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id e207sm1576097pfh.171.2020.09.09.02.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:36:07 -0700 (PDT)
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Oliver OHalloran <oliveroh@au1.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20200908015106.79661-1-aik@ozlabs.ru>
 <20200908054416.GA13585@lst.de>
 <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
 <20200908121937.GA31559@lst.de>
 <1746dd66810.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20200909075849.GA12282@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <0a7a992f-ad2e-e76a-7bee-1ed4ed607748@ozlabs.ru>
Date: Wed, 9 Sep 2020 19:36:04 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200909075849.GA12282@lst.de>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/09/2020 17:58, Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 11:10:03PM +1000, Alexey Kardashevskiy wrote:
>>>> a-ha, this makes more sense, thanks. Then I guess we need to revert that
>>>> one bit from yours f1565c24b596, do not we?
>>>
>>> Why?  The was the original intent of the API, but now we also use
>>> internally to check the addressing capabilities.
>>
>> The bigger mask the better, no? As it is now, it's limited by the window 
>> size which happens to be bigger than 4GB but smaller then full 64bit (48bit 
>> on my system)
> 
> Yes, the bigger mask is better.  But I don't see why you'd want to
> revert the dma bypass code for that entirely.
> 

I want dma_get_required_mask() to return the bigger mask always.

Now it depends on (in dma_alloc_direct()):
1. dev->dma_ops_bypass: set via pci_set_(coherent_)dma_mask();
2. dev->coherent_dma_mask - the same;
3. dev->bus_dma_limit - usually not set at all.

So until we set the mask, dma_get_required_mask() returns smaller mask.
So aacraid and likes (which calls dma_get_required_mask() before setting
it) will remain prone for breaks.


[forgot to cc: other folks last time, fixed now]

-- 
Alexey
