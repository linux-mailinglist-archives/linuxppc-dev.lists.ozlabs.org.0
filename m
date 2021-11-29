Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F54615E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:09:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2m0G0tDRz3c7R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 00:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2lzn35Qsz2xXs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 00:09:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J2lzh0Q6lz9sSg;
 Mon, 29 Nov 2021 14:09:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2SWbB37KsdN; Mon, 29 Nov 2021 14:09:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J2lzg6dWsz9sSc;
 Mon, 29 Nov 2021 14:09:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D39D88B7AA;
 Mon, 29 Nov 2021 14:09:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wfS5p2zWdEmK; Mon, 29 Nov 2021 14:09:03 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A4CA8B763;
 Mon, 29 Nov 2021 14:09:03 +0100 (CET)
Message-ID: <e1397c7f-abbd-c5dc-1bf6-74f409b07b4c@csgroup.eu>
Date: Mon, 29 Nov 2021 14:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/ftrace: Handle large kernel configs
Content-Language: fr-FR
To: "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
References: <20181016202500.28039-1-naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20181016202500.28039-1-naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Naveen,

Le 16/10/2018 à 22:25, Naveen N. Rao a écrit :
> Currently, we expect to be able to reach ftrace_caller() from all
> ftrace-enabled functions through a single relative branch. With large
> kernel configs, we see functions outside of 32MB of ftrace_caller()
> causing ftrace_init() to bail.
> 
> In such configurations, gcc/ld emits two types of trampolines for mcount():
> 1. A long_branch, which has a single branch to mcount() for functions that
>     are one hop away from mcount():
> 	c0000000019e8544 <00031b56.long_branch._mcount>:
> 	c0000000019e8544:	4a 69 3f ac 	b       c00000000007c4f0 <._mcount>
> 
> 2. A plt_branch, for functions that are farther away from mcount():
> 	c0000000051f33f8 <0008ba04.plt_branch._mcount>:
> 	c0000000051f33f8:	3d 82 ff a4 	addis   r12,r2,-92
> 	c0000000051f33fc:	e9 8c 04 20 	ld      r12,1056(r12)
> 	c0000000051f3400:	7d 89 03 a6 	mtctr   r12
> 	c0000000051f3404:	4e 80 04 20 	bctr
> 
> We can reuse those trampolines for ftrace if we can have those
> trampolines go to ftrace_caller() instead. However, with ABIv2, we
> cannot depend on r2 being valid. As such, we use only the long_branch
> trampolines by patching those to instead branch to ftrace_caller or
> ftrace_regs_caller.
> 
> In addition, we add additional trampolines around .text and .init.text
> to catch locations that are covered by the plt branches. This allows
> ftrace to work with most large kernel configurations.
> 
> For now, we always patch the trampolines to go to ftrace_regs_caller,
> which is slightly inefficient. This can be optimized further at a later
> point.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
> Since RFC:
> - Change to patch long_branch to go to ftrace_caller, rather than
>    patching mcount()
> - Stop using plt_branch since it can't be relied on for ABIv2
> - Add trampolines around .text and .init.text to catch remaining
>    locations
> 
> - Naveen
> 
>   arch/powerpc/kernel/trace/ftrace.c    | 261 +++++++++++++++++++++++++-
>   arch/powerpc/kernel/trace/ftrace_64.S |  12 ++
>   arch/powerpc/kernel/vmlinux.lds.S     |  13 +-
>   3 files changed, 281 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 4bfbb54dee51..4bf051d3e21e 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c

...

> +/*
> + * If this is a compiler generated long_branch trampoline (essentially, a
> + * trampoline that has a branch to _mcount()), we re-write the branch to
> + * instead go to ftrace_[regs_]caller() and note down the location of this
> + * trampoline.
> + */
> +static int setup_mcount_compiler_tramp(unsigned long tramp)
> +{
> +	int i, op;
> +	unsigned long ptr;
> +	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
> +
> +	/* Is this a known long jump tramp? */
> +	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
> +		if (!ftrace_tramps[i])
> +			break;
> +		else if (ftrace_tramps[i] == tramp)
> +			return 0;
> +
> +	/* Is this a known plt tramp? */
> +	for (i = 0; i < NUM_FTRACE_TRAMPS; i++)
> +		if (!ftrace_plt_tramps[i])
> +			break;
> +		else if (ftrace_plt_tramps[i] == tramp)
> +			return -1;

I don't understand how this is supposed to work.
ftrace_plt_tramps[] being a static table, it is set to 0s at startup.
So the above loop breaks at first round.

Then ftrace_plt_tramps[i] is never/nowhere set.

So I just see it as useless.

Am I missing something ?

Thanks
Christophe

> +
> +	/* New trampoline -- read where this goes */
> +	if (probe_kernel_read(&op, (void *)tramp, sizeof(int))) {
> +		pr_debug("Fetching opcode failed.\n");
> +		return -1;
> +	}
> +
> +	/* Is this a 24 bit branch? */
> +	if (!is_b_op(op)) {
> +		pr_debug("Trampoline is not a long branch tramp.\n");
> +		return -1;
> +	}
> +
> +	/* lets find where the pointer goes */
> +	ptr = find_bl_target(tramp, op);
> +
> +	if (ptr != ppc_global_function_entry((void *)_mcount)) {
> +		pr_debug("Trampoline target %p is not _mcount\n", (void *)ptr);
> +		return -1;
> +	}
> +
> +	/* Let's re-write the tramp to go to ftrace_[regs_]caller */
> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +	ptr = ppc_global_function_entry((void *)ftrace_regs_caller);
> +#else
> +	ptr = ppc_global_function_entry((void *)ftrace_caller);
> +#endif
> +	if (!create_branch((void *)tramp, ptr, 0)) {
> +		pr_debug("%ps is not reachable from existing mcount tramp\n",
> +				(void *)ptr);
> +		return -1;
> +	}
> +
> +	if (patch_branch((unsigned int *)tramp, ptr, 0)) {
> +		pr_debug("REL24 out of range!\n");
> +		return -1;
> +	}
> +
> +	if (add_ftrace_tramp(tramp)) {
> +		pr_debug("No tramp locations left\n");
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +


...

