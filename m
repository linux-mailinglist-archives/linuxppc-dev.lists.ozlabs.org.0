Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D18515730
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 23:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqmKQ2PTjz3bpT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 07:46:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=NuAZTGtL;
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
 header.s=pandora-2019 header.b=NuAZTGtL; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqmJm4tdDz3bbL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 07:46:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cwWnO80Ui/d685UGUuBb6P6W/VqQxrK3NU0KyxunMME=; b=NuAZTGtLYYcfk4IaGz8kBTT5Di
 0khQT6RBBrfoMfADRQoh55tLUZAAxvGzbf+CHwsG5aHW/I0aPMt9IcQreT+TXN6tVft3fhHxppW6e
 0gRrhT6oZwWHTdNRt+hsETMwNeSqJUbKiJvdYcPS0Tel4JSlQtazcO1PKvgS3i7ssm2Wvg6CHs/7o
 pj47XlfT3VRnDJ1t48UzNo9OiptPRH+9FkqQXagZ6uncBzcJGMl/PQwNLpM91GK25wc70TaaRl3MI
 17OaYSYBFRj1A/+iiCNfQT0GNRF/9G3lza+liz2omEugL6i4QHflxUFmrjvLEVlv51bSj77G0/dOg
 tubfbwug==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58452)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nkYQk-0004ZT-FQ; Fri, 29 Apr 2022 22:45:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nkYQM-0002I9-Ul; Fri, 29 Apr 2022 22:45:14 +0100
Date: Fri, 29 Apr 2022 22:45:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 02/30] ARM: kexec: Disable IRQs/FIQs also on crash CPUs
 shutdown path
Message-ID: <Ymxcaqy6DwhoQrZT@shell.armlinux.org.uk>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-3-gpiccoli@igalia.com>
 <87mtg392fm.wl-maz@kernel.org>
 <71d829c4-b280-7d6e-647d-79a1baf9408b@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71d829c4-b280-7d6e-647d-79a1baf9408b@igalia.com>
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, dyoung@redhat.com, vgoyal@redhat.com,
 pmladek@suse.com, dave.hansen@linux.intel.com, keescook@chromium.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 rostedt@goodmis.org, rcu@vger.kernel.org, gregkh@linuxfoundation.org,
 bp@alien8.de, fabiomirmar@gmail.com, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 kernel@gpiccoli.net, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 29, 2022 at 06:38:19PM -0300, Guilherme G. Piccoli wrote:
> Thanks Marc and Michael for the review/discussion.
> 
> On 29/04/2022 15:20, Marc Zyngier wrote:
> > [...]
> 
> > My expectations would be that, since we're getting here using an IPI,
> > interrupts are already masked. So what reenabled them the first place?
> > 
> > Thanks,
> > 
> > 	M.
> > 
> 
> Marc, I did some investigation in the code (and tried/failed in the ARM
> documentation as well heh), but this is still not 100% clear for me.
> 
> You're saying IPI calls disable IRQs/FIQs by default in the the target
> CPUs? Where does it happen? I'm a bit confused if this a processor
> mechanism, or it's in code.

When we taken an IRQ, IRQs will be masked, FIQs will not. IPIs are
themselves interrupts, so IRQs will be masked while the IPI is being
processed. Therefore, there should be no need to re-disable the
already disabled interrupts.

> But crash_smp_send_stop() is different, it seems to IPI the other CPUs
> with the flag IPI_CALL_FUNC, which leads to calling
> generic_smp_call_function_interrupt() - does it disable interrupts/FIQs
> as well? I couldn't find it.

It's buried in the architecture behaviour. When the CPU takes an
interrupt and jumps to the interrupt vector in the vectors page, it is
architecturally defined that interrupts will be disabled. If they
weren't architecturally disabled at this point, then as soon as the
first instruction is processed (at the interrupt vector, likely a
branch) the CPU would immediately take another jump to the interrupt
vector, and this process would continue indefinitely, making interrupt
handling utterly useless.

So, you won't find an explicit instruction in the code path from the
vectors to the IPI handler that disables interrupts - because it's
written into the architecture that this is what must happen.

IRQs are a lower priority than FIQs, so FIQs remain unmasked.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
