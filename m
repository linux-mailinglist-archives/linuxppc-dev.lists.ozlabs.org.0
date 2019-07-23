Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B376672595
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 05:53:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thJX0f3WzDqF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 13:53:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tGs72dVyzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 21:46:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45tGs671wzz9s3l;
 Tue, 23 Jul 2019 21:46:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/pseries/iommu: Add cond_resched() for huge
 updates
In-Reply-To: <20190722082821.37310-1-aik@ozlabs.ru>
References: <20190722082821.37310-1-aik@ozlabs.ru>
Date: Tue, 23 Jul 2019 21:46:17 +1000
Message-ID: <87r26h55yu.fsf@concordia.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> Mapping ~5.000.000 TCEs currently takes about 40s; this is the amount
> required for a 300GB VM with 64k IOMMU page size. Anything bigger than
> this produces RCU stall warnings.

OK. Are we sure we're not doing anything stupid in that code to make it
go that slowly?

> This adds cond_resched() to allow the scheduler to do context switching
> when it decides to.
>
> This loop is called from dma_set_mask() which is a sleepable context.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 889dc2e44b89..2b8de822272f 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -459,6 +459,7 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
>  static int tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
>  		unsigned long num_pfn, void *arg)
>  {
> +	cond_resched();
>  	return tce_setrange_multi_pSeriesLP(start_pfn, num_pfn, arg);
>  }

Why there and not in tce_setrange_multi_pSeriesLP() ?

I'm not sure what the maximum granularity walk_system_ram_range() will
ever call us with is.

cheers
