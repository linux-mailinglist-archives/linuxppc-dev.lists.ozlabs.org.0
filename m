Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 235FC3FC44A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 10:54:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzLbw0Gjmz2yPj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 18:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FhH9lOPu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzLb570GNz2xh1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 18:54:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f3fv6g3WY1dNgkG1wWMP0wIKttOnssZK8A7WNBphc38=; b=FhH9lOPu/UT4X9v1NnmpLuw2EZ
 5m6zNh3HxcxPVEZn9orUKyQESgZfnWmM4cBdWQHXL17LPDEJ9M+eVFGkzzzKpGYvyHKkg8bN3kq2h
 PWlMv4gbuCOGgWN7uF/wQSmnk1dBVkHbFDnZJ+sgqH5+GNdmgi7aIGFuiYeBoixBVvax+BVhG2zgU
 Yn6gokFvr+M0kPUDN0x+cQHeN3lElOwiCSFdcTlTmWstGKTTZwBXyBVUr/lVR8d7XHL1AoOIj3j6X
 lMDMIwUF+KEY8oe88w2E8SIYJpuw9sPoaFm6faSl7xDW9z/xZA4giX4VDdmmQDFhzsjBOfxga65Nw
 t8vfKdZw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzWD-00Eeoz-Hi; Tue, 31 Aug 2021 08:53:21 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3D918300109;
 Tue, 31 Aug 2021 10:53:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1780A2C7BAE48; Tue, 31 Aug 2021 10:53:18 +0200 (CEST)
Date: Tue, 31 Aug 2021 10:53:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Add support for out-of-line static calls
Message-ID: <YS3t/s9nojyCn9ev@hirez.programming.kicks-ass.net>
References: <cbfc0376461d02867c75cee72bb9167e16f4d0b0.1630396954.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbfc0376461d02867c75cee72bb9167e16f4d0b0.1630396954.git.christophe.leroy@csgroup.eu>
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

On Tue, Aug 31, 2021 at 08:05:21AM +0000, Christophe Leroy wrote:

> +#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
> +	asm(".pushsection .text, \"ax\"				\n"	\
> +	    ".align 4						\n"	\
> +	    ".globl " STATIC_CALL_TRAMP_STR(name) "		\n"	\
> +	    STATIC_CALL_TRAMP_STR(name) ":			\n"	\
> +	    "	blr						\n"	\
> +	    "	nop						\n"	\
> +	    "	nop						\n"	\
> +	    "	nop						\n"	\
> +	    ".type " STATIC_CALL_TRAMP_STR(name) ", @function	\n"	\
> +	    ".size " STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
> +	    ".popsection					\n")

> +static int patch_trampoline_32(u32 *addr, unsigned long target)
> +{
> +	int err;
> +
> +	err = patch_instruction(addr++, ppc_inst(PPC_RAW_LIS(_R12, PPC_HA(target))));
> +	err |= patch_instruction(addr++, ppc_inst(PPC_RAW_ADDI(_R12, _R12, PPC_LO(target))));
> +	err |= patch_instruction(addr++, ppc_inst(PPC_RAW_MTCTR(_R12)));
> +	err |= patch_instruction(addr, ppc_inst(PPC_RAW_BCTR()));
> +
> +	return err;
> +}

There can be concurrent execution and modification; the above doesn't
look safe in that regard. What happens if you've say, done the first
two, but not the latter two and execution happens (on a different
CPU or through IRQ context, etc..)?

> +void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
> +{
> +	int err;
> +	unsigned long target = (long)func;
> +
> +	if (!tramp)
> +		return;
> +
> +	mutex_lock(&text_mutex);
> +
> +	if (!func)
> +		err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
> +	else if (is_offset_in_branch_range((long)target - (long)tramp))
> +		err = patch_branch(tramp, target, 0);

These two are single instruction modifications and I'm assuming the
hardware is sane enough that execution sees either the old or the new
instruction. So this should work.

> +	else if (IS_ENABLED(CONFIG_PPC32))
> +		err = patch_trampoline_32(tramp, target);
> +	else
> +		BUILD_BUG();
> +
> +	mutex_unlock(&text_mutex);
> +
> +	if (err)
> +		panic("%s: patching failed %pS at %pS\n", __func__, func, tramp);
> +}
> +EXPORT_SYMBOL_GPL(arch_static_call_transform);

One possible solution that we explored on ARM64, was having the
trampoline be in 2 slots:


	b 1f

1:	blr
	nop
	nop
	nop

2:	blr
	nop
	nop
	nop

Where initially the first slot is active (per "b 1f"), then you write
the second slot, and as a final act, re-write the initial branch to
point to slot 2.

Then you execute synchronize_rcu_tasks() under your text mutex
(careful!) to ensure all users of your slot1 are gone and the next
modification repeats the whole thing, except for using slot1 etc..

Eventually I think Ard came up with the latest ARM64 proposal which puts
a literal in a RO section (could be the text section I suppose) and
loads and branches to that.

Anyway, the thing is, you can really only modify a single instruction at
the time and need to ensure concurrent execution is correct.
