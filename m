Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD46342A4A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 05:05:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2Rxc42Spz3c0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 15:05:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=orcam.me.uk
 (client-ip=2001:4190:8020::4; helo=angie.orcam.me.uk;
 envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
X-Greylist: delayed 100339 seconds by postgrey-1.36 at boromir;
 Sat, 20 Mar 2021 15:05:07 AEDT
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F2RxH0qkFz2yYp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 15:05:05 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id BAA7A92009C; Sat, 20 Mar 2021 05:04:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id AC6A092009B;
 Sat, 20 Mar 2021 05:04:57 +0100 (CET)
Date: Sat, 20 Mar 2021 05:04:57 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/10] ide: remove the legacy ide driver
In-Reply-To: <alpine.DEB.2.21.2103200425360.21463@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2103200455410.21463@angie.orcam.me.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-11-hch@lst.de>
 <alpine.DEB.2.21.2103200425360.21463@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021, Maciej W. Rozycki wrote:

> > been scheduled for removal for a while.  Finally kill it off so that we
> > can start cleaning up various bits of cruft it forced on the block layer.
> 
>  You need to adjust Documentation/admin-guide/kernel-parameters.txt too, 
> i.e. remove all the `ide*' options, possibly more (I haven't checked in 
> detail).

 And also Documentation/ide/ide.rst.  Also do we have all the necessary 
`hdparm' features supported in libata nowadays for PATA devices?

  Maciej
