Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0525E8E1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 17:49:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkJrX6mGbzDqkx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 01:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Hnu0TMoi; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkJm03TpyzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 01:45:34 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id u3so1168607pjr.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0zomv6SLpBCgRUcNigIvJpvA8Tydvp1pLbt33s7KfSg=;
 b=Hnu0TMoiEodwJYjQuYaWa1t2E+EpttYP4C490ikFzotrHDz6qAJBxTSBFrzBM9ZWFV
 rlJOySqH7G7hN7IYcBZDSQ4IoOZTMhy0m+8VIsKIQ4QSWRRgbMZIsztMcCzfk9DmFbHy
 8Dg6Yc+q3/o3SRY7/RIUOoW5mKjeMe35qCXWfrslnb1fCi13pdd3EM37UFUuQfHGAltL
 keQHRRBWLicT0pLW5vtR+CKe7sn2VXWnPG++EEi0qVq2QmkQoEcwLwSUFOaBBUPQ4Uc3
 qmRxoht8EFp8lgseX12iqurjQfGvOi3uikHIwDwOe8MOCLrXdhZo/XYFicKrYcN01vbM
 XPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0zomv6SLpBCgRUcNigIvJpvA8Tydvp1pLbt33s7KfSg=;
 b=K/jBrEqSo0bi4znGJ1y81EQ12K59MV26pNgKqGq+x2a1bSk3l6eb8S/hqoOkPVEtdL
 j3KmjDCZkKjzQ6OKBVopiDEpy3jdhfem49AxptgaztL5bc4xrZkrBUBLorPi78g4wgH/
 iwY7xuk2so/Paw77LpTJHrrK3W9KhZeQyz7ElZAlA7w9/fUmoaCnovfUXCFJdxh3rBZ4
 +yK81Z4MNP8Eaq/Ic4rLKrk8X6r5fijMDDxiOXS+aUiHB6JhXSYW94xSFigrnNoE3xQr
 QJ4WA8+rMOxoBSU/xDX2yemaEHeFK3UKm6mGn0e2VZck0ImldCPhHHgKZCrBsFK26AdB
 U5FA==
X-Gm-Message-State: AOAM532DXeVMIauYoBd2UttIE5GVi7WOdP8ZQwlTHzEryJXCS4SvSHEb
 8HRWQVraGrOdKGFk5hYGyBgxxA==
X-Google-Smtp-Source: ABdhPJy2DO7Qwem10G6tlX9grnI3fcQoduoCr4ZB3PxiacIYR680sRJ0i6xLUCnOjlQ7wVZiNvvTjg==
X-Received: by 2002:a17:90a:f117:: with SMTP id
 cc23mr12744737pjb.155.1599320729072; 
 Sat, 05 Sep 2020 08:45:29 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id c22sm1900861pgb.52.2020.09.05.08.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 08:45:27 -0700 (PDT)
Subject: Re: [PATCH 5/5] powerpc: use the generic dma_ops_bypass mode
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-6-hch@lst.de>
 <505bcc1d-01a7-9655-88e1-ebddd0b94d56@kaod.org>
 <20200831064038.GB27617@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <48e38110-2a8f-1701-2e30-06fb07bbfffe@ozlabs.ru>
Date: Sun, 6 Sep 2020 01:45:20 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200831064038.GB27617@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Daniel Borkmann <daniel@iogearbox.net>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Jesper Dangaard Brouer <brouer@redhat.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Oliver O'Halloran <oohall@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, aacraid@microsemi.com,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 31/08/2020 16:40, Christoph Hellwig wrote:
> On Sun, Aug 30, 2020 at 11:04:21AM +0200, Cédric Le Goater wrote:
>> Hello,
>>
>> On 7/8/20 5:24 PM, Christoph Hellwig wrote:
>>> Use the DMA API bypass mechanism for direct window mappings.  This uses
>>> common code and speed up the direct mapping case by avoiding indirect
>>> calls just when not using dma ops at all.  It also fixes a problem where
>>> the sync_* methods were using the bypass check for DMA allocations, but
>>> those are part of the streaming ops.
>>>
>>> Note that this patch loses the DMA_ATTR_WEAK_ORDERING override, which
>>> has never been well defined, as is only used by a few drivers, which
>>> IIRC never showed up in the typical Cell blade setups that are affected
>>> by the ordering workaround.
>>>
>>> Fixes: efd176a04bef ("powerpc/pseries/dma: Allow SWIOTLB")
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> ---
>>>   arch/powerpc/Kconfig              |  1 +
>>>   arch/powerpc/include/asm/device.h |  5 --
>>>   arch/powerpc/kernel/dma-iommu.c   | 90 ++++---------------------------
>>>   3 files changed, 10 insertions(+), 86 deletions(-)
>>
>> I am seeing corruptions on a couple of POWER9 systems (boston) when
>> stressed with IO. stress-ng gives some results but I have first seen
>> it when compiling the kernel in a guest and this is still the best way
>> to raise the issue.
>>
>> These systems have of a SAS Adaptec controller :
>>
>>    0003:01:00.0 Serial Attached SCSI controller: Adaptec Series 8 12G SAS/PCIe 3 (rev 01)
>>
>> When the failure occurs, the POWERPC EEH interrupt fires and dumps
>> lowlevel PHB4 registers among which :
>> 					
>>    [ 2179.251069490,3] PHB#0003[0:3]:           phbErrorStatus = 0000028000000000
>>    [ 2179.251117476,3] PHB#0003[0:3]:      phbFirstErrorStatus = 0000020000000000
>>
>> The bits raised identify a PPC 'TCE' error, which means it is related
>> to DMAs. See below for more details.
>>
>>
>> Reverting this patch "fixes" the issue but it is probably else where,
>> in some other layers or in the aacraid driver. How should I proceed
>> to get more information ?
> 
> The aacraid DMA masks look like a mess.


It kinds does and is. The thing is that after f1565c24b596 the driver 
sets 32 bit DMA mask which in turn enables the small DMA window (not 
bypass) and since the aacraid driver has at least one bug with double 
unmap of the same DMA handle, this somehow leads to EEH (PCI DMA error).


The driver sets 32but mask because it callis dma_get_required_mask() 
_before_ setting the mask so dma_get_required_mask() does not go the 
dma_alloc_direct() path and calls the powerpc's 
dma_iommu_get_required_mask() which:

1. does the math like this (spot 2 bugs):

mask = 1ULL < (fls_long(tbl->it_offset + tbl->it_size) - 1)

2. but even after fixing that, the driver crashes as f1565c24b596 
removed the call to dma_iommu_bypass_supported() so it enforces IOMMU.


The patch below (the first hunk to be precise) brings the things back to 
where they were (64bit mask). The double unmap bug in the driver is 
still to be investigated.



diff --git a/arch/powerpc/kernel/dma-iommu.c 
b/arch/powerpc/kernel/dma-iommu.c
index 569fecd7b5b2..785abccb90fc 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -117,10 +117,18 @@ u64 dma_iommu_get_required_mask(struct device *dev)
         struct iommu_table *tbl = get_iommu_table_base(dev);
         u64 mask;

+       if (dev_is_pci(dev)) {
+               u64 bypass_mask = dma_direct_get_required_mask(dev);
+
+               if (dma_iommu_bypass_supported(dev, bypass_mask))
+                       return bypass_mask;
+       }
+
         if (!tbl)
                 return 0;

-       mask = 1ULL < (fls_long(tbl->it_offset + tbl->it_size) - 1);
+       mask = 1ULL << (fls_long(tbl->it_offset + tbl->it_size) +
+                       tbl->it_page_shift - 1);
         mask += mask - 1;

         return mask;



-- 
Alexey
