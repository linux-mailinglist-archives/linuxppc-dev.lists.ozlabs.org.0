Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74C3C4B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 09:10:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NLjn5prPzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:10:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NLVT1VsdzDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 17:00:16 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5B6xssf032050;
 Tue, 11 Jun 2019 01:59:55 -0500
Message-ID: <b30ced162fa96d0ca63b8b9629d6fe9bc5c78746.camel@kernel.crashing.org>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 11 Jun 2019 16:59:54 +1000
In-Reply-To: <fdfc817d1dcdc83f5bc45f0ab12cbce0c61e6702.camel@kernel.crashing.org>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <7697a9d10777b28ae79fdffdde6d0985555f6310.camel@kernel.crashing.org>
 <3ed1ccfe-d7ca-11b9-17b3-303d1ae1bb0f@lwfinger.net>
 <c91ccbddd6a58dbee5705f10ed1d98fb44bd8f8d.camel@kernel.crashing.org>
 <20190611060816.GA20158@lst.de>
 <fdfc817d1dcdc83f5bc45f0ab12cbce0c61e6702.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-11 at 16:58 +1000, Benjamin Herrenschmidt wrote:
> On Tue, 2019-06-11 at 08:08 +0200, Christoph Hellwig wrote:
> > On Tue, Jun 11, 2019 at 03:56:33PM +1000, Benjamin Herrenschmidt
> > wrote:
> > > The reason I think it sort-of-mostly-worked is that to get more
> > > than
> > > 1GB of RAM, those machines use CONFIG_HIGHMEM. And *most* network
> > > buffers aren't allocated in Highmem.... so you got lucky.
> > > 
> > > That said, there is such as thing as no-copy send on network, so I
> > > wouldn't be surprised if some things would still have failed, just
> > > not
> > > frequent enough for you to notice.
> > 
> > Unless NETIF_F_HIGHDMA is set on a netdev, the core networkign code
> > will bounce buffer highmem pages for the driver under all
> > circumstances.
> 
>  ... which b43legacy doesn't set to the best of my knowledge ...
> 
> Which makes me wonder how come it didn't work even with your patches ?
> AFAIK, we have less than 1GB of lowmem unless the config has been
> tweaked....

Ah stupid me ... it's dma_set_mask that failed, since it has no idea
that the calling driver is limited to lowmem.

That's also why the "wrong" patch worked.

So yes, a ZONE_DMA at 30-bits will work, though it's somewhat overkill.

Cheers,
Ben.


