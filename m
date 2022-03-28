Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AF4E9276
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 12:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRpjY1X2Wz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 21:25:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ike4utfU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=ike4utfU; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRphq0224z2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 21:24:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cowTe1SqlS2BOdGmzt26WP+/bS7/jiiuXA3bfaFKWco=; b=ike4utfUXfV67i9TA6zdOS8mNs
 frOWZK9ja5kR0DpwP2JZsKKcNlTXAUWQgTNZ1PxZmZfw0P/YO4O/xLGx4RTU8nsHY++w4ymxFWYD3
 GjLUJ0y8HErEb9MprHuxSla+Xq+Eb/H7h6PQlsvB1uCdbY73ven3GlV0Voax5vXsvDW0ruCm8WeG0
 N2LAVDx0zAeehFxBZZ9fniVMQhP1aAkQEjDvKV3usfXWZvIb5zDb8u4euUSKx9RKjnVrbvsyuyfh4
 6u67ITXkcXlrq/vYwqH/VfRTyejXlP9ltIRIapq5WAxHu76zGm8dr4gqalhJy5Fh9LrVF4zSpbBJh
 c7ulFH3w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYmXI-00GoqY-SQ; Mon, 28 Mar 2022 10:23:45 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3D6BC9861F5; Mon, 28 Mar 2022 12:23:42 +0200 (CEST)
Date: Mon, 28 Mar 2022 12:23:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] livepatch: Remove klp_arch_set_pc() and asm/livepatch.h
Message-ID: <20220328102342.GW8939@worktop.programming.kicks-ass.net>
References: <e029c7cfde436f6bbf99148ab14dc2da99add503.1648447981.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e029c7cfde436f6bbf99148ab14dc2da99add503.1648447981.git.christophe.leroy@csgroup.eu>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 live-patching@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, linux-s390@vger.kernel.org,
 Joe Lawrence <joe.lawrence@redhat.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Petr Mladek <pmladek@suse.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 08:26:48AM +0200, Christophe Leroy wrote:
> All three versions of klp_arch_set_pc() do exactly the same: they
> call ftrace_instruction_pointer_set().
> 
> Call ftrace_instruction_pointer_set() directly and remove
> klp_arch_set_pc().
> 
> As klp_arch_set_pc() was the only thing remaining in asm/livepatch.h
> on x86 and s390, remove asm/livepatch.h
> 
> livepatch.h remains on powerpc but its content is exclusively used
> by powerpc specific code.

The only remaining thing seems to be a klp_init_thread_info() for ppc64,
but yeah..

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> diff --git a/kernel/livepatch/patch.c b/kernel/livepatch/patch.c
> index c172bf92b576..4c4f5a776d80 100644
> --- a/kernel/livepatch/patch.c
> +++ b/kernel/livepatch/patch.c
> @@ -118,7 +118,7 @@ static void notrace klp_ftrace_handler(unsigned long ip,
>  	if (func->nop)
>  		goto unlock;
>  
> -	klp_arch_set_pc(fregs, (unsigned long)func->new_func);
> +	ftrace_instruction_pointer_set(fregs, (unsigned long)func->new_func);
>  
>  unlock:
>  	ftrace_test_recursion_unlock(bit);

So ptrace has instruction_pointer_set(), I'm not sure why we have yet
another variant in the ftrace_ namespace. Perhaps also delete that?
