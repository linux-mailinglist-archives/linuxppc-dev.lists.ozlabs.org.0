Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 563BF42A46A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 14:29:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTFNX6cvHz2yPG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 23:29:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=yp9m=pa=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTFN705rdz2xrq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:29:26 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8122460E74;
 Tue, 12 Oct 2021 12:29:21 +0000 (UTC)
Date: Tue, 12 Oct 2021 08:29:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
Message-ID: <20211012082920.1f8d6557@gandalf.local.home>
In-Reply-To: <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Oct 2021 14:24:43 +0200 (CEST)
Miroslav Benes <mbenes@suse.cz> wrote:

> > +++ b/kernel/livepatch/patch.c
> > @@ -52,11 +52,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
> >  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
> >  	if (WARN_ON_ONCE(bit < 0))
> >  		return;
> > -	/*
> > -	 * A variant of synchronize_rcu() is used to allow patching functions
> > -	 * where RCU is not watching, see klp_synchronize_transition().
> > -	 */
> > -	preempt_disable_notrace();
> > 
> >  	func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
> >  				      stack_node);
> > @@ -120,7 +115,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
> >  	klp_arch_set_pc(fregs, (unsigned long)func->new_func);
> > 
> >  unlock:
> > -	preempt_enable_notrace();
> >  	ftrace_test_recursion_unlock(bit);
> >  }  
> 
> I don't like this change much. We have preempt_disable there not because 
> of ftrace_test_recursion, but because of RCU. ftrace_test_recursion was 
> added later. Yes, it would work with the change, but it would also hide 
> things which should not be hidden in my opinion.

Agreed, but I believe the change is fine, but requires a nice comment to
explain what you said above.

Thus, before the "ftrace_test_recursion_trylock()" we need:

	/*
	 * The ftrace_test_recursion_trylock() will disable preemption,
	 * which is required for the variant of synchronize_rcu() that is
	 * used to allow patching functions where RCU is not watching.
	 * See klp_synchronize_transition() for more details.
	 */

-- Steve
