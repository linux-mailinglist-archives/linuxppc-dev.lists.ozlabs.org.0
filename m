Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD85FEAED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 07:24:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FQDR1B02zF49P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 17:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FQBk1mkqzF46j
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 17:23:07 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0EC8968BE1; Sat, 16 Nov 2019 07:22:58 +0100 (CET)
Date: Sat, 16 Nov 2019 07:22:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: generic DMA bypass flag
Message-ID: <20191116062258.GA8913@lst.de>
References: <20191113133731.20870-1-hch@lst.de>
 <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
 <20191114074105.GC26546@lst.de>
 <9c8f4d7b-43e0-a336-5d93-88aef8aae716@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c8f4d7b-43e0-a336-5d93-88aef8aae716@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 06:12:48PM +0000, Robin Murphy wrote:
> And is that any different from where you would choose to "just" set a 
> generic bypass flag?

Same spots, as intel-iommu moves from the identify to a dma domain when
setting a 32-bit mask.  But that means once a 32-bit mask is set we can't
ever go back to the 64-bit one.  And we had a couple drivers playing
interesting games there.  FYI, this is the current intel-iommu
WIP conversion to the dma bypass flag:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-bypass
