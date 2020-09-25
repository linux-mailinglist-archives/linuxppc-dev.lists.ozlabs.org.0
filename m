Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1661277FCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 07:13:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKn65vxmzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 15:13:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKPs2z8SzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 14:56:30 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 88A7868AFE; Fri, 25 Sep 2020 06:56:25 +0200 (CEST)
Date: Fri, 25 Sep 2020 06:56:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
Message-ID: <20200925045625.GB9966@lst.de>
References: <20200908054416.GA13585@lst.de>
 <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
 <20200908121937.GA31559@lst.de>
 <1746dd66810.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20200909075849.GA12282@lst.de>
 <0a7a992f-ad2e-e76a-7bee-1ed4ed607748@ozlabs.ru>
 <20200915065022.GA19658@lst.de>
 <93424419-3476-fc07-8a83-8d9d39062810@ozlabs.ru>
 <20200923141020.GA12374@lst.de>
 <1acaab45-1796-7420-b4fd-b6add7f0d28f@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1acaab45-1796-7420-b4fd-b6add7f0d28f@ozlabs.ru>
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
Cc: Oliver OHalloran <oliveroh@au1.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 24, 2020 at 05:03:11PM +1000, Alexey Kardashevskiy wrote:
> May be... The current behavior is not wrong (after the fix) but not
> optimal either. Even with legacy PCI it should just result in failing
> attempt to set 64bit mask which drivers should still handle, i.e. choose
> a shorter mask.

Err, no.

> Why not ditch the whole dma_get_required_mask() and just fail on setting
> a bigger mask? Are these failures not handled in some drivers? Or there
> are cases when a shorter mask is better? Thanks,

Because that is a complete pain.  Think of it, the device/driver knows
what it supports.  For 98% of the modern devices that means all 64-bit
bits, and for most others this means 32-bits, with a few wackos that
support 48 bits or something like that.  The 98% just take any address
thrown at them, and the others just care that they never see an
address larger than what they support.  They could not care any less
if the systems supports 31, 36, 41, 48, 52, 55, 61 or 63-bit addressing,
an they most certainly should not implement stupid boilerplate code to
guess what addressing mode the system implements.  They just declare
what they support.

Then you have the 12 drivers for devices that can do optimizations if
they never see large DMA addresses.  They use the somewhat misnamed
dma_get_required_mask API to query what the largest address they might
see is and act based on that, while not putting any burden on all the
sane devices/drivers.
