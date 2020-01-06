Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFCA131C88
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 00:46:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sBxR3zYBzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 10:46:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sBdp5BX5zDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 10:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47sBdp41NSz9sRf; Tue,  7 Jan 2020 10:33:18 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d862b44133b7a1d7de25288e09eabf4df415e971
In-Reply-To: <20191216041924.42318-2-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH kernel v2 1/4] Revert "powerpc/pseries/iommu: Don't use
 dma_iommu_ops on secure guests"
Message-Id: <47sBdp41NSz9sRf@ozlabs.org>
Date: Tue,  7 Jan 2020 10:33:18 +1100 (AEDT)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-16 at 04:19:21 UTC, Alexey Kardashevskiy wrote:
> From: Ram Pai <linuxram@us.ibm.com>
> 
> This reverts commit edea902c1c1efb855f77e041f9daf1abe7a9768a.
> 
> At the time the change allowed direct DMA ops for secure VMs; however
> since then we switched on using SWIOTLB backed with IOMMU (direct mapping)
> and to make this work, we need dma_iommu_ops which handles all cases
> including TCE mapping I/O pages in the presence of an IOMMU.
> 
> Fixes: edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests")
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [aik: added "revert" and "fixes:"]
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d862b44133b7a1d7de25288e09eabf4df415e971

cheers
