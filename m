Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2B29E804
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 10:59:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMLWv42k6zDqJt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 20:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMLRn3Nm7zDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 20:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cJ89gKM6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMLRm3sBKz9sRR;
 Thu, 29 Oct 2020 20:56:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603965364;
 bh=agmXWLfdIA/pQg1LOAdVjmxcr2Hn93lU+lUVrcQP8co=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cJ89gKM6AYK1YY7ZnpS2yHhbxcLbjmfev6r+5Jf2idhvDbSxMIo9mcs5wY0pZEN+W
 0cIi327yBjBEVGmz2pNNAQhtIV6qLKR3otIH/eMSHWT8mkLPkvUeDXaqyd9QCBHNzm
 CfpAwbuDAh283Mb+6+j6c+iKHCQxlkMPxtW0ZlVJQx/hfchdhnlspaTuscYQS28C6O
 QBWRvvDEFrskk+0H/CtSY0Sfiq0kkRmoVc8ubM3WkGa/iXYDThHknl8QOTMUnF5RxN
 wBM1Rru6FhrMzWGzN5iSbrz6kKMpgR5ihXYDENlh5i9jVI4j2JWzRbw4K4THt9hwP+
 LlKTdcZt3QDnQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v4 2/2] powerpc/dma: Fallback to dma_ops when
 persistent memory present
In-Reply-To: <20201029015241.73920-3-aik@ozlabs.ru>
References: <20201029015241.73920-1-aik@ozlabs.ru>
 <20201029015241.73920-3-aik@ozlabs.ru>
Date: Thu, 29 Oct 2020 20:56:03 +1100
Message-ID: <878sbpwe30.fsf@mpe.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> So far we have been using huge DMA windows to map all the RAM available.
> The RAM is normally mapped to the VM address space contiguously, and
> there is always a reasonable upper limit for possible future hot plugged
> RAM which makes it easy to map all RAM via IOMMU.
>
> Now there is persistent memory ("ibm,pmemory" in the FDT) which (unlike
> normal RAM) can map anywhere in the VM space beyond the maximum RAM size
> and since it can be used for DMA, it requires extending the huge window
> up to MAX_PHYSMEM_BITS which requires hypervisor support for:
> 1. huge TCE tables;
> 2. multilevel TCE tables;
> 3. huge IOMMU pages.
>
> Certain hypervisors cannot do either so the only option left is
> restricting the huge DMA window to include only RAM and fallback to
> the default DMA window for persistent memory.
>
> This defines arch_dma_map_direct/etc to allow generic DMA code perform
> additional checks on whether direct DMA is still possible.
>
> This checks if the system has persistent memory. If it does not,
> the DMA bypass mode is selected, i.e.
> * dev->bus_dma_limit = 0
> * dev->dma_ops_bypass = true <- this avoid calling dma_ops for mapping.
>
> If there is such memory, this creates identity mapping only for RAM and
> sets the dev->bus_dma_limit to let the generic code decide whether to
> call into the direct DMA or the indirect DMA ops.
>
> This should not change the existing behaviour when no persistent memory
> as dev->dma_ops_bypass is expected to be set.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
