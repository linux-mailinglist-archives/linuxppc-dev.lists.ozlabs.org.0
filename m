Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9A3460E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 15:03:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Y4m2lb0z30NB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 01:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=X+JdXLoQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=X+JdXLoQ; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Y4L1nDVz30FF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 01:03:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N2uCmQ8vi2Ep5UQ3oogYPNPYrv32/jec/EyUkk8lTs8=; b=X+JdXLoQWsdpRf+AXi8/3tUI/
 jXnKmRfCxmqfZ3epNEm5hZd6PTJjrEfchsuMTTlqSuqlwy6qnEC631sY4eZU+osiWuHRhcxdwfmBD
 EcYvmwvWC1bY3+5djEQq4uPoU/zCK3YUQHS/90ljVFZtIVLjCNXfSahRqSQjUFj/aqr7rUZvqKCg4
 nAFII9fQW+Yo8eMKfe/x8Vh7CDPqW0zVh4L6fCzsTfFC91VsLLsN1Nuepys1ybTCHaDv7p6juNvev
 jSWu7nxKgl0Rmv4lCgJG2fgIHHEpOcy5Vg45Bw0aV7bKbBtPXM47Pr9bcIU6ymZXkeYIVCo3YUFhi
 YIUU7TlWA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51628)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lOhcg-0007nq-TU; Tue, 23 Mar 2021 14:03:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lOhcd-0004D5-LA; Tue, 23 Mar 2021 14:03:03 +0000
Date: Tue, 23 Mar 2021 14:03:03 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Message-ID: <20210323140303.GD1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de>
 <20210322151503.GX1463@shell.armlinux.org.uk>
 <20210322151823.GA2764@lst.de> <20210322153314.GA3440@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322153314.GA3440@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 22, 2021 at 04:33:14PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 22, 2021 at 04:18:23PM +0100, Christoph Hellwig wrote:
> > On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin wrote:
> > > It gets worse than that though - due to a change to remove
> > > pcibios_min_io from the generic code, moving it into the ARM
> > > architecture code, this has caused a regression that prevents the
> > > legacy resources being registered against the bus resource. So even
> > > if they are there, they cause probe failures. I haven't found a
> > > reasonable way to solve this yet, but until there is, there is no
> > > way that the PATA driver can be used as the "legacy mode" support
> > > is effectively done via the PCI code assigning virtual IO port
> > > resources.
> > > 
> > > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > > asked for a lspci for that last week but nothing has yet been
> > > forthcoming from whoever responded to your patch for Alpha - so I
> > > can't compare what I'm seeing with what's happening with Alpha.
> > 
> > That sounds like something we could fix with a quirk for function 2
> > in the PCI resource assignment code.  Can you show what vendor and
> > device ID function 2 has so that I could try to come up with one?
> 
> Something like this:

That solves the problem for the IDE driver, which knows how to deal
with legacy mode, but not the PATA driver, which doesn't. The PATA
driver needs these resources.

As I say, having these resources presents a problem on ARM. A previous
commit (3c5d1699887b) changed the way the bus resources are setup which
results in /proc/ioports containing:

00000000-0000000f : dma1
00000020-0000003f : pic1
00000060-0000006f : i8042
00000070-00000073 : rtc_cmos
  00000070-00000073 : rtc0
00000080-0000008f : dma low page
000000a0-000000bf : pic2
000000c0-000000df : dma2
00000213-00000213 : ISAPnP
000002f8-000002ff : serial8250.0
  000002f8-000002ff : serial
000003c0-000003df : vga+
000003f8-000003ff : serial8250.0
  000003f8-000003ff : serial
00000480-0000048f : dma high page
00000a79-00000a79 : isapnp write
00001000-0000ffff : PCI0 I/O
  00001000-0000107f : 0000:00:08.0
    00001000-0000107f : 3c59x
  00001080-0000108f : 0000:00:06.1
  00001090-0000109f : 0000:00:07.0
    00001090-0000109f : pata_it821x
  000010a0-000010a7 : 0000:00:07.0
    000010a0-000010a7 : pata_it821x
  000010a8-000010af : 0000:00:07.0
    000010a8-000010af : pata_it821x
  000010b0-000010b3 : 0000:00:07.0
    000010b0-000010b3 : pata_it821x
  000010b4-000010b7 : 0000:00:07.0
    000010b4-000010b7 : pata_it821x

The "PCI0 I/O" resource is the bus level resource, and the legacy
resources can not be claimed against that.

Without these resources, the PATA cypress driver doesn't work.

As I said previously, the reason this regression was not picked up
earlier is because I don't upgrade the kernel on this machine very
often; the machine has had uptimes into thousands of days.

I need to try reverting Rob's commit to find out if anything breaks
on this platform - it's completely wrong from a technical point of
view for any case where we have a PCI southbridge, since the
southbridge provides ISA based resources. I'm not entirely sure
what the point of it was, since we still have the PCIBIOS_MIN_IO
macro which still uses pcibios_min_io.

I'm looking at some of the other changes Rob made back at that time
which also look wrong, such as 8ef6e6201b26 which has the effect of
locating the 21285 IO resources to PCI address 0, over the top of
the ISA southbridge resources. I've no idea what Rob was thinking
when he removed the csrio allocation code in that commit, but
looking at it to day, it's soo obviously wrong even to a casual
glance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
