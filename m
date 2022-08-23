Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA959D49A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 10:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBjDq40KMz3bqn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:33:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DWH/riAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBjDJ33Rrz2xGM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 18:33:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DWH/riAm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MBjDH5BJcz4xYS;
	Tue, 23 Aug 2022 18:33:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661243600;
	bh=jzL+tYVj4e9+zENm5e4p359zO1COy5i/CDx3a5RuXi0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DWH/riAmZijXBMyFpMOiCjZL/u14KNbC33rDY2XPlmwRTlIHFZEyB3l4hZ6CutX2M
	 /hxh+Z+F6vNEwwgMah0o1MIoBK/i6qQfhDYcu9Ac4BZf6IxKGhWAcJIfsROANYVH0M
	 2cJCD7cGrgSm+6Hle+5F8DQiDlE3nNy4QRjFvW+n5WL+2Nkq4AKPDtSCDwkc9uk8QA
	 KEzBaddNdy74sR7hw0/y6OjlExq3oBBYjU97e95jCsGLYAR20kqphSEuAqjx6FngzL
	 qNIH2G9b0IyZaSi49GgtXATGN0SmKeTKjGlFe7UyPR4YxQbjQdI+Z1PfSv2CDedkjL
	 cs//ozxWcigLA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 lance@osuosl.org, paulmck@kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH linux-next] powerpc: disable sanitizer in irq_soft_mask_set
In-Reply-To: <20220821010030.97539-1-zhouzhouyi@gmail.com>
References: <20220821010030.97539-1-zhouzhouyi@gmail.com>
Date: Tue, 23 Aug 2022 18:33:14 +1000
Message-ID: <87edx7l5px.fsf@mpe.ellerman.id.au>
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> In ppc, compiler based sanitizer will generate instrument instructions
> around statement WRITE_ONCE(local_paca->irq_soft_mask, mask):
>
>    0xc000000000295cb0 <+0>:	addis   r2,r12,774
>    0xc000000000295cb4 <+4>:	addi    r2,r2,16464
>    0xc000000000295cb8 <+8>:	mflr    r0
>    0xc000000000295cbc <+12>:	bl      0xc00000000008bb4c <mcount>
>    0xc000000000295cc0 <+16>:	mflr    r0
>    0xc000000000295cc4 <+20>:	std     r31,-8(r1)
>    0xc000000000295cc8 <+24>:	addi    r3,r13,2354
>    0xc000000000295ccc <+28>:	mr      r31,r13
>    0xc000000000295cd0 <+32>:	std     r0,16(r1)
>    0xc000000000295cd4 <+36>:	stdu    r1,-48(r1)
>    0xc000000000295cd8 <+40>:	bl      0xc000000000609b98 <__asan_store1+8>
>    0xc000000000295cdc <+44>:	nop
>    0xc000000000295ce0 <+48>:	li      r9,1
>    0xc000000000295ce4 <+52>:	stb     r9,2354(r31)
>    0xc000000000295ce8 <+56>:	addi    r1,r1,48
>    0xc000000000295cec <+60>:	ld      r0,16(r1)
>    0xc000000000295cf0 <+64>:	ld      r31,-8(r1)
>    0xc000000000295cf4 <+68>:	mtlr    r0
>
> If there is a context switch before "stb     r9,2354(r31)", r31 may
> not equal to r13, in such case, irq soft mask will not work.
>
> This patch disable sanitizer in irq_soft_mask_set.
>
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Dear PPC developers
>
> I found this bug when trying to do rcutorture tests in ppc VM of
> Open Source Lab of Oregon State University following Paul E. McKenny's guidance.
>
> console.log report following bug:
>
> [  346.527467][  T100] BUG: using smp_processor_id() in preemptible [00000000] code: rcu_torture_rea/100^M
> [  346.529416][  T100] caller is rcu_preempt_deferred_qs_irqrestore+0x74/0xed0^M
> [  346.531157][  T100] CPU: 4 PID: 100 Comm: rcu_torture_rea Tainted: G        W          5.19.0-rc5-next-20220708-dirty #253^M
> [  346.533620][  T100] Call Trace:^M
> [  346.534449][  T100] [c0000000094876c0] [c000000000ce2b68] dump_stack_lvl+0xbc/0x108 (unreliable)^M
> [  346.536632][  T100] [c000000009487710] [c000000001712954] check_preemption_disabled+0x154/0x160^M
> [  346.538665][  T100] [c0000000094877a0] [c0000000002ce2d4] rcu_preempt_deferred_qs_irqrestore+0x74/0xed0^M
> [  346.540830][  T100] [c0000000094878b0] [c0000000002cf3c0] __rcu_read_unlock+0x290/0x3b0^M
> [  346.542746][  T100] [c000000009487910] [c0000000002bb330] rcu_torture_read_unlock+0x30/0xb0^M
> [  346.544779][  T100] [c000000009487930] [c0000000002b7ff8] rcutorture_one_extend+0x198/0x810^M
> [  346.546851][  T100] [c000000009487a10] [c0000000002b8bfc] rcu_torture_one_read+0x58c/0xc90^M
> [  346.548844][  T100] [c000000009487ca0] [c0000000002b942c] rcu_torture_reader+0x12c/0x360^M
> [  346.550784][  T100] [c000000009487db0] [c0000000001de978] kthread+0x1e8/0x220^M
> [  346.552555][  T100] [c000000009487e10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64^M
>
> After 12 days debugging, I finally narrow the problem to irq_soft_mask_set.

Thanks for spending 12 days debugging it! O_o

> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 26ede09c521d..a5ae8d82cc9d 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_return(void)
>   * for the critical section and as a clobber because
>   * we changed paca->irq_soft_mask
>   */
> -static inline notrace void irq_soft_mask_set(unsigned long mask)
> +static inline notrace __no_kcsan __no_sanitize_address void irq_soft_mask_set(unsigned long mask)
>  {
>  	/*
>  	 * The irq mask must always include the STD bit if any are set.

My worry is that this will force irq_soft_mask_set() out of line, which
we would rather avoid. It's meant to be a fast path.

In fact with this applied I see nearly 300 out-of-line copies of the
function when building a defconfig, and ~1700 calls to it.

Normally it is inlined at every call site.


So I think I'm inclined to revert ef5b570d3700 ("powerpc/irq: Don't open
code irq_soft_mask helpers").

It was a nice looking cleanup, but those loads must not be instrumented
by KASAN, but we also want them inlined, and AFAICS the only way to
achieve that is to go back to inline asm.

cheers
