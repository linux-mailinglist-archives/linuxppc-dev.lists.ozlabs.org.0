Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B53B0A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 10:20:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MmKl6j2tzDqRr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 18:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MmHk0XXszDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 18:18:56 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id C36F768B05; Mon, 10 Jun 2019 10:18:25 +0200 (CEST)
Date: Mon, 10 Jun 2019 10:18:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
Message-ID: <20190610081825.GA16534@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 08, 2019 at 04:52:24PM -0500, Larry Finger wrote:
> On 6/7/19 12:29 PM, Christoph Hellwig wrote:
>> I don't think we should work around this in the driver, we need to fix
>> it in the core.  I'm curious why my previous patch didn't work.  Can
>> you throw in a few printks what failed?  I.e. did dma_direct_supported
>> return false?  Did the actual allocation fail?
>
> Routine dma_direct_supported() returns true.
>
> The failure is in routine dma_set_mask() in the following if test:
>
>         if (!dev->dma_mask || !dma_supported(dev, mask))
>                 return -EIO;
>
> For b43legacy, dev->dma_mask is 0xc265684800000000.
>     dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x3fffffff, and 
> the routine returns -EIO.
>
> For b43,       dev->dma_mask is 0xc265684800000001,
>     dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x77777777, and 
> the routine returns 0.

I don't fully understand what values the above map to.  Can you send
me your actual debugging patch as well?
