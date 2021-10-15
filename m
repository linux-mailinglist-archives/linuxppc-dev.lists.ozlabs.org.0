Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E842FAFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 20:29:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWFD11kTsz3c9G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 05:29:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cY0CRJ4S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=cY0CRJ4S; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWFCJ3ybgz30RP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 05:28:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=us4YosfodZgYMwFe8rJkfXK5dBQB718M3Lke3zJ1ToY=; b=cY0CRJ4SyOUVhj9UQyVxaRjiQw
 /1wr6TKwpWSzfpNTEbXEKVniDAC2ka6eybM+zn4dvXDqwYkZkvTR7v491RJDKTw//hD58xTRj4oSR
 0QlPPMnjn7Kj5Q69itBEQRhxFEDeXwGDeihgs8rBliRLbgQ1rALI78w76v8T7IV7afCS0Fz+4Wm/4
 JqW5/oOc7BvO/34prpputAko6YLKktrYcXK5QZw27hBqOhlswQg+31OoFJIp0mMSv5a8AOMHrtuWW
 Noym6xZO/FLCs8cS2lPtQPTbXYrAqWX9Q1Zx+cYlupXrs+iYell2Jzqq1JcZWRqrfVcDkMJ/NiCjB
 zMNudW1A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRt6-009CM0-0J; Fri, 15 Oct 2021 18:25:17 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 90BD19857C7; Fri, 15 Oct 2021 20:24:59 +0200 (CEST)
Date: Fri, 15 Oct 2021 20:24:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211015182459.GL174703@worktop.programming.kicks-ass.net>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
 <20211015135806.72d1af23@gandalf.local.home>
 <20211015180429.GK174703@worktop.programming.kicks-ass.net>
 <20211015142033.72605b47@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015142033.72605b47@gandalf.local.home>
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
Cc: =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guoren@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 15, 2021 at 02:20:33PM -0400, Steven Rostedt wrote:
> On Fri, 15 Oct 2021 20:04:29 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Fri, Oct 15, 2021 at 01:58:06PM -0400, Steven Rostedt wrote:
> > > Something like this:  
> > 
> > I think having one copy of that in a header is better than having 3
> > copies. But yes, something along them lines.
> 
> I was just about to ask you about this patch ;-)

Much better :-)

> diff --git a/kernel/events/internal.h b/kernel/events/internal.h
> index 228801e20788..c91711f20cf8 100644
> --- a/kernel/events/internal.h
> +++ b/kernel/events/internal.h
> @@ -206,11 +206,7 @@ DEFINE_OUTPUT_COPY(__output_copy_user, arch_perf_out_copy_user)
>  static inline int get_recursion_context(int *recursion)
>  {
>  	unsigned int pc = preempt_count();

Although I think we can do without that ^ line as well :-)

> -	unsigned char rctx = 0;
> -
> -	rctx += !!(pc & (NMI_MASK));
> -	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK));
> -	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
> +	unsigned char rctx = interrupt_context_level();
>  
>  	if (recursion[rctx])
>  		return -1;
