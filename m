Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3B442DE01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 17:23:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVY830rqzz3c65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 02:23:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ZLILYHxO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=ZLILYHxO; dkim-atps=neutral
X-Greylist: delayed 515 seconds by postgrey-1.36 at boromir;
 Fri, 15 Oct 2021 02:22:53 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVY7K5cRYz2yg4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 02:22:52 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4603621A89;
 Thu, 14 Oct 2021 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634224452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALOTVNu/egcVlHKjItYFDOMwJxp+I4TFEjpwx0g4g5E=;
 b=ZLILYHxOIMb36+D1zMkaQ7f9QhJIGj0VMe3lw2B87bi8pmp+oPWT8j/AlZo7s/YaiBBYxo
 DHO8JYR1TwD9iHLQmgJ9hvQf6dkOXdKyF8BeukJuevUxhdRMHZkVyqaM7jUcpNafEgM9Js
 6KtMXgfm/vEGo6eBDp86QFxhn6m8tdk=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4CE08A3B88;
 Thu, 14 Oct 2021 15:14:10 +0000 (UTC)
Date: Thu, 14 Oct 2021 17:14:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <YWhJP41cNwDphYsv@alley>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
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
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Kosina <jikos@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2021-10-13 16:51:46, 王贇 wrote:
> As the documentation explained, ftrace_test_recursion_trylock()
> and ftrace_test_recursion_unlock() were supposed to disable and
> enable preemption properly, however currently this work is done
> outside of the function, which could be missing by mistake.
> 
> This path will make sure the preemption was disabled when trylock()
> succeed, and the unlock() will enable the preemption if previously
> enabled.
> 
> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index a9f9c57..58e474c 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -214,7 +214,18 @@ static __always_inline void trace_clear_recursion(int bit)

We should also update the description above the function, for example:

  /**
   * ftrace_test_recursion_trylock - tests for recursion in same context
   *
   * Use this for ftrace callbacks. This will detect if the function
   * tracing recursed in the same context (normal vs interrupt),
   *
   * Returns: -1 if a recursion happened.
-  *           >= 0 if no recursion
+  *           >= 0 if no recursion (success)
+  *
+  * Disables the preemption on success. It is just for a convenience.
+  * Current users needed to disable the preemtion for some reasons.
   */


>  static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>  							 unsigned long parent_ip)
>  {
> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	int bit;
> +
> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	/*
> +	 * The zero bit indicate we are nested
> +	 * in another trylock(), which means the
> +	 * preemption already disabled.
> +	 */
> +	if (bit > 0)
> +		preempt_disable_notrace();

Is this safe? The preemption is disabled only when
trace_test_and_set_recursion() was called by ftrace_test_recursion_trylock().

We must either always disable the preemtion when bit >= 0.
Or we have to disable the preemtion already in
trace_test_and_set_recursion().


Finally, the comment confused me a lot. The difference between nesting and
recursion is far from clear. And the code is tricky liky like hell :-)
I propose to add some comments, see below for a proposal.

> +
> +	return bit;
>  }
>  /**
> @@ -222,9 +233,13 @@ static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>   * @bit: The return of a successful ftrace_test_recursion_trylock()
>   *
>   * This is used at the end of a ftrace callback.
> + *
> + * Preemption will be enabled (if it was previously enabled).
>   */
>  static __always_inline void ftrace_test_recursion_unlock(int bit)
>  {
> +	if (bit)

This is not symetric with trylock(). It should be:

	if (bit > 0)

Anyway, trace_clear_recursion() quiently ignores bit != 0


> +		preempt_enable_notrace();
>  	trace_clear_recursion(bit);
>  }


Below is my proposed patch that tries to better explain the recursion
check:

From 20d69f11e2683262fa0043b803999061cbac543f Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Thu, 14 Oct 2021 16:57:39 +0200
Subject: [PATCH] trace: Better describe the recursion check return values

The trace recursion check might be called recursively by different
layers of the tracing code. It is safe recursion and the check
is even optimized for this case.

The problematic recursion is when the traced function is called
by the tracing code. This is properly detected.

Try to explain this difference a better way.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 include/linux/trace_recursion.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index a9f9c5714e65..b5efb804efdf 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -159,13 +159,27 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
 # define do_ftrace_record_recursion(ip, pip)	do { } while (0)
 #endif
 
+/*
+ * trace_test_and_set_recursion() is called on several layers
+ * of the ftrace code when handling the same ftrace entry.
+ * These calls might be nested/recursive.
+ *
+ * It uses TRACE_LIST_*BITs to distinguish between this
+ * internal recursion and recursion caused by calling
+ * the traced function by the ftrace code.
+ *
+ * Returns: > 0 when no recursion
+ *          0 when called recursively internally (safe)
+ *	    -1 when the traced function was called recursively from
+ *             the ftrace handler (unsafe)
+ */
 static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
 							int start, int max)
 {
 	unsigned int val = READ_ONCE(current->trace_recursion);
 	int bit;
 
-	/* A previous recursion check was made */
+	/* Called recursively internally by different ftrace code layers? */
 	if ((val & TRACE_CONTEXT_MASK) > max)
 		return 0;
 
-- 
2.26.2

