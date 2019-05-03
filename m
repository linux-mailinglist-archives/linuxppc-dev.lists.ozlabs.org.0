Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE5128E8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:33:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wP4S6BsDzDqZq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:33:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKN5QMYzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKN2r46z9sNf; Fri,  3 May 2019 16:59:20 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b511cdd1c12d1e450baeba5373dd3a8897396e2b
X-Patchwork-Hint: ignore
In-Reply-To: <20190410064800.82221-1-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH kernel] powerpc/powernv/ioda: Handle failures correctly in
 pnv_pci_ioda_iommu_bypass_supported
Message-Id: <44wNKN2r46z9sNf@ozlabs.org>
Date: Fri,  3 May 2019 16:59:20 +1000 (AEST)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-04-10 at 06:48:00 UTC, Alexey Kardashevskiy wrote:
> When the return value type was changed from int to bool, few places were
> left unchanged, this fixes them. We did not hit these failures as
> the first one is not happening at all and the second one is little more
> likely to happen if the user switches a 33..58bit DMA capable device
> between the VFIO and vendor drivers and there are not so many of these.
> 
> Fixes: 2d6ad41b2c21 ("powerpc/powernv: use the generic iommu bypass code", 2019-02-13)
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b511cdd1c12d1e450baeba5373dd3a88

cheers
