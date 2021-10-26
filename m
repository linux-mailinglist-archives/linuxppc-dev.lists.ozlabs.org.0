Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4943AA6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 04:43:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdbj2475Nz3bWk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 13:43:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=c3ca=po=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdbhc4XQ7z2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 13:42:40 +1100 (AEDT)
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E000861074;
 Tue, 26 Oct 2021 02:42:34 +0000 (UTC)
Date: Mon, 25 Oct 2021 22:42:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: Re: [PATCH v4 0/2] fix & prevent the missing preemption disabling
Message-ID: <20211025224233.61b8e088@rorschach.local.home>
In-Reply-To: <71c21f78-9c44-fdb2-f8e2-d8544b3421bd@linux.alibaba.com>
References: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
 <71c21f78-9c44-fdb2-f8e2-d8544b3421bd@linux.alibaba.com>
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

On Tue, 26 Oct 2021 10:09:12 +0800
=E7=8E=8B=E8=B4=87 <yun.wang@linux.alibaba.com> wrote:

> Just a ping, to see if there are any more comments :-P

I guess you missed what went into mainline (and your name found a bug
in my perl script for importing patches ;-)

  https://lore.kernel.org/all/20211019091344.65629198@gandalf.local.home/

Which means patch 1 needs to change:

> +	/*
> +	 * Disable preemption to fulfill the promise.
> +	 *
> +	 * Don't worry about the bit 0 cases, they indicate
> +	 * the disabling behaviour has already been done by
> +	 * internal call previously.
> +	 */
> +	preempt_disable_notrace();
> +
>  	return bit + 1;
>  }
>=20
> +/*
> + * Preemption will be enabled (if it was previously enabled).
> + */
>  static __always_inline void trace_clear_recursion(int bit)
>  {
>  	if (!bit)
>  		return;
>=20
> +	if (bit > 0)
> +		preempt_enable_notrace();
> +

Where this wont work anymore.

Need to preempt disable and enable always.

-- Steve


>  	barrier();
>  	bit--;
>  	trace_recursion_clear(bit);
> @@ -209,7 +227,7 @@ static __always_inline void trace_clear_recursion(int=
 bit)
>   * tracing recursed in the same context (normal vs interrupt),
>   *
