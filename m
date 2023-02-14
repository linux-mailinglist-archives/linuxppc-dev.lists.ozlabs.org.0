Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D2697064
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 23:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGZvz40BYz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 09:03:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=gOWkVHN6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=gOWkVHN6;
	dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGZv26GZYz3bZj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 09:02:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZAoS9GAPCjvcD2e9rjRkdzaMQfoBwDvlSDrbpklXNtw=; b=gOWkVHN6VrFdTRZ3tkfzExyMX5
	iJG3T+SC9IXbxn90Fbaz8qafSZ2cSWCKJIfE8M6lrpaFk6i6pbMJcmCesDgK+0V1ZlSkpV3lpLQvt
	6t3as6FVzUgvCdry0d05aVbpoyawUPAWWKEqHsdUd51LfdMnUdvaseupK9S0TyD3aRX25kRmEaruc
	EDzNZOFM6e6s8/SHUq+zLrY0bXzYJpc9f4y5Cy3NTRq9ku5n9kEMzAqA4jLJe3H8GReXifQoT0YuX
	GYQEQY1P5tctvQOGyUvJ+7gLiMHs9z3IdsrOcbX7CJOmYcb6RVPKTGGR+IyKtzcy3IDf7PHmpL/Fz
	TKUvgqew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59692)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pS3Ms-00064U-Fz; Tue, 14 Feb 2023 22:01:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pS3Mf-0004Fv-KA; Tue, 14 Feb 2023 22:01:29 +0000
Date: Tue, 14 Feb 2023 22:01:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v2 03/24] arm/cpu: Make sure arch_cpu_idle_dead() doesn't
 return
Message-ID: <Y+wEubLjgDQDIbSO@shell.armlinux.org.uk>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
 <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
 <20230214183926.46trlpdror3v5sk5@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214183926.46trlpdror3v5sk5@treble>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kernel@vger.kernel.org, lin
 ux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 10:39:26AM -0800, Josh Poimboeuf wrote:
> On Tue, Feb 14, 2023 at 11:15:23AM +0000, Russell King (Oracle) wrote:
> > On Mon, Feb 13, 2023 at 11:05:37PM -0800, Josh Poimboeuf wrote:
> > > arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> > > BUG().
> > > 
> > > BUG() is preferable to unreachable() because BUG() is a more explicit
> > > failure mode and avoids undefined behavior like falling off the edge of
> > > the function into whatever code happens to be next.
> > 
> > This is silly. Just mark the function __noreturn and be done with it.
> > If the CPU ever executes code past the "b" instruction, it's already
> > really broken that the extra instructions that BUG() gives will be
> > meaningless.
> > 
> > This patch does nothing except add yet more bloat the kernel.
> > 
> > Sorry, but NAK.
> 
> Problem is, the compiler can't read inline asm.  So you'd get a 
> "'noreturn' function does return" warning.
> 
> We can do an unreachable() instead of a BUG() here if you prefer
> undefined behavior.

That's fine.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
