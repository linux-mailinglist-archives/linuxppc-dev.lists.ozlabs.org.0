Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 248EE205F77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 22:37:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ryl14GZWzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 06:37:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=cgVqGLE1; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ryg05j59zDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 06:34:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zZ9ZwwPDMMp7BvMEq8EyOsJmlN/xF7BcziW3McexKPw=; b=cgVqGLE15DsOhKQPCCWADScd6J
 RjV//ZuVBYwgm/bNvaMm3QXBYNmo02AYWxJkY/2WaxgRPk7rP2wszqc18skOWnf/MqurHSMUWZQAu
 EEV1w0DUhNxOIX+qDNchE/AvrYT7BGdjTW+DgCATQM1ZpWT2NwwUPeJ/YXNtIBaxPwhP4cLwzuvRW
 Gy+Ii7D86w2z4wmNuMjEy5DOduGQXwWdsbVQEBv5Gu7qk46hYIANV8d9AMQh14vIwefWYyvUys2xL
 bcA9M8a+qokxiBquFfj0BbnW1Gaz89VK+nq6CMmgio7rvkbT3e1GTD2P56Y/J3TfIgxGjfUVkm2ZX
 qJKo60Cg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnpbZ-0004Bx-GE; Tue, 23 Jun 2020 20:33:18 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1EBD3983A87; Tue, 23 Jun 2020 22:33:17 +0200 (CEST)
Date: Tue, 23 Jun 2020 22:33:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200623203317.GG4496@worktop.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
 <20200623202404.GE2483@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623202404.GE2483@worktop.programming.kicks-ass.net>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, x86@kernel.org, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, davem@davemloft.net,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, tglx@linutronix.de, will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 10:24:04PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 08:12:32PM +0200, Peter Zijlstra wrote:
> > Fair enough; I'll rip it all up and boot a KCSAN kernel, see what if
> > anything happens.
> 
> OK, so the below patch doesn't seem to have any nasty recursion issues
> here. The only 'problem' is that lockdep now sees report_lock can cause
> deadlocks.
> 
> It is completely right about it too, but I don't suspect there's much we
> can do about it, it's pretty much the standard printk() with scheduler
> locks held report.

Just for giggles I added the below and that works fine too. Right until
the report_lock deadlock splat of course, thereafter lockdep is
disabled.

diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index ac5f8345bae9..a011cf0a1611 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -459,6 +459,8 @@ static void set_other_info_task_blocking(unsigned long *flags,
 	 */
 	int timeout = max(kcsan_udelay_task, kcsan_udelay_interrupt);

+	lockdep_assert_held(&report_lock);
+
 	other_info->task = current;
 	do {
 		if (is_running) {
@@ -495,6 +497,8 @@ static void set_other_info_task_blocking(unsigned long *flags,
 		 other_info->task == current);
 	if (is_running)
 		set_current_state(TASK_RUNNING);
+
+	lockdep_assert_held(&report_lock);
 }

 /* Populate @other_info; requires that the provided @other_info not in use. */
