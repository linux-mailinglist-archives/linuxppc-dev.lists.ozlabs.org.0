Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460341CD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:55:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NyL63NgQzDqnD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NyJ14GpTzDqlw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:53:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="GFvtK0jF"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45NyHz4LJGz8t30
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:53:19 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45NyHz3sQmz9sBr; Wed, 12 Jun 2019 16:53:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+eeb336ffa9092f1fc134+5771+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="GFvtK0jF"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45NyHz21VFz9s9y
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 16:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xgUX4NVL92gkxOqiTvw1J9XqeyQ+MJXpugSZPm13AZs=; b=GFvtK0jFohgoH84MW52pkyI40
 R1zEfRmP4a24R6XxrcvPT3RRZbLFUlUtEPxsULpUAaAK5nCVL8Sz4cA+wGpXZQLudidQvzYR6dqkg
 89yQXiFkJzeTJdX/YYYJ56lXLo7Vk7rvNbee/3ocS7fbGmRvhLPyyxwLW15FdZIKkNpcEiWvDopqf
 T5QXYgcpiInC9kdOYDQXsM2QV5ii8Ur0ZT715wd7lQ4es8wB89/njfaF11nBFSWsohi1P3z+9BFJ3
 OAbEfmPM0p4yE9eul8AJt2Eav6KrJtgquUD1xJPHnz2v0ox9BgG1BUWkq/2M7rQLshhgGHGEbLL31
 JxdnZzHKg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hax8E-0000qt-4p; Wed, 12 Jun 2019 06:53:14 +0000
Date: Tue, 11 Jun 2019 23:53:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
Message-ID: <20190612065314.GA28838@infradead.org>
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com>
 <20190611151753.GA11404@infradead.org>
 <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
 <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
 <CAOSf1CE82uVVni638jkJJpQ7XLXX+HdD7xuB7Wv-f8mn=SBMeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CE82uVVni638jkJJpQ7XLXX+HdD7xuB7Wv-f8mn=SBMeg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Oded Gabbay <oded.gabbay@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@infradead.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 04:35:22PM +1000, Oliver O'Halloran wrote:
> Setting a 48 bit DMA mask doesn't work today because we only allocate
> IOMMU tables to cover the 0..2GB range of PCI bus addresses.

I don't think that is true upstream, and if it is we need to fix bug
in the powerpc code.  powerpc should be falling back treating a 48-bit
dma mask like a 32-bit one at least, that is use dynamic iommu mappings
instead of using the direct mapping.  And from my reding of 
arch/powerpc/kernel/dma-iommu.c that is exactly what it does.
