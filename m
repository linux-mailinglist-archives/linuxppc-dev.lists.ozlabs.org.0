Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350421A0705
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 08:10:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xH7w1WnhzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=nXcul3e4; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGjD20rDzDqBV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:50:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xGj80qxxz9tyl1;
 Tue,  7 Apr 2020 07:50:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nXcul3e4; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LZXCBihUOUFy; Tue,  7 Apr 2020 07:50:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xGj76XqXz9tyl0;
 Tue,  7 Apr 2020 07:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586238635; bh=2tZXuUuex6nYp5avlGoJBieKqNJeU842UJK6lCZeZPI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nXcul3e4DfJz0oM+xpLF9D5KFsNSJWxYp7PA9W3ITIQcqYUdiyVW1sAUPqGqCxJyw
 BwvgBOpHsrpTZ8JH2VvPA0qmqfeAih64Ql/VijwikDKSaPq/07LD7gdSUKWK/sYVlr
 QphDLp2os721Ch5R4UtyRkSVjow/YCG5h8UngLyo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8D208B76E;
 Tue,  7 Apr 2020 07:50:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J6cArsecsUwx; Tue,  7 Apr 2020 07:50:36 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BBBE78B75E;
 Tue,  7 Apr 2020 07:50:33 +0200 (CEST)
Subject: Re: [PATCH v12 5/8] powerpc/64: make buildable without CONFIG_COMPAT
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584699455.git.msuchanek@suse.de>
 <e5619617020ef3a1f54f0c076e7d74cb9ec9f3bf.1584699455.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b420b304-05e9-df58-7149-31169b0b01e2@c-s.fr>
Date: Tue, 7 Apr 2020 07:50:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e5619617020ef3a1f54f0c076e7d74cb9ec9f3bf.1584699455.git.msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/03/2020 à 11:20, Michal Suchanek a écrit :
> There are numerous references to 32bit functions in generic and 64bit
> code so ifdef them out.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2:
> - fix 32bit ifdef condition in signal.c
> - simplify the compat ifdef condition in vdso.c - 64bit is redundant
> - simplify the compat ifdef condition in callchain.c - 64bit is redundant
> v3:
> - use IS_ENABLED and maybe_unused where possible
> - do not ifdef declarations
> - clean up Makefile
> v4:
> - further makefile cleanup
> - simplify is_32bit_task conditions
> - avoid ifdef in condition by using return
> v5:
> - avoid unreachable code on 32bit
> - make is_current_64bit constant on !COMPAT
> - add stub perf_callchain_user_32 to avoid some ifdefs
> v6:
> - consolidate current_is_64bit
> v7:
> - remove leftover perf_callchain_user_32 stub from previous series version
> v8:
> - fix build again - too trigger-happy with stub removal
> - remove a vdso.c hunk that causes warning according to kbuild test robot
> v9:
> - removed current_is_64bit in previous patch
> v10:
> - rebase on top of 70ed86f4de5bd
> ---
>   arch/powerpc/include/asm/thread_info.h | 4 ++--
>   arch/powerpc/kernel/Makefile           | 6 +++---
>   arch/powerpc/kernel/entry_64.S         | 2 ++
>   arch/powerpc/kernel/signal.c           | 3 +--
>   arch/powerpc/kernel/syscall_64.c       | 6 ++----
>   arch/powerpc/kernel/vdso.c             | 3 ++-
>   arch/powerpc/perf/callchain.c          | 8 +++++++-
>   7 files changed, 19 insertions(+), 13 deletions(-)
> 

[...]

> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 87d95b455b83..2dcbfe38f5ac 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -24,7 +24,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
>   				   long r6, long r7, long r8,
>   				   unsigned long r0, struct pt_regs *regs)
>   {
> -	unsigned long ti_flags;
>   	syscall_fn f;
>   
>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> @@ -68,8 +67,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>   
>   	local_irq_enable();
>   
> -	ti_flags = current_thread_info()->flags;
> -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
>   		/*
>   		 * We use the return value of do_syscall_trace_enter() as the
>   		 * syscall number. If the syscall was rejected for any reason
> @@ -94,7 +92,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
>   	/* May be faster to do array_index_nospec? */
>   	barrier_nospec();
>   
> -	if (unlikely(ti_flags & _TIF_32BIT)) {
> +	if (unlikely(is_32bit_task())) {

is_compat() should be used here instead, because we dont want to use 
compat_sys_call_table() on PPC32.

>   		f = (void *)compat_sys_call_table[r0];
>   
>   		r3 &= 0x00000000ffffffffULL;

Christophe
