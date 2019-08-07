Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 355248443D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 08:06:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Lbs6JnkzDr7d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 16:06:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 463LZ30Jl3zDqsq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 16:04:41 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BFD0A68CEE; Wed,  7 Aug 2019 08:04:33 +0200 (CEST)
Date: Wed, 7 Aug 2019 08:04:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Shawn Anastasio <shawn@anastas.io>
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190807060432.GD6627@lst.de>
References: <20190805080145.5694-1-hch@lst.de>
 <20190805080145.5694-2-hch@lst.de>
 <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
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
Cc: Gavin Li <git@thegavinli.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Paul Burton <paul.burton@mips.com>, Catalin Marinas <catalin.marinas@arm.com>,
 James Hogan <jhogan@kernel.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 06, 2019 at 09:39:06PM +0200, Shawn Anastasio wrote:
>> -#ifdef CONFIG_ARCH_HAS_DMA_MMAP_PGPROT
>>   pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
>>   		unsigned long attrs);
>> -#else
>> -# define arch_dma_mmap_pgprot(dev, prot, attrs)	pgprot_noncached(prot)
>> -#endif
>
> Nit, but maybe the prototype should still be ifdef'd here? It at least
> could prevent a reader from incorrectly thinking that the function is
> always present.

Actually it is typical modern Linux style to just provide a prototype
and then use "if (IS_ENABLED(CONFIG_FOO))" to guard the call(s) to it.

>
> Also, like Will mentioned earlier, the function name isn't entirely
> accurate anymore. I second the suggestion of using something like
> arch_dma_noncoherent_pgprot().

As mentioned I plan to remove arch_dma_mmap_pgprot for 5.4, so I'd
rather avoid churn for the short period of time.

> As for your idea of defining
> pgprot_dmacoherent for all architectures as
>
> #ifndef pgprot_dmacoherent
> #define pgprot_dmacoherent pgprot_noncached
> #endif
>
> I think that the name here is kind of misleading too, since this
> definition will only be used when there is no support for proper
> DMA coherency.

Do you have a suggestion for a better name?  I'm pretty bad at naming,
so just reusing the arm name seemed like a good way to avoid having
to make naming decisions myself.
