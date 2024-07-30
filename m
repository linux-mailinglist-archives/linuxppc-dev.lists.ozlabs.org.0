Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0D9415D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 17:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYKWT4L94z3dTC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 01:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYKVf1wkMz3dHR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 01:52:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C146961FE5;
	Tue, 30 Jul 2024 15:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B36C4AF0A;
	Tue, 30 Jul 2024 15:52:19 +0000 (UTC)
Date: Tue, 30 Jul 2024 16:52:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH RFC v2 2/5] of: get dma area lower limit
Message-ID: <ZqkMMW_mz4C66I2e@arm.com>
References: <cover.1712642324.git.baruch@tkos.co.il>
 <230ea13ef8e9f576df849e1b03406184ca890ba8.1712642324.git.baruch@tkos.co.il>
 <ZnH-VU2iz9Q2KLbr@arm.com>
 <87cyn1k7yq.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyn1k7yq.fsf@tarshish>
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
Cc: Rob Herring <robh@kernel.org>, linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 02:49:01PM +0300, Baruch Siach wrote:
> Hi Catalin,
> 
> On Tue, Jun 18 2024, Catalin Marinas wrote:
> > On Tue, Apr 09, 2024 at 09:17:55AM +0300, Baruch Siach wrote:
> >> of_dma_get_max_cpu_address() returns the highest CPU address that
> >> devices can use for DMA. The implicit assumption is that all CPU
> >> addresses below that limit are suitable for DMA. However the
> >> 'dma-ranges' property this code uses also encodes a lower limit for DMA
> >> that is potentially non zero.
> >> 
> >> Rename to of_dma_get_cpu_limits(), and extend to retrieve also the lower
> >> limit for the same 'dma-ranges' property describing the high limit.
> >
> > I don't understand the reason for the lower limit. The way the Linux
> > zones work is that ZONE_DMA always starts from the start of the RAM. It
> > doesn't matter whether it's 0 or not, you'd not allocate below the start
> > of RAM anyway. If you have a device that cannot use the bottom of the
> > RAM, it is pretty broken and not supported by Linux.
> 
> I won't argue with that assertion. My target system RAM happens to start
> at that the lower end of devices DMA zone, so I'm fine with skipping
> this patch.
> 
> Just curious. What is the inherent limitation that prevents Linux from
> supporting DMA zone with lower limit above RAM start?

It's the way the zone allocation fallback mechanism works. Let's say a
ZONE_DMA32 allocation fails, it falls back to ZONE_DMA and it's supposed
to be compatible with the GFP_DMA32 request. If you have some other zone
below ZONE_DMA, it should also be compatible with GFP_DMA allocations.

-- 
Catalin
