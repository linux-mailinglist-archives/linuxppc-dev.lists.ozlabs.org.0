Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489B2E69AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 18:25:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4PZ45SThzDqBx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 04:25:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=wIixOSh8; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4PXF5tG1zDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 04:23:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WcE43Fgn3spFCZPvKJxx0LNE1rDojIXPuwxkq9VZjMs=; b=wIixOSh8cQ511bYlN+QRGms/S
 nlAdDjkMveRiuMhD8mhh0CeW0NehL/0Dn8mod9w5LwgJBucUnFdHoghh7ceGJoQy7c4Z20Mroq+fS
 IGvKjERhnM1xpUPmR2Cxb7eLcKb48q05lZjPSGJ+x0/rDDVZ08MH8CCYXgRelrxMkV5zLd0v7/fQI
 iJcLMDF0e6ykoNh+LFQdipAHqMu/H4YidcAg+cJ/nIcjd6vn+z5IAFK4kAFzGZTAsObU5HobbUiqK
 WubJHS8RCrt33xk81kIhCbo4WlQyAxWnn7VbU1Too9U9QmcVOb4Ro6PZng6ArUiliRak7h23kn2ra
 YEDMUb5Mw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44606)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ktwEa-0004aV-K5; Mon, 28 Dec 2020 17:23:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ktwEX-0000RT-6Y; Mon, 28 Dec 2020 17:23:01 +0000
Date: Mon, 28 Dec 2020 17:23:01 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Message-ID: <20201228172301.GH1551@shell.armlinux.org.uk>
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1836294649.3345.1609100294833.JavaMail.zimbra@efficios.com>
 <CALCETrVdcn2r2Jvd1=-bM=FQ8KbX4aH-v4ytdojL7r7Nb6k8YQ@mail.gmail.com>
 <20201228102537.GG1551@shell.armlinux.org.uk>
 <CALCETrWQx0qwthBc5pJBxs2PWAQo-roAz-6g=7HOs+dsiokVsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrWQx0qwthBc5pJBxs2PWAQo-roAz-6g=7HOs+dsiokVsg@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 stable <stable@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 28, 2020 at 09:14:23AM -0800, Andy Lutomirski wrote:
> On Mon, Dec 28, 2020 at 2:25 AM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Sun, Dec 27, 2020 at 01:36:13PM -0800, Andy Lutomirski wrote:
> > > On Sun, Dec 27, 2020 at 12:18 PM Mathieu Desnoyers
> > > <mathieu.desnoyers@efficios.com> wrote:
> > > >
> > > > ----- On Dec 27, 2020, at 1:28 PM, Andy Lutomirski luto@kernel.org wrote:
> > > >
> > >
> > > > >
> > > > > I admit that I'm rather surprised that the code worked at all on arm64,
> > > > > and I'm suspicious that it has never been very well tested.  My apologies
> > > > > for not reviewing this more carefully in the first place.
> > > >
> > > > Please refer to Documentation/features/sched/membarrier-sync-core/arch-support.txt
> > > >
> > > > It clearly states that only arm, arm64, powerpc and x86 support the membarrier
> > > > sync core feature as of now:
> > >
> > > Sigh, I missed arm (32).  Russell or ARM folks, what's the right
> > > incantation to make the CPU notice instruction changes initiated by
> > > other cores on 32-bit ARM?
> >
> > You need to call flush_icache_range(), since the changes need to be
> > flushed from the data cache to the point of unification (of the Harvard
> > I and D), and the instruction cache needs to be invalidated so it can
> > then see those updated instructions. This will also take care of the
> > necessary barriers that the CPU requires for you.
> 
> With what parameters?   From looking at the header, this is for the
> case in which the kernel writes some memory and then intends to
> execute it.  That's not what membarrier() does at all.  membarrier()
> works like this:

You didn't specify that you weren't looking at kernel memory.

If you're talking about userspace, then the interface you require
is flush_icache_user_range(), which does the same as
flush_icache_range() but takes userspace addresses. Note that this
requires that the memory is currently mapped at those userspace
addresses.

If that doesn't fit your needs, there isn't an interface to do what
you require, and it basically means creating something brand new
on every architecture.

What you are asking for is not "just a matter of a few instructions".
I have stated the required steps to achieve what you require above;
that is the minimum when you have non-snooping harvard caches, which
the majority of 32-bit ARMs have.

> User thread 1:
> 
> write to RWX memory *or* write to an RW alias of an X region.
> membarrier(...);
> somehow tell thread 2 that we're ready (with a store release, perhaps,
> or even just a relaxed store.)
> 
> User thread 2:
> 
> wait for the indication from thread 1.
> barrier();
> jump to the code.
> 
> membarrier() is, for better or for worse, not given a range of addresses.

Then, I'm sorry, it can't work on 32-bit ARM.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
