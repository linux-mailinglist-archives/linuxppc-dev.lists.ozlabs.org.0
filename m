Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BDB3414F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 06:43:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1t9Y50VWz30Hr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 16:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1t9D0k1tz30HC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 16:43:26 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EFE6A68BEB; Fri, 19 Mar 2021 06:43:19 +0100 (CET)
Date: Fri, 19 Mar 2021 06:43:19 +0100
From: Christoph Hellwig <hch@lst.de>
To: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: remove the legacy ide driver
Message-ID: <20210319054319.GA9880@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
 <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 12:43:48PM +1100, Finn Thain wrote:
> A few months ago I wrote another patch to move some more platforms away 
> from macide but it has not been tested yet. That is not to say you should 
> wait. However, my patch does have some changes that are missing from your 
> patch series, relating to ide platform devices in arch/m68k/mac/config.c. 
> I hope to be able to test this patch before the 5.13 merge window closes.

Normally we do not remove drivers for hardware that is still used.  So
at leat for macide my plan was not to take it away unless the users 
are sufficiently happy.  Or in other words:  I think waiting it the
right choice, but hopefully we can make that wait as short as possible.
