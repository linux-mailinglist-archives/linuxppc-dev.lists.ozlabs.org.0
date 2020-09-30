Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC227E2A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Sep 2020 09:31:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1ScR71WWzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Sep 2020 17:31:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=OD25q2e2; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1SZJ4dJZzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Sep 2020 17:29:39 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id y14so533808pgf.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Sep 2020 00:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ttjWabQRau3CSv1NZHdvKgdGtvh6Z/VK2a6nGv/LF2M=;
 b=OD25q2e2XCUDocehJX95Mlok4AlDpgPtWt0gZ0DBurQ/JBCiZMVBkDa99TMTvvMICD
 AJmgshelncbjhLWln8OoUyUeHS6Ynoya/KZlwb9DQ7YZzOjnn7sRWok40Yn5z21I0XR+
 9a0is9Gs0FRntLSPsQKdXmBkwVYXo+rP9AIt8R2IoGyoauSwhWgVIJP6QcwBRE1zY+Rt
 jJ+H5R3FtqTWYYP5Rx+O/PYIDw5rwgHOWPRSUPyp7kEa5FTCU764JPv6MzVGnCVhN+zy
 oB7cChdWTcrXkvq2lO4FvfiCNnng9/WbgR//zlAowTbk7Mj+rpz0MlUl8V+uAta+VlYF
 B/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ttjWabQRau3CSv1NZHdvKgdGtvh6Z/VK2a6nGv/LF2M=;
 b=H52PxPWOnLuG1NUkdfUMGw6V3yhIIZNOH+T14k2LbeyPMVLgrWmXCfc2i8yqEPBuxt
 yWEAT2x2RwJ37Ee1klwRyJ9WvWkryoeyZmTM71i+eovzNUOfOOpbIqE4//H6MuuzyVyr
 6l7ycswAG6cHwN3DXBD7fuNz6BuXgdQbCW6YHN0eiuJcYgWbpEFSApcOneiZJ5G/8Xe7
 dneZn1B0dTK22KdfzxRhFM9m1v7PKc+X05/QZHg4OWRNbX7IFLl7gHWLFp7Q5w6ZFEB3
 Gw8rpHWCJR32VZ8uMMLSk54MGYLOnnCV8EL9dMrM/Cl+XneUW/ivypvMN2QfK4vamINE
 nFwA==
X-Gm-Message-State: AOAM5330V284B2g4/TriIdydgXLJTcM71+ALsjs3NANiaJKm/S+CC7RB
 Vxcq+o+cKKSrhDc9WnRv+v5MLOXWYQhYS/e7
X-Google-Smtp-Source: ABdhPJzDAwbFyeq9hHNslWbeb5fIy2d9wdWFyoAosW8hNavBPE1n1GhZy2J+o9mcAuTKS6RqPwmmAA==
X-Received: by 2002:a63:f90a:: with SMTP id h10mr1104428pgi.361.1601450975968; 
 Wed, 30 Sep 2020 00:29:35 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id y4sm1132513pgl.67.2020.09.30.00.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 00:29:35 -0700 (PDT)
Subject: Re: [PATCH v2 14/14] powerpc/pseries/iommu: Rename "direct window" to
 "dma window"
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-15-leobras.c@gmail.com>
 <2ba89065-4e9c-57c2-3825-aed9a7d8451a@ozlabs.ru>
 <1b813ab38869e2e6770ed09487a3fba7befaca86.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <1167e804-eddb-345e-539d-009b7c8d35fe@ozlabs.ru>
Date: Wed, 30 Sep 2020 17:29:28 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <1b813ab38869e2e6770ed09487a3fba7befaca86.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 30/09/2020 06:54, Leonardo Bras wrote:
> On Tue, 2020-09-29 at 13:55 +1000, Alexey Kardashevskiy wrote:
>>
>> On 12/09/2020 03:07, Leonardo Bras wrote:
>>> Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
>>>
>>> A previous change introduced the usage of DDW as a bigger indirect DMA
>>> mapping when the DDW available size does not map the whole partition.
>>>
>>> As most of the code that manipulates direct mappings was reused for
>>> indirect mappings, it's necessary to rename all names and debug/info
>>> messages to reflect that it can be used for both kinds of mapping.
>>>
>>> Also, defines DEFAULT_DMA_WIN as "ibm,dma-window" to document that
>>> it's the name of the default DMA window.
>>
>> "ibm,dma-window" is so old so it does not need a macro (which btw would
>> be DMA_WIN_PROPNAME to match the other names) :)
> 
> Thanks for bringing that to my attention!
> In fact, DMA_WIN_PROPNAME makes more sense, but it's still generic and
> doesn't look to point to a generic one.
> 
> Would that be ok to call it DEFAULT_WIN_PROPNAME ?


I would not touch it at all, the property name is painfully known and 
not going to change ever. Does anyone else define it as a macro? I do 
not see any:

[fstn1-p1 kernel-dma-bypass]$ git grep "ibm,dma-window"  | wc -l
8
[fstn1-p1 kernel-dma-bypass]$ git grep "define.*ibm,dma-window"  | wc -l
0



> 
> 
>>
>>
>>> Those changes are not supposed to change how the code works in any
>>> way, just adjust naming.
>>
>> I simply have this in my .vimrc for the cases like this one:
>>
>> ===
>> This should cause no behavioural change.
>> ===
> 
> Great tip! I will make sure to have this saved here :)
> 
> Thank you!
> 

-- 
Alexey
