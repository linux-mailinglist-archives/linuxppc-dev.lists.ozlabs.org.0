Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE95484D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 13:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM8Z707Zcz3fHS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 21:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=AYS6grJV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=AYS6grJV;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM4nd4vySz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 18:42:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TBu1hM1Fbte1hrb329bc3ivTNLPSxYZoE9gYu5eRiHg=; b=AYS6grJVD8NMmpEvSXoRmqR/m5
	NEo85wVpnYAfEDlJuO/EUebdXwmtGi7E1hfXWnzD4xJRKZ83szCruTMmPOs7xBMJ6Aw1UFgllIdA2
	DrNCgkjyxwSlCkaYvmrnpeyVHjsekjBUo+W+kPzFmB2XaZh0Vpc97VCHNs1UCeL3PGYHI9qxJxVu/
	DaFylVxmC0fZNsBkd3ExUz+u7t35uoUT8AamFGd6WJIWdTb36E6JQrKM1QWtIzoeKjuNFK4QcGaGj
	jl+nLLuCaTmbWLVhpIZJqu3xqI2+WRMTvXP48+Wg/el92i2X48vydvI85ds5VF4NfA6ZUW+2+coel
	hUXUv0FQ==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0fdb-00Gf1z-43; Mon, 13 Jun 2022 08:41:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 600BB300472;
	Mon, 13 Jun 2022 10:41:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 42FA02849859B; Mon, 13 Jun 2022 10:41:27 +0200 (CEST)
Date: Mon, 13 Jun 2022 10:41:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH 21/36] x86/tdx: Remove TDX_HCALL_ISSUE_STI
Message-ID: <Yqb4N3iwh1X7378o@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.251109029@infradead.org>
 <CAJhGHyCnu_BsKf5STMMJKMWm0NVZ8qXT8Qh=BhhCjSSgwchL3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJhGHyCnu_BsKf5STMMJKMWm0NVZ8qXT8Qh=BhhCjSSgwchL3Q@mail.gmail.com>
X-Mailman-Approved-At: Mon, 13 Jun 2022 21:27:22 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, Huacai Chen <chenhuacai@kernel.org>, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme <acme@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, Richard Henderson <rth@twiddle.net>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kern
 el.org, Dave Hansen <dave.hansen@linux.intel.com>, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, Alexander Shishkin <alexander.shishkin@linux.intel.com>, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrov
 sky@oracle.com>, khilman@kernel.org, linux-csky@vger.

kernel.org, VMware Inc <pv-drivers@vmware.com>, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>, linux@armlinux.org.uk, Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, paulmck@ker
 nel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org, Juergen Gross <jgross@suse.com>, monstr@monstr.eu, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, ink@jurassic.park.msu.ru, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 13, 2022 at 04:26:01PM +0800, Lai Jiangshan wrote:
> On Wed, Jun 8, 2022 at 10:48 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Now that arch_cpu_idle() is expected to return with IRQs disabled,
> > avoid the useless STI/CLI dance.
> >
> > Per the specs this is supposed to work, but nobody has yet relied up
> > this behaviour so broken implementations are possible.
> 
> I'm totally newbie here.
> 
> The point of safe_halt() is that STI must be used and be used
> directly before HLT to enable IRQ during the halting and stop
> the halting if there is any IRQ.

Correct; on real hardware. But this is virt...

> In TDX case, STI must be used directly before the hypercall.
> Otherwise, no IRQ can come and the vcpu would be stalled forever.
> 
> Although the hypercall has an "irq_disabled" argument.
> But the hypervisor doesn't (and can't) touch the IRQ flags no matter
> what the "irq_disabled" argument is.  The IRQ is not enabled during
> the halting if the IRQ is disabled before the hypercall even if
> irq_disabled=false.

All we need the VMM to do is wake the vCPU, and it can do that,
irrespective of the guest's IF.

So the VMM can (and does) know if there's an interrupt pending, and
that's all that's needed to wake from this hypercall. Once the vCPU is
back up and running again, we'll eventually set IF again and the pending
interrupt will get delivered and all's well.

Think of this like MWAIT with ECX[0] set if you will.
