Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519266D986F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 15:39:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsjK50svZz3fRl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 23:39:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ayo4gvUW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ayo4gvUW;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsjJF20BWz3fDd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 23:38:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rsfbSrxkyNUKnA+3L2zt42sf6Zqq9lCcgt0uWjy7k60=; b=Ayo4gvUWmcUkBURpVFBSM+eYhV
	l7P2VtXOZBB6jb1wtuH+SdKdAItVAe+kMpSzp3YHtSIOle0g7qoCA/xj5KLlB2TlzHd4JmzQKG0FG
	ctlJPIo/yJy3hcmtZqn4NrRTzxtN/fnZe8ae5QDZOAmpGmMl3PtsYG2hCbTsLjgSNkrwGT4IOrh74
	AX3ervbDbcchBnb5NvAJ5/MXEGpH67rwaQ648BB6lvgDw2ZlLdz6jKQfgBg5U/zbLSkUQry3H0GEj
	zy0FeIX/yV9L32RTQOxJW9GjquZ0APcE4Plys2ZHWAXHTK7OJBep9Io61I07aKVmKD7SgpcMnYUx2
	9zUW7zgw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pkPoU-00HSLt-Th; Thu, 06 Apr 2023 13:38:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 690B43000DC;
	Thu,  6 Apr 2023 15:38:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4F208212E36AE; Thu,  6 Apr 2023 15:38:05 +0200 (CEST)
Date: Thu, 6 Apr 2023 15:38:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230406133805.GO386572@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
 <20230405114148.GA351571@hirez.programming.kicks-ass.net>
 <ZC1j8ivE/kK7+Gd5@lothringen>
 <xhsmhpm8ia46p.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmhpm8ia46p.mognet@vschneid.remote.csb>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 01:45:02PM +0100, Valentin Schneider wrote:
> On 05/04/23 14:05, Frederic Weisbecker wrote:
> >  static void smp_call_function_many_cond(const struct cpumask *mask,
> >                                       smp_call_func_t func, void *info,
> > @@ -946,10 +948,13 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
> >  #endif
> >                       cfd_seq_store(pcpu->seq_queue, this_cpu, cpu, CFD_SEQ_QUEUE);
> >                       if (llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu))) {
> > -				__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
> > -				nr_cpus++;
> > -				last_cpu = cpu;
> > -
> > +				if (!(scf_flags & SCF_NO_USER) ||
> > +				    !IS_ENABLED(CONFIG_GENERIC_ENTRY) ||
> > +				     ct_state_cpu(cpu) != CONTEXT_USER) {
> > +					__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
> > +					nr_cpus++;
> > +					last_cpu = cpu;
> > +				}
> 
> I've been hacking on something like this (CSD deferral for NOHZ-full),
> and unfortunately this uses the CPU-local cfd_data storage thing, which
> means any further smp_call_function() from the same CPU to the same
> destination will spin on csd_lock_wait(), waiting for the target CPU to
> come out of userspace and flush the queue - and we've just spent extra
> effort into *not* disturbing it, so that'll take a while :(

I'm not sure I buy into deferring stuff.. a NOHZ_FULL cpu might 'never'
come back. Queueing data just in case it does seems wasteful.
