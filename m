Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD7B260B31
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 08:47:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlwgW1FYjzDqR3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 16:47:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlwdH6bYrzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 16:45:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LZ3GQ+WV; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BlwdH1rTfz9sTK;
 Tue,  8 Sep 2020 16:45:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599547523;
 bh=r/3rfuxatP3YbEsc7UBrCC3zIODpBHcxZX3ayVuwoik=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LZ3GQ+WVb+t9Sld9hUw21h0OEahyGIF+YF+jTAscXCZgvz0vJlmNGQclbkUx8dGqA
 /Uc/673TwzRiGZ5WCdG6B2U/BVQRgWTFKhPOT96783AXxtgrwx4IFThpoBd8fTTQJo
 unvyD+M0u8ppUsJlEgzs5HTR4D2oRDNMAhcNoxa4wPE23D8/W2tmz214lmIxCeWFV5
 0GUCf2R2hyfLOI4hlj4MV4vTockmDZaUw5MEWPzGQe9NUimP8EjZ/NxDWDfWa6M/FK
 RTZ281NinksirpPFmItRRwyygrPpUje9LGV2YZUkSn4glePgEV1RPIw7BcUQ3vr9tZ
 PW4C62z7lLh8w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
In-Reply-To: <20200908015106.79661-1-aik@ozlabs.ru>
References: <20200908015106.79661-1-aik@ozlabs.ru>
Date: Tue, 08 Sep 2020 16:45:20 +1000
Message-ID: <87pn6wsr5r.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 Christoph Hellwig <hch@lst.de>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> There are 2 problems with it:
> 1. "<" vs expected "<<"
> 2. the shift number is an IOMMU page number mask, not an address mask
> as the IOMMU page shift is missing.
>
> This did not hit us before f1565c24b596 ("powerpc: use the generic
> dma_ops_bypass mode") because we had there additional code to handle
> bypass mask so this chunk (almost?) never executed. However there
> were reports that aacraid does not work with "iommu=nobypass".
> After f1565c24b596, aacraid (and probably others which call
> dma_get_required_mask() before setting the mask) was unable to
> enable 64bit DMA and fall back to using IOMMU which was known not to work,
> one of the problems is double free of an IOMMU page.
>
> This fixes DMA for aacraid, both with and without "iommu=nobypass"
> in the kernel command line. Verified with "stress-ng -d 4".
>
> Fixes: f1565c24b596 ("powerpc: use the generic dma_ops_bypass mode")

I think it'd be better to point the Fixes tag at 6a5c7be5e484, which
originally introduced the bug, even if we didn't notice it until
f1565c24b596 exposed it (or made it more likely).

cheers

> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> The original code came Jun 24 2011:
> 6a5c7be5e484 ("powerpc: Override dma_get_required_mask by platform hook and ops")
>
>
> What is dma_get_required_mask() for anyway? What "requires" what here?
>
> Even though it works for now (due to huge - >4GB - default DMA window),
> I am still not convinced we do not want this chunk here
> (this is what f1565c24b596 removed):
>
> if (dev_is_pci(dev)) {
>         u64 bypass_mask = dma_direct_get_required_mask(dev);
>
>         if (dma_iommu_bypass_supported(dev, bypass_mask))
>                 return bypass_mask;
> }
> ---
>  arch/powerpc/kernel/dma-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
> index 569fecd7b5b2..9053fc9d20c7 100644
> --- a/arch/powerpc/kernel/dma-iommu.c
> +++ b/arch/powerpc/kernel/dma-iommu.c
> @@ -120,7 +120,8 @@ u64 dma_iommu_get_required_mask(struct device *dev)
>  	if (!tbl)
>  		return 0;
>  
> -	mask = 1ULL < (fls_long(tbl->it_offset + tbl->it_size) - 1);
> +	mask = 1ULL << (fls_long(tbl->it_offset + tbl->it_size) +
> +			tbl->it_page_shift - 1);
>  	mask += mask - 1;
>  
>  	return mask;
> -- 
> 2.17.1
