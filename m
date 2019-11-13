Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7CFB2E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 15:51:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cncq2yFczF6nR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 01:51:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47CnTj0pHrzF77N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 01:45:23 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 367C87A7;
 Wed, 13 Nov 2019 06:45:18 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CEA63F6C4;
 Wed, 13 Nov 2019 06:45:17 -0800 (PST)
Subject: Re: generic DMA bypass flag
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20191113133731.20870-1-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
Date: Wed, 13 Nov 2019 14:45:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113133731.20870-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/11/2019 1:37 pm, Christoph Hellwig wrote:
> Hi all,
> 
> I've recently beeing chatting with Lu about using dma-iommu and
> per-device DMA ops in the intel IOMMU driver, and one missing feature
> in dma-iommu is a bypass mode where the direct mapping is used even
> when an iommu is attached to improve performance.  The powerpc
> code already has a similar mode, so I'd like to move it to the core
> DMA mapping code.  As part of that I noticed that the current
> powerpc code has a little bug in that it used the wrong check in the
> dma_sync_* routines to see if the direct mapping code is used.

In all honesty, this seems silly. If we can set a per-device flag to say 
"oh, bypass these ops and use some other ops instead", then we can just 
as easily simply give the device the appropriate ops in the first place. 
Because, y'know, the name of the game is "per-device ops".

> These two patches just add the generic code and move powerpc over,
> the intel IOMMU bits will require a separate discussion.

The ops need to match the default domain type, so the hard part of the 
problem is choosing when and if to switch that (particularly fun if 
there are multiple devices in the IOMMU group). Flipping between 
iommu-dma and dma-direct at that point will be trivial.

I don't see a great benefit to pulling legacy cruft out into common code 
instead of just working to get rid of it in-place, when said cruft pulls 
in the opposite direction to where we're taking the common code (i.e. 
it's inherently based on the premise of global ops).

Robin.

> The x86 AMD Gart code also has a bypass mode, but it is a lot
> strange, so I'm not going to touch it for now.
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
