Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 430473B449A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 15:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBJ0d6kxxz3bwP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 23:35:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=xyD1AXSp;
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
 header.s=pandora-2019 header.b=xyD1AXSp; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (unknown
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBJ046WJLz3brt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 23:34:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ze0cDzN8bUMWNAl+8iRscpck4qNLSArRApI/uLhLSvA=; b=xyD1AXSpkRsKpDvRdFL6DY1wE
 QdnGUr1a/XUiGlKDRfbCdxgTTbwOlcFRtBWTFDGFW/VXc0gpsbyO1rqTIQJX94k0OSyGr2p8oEueK
 AChEsxADklDoe1x1iN0Oaoeyg6WjvdGQT23zJAe2jQE0E6SEnZce7R+9uySj37XfucJP00XsJ2ejY
 oPAywWjYsv1iDHwhJI7YAN6gFAIQpEtBdrwfcyfbNOONqBIQVwP2ZTCPBolPyBU4/1htPwptfcZ9u
 bj3DyTr5VvLmC163GIPZYgZpZ2VXBG9ILmC2uUvFfNCj3p8af1GQX/3yW1wpeMiR3HETaiO9NUoe8
 9JBmyjlyA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45352)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lwlyY-0000mV-Hr; Fri, 25 Jun 2021 14:34:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lwlyT-0006iE-6d; Fri, 25 Jun 2021 14:34:25 +0100
Date: Fri, 25 Jun 2021 14:34:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v3 4/6] printk: remove NMI tracking
Message-ID: <20210625133425.GX22278@shell.armlinux.org.uk>
References: <20210624111148.5190-1-john.ogness@linutronix.de>
 <20210624111148.5190-5-john.ogness@linutronix.de>
 <YNXNx68CXrI9QpHD@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNXNx68CXrI9QpHD@alley>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 25, 2021 at 02:36:23PM +0200, Petr Mladek wrote:
> On Thu 2021-06-24 13:17:46, John Ogness wrote:
> > All NMI contexts are handled the same as the safe context: store the
> > message and defer printing. There is no need to have special NMI
> > context tracking for this. Using in_nmi() is enough.
> > 
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > ---
> >  arch/arm/kernel/smp.c       |  2 --
> >  arch/powerpc/kexec/crash.c  |  3 ---
> >  include/linux/hardirq.h     |  2 --
> >  include/linux/printk.h      | 12 ------------
> >  init/Kconfig                |  5 -----
> >  kernel/printk/internal.h    |  6 ------
> >  kernel/printk/printk_safe.c | 37 +------------------------------------
> >  kernel/trace/trace.c        |  2 --
> >  8 files changed, 1 insertion(+), 68 deletions(-)
> > 
> > diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> > index 74679240a9d8..0dd2d733ad62 100644
> > --- a/arch/arm/kernel/smp.c
> > +++ b/arch/arm/kernel/smp.c
> > @@ -668,9 +668,7 @@ static void do_handle_IPI(int ipinr)
> >  		break;
> >  
> >  	case IPI_CPU_BACKTRACE:
> > -		printk_nmi_enter();
> >  		nmi_cpu_backtrace(get_irq_regs());
> > -		printk_nmi_exit();
> 
> It looks to me that in_nmi() returns false here. As a result,
> nmi_cpu_backtrace() might newly call consoles immediately.
> 
> If I recall correctly, arm does not have a proper NMI.
> And this is just some special case of a "normal" IRQ.
> 
> And indeed, nmi_enter() is called only from handle_fiq_as_nmi()
> and it is just a boiler plate.
> 
> If I am right, we should replace printk_nmi_enter() with
> printk_safe_enter_irqsave(flags) or so.
> 
> Even better solution might be to call this within
> nmi_enter()/nmi_exit(). But I am not sure if this is what
> the arm people want.

As I seem to recall, the guy in ARM Ltd who was working on this seemed
to drift away and it never got finished - however, I've always carried
platform specific hacks in my tree to make this work from FIQ on the
platforms I cared about:

http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=fiq

Not suitable for mainline like that. I'm not aware of anyone working on
it now.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
