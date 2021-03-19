Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D37341248
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 02:49:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1mzF13srz3c2S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:49:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 315 seconds by postgrey-1.36 at boromir;
 Fri, 19 Mar 2021 12:49:12 AEDT
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F1myw1sRDz2yZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 12:49:12 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id A6CA429ECE;
 Thu, 18 Mar 2021 21:43:47 -0400 (EDT)
Date: Fri, 19 Mar 2021 12:43:48 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the legacy ide driver
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
Message-ID: <c1fa8e6-a05d-9ea1-f47e-9e85ea6ea65e@telegraphics.com.au>
References: <20210318045706.200458-1-hch@lst.de>
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

On Thu, 18 Mar 2021, Christoph Hellwig wrote:

> Hi all,
> 
> we've been trying to get rid of the legacy ide driver for a while now,
> and finally scheduled a removal for 2021, which is three month old now.
> 
> In general distros and most defconfigs have switched to libata long ago,
> but there are a few exceptions.  This series first switches over all
> remaining defconfigs to use libata and then removes the legacy ide
> driver.
> 
> libata mostly covers all hardware supported by the legacy ide driver.
> There are three mips drivers that are not supported, but the linux-mips
> list could not identify any users of those.  There also are two m68k
> drivers that do not have libata equivalents, which might or might not
> have users, so we'll need some input and possibly help from the m68k
> community here.
> 

A few months ago I wrote another patch to move some more platforms away 
from macide but it has not been tested yet. That is not to say you should 
wait. However, my patch does have some changes that are missing from your 
patch series, relating to ide platform devices in arch/m68k/mac/config.c. 
I hope to be able to test this patch before the 5.13 merge window closes.
