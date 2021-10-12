Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C642A4CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 14:44:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTFhv40Phz2yw7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 23:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=yp9m=pa=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTFhT44tNz2xWt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:43:37 +1100 (AEDT)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A316660E97;
 Tue, 12 Oct 2021 12:43:32 +0000 (UTC)
Date: Tue, 12 Oct 2021 08:43:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
Message-ID: <20211012084331.06b8dd23@gandalf.local.home>
In-Reply-To: <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
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
 Paul Walmsley <paul.walmsley@sifive.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 live-patching@vger.kernel.org, linux-riscv@lists.infradead.org,
 Miroslav Benes <mbenes@suse.cz>, Paul Mackerras <paulus@samba.org>,
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

On Tue, 12 Oct 2021 13:40:08 +0800
=E7=8E=8B=E8=B4=87 <yun.wang@linux.alibaba.com> wrote:

> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -214,7 +214,14 @@ static __always_inline void trace_clear_recursion(in=
t bit)
>  static __always_inline int ftrace_test_recursion_trylock(unsigned long i=
p,
>  							 unsigned long parent_ip)
>  {
> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, =
TRACE_FTRACE_MAX);
> +	int bit;
> +
> +	preempt_disable_notrace();

The recursion test does not require preemption disabled, it uses the task
struct, not per_cpu variables, so you should not disable it before the test.

	bit =3D trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TR=
ACE_FTRACE_MAX);
	if (bit >=3D 0)
		preempt_disable_notrace();

And if the bit is zero, it means a recursion check was already done by
another caller (ftrace handler does the check, followed by calling perf),
and you really don't even need to disable preemption in that case.

	if (bit > 0)
		preempt_disable_notrace();

And on the unlock, have:

 static __always_inline void ftrace_test_recursion_unlock(int bit)
 {
	if (bit)
		preempt_enable_notrace();
 	trace_clear_recursion(bit);
 }

But maybe that's over optimizing ;-)

-- Steve


> +	bit =3D trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START,=
 TRACE_FTRACE_MAX);
> +	if (bit < 0)
> +		preempt_enable_notrace();
> +
> +	return bit;
>  }

