Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E598984B06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 13:48:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463VBl0yfxzDr9W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 21:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="hP9u2rSZ"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463V8S2nTQzDqcv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 21:46:32 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4E68D7F6C7;
 Wed,  7 Aug 2019 06:45:56 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1565178359; bh=446J/ks+11OkveMVUDF0cNPnmfj1n92jZbU24O7P9/w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hP9u2rSZ2plqV7LSihnZ4KMQVILfq7Ta2sV8HqIs1xbk2MqAhVpRJ6umqGgci1XIw
 hvh77x7f8n37Psb6kp4uuHgh1P6AfAITszpAvWuCtCDloHJlE5k+uWk9f/dQej3UDU
 qMHsetLafrL3ESTZBFd89wh1+uVXTW3/D3TX+Bpwv2+kSdwrkuePe9f0Clec/3r7iH
 7yIC+pqI+WIPPbX9PsepRnRJZLc921VqOzBwDqsh6FmLCalWwMFybFzndKvL3JEuXi
 5dqTaMkGqM4FXMkjra5WMd5s7geBuqsT9BcRdnx5ncHjHaUtqJtFLGYWb97FotCml5
 CVyfcDxoPGXew==
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
To: Christoph Hellwig <hch@lst.de>
References: <20190805080145.5694-1-hch@lst.de>
 <20190805080145.5694-2-hch@lst.de>
 <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
 <20190807060432.GD6627@lst.de>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <765a7f25-0e3d-3edc-3f6d-9a17e2379253@anastas.io>
Date: Wed, 7 Aug 2019 13:45:51 +0200
MIME-Version: 1.0
In-Reply-To: <20190807060432.GD6627@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Gavin Li <git@thegavinli.com>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Paul Burton <paul.burton@mips.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/7/19 8:04 AM, Christoph Hellwig wrote:
> Actually it is typical modern Linux style to just provide a prototype
> and then use "if (IS_ENABLED(CONFIG_FOO))" to guard the call(s) to it.

I see.

>> Also, like Will mentioned earlier, the function name isn't entirely
>> accurate anymore. I second the suggestion of using something like
>> arch_dma_noncoherent_pgprot().
> 
> As mentioned I plan to remove arch_dma_mmap_pgprot for 5.4, so I'd
> rather avoid churn for the short period of time.

Yeah, fair enough.

>> As for your idea of defining
>> pgprot_dmacoherent for all architectures as
>>
>> #ifndef pgprot_dmacoherent
>> #define pgprot_dmacoherent pgprot_noncached
>> #endif
>>
>> I think that the name here is kind of misleading too, since this
>> definition will only be used when there is no support for proper
>> DMA coherency.
> 
> Do you have a suggestion for a better name?  I'm pretty bad at naming,
> so just reusing the arm name seemed like a good way to avoid having
> to make naming decisions myself.

Good question. Perhaps something like `pgprot_dmacoherent_fallback`
would better convey that this is only used for devices that don't
support DMA coherency? Or maybe `pgprot_dma_noncoherent`?

