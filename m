Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B3A534FD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 15:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L87pw1Rqtz3bc8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 23:20:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HpU41jjz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HpU41jjz;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L87pF0Wdxz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 23:20:03 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 539D2219FB;
	Thu, 26 May 2022 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653571200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QoYDBLxX9BnU+G+6FHIPva/2AM2AhlaFaohhF5jTXUo=;
	b=HpU41jjz/FvW2F/+inOvSarcXtO2B7pbUzjTH+QRrS2NXXkjN7owGcyutNO4z8qCpJ0ESI
	sYkIx3PgYKHL6dxtfO6KcJ3qGpKr/sEK5iIGjOYBrv2sRZVUgyLnoZMUe6vSsF8F5u1PCF
	DKz2AlWoGbFVeDiiavJ2/mLchIghitU=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id EA27A2C141;
	Thu, 26 May 2022 13:19:58 +0000 (UTC)
Date: Thu, 26 May 2022 15:19:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: dangling pointer to '__str' error on ppc64_defconfig, GCC 12.1.0
Message-ID: <Yo9+fQ32Br9+NpUW@alley>
References: <Yo9Fm/hdtac1t9sW@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yo9Fm/hdtac1t9sW@debian.me>
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
Cc: John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, David Howells <dhowells@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Jordan Niethe <jniethe5@gmail.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2022-05-26 16:17:15, Bagas Sanjaya wrote:
> Hi everyone,
> 
> Attempting to build ppc64_defconfig kernel with powerpc64-unknown-linux-gnu
> (GCC 12.1.0) on v5.18, I got build error on ftrace.o:
> 
>   CC      arch/powerpc/kernel/trace/ftrace.o
>   CC      init/init_task.o
> In file included from ./include/asm-generic/bug.h:22,
>                  from ./arch/powerpc/include/asm/bug.h:156,
>                  from ./include/linux/bug.h:5,
>                  from ./include/linux/thread_info.h:13,
>                  from ./include/asm-generic/preempt.h:5,
>                  from ./arch/powerpc/include/generated/asm/preempt.h:1,
>                  from ./include/linux/preempt.h:78,
>                  from ./include/linux/spinlock.h:55,
>                  from arch/powerpc/kernel/trace/ftrace.c:16:
> arch/powerpc/kernel/trace/ftrace.c: In function 'ftrace_modify_code':
> ./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                                            ^
> ./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                 ^~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:75:17: note: in expansion of macro 'pr_err'
>    75 |                 pr_err("%p: replaced (%s) != old (%s)",
>       |                 ^~~~~~
> In file included from ./arch/powerpc/include/asm/code-patching.h:14,
>                  from arch/powerpc/kernel/trace/ftrace.c:26:
> ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>   156 |         char __str[PPC_INST_STR_LEN];   \
>       |              ^~~~~

IMHO, the problem is in the macro:

#define ppc_inst_as_str(x)		\
({					\
	char __str[PPC_INST_STR_LEN];	\
	__ppc_inst_as_str(__str, x);	\
	__str;				\
})

The buffer __str is defined inside the code block {} and
the macro passes the pointer to the buffer outside.
IMHO, from the compiler POV, the buffer does not exist
outside of the code block.

The macro was added by the commit 50428fdc53ba48f6936b10dfd ("powerpc:
Add a ppc_inst_as_str() helper").

Adding Jordan Niethe into Cc.

Best Regards,
Petr


> ./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> ./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                          ^~~~~~~~~~~~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:75:17: note: in expansion of macro 'pr_err'
>    75 |                 pr_err("%p: replaced (%s) != old (%s)",
>       |                 ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_nop_kernel':
> ./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                                            ^
> ./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                 ^~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:379:17: note: in expansion of macro 'pr_err'
>   379 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>       |                 ^~~~~~
> ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>   156 |         char __str[PPC_INST_STR_LEN];   \
>       |              ^~~~~
> ./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> ./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                          ^~~~~~~~~~~~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:379:17: note: in expansion of macro 'pr_err'
>   379 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>       |                 ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_call_kernel':
> ./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                                            ^
> ./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                 ^~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:638:17: note: in expansion of macro 'pr_err'
>   638 |                 pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
>       |                 ^~~~~~
> ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>   156 |         char __str[PPC_INST_STR_LEN];   \
>       |              ^~~~~
> ./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> ./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                          ^~~~~~~~~~~~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:638:17: note: in expansion of macro 'pr_err'
>   638 |                 pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
>       |                 ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_nop':
> ./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                                            ^
> ./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                 ^~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:205:17: note: in expansion of macro 'pr_err'
>   205 |                 pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
>       |                 ^~~~~~
> ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>   156 |         char __str[PPC_INST_STR_LEN];   \
>       |              ^~~~~
> ./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> ./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                          ^~~~~~~~~~~~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:205:17: note: in expansion of macro 'pr_err'
>   205 |                 pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
>       |                 ^~~~~~
> ./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                                            ^
> ./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                 ^~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:139:17: note: in expansion of macro 'pr_err'
>   139 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>       |                 ^~~~~~
> ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>   156 |         char __str[PPC_INST_STR_LEN];   \
>       |              ^~~~~
> ./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> ./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                          ^~~~~~~~~~~~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:139:17: note: in expansion of macro 'pr_err'
>   139 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>       |                 ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_make_call':
> ./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                                            ^
> ./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                 ^~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:506:17: note: in expansion of macro 'pr_err'
>   506 |                 pr_err("Unexpected call sequence at %p: %s %s\n",
>       |                 ^~~~~~
> ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>   156 |         char __str[PPC_INST_STR_LEN];   \
>       |              ^~~~~
> ./include/linux/printk.h:418:33: note: in expansion of macro 'ppc_inst_as_str'
>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> ./include/linux/printk.h:446:26: note: in expansion of macro 'printk_index_wrap'
>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>       |                          ^~~~~~~~~~~~~~~~~
> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> arch/powerpc/kernel/trace/ftrace.c:506:17: note: in expansion of macro 'pr_err'
>   506 |                 pr_err("Unexpected call sequence at %p: %s %s\n",
>       |                 ^~~~~~
> cc1: all warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:288: arch/powerpc/kernel/trace/ftrace.o] Error 1
> 
> I also hit this error on current master (commit babf0bb978e3c9
> ("Merge tag 'xfs-5.19-for-linus' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux")).
> 
> Thanks.
> 
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> -- 
> An old man doll... just what I always wanted! - Clara
