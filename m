Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D17DDD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 16:25:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zsyH5BKnzDqml
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 00:25:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+f91b4cf709acd1b15965+5821+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zstJ5L6fzDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 00:21:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3McWM/2bHyYOyL1mFZJ/4Q0USrtCE0kV4BVYCLDzEY=; b=Gs6eJLcnWsNhmKTj7X+mSbYPe
 sWN22x7cdspZVuBOb/sWdUdPLhLBDtpvcboWjDhtNcMhLNRBsMfY6by3qN+lcy3LRZiUTk0N+2HWP
 kOMZJFvxoPcRRNE0uvjE3622yufdZBOfEmuk+pAqJ8990LoLVBjJVTweC5ML2/fcSI/I5yQk9xkzC
 DXo9lzPx4qs2+vDYwixYfvb2WsV3i/so3GWZx5jh//NyzYZwmzw2WyL3kD9ImGZ15MoGVv0+nXyc2
 pqAha+cjJpUedSiG3zLHHfWNCMILWDl3fGMNdumhlKXZRRXsvXSn/qs7h+oJomhUXmSe+q3FHmFnl
 YsYxtSn1Q==;
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1htBxQ-0006JC-Ow; Thu, 01 Aug 2019 14:21:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: fix default dma_mmap_* pgprot
Date: Thu,  1 Aug 2019 17:21:17 +0300
Message-Id: <20190801142118.21225-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

As Shawn pointed out we've had issues with the dma mmap pgprots ever
since the dma_common_mmap helper was added beyong the initial
architectures - we default to uncached mappings, but for devices that
are DMA coherent, or if the DMA_ATTR_NON_CONSISTENT is set (and
supported) this can lead to aliasing of cache attributes.  This patch
fixes that.  My explanation of why this hasn't been much of an issue
is that the dma_mmap_ helpers aren't used widely and mostly just in
architecture specific drivers.
