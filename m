Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F35CA8D647
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:34:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467sY550XBzDqtk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 00:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467sJc2NLLzDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 00:23:38 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6C2D668B02; Wed, 14 Aug 2019 16:23:32 +0200 (CEST)
Date: Wed, 14 Aug 2019 16:23:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: use the generic dma coherent remap allocator
Message-ID: <20190814142332.GA8873@lst.de>
References: <20190814132230.31874-1-hch@lst.de>
 <20190814132230.31874-2-hch@lst.de>
 <34961f3c-e859-49a0-834f-0342bf1f7974@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34961f3c-e859-49a0-834f-0342bf1f7974@c-s.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 04:20:34PM +0200, Christophe Leroy wrote:
>> index 56a7c814160d..afe71b89dec3 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -450,8 +450,10 @@ config NOT_COHERENT_CACHE
>>   	depends on 4xx || PPC_8xx || E200 || PPC_MPC512x || \
>>   		GAMECUBE_COMMON || AMIGAONE
>>   	select ARCH_HAS_DMA_COHERENT_TO_PFN
>
> You drop arch_dma_coherent_to_pfn(), it's surprising to see 
> ARCH_HAS_DMA_COHERENT_TO_PFN remains. At first I thought I'd get a build 
> failure.
>
> After looking more, I see there is a arch_dma_coherent_to_pfn()
> defined in kernel/dma/remap.c when DMA_DIRECT_REMAP is selected.
>
> I think the naming is not really consistant and should be fixed some how, 
> because that's misleading to have an arch_something() being common to all.

I actually have patches in the queue kill arch_dma_coherent_to_pfn off
entirely, as we can always just get back to the physical address and thus
pfn from the dma address using dma_to_phys for dma-direct.

But there is a huge review backlog for my outstanding dma patcheset,
so it might take a bit until it is posted.
