Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD1B6CF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 21:54:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YVzm17wHzF4QW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 05:54:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux-mips.org
 (client-ip=148.251.95.138; helo=cvs.linux-mips.org;
 envelope-from=macro@linux-mips.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-mips.org
X-Greylist: delayed 136 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Sep 2019 05:52:23 AEST
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by lists.ozlabs.org (Postfix) with ESMTP id 46YVxg29TqzF4JR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 05:52:23 +1000 (AEST)
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
 with ESMTP id S23994204AbfIRTuBXltuQ (ORCPT
 <rfc822;linuxppc-dev@lists.ozlabs.org>);
 Wed, 18 Sep 2019 21:50:01 +0200
Date: Wed, 18 Sep 2019 20:50:01 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] MIPS: remove support for DMA_ATTR_WRITE_COMBINE
In-Reply-To: <20190807061602.31217-3-hch@lst.de>
Message-ID: <alpine.LFD.2.21.1909182001260.31718@eddie.linux-mips.org>
References: <20190807061602.31217-1-hch@lst.de>
 <20190807061602.31217-3-hch@lst.de>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Shawn Anastasio <shawn@anastas.io>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Paul Burton <paul.burton@mips.com>, Catalin Marinas <catalin.marinas@arm.com>,
 James Hogan <jhogan@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2019, Christoph Hellwig wrote:

> Mips uses the KSEG1 kernel memory segment to map dma coherent
> allocations for non-coherent devices as uncacheable, and does not have
> any kind of special support for DMA_ATTR_WRITE_COMBINE in the allocation
> path.  Thus supporting DMA_ATTR_WRITE_COMBINE in dma_mmap_attrs will
> lead to multiple mappings with different caching attributes.

 FYI, AFAIK _CACHE_UNCACHED_ACCELERATED (where supported) is effectively 
write-combine.  Though IIUC someone would have to wire it in first.

  Maciej
