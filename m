Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9211A5FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 09:38:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xr112hpmzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:38:13 +1100 (AEDT)
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
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="Usht71Gx"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XqzF1Jc5zDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 19:36:39 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id d199so1433107pfd.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 00:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TyTd+C4knMLMcc86kOqTPFMrzj2GSz56Tr2BiHlr9+E=;
 b=Usht71GxmrxvJ+OZO6Pq7XSaayiRm2orx4LBvrKT3ZMA0NaW0FN1ZZTJTR4Mp4PFWa
 rjjVDxWsmIPEWhW2cBWcIWCNhP5IqJssFkCLCx58g4UTdc12WxM3iOBbkyzsnr64aJUw
 pGo5H/NLFyKolQbjQYlDoQJgXH2VHd0FjIqwRULPoZ7HlqFh8y9CvqNT2tR8u2m9DTZW
 pueAS0jdYPo7W66xiH/sUOd4O7FcrMRq9HRciXhM0s57Fv2jo89NAl2cyImzzLUG3hLQ
 FP5qJgJN1Sj6+Y8iUlV4UAytPWUZLqG/Sact7w3RP3NFe5c8YFayvtXjCL/fFlTbczAJ
 Bz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TyTd+C4knMLMcc86kOqTPFMrzj2GSz56Tr2BiHlr9+E=;
 b=Fj9/8o1Z5sATs5ieE9k1rfAu58TY7Qw1b2Q0EqImZAp72zegO0tFeKY6H9pjaNvl98
 FIJVJv9CU2VOzEoz0M08jVTBXO5DdDkQwDQaZ3MUI0rZ4ykUmQRPZiUxBuzf7FesTmQd
 zn3GMIDg2ju6V5gvzB1lGudbRFrs3xqoUTHwA2eab7wpWesgzxeAb+pdT0SgfM00Hf4D
 tXzZ8aH6kDWDSUXRHNg7vEPOhs3VqH+4/+x5Pu4c5QDwxB1G1VOE7iMMgyj/YEIIPEeJ
 Khc0GdE5WoUZkWsAAoeGXvWUbL4mljQzB/idwjGtdoVVJ1n4B8E54OohbPBaBle53g5Q
 lhjg==
X-Gm-Message-State: APjAAAXK+UnRddhM5L3wOAq8pvBNqmofkf9ruD4cM9BNB0qCbuKCfUlY
 hHGvmaPnc5agKZxV9i9PyxEFAg==
X-Google-Smtp-Source: APXvYqx+DhrCyt73cuUffzsSteZ7KnRWBj0belTAxkWzrn1HcEFEhQmpxGthAEKhvN2FuASSzSlNog==
X-Received: by 2002:a63:5f91:: with SMTP id t139mr2735712pgb.185.1576053397358; 
 Wed, 11 Dec 2019 00:36:37 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j14sm1737420pgs.57.2019.12.11.00.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 00:36:36 -0800 (PST)
Subject: Re: [PATCH v5 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for
 Secure VM.
To: Michael Roth <mdroth@linux.vnet.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 mpe@ellerman.id.au
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-3-git-send-email-linuxram@us.ibm.com>
 <157602860458.3810.8599908751067047456@sif>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <be36117d-204e-bf59-287a-371103186e16@ozlabs.ru>
Date: Wed, 11 Dec 2019 19:36:29 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <157602860458.3810.8599908751067047456@sif>
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
Cc: andmike@us.ibm.com, mst@redhat.com, linux-kernel@vger.kernel.org,
 ram.n.pai@gmail.com, leonardo@linux.ibm.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/12/2019 12:43, Michael Roth wrote:
> Quoting Ram Pai (2019-12-06 19:12:39)
>> Commit edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on
>>                 secure guests")
>> disabled dma_iommu_ops path, for secure VMs. Disabling dma_iommu_ops
>> path for secure VMs, helped enable dma_direct path.  This enabled
>> support for bounce-buffering through SWIOTLB.  However it fails to
>> operate when IOMMU is enabled, since I/O pages are not TCE mapped.
>>
>> Renable dma_iommu_ops path for pseries Secure VMs.  It handles all
>> cases including, TCE mapping I/O pages, in the presence of a
>> IOMMU.
> 
> Wasn't clear to me at first, but I guess the main gist of this series is
> that we want to continue to use SWIOTLB, but also need to create mappings
> of it's bounce buffers in the IOMMU, so we revert to using dma_iommu_ops
> and rely on the various dma_iommu_{map,alloc}_bypass() hooks throughout
> to call into dma_direct_* ops rather than relying on the dma_is_direct(ops)
> checks in DMA API functions to do the same.


Correct. Took me a bit of time to realize what we got here :) We only
rely on  dma_iommu_ops::.dma_supported to write the DMA offset to a
device (when creating a huge window), and after that we know it is
mapped directly and swiotlb gets this 1<<59 offset via __phys_to_dma().


> That makes sense, but one issue I see with that is that
> dma_iommu_map_bypass() only tests true if all the following are true:
> 
> 1) the device requests a 64-bit DMA mask via
>    dma_set_mask/dma_set_coherent_mask
> 2) DDW is enabled (i.e. we don't pass disable_ddw on command-line)
> 
> dma_is_direct() checks don't have this limitation, so I think for
> anything cases, such as devices that use a smaller DMA mask, we'll
> end up falling back to the non-bypass functions in dma_iommu_ops, which
> will likely break for things like dma_alloc_coherent/dma_map_single
> since they won't use SWIOTLB pages and won't do the necessary calls to
> set_memory_unencrypted() to share those non-SWIOTLB buffers with
> hypervisor.
> 
> Maybe that's ok, but I think we should be clearer about how to
> fail/handle these cases.
> 
> Though I also agree with some concerns Alexey stated earlier: it seems
> wasteful to map the entire DDW window just so these bounce buffers can be
> mapped.  Especially if you consider the lack of a mapping to be an additional
> safe-guard against things like buggy device implementations on the QEMU
> side. E.g. if we leaked pages to the hypervisor on accident, those pages
> wouldn't be immediately accessible to a device, and would still require
> additional work get past the IOMMU.
> 
> What would it look like if we try to make all this work with disable_ddw passed
> to kernel command-line (or forced for is_secure_guest())?
> 
>   1) dma_iommu_{alloc,map}_bypass() would no longer get us to dma_direct_* ops,
>      but an additional case or hook that considers is_secure_guest() might do
>      it.
>      
>   2) We'd also need to set up an IOMMU mapping for the bounce buffers via
>      io_tlb_start/io_tlb_end. We could do it once, on-demand via
>      dma_iommu_bypass_supported() like we do for the 64-bit DDW window, or
>      maybe in some init function.


io_tlb_start/io_tlb_end are only guaranteed to stay within 4GB and our
default DMA window is 1GB (KVM) or 2GB (PowerVM), ok, we can define
ARCH_LOW_ADDRESS_LIMIT as 1GB.

But it has also been mentioned that we are likely to be having swiotlb
buffers outside of the first 4GB as they are not just for crippled
devices any more. So we are likely to have 64bit window, I'd just ditch
the default window then, I have patches for this but every time I
thought I have a use case, turned out that I did not.


> That also has the benefit of not requiring devices to support 64-bit DMA.
> 
> Alternatively, we could continue to rely on the 64-bit DDW window, but
> modify call to enable_ddw() to only map the io_tlb_start/end range in
> the case of is_secure_guest(). This is a little cleaner implementation-wise
> since we can rely on the existing dma_iommu_{alloc,map}_bypass() hooks, but
> devices that don't support 64-bit will fail back to not using dma_direct_* ops
> and fail miserably. We'd probably want to handle that more gracefully.
> 
> Or we handle both cases gracefully. To me it makes more sense to enable
> non-DDW case, then consider adding DDW case later if there's some reason
> why 64-bit DMA is needed. But would be good to hear if there are other
> opinions.


For now we need to do something with the H_PUT_TCE_INDIRECT's page -
either disable multitce (but boot time increases) or share the page. The
patch does the latter. Thanks,


> 
>>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/iommu.c | 11 +----------
>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>> index 67b5009..4e27d66 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -36,7 +36,6 @@
>>  #include <asm/udbg.h>
>>  #include <asm/mmzone.h>
>>  #include <asm/plpar_wrappers.h>
>> -#include <asm/svm.h>
>>  #include <asm/ultravisor.h>
>>
>>  #include "pseries.h"
>> @@ -1346,15 +1345,7 @@ void iommu_init_early_pSeries(void)
>>         of_reconfig_notifier_register(&iommu_reconfig_nb);
>>         register_memory_notifier(&iommu_mem_nb);
>>
>> -       /*
>> -        * Secure guest memory is inacessible to devices so regular DMA isn't
>> -        * possible.
>> -        *
>> -        * In that case keep devices' dma_map_ops as NULL so that the generic
>> -        * DMA code path will use SWIOTLB to bounce buffers for DMA.
>> -        */
>> -       if (!is_secure_guest())
>> -               set_pci_dma_ops(&dma_iommu_ops);
>> +       set_pci_dma_ops(&dma_iommu_ops);
>>  }
>>
>>  static int __init disable_multitce(char *str)
>> -- 
>> 1.8.3.1
>>

-- 
Alexey
