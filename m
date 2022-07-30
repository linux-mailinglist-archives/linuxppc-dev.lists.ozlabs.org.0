Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87C585A5E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jul 2022 14:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lw3Fy0fYVz2y28
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jul 2022 22:13:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" header.d=lespinasse.org header.i=@lespinasse.org header.a=ed25519-sha256 header.s=srv-79-ed header.b=x/Ziq42G;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=lespinasse.org header.i=@lespinasse.org header.a=rsa-sha256 header.s=srv-79-rsa header.b=xjlyRJ2P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lespinasse.org (client-ip=63.205.204.226; helo=server.lespinasse.org; envelope-from=michel@lespinasse.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass header.d=lespinasse.org header.i=@lespinasse.org header.a=ed25519-sha256 header.s=srv-79-ed header.b=x/Ziq42G;
	dkim=pass (2048-bit key; secure) header.d=lespinasse.org header.i=@lespinasse.org header.a=rsa-sha256 header.s=srv-79-rsa header.b=xjlyRJ2P;
	dkim-atps=neutral
Received: from server.lespinasse.org (server.lespinasse.org [63.205.204.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lvzs25xPxz2xHf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jul 2022 19:40:38 +1000 (AEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=lespinasse.org; i=@lespinasse.org; q=dns/txt; s=srv-79-ed;
 t=1659174032; h=date : from : to : cc : subject : message-id :
 references : mime-version : content-type : in-reply-to : from;
 bh=weCa4etYCrU0JKpJO/Ui+2clGa/1cbP+1Ce8uxB4Z2U=;
 b=x/Ziq42GBYdLObjVTEjRxMr42JGNj1S6ikUonHkCSS9+QUAEIEusirhrUb1NLAhWCN9I/
 26gXmKmVFCvOvm8Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lespinasse.org;
 i=@lespinasse.org; q=dns/txt; s=srv-79-rsa; t=1659174032; h=date :
 from : to : cc : subject : message-id : references : mime-version :
 content-type : in-reply-to : from;
 bh=weCa4etYCrU0JKpJO/Ui+2clGa/1cbP+1Ce8uxB4Z2U=;
 b=xjlyRJ2PLCvlHddIpET9xkdQ9b2YJIlAuRmqVD4Zi9LYcfMqzgs3mU4rkm/FKHLXNUOaJ
 LyyP89/nFeA6CHdOEfvoMWe+2hvIc5qWIl7OAgthzIj8J1BY1lyEpfvyFmhVmffdeRhfjdo
 vMuxuuddA8OZu54a34mTh9dLsyNfUY1VEPbkQXmB5bXD5tY51a2x0Dy7lPzCrgrdbPY9jea
 g6bR8AptJZSZjsf3hgGuxahRdvKbF0nVgvjROX7b4fAX0R64UDLs/zIoRFldyB9Yfr1EawK
 tm9ki9L5Z6WkfftzLymxjgxhP/KXmf4WU+QM/fsd13mCq3dze1SIRx1wUOGA==
Received: by server.lespinasse.org (Postfix, from userid 1000)
	id 1452116096D; Sat, 30 Jul 2022 02:40:32 -0700 (PDT)
Date: Sat, 30 Jul 2022 02:40:32 -0700
From: Michel Lespinasse <michel@lespinasse.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220730094032.GA1587@lespinasse.org>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.172460444@infradead.org>
 <20220725194306.GA14746@lespinasse.org>
 <20220728172053.GA3607379@paulmck-ThinkPad-P17-Gen-1>
 <20220729102458.GA1695@lespinasse.org>
 <20220729152622.GM2860372@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729152622.GM2860372@paulmck-ThinkPad-P17-Gen-1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 30 Jul 2022 22:13:28 +1000
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
Cc: Michel Lespinasse <michel@lespinasse.org>, juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
  dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, rh0@fb.com, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, josh@joshtriplett.org, khilman@kernel.org, li
 nux-csky@vger.kernel.org, tony@atomide.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, yury.norov@gmail.com, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, monstr@monstr.eu, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, Peter Zijlstra <peterz@infradead.org>, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, Arnd Bergmann <arnd@arndb.de>, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy
 .shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, pv-drivers@vmware.com, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 29, 2022 at 08:26:22AM -0700, Paul E. McKenney wrote:> Would you be willing to try another shot in the dark, but untested
> this time?  I freely admit that this is getting strange.
> 
> 							Thanx, Paul

Yes, adding this second change got rid of the boot time warning for me.

> ------------------------------------------------------------------------
> 
> diff --git a/kernel/sched/clock.c b/kernel/sched/clock.c
> index e374c0c923dae..279f557bf60bb 100644
> --- a/kernel/sched/clock.c
> +++ b/kernel/sched/clock.c
> @@ -394,7 +394,7 @@ notrace void sched_clock_tick(void)
>  	if (!static_branch_likely(&sched_clock_running))
>  		return;
>  
> -	lockdep_assert_irqs_disabled();
> +	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !raw_irqs_disabled());
>  
>  	scd = this_scd();
>  	__scd_stamp(scd);
