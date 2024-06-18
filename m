Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5490DE8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 23:39:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3g9x3yjMz3cVX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 07:39:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3g9V3FpQz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 07:38:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 742EACE1C9D;
	Tue, 18 Jun 2024 21:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1613BC3277B;
	Tue, 18 Jun 2024 21:38:31 +0000 (UTC)
Date: Tue, 18 Jun 2024 22:38:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH RFC v2 2/5] of: get dma area lower limit
Message-ID: <ZnH-VU2iz9Q2KLbr@arm.com>
References: <cover.1712642324.git.baruch@tkos.co.il>
 <230ea13ef8e9f576df849e1b03406184ca890ba8.1712642324.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <230ea13ef8e9f576df849e1b03406184ca890ba8.1712642324.git.baruch@tkos.co.il>
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

On Tue, Apr 09, 2024 at 09:17:55AM +0300, Baruch Siach wrote:
> of_dma_get_max_cpu_address() returns the highest CPU address that
> devices can use for DMA. The implicit assumption is that all CPU
> addresses below that limit are suitable for DMA. However the
> 'dma-ranges' property this code uses also encodes a lower limit for DMA
> that is potentially non zero.
> 
> Rename to of_dma_get_cpu_limits(), and extend to retrieve also the lower
> limit for the same 'dma-ranges' property describing the high limit.

I don't understand the reason for the lower limit. The way the Linux
zones work is that ZONE_DMA always starts from the start of the RAM. It
doesn't matter whether it's 0 or not, you'd not allocate below the start
of RAM anyway. If you have a device that cannot use the bottom of the
RAM, it is pretty broken and not supported by Linux.

I think you added this limit before we tried to move away from
zone_dma_bits to a non-power-of-two limit (zone_dma_limit). With the
latter, we no longer need tricks with the lower limit,
of_dma_get_max_cpu_address() should capture the smallest upper CPU
address limit supported by all devices (and that's where ZONE_DMA should
end).

-- 
Catalin
