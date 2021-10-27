Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD243C06E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 04:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfCxw5K0Gz2y7J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 13:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=up5n=pp=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfCxV6d2Kz2xB0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 13:55:58 +1100 (AEDT)
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03365610C7;
 Wed, 27 Oct 2021 02:55:53 +0000 (UTC)
Date: Tue, 26 Oct 2021 22:55:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: Re: [PATCH v6 1/2] ftrace: disable preemption when recursion locked
Message-ID: <20211026225552.72a7ee79@rorschach.local.home>
In-Reply-To: <78c95844-16b7-8904-b48d-3b2ccd76a352@linux.alibaba.com>
References: <df8e9b3e-504c-635d-4e92-99cdf9f05479@linux.alibaba.com>
 <78c95844-16b7-8904-b48d-3b2ccd76a352@linux.alibaba.com>
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
 Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jiri Kosina <jikos@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Oct 2021 10:34:13 +0800
=E7=8E=8B=E8=B4=87 <yun.wang@linux.alibaba.com> wrote:

> +/*
> + * Preemption will be enabled (if it was previously enabled).
> + */
>  static __always_inline void trace_clear_recursion(int bit)
>  {
> +	WARN_ON_ONCE(bit < 0);

Can you send a v7 without the WARN_ON.

This is an extremely hot path, and this will cause noticeable overhead.

If something were to call this with bit < 0, then it would crash and
burn rather quickly.

-- Steve


> +
> +	preempt_enable_notrace();
>  	barrier();
>  	trace_recursion_clear(bit);
>  }
