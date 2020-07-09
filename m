Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F4F219CF4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 12:06:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Wz34jMvzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 20:06:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Wvc6bYkzDr2j
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 20:03:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FGveEg8q; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2WvZ3zGxz9sTH;
 Thu,  9 Jul 2020 20:03:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594288986;
 bh=gzevlDZNhGR3zBt4oGJSiaOWmNIXxDnq4AJkVnA7ct8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FGveEg8q/y3tCFCeSW1FsRbhFSvX8FhcucbFCIXftYTCKPONKTv/40QFtquvhS7Yo
 PzXwGYKN7bovdbCuMD9lgGZakoYc2SOVrOpgitHHV+kYC3njs0+MPZ+BhyTGB9o+6t
 jNfCMr6brEGBnannqnY2pUkSB5UZp/XUOHF3PqH++pCffJ9+JixW+/tHMqnaHPCA2p
 x9T56tPe0+HFuPp06W4+IOZ9S0ZRYFuezORe9sSIH+715fqj7tkhTxHACSUtShzB/r
 +zGySTRD9bXU5UDoL0fTvXIBwPFr8LToCxfYHvUOi/Uuzt7xvwIge32QyPjtpPZpyI
 pdmw83qWCiusQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/6] powerpc/powernv: must include hvcall.h to get PAPR
 defines
In-Reply-To: <20200706043540.1563616-2-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-2-npiggin@gmail.com>
Date: Thu, 09 Jul 2020 20:05:18 +1000
Message-ID: <87fta1vw9t.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> An include goes away in future patches which breaks compilation
> without this.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda-tce.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> index f923359d8afc..8eba6ece7808 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
> @@ -15,6 +15,7 @@
>  
>  #include <asm/iommu.h>
>  #include <asm/tce.h>
> +#include <asm/hvcall.h> /* share error returns with PAPR */
>  #include "pci.h"
>  
>  unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb)
> -- 
> 2.23.0

This isn't needed anymore AFAICS, since:

5f202c1a1d42 ("powerpc/powernv/ioda: Return correct error if TCE level allocation failed")

cheers
