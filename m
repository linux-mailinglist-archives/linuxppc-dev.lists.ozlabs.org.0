Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B9264679
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:01:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnJt822fDzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4BnJlT65z1zDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 22:55:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BnJlS5HLHz9sTq; Thu, 10 Sep 2020 22:55:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200908015106.79661-1-aik@ozlabs.ru>
References: <20200908015106.79661-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
Message-Id: <159974250724.1017939.2306300501613089726.b4-ty@ellerman.id.au>
Date: Thu, 10 Sep 2020 22:55:32 +1000 (AEST)
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Cédric Le Goater <clg@kaod.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Sep 2020 11:51:06 +1000, Alexey Kardashevskiy wrote:
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
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/dma: Fix dma_map_ops::get_required_mask
      https://git.kernel.org/powerpc/c/437ef802e0adc9f162a95213a3488e8646e5fc03

cheers
