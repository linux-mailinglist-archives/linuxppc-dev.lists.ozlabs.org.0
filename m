Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED86C537975
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 12:53:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBXMR6jtmz3bvX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 20:53:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RCZFhtbc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBXLp1ynPz2ywb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 20:53:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RCZFhtbc;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LBXLn0P3Yz4xZD;
	Mon, 30 May 2022 20:53:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653907986;
	bh=Dkvi+HFnbDL2DwAp//5yZB70vhuSooWcV247ZK3BH7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RCZFhtbcPhp6Lug7Q3gshleEqDi7ZuvqwB+nM02fddCWX0aDlm65SzHOVqZw86Aj/
	 4xC3Bt3yfwONnf9sSnPlNSYOUpxKhgjYmfchRALVRMhZP09M51niSbFrWNiiK7dQNd
	 WMN1UzdHm3Iykv6om8HKrnwF/u8r0QuBoaeGeCaJMG+4hFBZ0jsFaABKvbpwyqNAvE
	 L9EjjUFZIAM7ouw6qZeT6WRJPYCy+x8D+0q9rLKUllNhJI8C4Rj3GUAPUSmatzOjSt
	 tfCsdy2vE/Je+vFDDbHqQLdqbZpHo6viU34ODQG6WMYFqhYV+0b3MCakzgqjGljCyu
	 +nHi3eexEZT/Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Petr Mladek <pmladek@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: dangling pointer to '__str' error on ppc64_defconfig, GCC 12.1.0
In-Reply-To: <Yo9+fQ32Br9+NpUW@alley>
References: <Yo9Fm/hdtac1t9sW@debian.me> <Yo9+fQ32Br9+NpUW@alley>
Date: Mon, 30 May 2022 20:53:01 +1000
Message-ID: <87k0a3l2b6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, David Howells <dhowells@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Paul Mackerras <paulus@samba.org>, Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Petr Mladek <pmladek@suse.com> writes:
> On Thu 2022-05-26 16:17:15, Bagas Sanjaya wrote:
>> Hi everyone,
>> 
>> Attempting to build ppc64_defconfig kernel with powerpc64-unknown-linux-gnu
>> (GCC 12.1.0) on v5.18, I got build error on ftrace.o:
>> 
>>   CC      arch/powerpc/kernel/trace/ftrace.o
>>   CC      init/init_task.o
>> In file included from ./include/asm-generic/bug.h:22,
>>                  from ./arch/powerpc/include/asm/bug.h:156,
>>                  from ./include/linux/bug.h:5,
>>                  from ./include/linux/thread_info.h:13,
>>                  from ./include/asm-generic/preempt.h:5,
>>                  from ./arch/powerpc/include/generated/asm/preempt.h:1,
>>                  from ./include/linux/preempt.h:78,
>>                  from ./include/linux/spinlock.h:55,
>>                  from arch/powerpc/kernel/trace/ftrace.c:16:
>> arch/powerpc/kernel/trace/ftrace.c: In function 'ftrace_modify_code':
>> ./include/linux/printk.h:446:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>>   446 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>>       |                                            ^
>> ./include/linux/printk.h:418:17: note: in definition of macro 'printk_index_wrap'
>>   418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>>       |                 ^~~~~~~
>> ./include/linux/printk.h:489:9: note: in expansion of macro 'printk'
>>   489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>>       |         ^~~~~~
>> arch/powerpc/kernel/trace/ftrace.c:75:17: note: in expansion of macro 'pr_err'
>>    75 |                 pr_err("%p: replaced (%s) != old (%s)",
>>       |                 ^~~~~~
>> In file included from ./arch/powerpc/include/asm/code-patching.h:14,
>>                  from arch/powerpc/kernel/trace/ftrace.c:26:
>> ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>>   156 |         char __str[PPC_INST_STR_LEN];   \
>>       |              ^~~~~
>
> IMHO, the problem is in the macro:
>
> #define ppc_inst_as_str(x)		\
> ({					\
> 	char __str[PPC_INST_STR_LEN];	\
> 	__ppc_inst_as_str(__str, x);	\
> 	__str;				\
> })
>
> The buffer __str is defined inside the code block {} and
> the macro passes the pointer to the buffer outside.
> IMHO, from the compiler POV, the buffer does not exist
> outside of the code block.
 
This warning seems kind of incompatible with statement expressions. But
I guess the compiler is happy as long as the value returned is not a
pointer. So I'm not sure I agree with the compiler here, but too bad for
me I guess.

This macro has always been a bit awkward, I think I'm inclined to just
get rid of it completely, and print the ulong value. I'll send a patch.

Anyway it's definitely not your problem, sorry you ended up on Cc.

cheers
