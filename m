Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D5225787
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:23:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9BWP4K6XzDqGh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:23:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9BRf2vjkzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:20:29 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 324A068BFE; Mon, 20 Jul 2020 08:20:24 +0200 (CEST)
Date: Mon, 20 Jul 2020 08:20:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/5] dma-mapping: make support for dma ops optional
Message-ID: <20200720062024.GA10878@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-4-hch@lst.de> <20200718171714.GA237687@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718171714.GA237687@roeck-us.net>
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 18, 2020 at 10:17:14AM -0700, Guenter Roeck wrote:
> On Wed, Jul 08, 2020 at 05:24:47PM +0200, Christoph Hellwig wrote:
> > Avoid the overhead of the dma ops support for tiny builds that only
> > use the direct mapping.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> For ppc:pmac32_defconfig and other configurations, this patch results in:

Fixed and force pushed.
