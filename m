Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AEEB15F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 14:42:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473mhm1cXYzF1LJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 00:42:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4fa4615b85c97fbb822c+5912+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="OewjRBc9"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473mcl6GKqzF5YW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 00:38:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QkB42TZaY19p2tUWLkDIEWFmICndZjJCiuu8c7FQUq4=; b=OewjRBc9r9Xp8/PXv2ckSWK7N
 WX5KxNtEnxuD88ukmOO+8iDivb6it9c5njv2xdlRHDV3ilOSkq+TQL1eZ8py0NxbpFJIK4xgwK6ux
 7D5//CzzfbuOt0waXy9tZOoZuyaFaj6keBpC0pEGDXq0l0ZpuzSYhyoXX9IBE403iJ2khy33zpTr9
 sJDM3/z9b9fFXeAnO2iZzJx16eN0zkdRxNCAyRmFcOIfHAWM7iod8Jv07lYmHFMQ2Rm4qWOBeNu/q
 QKBxAgivmnYe77smiwpxolIuesXJq2NVe/USj+FRAOM5XgZaMqbOpfLsKJvOXgwLXdGuNFg0qOkS+
 TMOLequjA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iQAel-0005dF-3D; Thu, 31 Oct 2019 13:38:31 +0000
Date: Thu, 31 Oct 2019 06:38:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH RFC 1/5] dma/direct: turn ARCH_ZONE_DMA_BITS into a
 variable
Message-ID: <20191031133831.GA21509@infradead.org>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
 <20191014183108.24804-2-nsaenzjulienne@suse.de>
 <20191030214914.GA15939@infradead.org>
 <8c525f66c1c0d9f07e0cff4948d1ec3229756220.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c525f66c1c0d9f07e0cff4948d1ec3229756220.camel@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-s390@vger.kernel.org, mbrugger@suse.com,
 Vasily Gorbik <gor@linux.ibm.com>, wahrenst@gmx.net,
 Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Paul Mackerras <paulus@samba.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 31, 2019 at 11:30:36AM +0100, Nicolas Saenz Julienne wrote:
> On Wed, 2019-10-30 at 14:49 -0700, Christoph Hellwig wrote:
> > On Mon, Oct 14, 2019 at 08:31:03PM +0200, Nicolas Saenz Julienne wrote:
> > > Some architectures, notably ARM, are interested in tweaking this
> > > depending on their runtime DMA addressing limitations.
> > > 
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > 
> > Do you want me to pick this up for the 5.5 dma-mapping tree, or do you
> > want me to wait for the rest to settle?
> 
> I'd say take it, this will be ultimately needed once we push forward with ARM.

Can you resend a version that applies against 5.4-rc?  The current one
has conflicts in the arm64 code.
