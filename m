Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA64C27A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46Z565FWz3dgF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:10:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plqHsoA9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+ccf00434d002d37b347b+6759+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=plqHsoA9; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46LP4w8Lz3dqS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 20:00:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0xdJtLbIyGaTkVrOoFrs1oCqE4SKHuV2ypN1+yGx8FU=; b=plqHsoA9r6qv2vcyoZWmADrMG/
 5OPFbItTU7dR/wJsGyZ44TU7xCGfQQi8sj15lLsmxdJKWXugYw9BJI825zqqtRxeT2vsvlVL1+L+4
 Z4s86+FCMNrdAqVn80iGGZAgP1Tib8fDL9OlFVl6nNO623T8ympgHtoeQ8BY5GKQooyK/3WKhc0OJ
 RZfyDYV0j3SviZJjYHW+23G9QvaHR2MEStY2hyxNGAakVOAap9o8FDNl4jQHwk6i6bgcOGcNyf81N
 7qkWtXciB2p6k8Q5Hv/7mbngKMtgV1QAQWdv1kadJpK9io105nqZXvfHdj7kmdHBz/G8wD2sYCdtb
 3ygJbvwQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nN7Yy-00H1v4-7V; Thu, 24 Feb 2022 06:25:16 +0000
Date: Wed, 23 Feb 2022 22:25:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Message-ID: <YhckzJp5/x9zW4uQ@infradead.org>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
 <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
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
Cc: airlied@linux.ie, trix@redhat.com, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, paulus@samba.org, sparclinux@vger.kernel.org,
 linux-scsi@vger.kernel.org, sathya.prakash@broadcom.com,
 Christoph Hellwig <hch@infradead.org>, MPT-FusionLinux.pdl@broadcom.com,
 hao.wu@intel.com, arnd@arndb.de, suganath-prabu.subramani@broadcom.com,
 sreekanth.reddy@broadcom.com, ink@jurassic.park.msu.ru, bhelgaas@google.com,
 mchehab@kernel.org, mattst88@gmail.com, awalls@md.metrocast.net,
 davem@davemloft.net, alex.bou9@gmail.com, vkoul@kernel.org,
 linux-alpha@vger.kernel.org, dmaengine@vger.kernel.org, mdf@kernel.org,
 akpm@linux-foundation.org, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, yilun.xu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 09:26:56PM +0100, Christophe JAILLET wrote:
> Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
> They all still apply cleanly.
> 
> 04 has been picked it up for inclusion in the media subsystem for 5.18.
> The other ones all have 1 or more Reviewed-by:/Acked-by: tags.
> 
> Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in
> order not to break builds.

So how about this:  I'll pick up 1, 5,6,8 and 9 for the dma-mapping
tree.  After -rc1 when presumably all other patches have reached
mainline your resubmit one with the added include and we finish this
off?

Thanks a lot for all your work already!
