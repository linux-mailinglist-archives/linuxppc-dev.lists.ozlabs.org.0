Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 034053C3B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 07:58:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NK721h57zDqW7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 15:58:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NK5F12XgzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 15:56:48 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5B5uXlu029265;
 Tue, 11 Jun 2019 00:56:34 -0500
Message-ID: <c91ccbddd6a58dbee5705f10ed1d98fb44bd8f8d.camel@kernel.crashing.org>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Larry Finger <Larry.Finger@lwfinger.net>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Christoph Hellwig <hch@lst.de>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 11 Jun 2019 15:56:33 +1000
In-Reply-To: <3ed1ccfe-d7ca-11b9-17b3-303d1ae1bb0f@lwfinger.net>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <7697a9d10777b28ae79fdffdde6d0985555f6310.camel@kernel.crashing.org>
 <3ed1ccfe-d7ca-11b9-17b3-303d1ae1bb0f@lwfinger.net>
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
Cc: linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-06-10 at 13:44 -0500, Larry Finger wrote:
> On 6/7/19 11:21 PM, Benjamin Herrenschmidt wrote:
> > 
> > > Please try the attached patch. I'm not really pleased with it and I will
> > > continue to determine why the fallback to a 30-bit mask fails, but at least this
> > > one works for me.
> > 
> > Your patch only makes sense if the device is indeed capable of
> > addressing 31-bits.
> > 
> > So either the driver is buggy and asks for a too small mask in which
> > case your patch is ok, or it's not and you're just going to cause all
> > sort of interesting random problems including possible memory
> > corruption.
> 
> Of course the driver may be buggy, but it asks for the correct mask.
> 
> This particular device is not capable of handling 32-bit DMA. The driver detects 
> the 32-bit failure and falls back to 30 bits. It works on x86, and did on PPC32 
> until 5.1. As Christoph said, it should always be possible to use fewer bits 
> than the maximum.

No, I don't think it *worked* on ppc32 before Christoph patch. I think
it "mostly sort-of worked" :-)

The reason I'm saying that is if your system has more than 1GB of RAM,
then you'll have chunks of memory that the device simply cannot
address.

Before Christoph patches, we had no ZONE_DMA or ZONE_DMA32 covering the
30-bit limited space, so any memory allocation could in theory land
above 30-bits, causing all sort of horrible things to happen with that
driver.

The reason I think it sort-of-mostly-worked is that to get more than
1GB of RAM, those machines use CONFIG_HIGHMEM. And *most* network
buffers aren't allocated in Highmem.... so you got lucky.

That said, there is such as thing as no-copy send on network, so I
wouldn't be surprised if some things would still have failed, just not
frequent enough for you to notice.

> Similar devices that are new enough to use b43 rather than b43legacy work with 
> new kernels; however, they have and use 32-bit DMA.

Cheres,
Ben.


