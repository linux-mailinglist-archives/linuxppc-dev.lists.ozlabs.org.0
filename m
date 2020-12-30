Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C332E779E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 11:02:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5Rff5lsrzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 21:02:34 +1100 (AEDT)
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
 header.s=pandora-2019 header.b=p2p0MbfK; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5Rcl2XywzDqGn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Dec 2020 21:00:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RLGcTHha1iBi5RnrUOHhCpmRRdZbNNy9N9/LhkhCawU=; b=p2p0MbfKm1c8qLl/oYqAdf1c5
 NSwPA81w4cjPSXGUfrJlixIAMI1qiuQ7JBKa9c5vBh4YgHdF0Jl+25BUYsCjR0frTf+ZCFe2U4LXA
 dPkGzPHZHMTMAbMr0rdcSUFc44dMCYe763lJr/QUsH4+0HztLsn3Mjq68nAJQMyuTict5YCIztQzI
 n6s+eLub2njYRmf+cXWAP4agnwvAjzJYz0xYFSrMDd/o9ZbURf5A95R8hC7HTrd+iP5UnwJDv+b98
 3djV2uepw2kuTFjy5+kUg2ogjoiIwI7jdLtlQ7Vt2c5/VPzEVR1Z68PxpY1/p4sFkU2xtuRUu/Sz5
 1tzF0cYVg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44902)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kuYHP-0005bt-HE; Wed, 30 Dec 2020 10:00:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kuYHM-00026D-M2; Wed, 30 Dec 2020 10:00:28 +0000
Date: Wed, 30 Dec 2020 10:00:28 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Message-ID: <20201230100028.GP1551@shell.armlinux.org.uk>
References: <CAG48ez0YZ_iy6qZpdGUj38wqeg_NzLHHhU-mBCBf5hcopYGVPg@mail.gmail.com>
 <20201228190852.GI1551@shell.armlinux.org.uk>
 <CALCETrVpvrBufrJgXNY=ogtZQLo7zgxQmD7k9eVCFjcdcvarmA@mail.gmail.com>
 <1086654515.3607.1609187556216.JavaMail.zimbra@efficios.com>
 <CALCETrXx3Xe+4Y6WM-mp0cTUU=r3bW6PV2b25yA8bm1Gvak6wQ@mail.gmail.com>
 <1609200902.me5niwm2t6.astroid@bobo.none>
 <CALCETrX6MOqmN5_jhyO1jJB7M3_T+hbomjxPYZLJmLVNmXAVzA@mail.gmail.com>
 <1609210162.4d8dqilke6.astroid@bobo.none>
 <20201229104456.GK1551@shell.armlinux.org.uk>
 <1609290821.wrfh89v23a.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1609290821.wrfh89v23a.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, paulmck <paulmck@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 30, 2020 at 12:33:02PM +1000, Nicholas Piggin wrote:
> Excerpts from Russell King - ARM Linux admin's message of December 29, 2020 8:44 pm:
> > On Tue, Dec 29, 2020 at 01:09:12PM +1000, Nicholas Piggin wrote:
> >> I think it should certainly be documented in terms of what guarantees
> >> it provides to application, _not_ the kinds of instructions it may or
> >> may not induce the core to execute. And if existing API can't be
> >> re-documented sanely, then deprecatd and new ones added that DTRT.
> >> Possibly under a new system call, if arch's like ARM want a range
> >> flush and we don't want to expand the multiplexing behaviour of
> >> membarrier even more (sigh).
> > 
> > The 32-bit ARM sys_cacheflush() is there only to support self-modifying
> > code, and takes whatever actions are necessary to support that.
> > Exactly what actions it takes are cache implementation specific, and
> > should be of no concern to the caller, but the underlying thing is...
> > it's to support self-modifying code.
> 
>    Caveat
>        cacheflush()  should  not  be used in programs intended to be portable.
>        On Linux, this call first appeared on the MIPS architecture, but  nowa‐
>        days, Linux provides a cacheflush() system call on some other architec‐
>        tures, but with different arguments.
> 
> What a disaster. Another badly designed interface, although it didn't 
> originate in Linux it sounds like we weren't to be outdone so
> we messed it up even worse.
> 
> flushing caches is neither necessary nor sufficient for code modification
> on many processors. Maybe some old MIPS specific private thing was fine,
> but certainly before it grew to other architectures, somebody should 
> have thought for more than 2 minutes about it. Sigh.

WARNING: You are bordering on being objectionable and offensive with
that comment.

The ARM interface was designed by me back in the very early days of
Linux, probably while you were still in dypers, based on what was
known at the time.  Back in the early 2000s, ideas such as relaxed
memory ordering were not known.  All there was was one level of
harvard cache.

So, juts shut up with your insults.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
