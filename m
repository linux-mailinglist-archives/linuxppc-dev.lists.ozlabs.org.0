Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98E3FC94D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 16:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzTRk1s9mz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 00:03:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iMhGAYk8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=iMhGAYk8; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzTR001lwz2yJR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 00:02:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZgzwjZwCf/ykABrZU5jktR0OjgK20KPldkEgMC3u/pM=; b=iMhGAYk8TgJk6vqXPzJH30eIpU
 ToQBbegMORlZFXCmgjtDqES1d45uMUGrqOzqxy+MgrDJCvMwR5FuHYFs35lhi9jtMUK/8cL7VAQT/
 1nseKClnmJqNOd8uXKcxdEYcxoB/PKkY8yzS0N2rU4Oyr02kaHcu2y0H/OuBi0l/jFv7NxPAOYFGg
 kDOh3Ko8Zm7gxxB2jj9KtZDKwvQKB7/zcfQjCCeNvctR5Is/GfI91NsK40PsFy8Am4Bwixv6+siGq
 n0zIUF6dmfciKAc9bzTIEgZLIA5USAVSlXShsmWUm9doaWk57dk6LA0kYiMRM+B6ikrNpIj4KcyQI
 0E5pcHVw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL4JN-001GfJ-AY; Tue, 31 Aug 2021 14:00:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 19B6F300299;
 Tue, 31 Aug 2021 16:00:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B542120AEBF27; Tue, 31 Aug 2021 16:00:20 +0200 (CEST)
Date: Tue, 31 Aug 2021 16:00:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/32: Add support for out-of-line static calls
Message-ID: <YS419Exj6PpESVc/@hirez.programming.kicks-ass.net>
References: <97f252fcd63e145f54fbf85124c75fb01e96e1bb.1630415517.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f252fcd63e145f54fbf85124c75fb01e96e1bb.1630415517.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jason Baron <jbaron@akamai.com>, Paul Mackerras <paulus@samba.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 31, 2021 at 01:12:26PM +0000, Christophe Leroy wrote:
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 36b72d972568..a0fe69d8ec83 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -247,6 +247,7 @@ config PPC
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
>  	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
> +	select HAVE_STATIC_CALL			if PPC32
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_VIRT_CPU_ACCOUNTING
>  	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
> diff --git a/arch/powerpc/include/asm/static_call.h b/arch/powerpc/include/asm/static_call.h
> new file mode 100644
> index 000000000000..2402c6d32439
> --- /dev/null
> +++ b/arch/powerpc/include/asm/static_call.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_STATIC_CALL_H
> +#define _ASM_POWERPC_STATIC_CALL_H
> +
> +#define __POWERPC_SCT(name, inst)					\
> +	asm(".pushsection .text, \"ax\"				\n"	\
> +	    ".align 5						\n"	\
> +	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
> +	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
> +	    inst "						\n"	\
> +	    "	lis	12,1f@ha				\n"	\
> +	    "	lwz	12,1f@l(12)				\n"	\
> +	    "	mtctr	12					\n"	\
> +	    "	bctr						\n"	\
> +	    "1:	.long 0						\n"	\
> +	    "	nop						\n"	\
> +	    "	nop						\n"	\
> +	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
> +	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
> +	    ".popsection					\n")
> +
> +#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)	__POWERPC_SCT(name, "b " #func)
> +#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)	__POWERPC_SCT(name, "blr")
> +
> +#endif /* _ASM_POWERPC_STATIC_CALL_H */

> diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
> new file mode 100644
> index 000000000000..e5e78205ccb4
> --- /dev/null
> +++ b/arch/powerpc/kernel/static_call.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/memory.h>
> +#include <linux/static_call.h>
> +
> +#include <asm/code-patching.h>
> +
> +void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
> +{
> +	int err;
> +	unsigned long target = (long)func;
> +	bool is_short = is_offset_in_branch_range((long)target - (long)tramp);
> +
> +	if (!tramp)
> +		return;
> +
> +	mutex_lock(&text_mutex);
> +
> +	if (func && !is_short) {
> +		err = patch_instruction(tramp + 20, ppc_inst(target));
> +		if (err)
> +			goto out;
> +	}
> +
> +	if (!func)
> +		err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
> +	else if (is_short)
> +		err = patch_branch(tramp, target, 0);
> +	else
> +		err = patch_instruction(tramp, ppc_inst(PPC_RAW_NOP()));
> +out:
> +	mutex_unlock(&text_mutex);
> +
> +	if (err)
> +		panic("%s: patching failed %pS at %pS\n", __func__, func, tramp);
> +}
> +EXPORT_SYMBOL_GPL(arch_static_call_transform);

Yes, this should work nicely!

Since you have the two nop's at the end, you could frob in an
optimization for __static_call_return0 without too much issue.

Replace the two nops with (excuse my ppc asm):

	li r3, 0
	blr

and augment arch_static_call_transform() with something like:

	if (func == &__static_call_return0)
		err = patch_branch(tramp, tramp+24, 0);

