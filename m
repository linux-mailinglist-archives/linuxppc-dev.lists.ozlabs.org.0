Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F86142F39D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 15:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW6jq5sJJz3bmn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 00:36:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=a1n/=pd=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW6jL4Q0zz2xt1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 00:35:50 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 667A761151;
 Fri, 15 Oct 2021 13:35:44 +0000 (UTC)
Date: Fri, 15 Oct 2021 09:35:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <20211015093542.7d9a9671@gandalf.local.home>
In-Reply-To: <3c87e825-e907-cba0-e95f-28878356fc71@linux.alibaba.com>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
 <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
 <YWktujP6DcMnRIXT@alley>
 <3c87e825-e907-cba0-e95f-28878356fc71@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Paul Mackerras <paulus@samba.org>, Joe Lawrence <joe.lawrence@redhat.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 17:12:26 +0800
=E7=8E=8B=E8=B4=87 <yun.wang@linux.alibaba.com> wrote:

> Maybe take some example would be easier to understand...
>=20
> Currently there are two way of using ftrace_test_recursion_trylock(),
> one with TRACE_FTRACE_XXX we mark as A, one with TRACE_LIST_XXX we mark
> as B, then:
>=20
> A followed by B on same context got bit > 0
> B followed by A on any context got bit 0
> A followed by A on same context got bit > 0
> A followed by A followed by A on same context got bit -1
> B followed by B on same context got bit > 0
> B followed by B followed by B on same context got bit -1
>=20
> If we get rid of the TRACE_TRANSITION_BIT which allowed recursion for
> onetime, then it would be:

We can't get rid of the transition bit. It's there to fix a bug. Or at
least until we finish the "noinst" issue which may be true now? I have to
go revisit it.

The reason for the transition bit, is because we were dropping function
traces, that people relied on being there. The problem is that the
recursion protection allows for nested context. That is, it will not detect
recursion if we an interrupt triggers during a trace (while the recursion
lock is held) and then that interrupt does a trace. It is allowed to call
the ftrace_test_recursion_trylock() again.

But, what happens if the trace occurs after the interrupt triggers, but
before the preempt_count states that we are now in interrupt context? As
preempt_count is used by this code to determine what context we are in, if
a trace happens in this "transition" state, without the transition bit, a
recursion is detected (false positive) and the event is dropped. People are
then confused on how an interrupt happened, but the entry of the interrupt
never triggered (according to the trace).

The transition bit allows one level of recursion to handle this case.

The "noinst" work may also remove all locations that can be traced before
the context is updated. I need to see if that is now the case, and if it
is, we can remove the transition bit.

This is not the design issue I mentioned earlier. I'm still working on that
one.

-- Steve


>=20
> A followed by B on same context got bit > 0
> B followed by A on any context got bit 0
> A followed by A on same context got bit -1
> B followed by B on same context got bit -1
>=20
> So as long as no continuously AAA it's safe?

