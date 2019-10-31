Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FCEB6AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 19:13:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473tjh2bqWzF5q0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 05:13:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=catalin.marinas@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 473tYc3c0HzF3b4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 05:06:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC1D41FB;
 Thu, 31 Oct 2019 11:06:23 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 A95563F6C4; Thu, 31 Oct 2019 11:06:21 -0700 (PDT)
Date: Thu, 31 Oct 2019 18:06:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
Message-ID: <20191031180619.GI39590@arrakis.emea.arm.com>
References: <20191031152837.15253-1-nsaenzjulienne@suse.de>
 <20191031154759.GA7162@lst.de>
 <40d06d463c05d36968e8b64924d78f7794f8de50.camel@suse.de>
 <20191031155750.GA7394@lst.de>
 <6726a651c12d91ca22b9d8984745d90db5d507ec.camel@suse.de>
 <20191031165853.GA8532@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031165853.GA8532@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 31, 2019 at 05:58:53PM +0100, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 05:22:59PM +0100, Nicolas Saenz Julienne wrote:
> > OK, I see what you mean now. It's wrong indeed.
> > 
> > The trouble is the ZONE_DMA series[1] in arm64, also due for v5.5, will be
> > affected by this patch. I don't know the right way to approach this problem
> > since depending on the merge order, this patch should be updated or the arm64
> > ZONE_DMA series fixed.
> > 
> > Maybe it's easier to just wait for v5.6.
> 
> Ok, I can wait.  Or the arm64 maintainers can pick up this patch if
> you want to add it to that series.

This branch is stable (may add a fix but not I'm not rebasing it) if you
want to base this patch on top:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/zone-dma

Otherwise, with your ack, I can add it on top of the above branch (aimed
at 5.5).

-- 
Catalin
