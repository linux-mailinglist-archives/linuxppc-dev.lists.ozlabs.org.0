Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8723141D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 19:47:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FsNb242BzDqdV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 03:47:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+1238baab1fee290d454e+5759+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="OcvvfIQW"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FsMK2NqVzDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 03:46:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sw59L5eilDcyLax1cbN/oovEq+2iPQ87MItZHDnliB8=; b=OcvvfIQWRmhZciRaxx8x6dnj7
 P9/7pUyMmERrI8OtitGh0I1lua9/boy6cCyy8Ladvj3L+81QcfLZA3/MpAXnqBYWumQ7OwxjHJzyW
 dYcTgnoubni9ek4e+t2NdyFiporyzaIlnP+Sqtx7nVnm4QpWkErFIuu3c//DEmHtOceqwmRR+TleY
 5xdn+M5QVBRJydb756QKcrm2LYNcpari+BbBMzfF1a1qnRAOkMBtY1ouzqY7uu11IRMQ992tj+IwH
 kTGIKLKzrT0G7yIOK0n8A8VlEo0R3dSDvfZe6tdSfdipO9HLYIyRazJqOFjrnnt5KR1OHdtFysfhd
 5WgaU7K6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hWlbq-00022N-4T; Fri, 31 May 2019 17:46:30 +0000
Date: Fri, 31 May 2019 10:46:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Message-ID: <20190531174629.GA6298@infradead.org>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
 <20190530.150844.1826796344374758568.davem@davemloft.net>
 <20190531163350.GB8708@infradead.org>
 <37406608-df48-c7a0-6975-4b4ad408ba36@arm.com>
 <20190531170804.GA12211@infradead.org>
 <1b81c168-f5e0-f86a-f90e-22e8c3f2a602@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b81c168-f5e0-f86a-f90e-22e8c3f2a602@arm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, roy.pledge@nxp.com,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 camelia.groza@nxp.com, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2019 at 06:45:00PM +0100, Robin Murphy wrote:
> Bleh, I'm certainly not keen on formalising any kind of
> dma_to_phys()/dma_to_virt() interface for this. Or are you just proposing
> something like dma_unmap_sorry_sir_the_dog_ate_my_homework() for drivers
> which have 'lost' the original VA they mapped?

Yes, I guess we need that in some form.  I've heard a report the IBM
emca ethernet driver has the same issue, and any SOC with it this
totally blows up dma-debug as they just never properly unmap.
