Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7C909727
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 10:59:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PYbWvkuc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W1VSy6R0Kz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 18:59:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PYbWvkuc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W1JrP3Tvhz3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 11:45:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cmiivs9+4WenC6OP/1ZCnI/gkKg1dnHA0OIU4ZJ3byg=; b=PYbWvkucSg2aBQezLwmo+Qcd5e
	buXI3jXr9trafbVS5gAryDT/g51ZN2ZBHJAxUbhpaC2hB7zEs07wi7VegkBqFt449VYmSdHx7elSe
	WogNyhroF0DK54iaxAW50jWdlZDahTiZV5+Ls5WFRE8mrzX+a1Gce1UfgRgk+LFUxWnqraMHJ82U+
	fjuNuq9GYv6VpVV9TPpSg4O/DlYpC/xa6zQU7QS5onXdbc6AjTRUO7+Q+u9isTmIEj0KMnjFgqrDf
	ebusEVDAofzzEFgSzUfwc/6aFrS74znvLxdtqTdMPASh9jObHTMaQX2D8eISlHn4iq1vMo6HzZ/MT
	vTtCcWSw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIITp-0000000HUbB-2pKJ;
	Sat, 15 Jun 2024 01:45:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 38AF1300886; Sat, 15 Jun 2024 03:45:21 +0200 (CEST)
Date: Sat, 15 Jun 2024 03:45:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Message-ID: <20240615014521.GR8774@noisy.programming.kicks-ass.net>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
 <20240614092801.GL8774@noisy.programming.kicks-ass.net>
 <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
 <20240615012814.GP8774@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615012814.GP8774@noisy.programming.kicks-ass.net>
X-Mailman-Approved-At: Sat, 15 Jun 2024 18:57:30 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, sparclinux@vger.kernel.org, Mel Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Rik van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 15, 2024 at 03:28:14AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 14, 2024 at 12:48:37PM +0200, Vincent Guittot wrote:

> > The main problem is that need_resched becomes somewhat meaningless
> > because it doesn't  only mean "I need to resched a task" and we have
> > to add more tests around even for those not using polling
> 
> True, however we already had some of that by having the wakeup list,
> that made nr_running less 'reliable'.

Doesn't using !idle_cpu() instead of need_resched() in those balance
paths already do the right thing?

Checking need_resched() as an indicator of it getting work is already a
bit an assumption.

Also, Ingo, idle_cpu() and friends don't really belong in syscalls.c...
