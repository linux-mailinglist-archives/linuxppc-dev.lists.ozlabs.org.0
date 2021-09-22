Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B4B4141F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 08:33:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDpQc0v3Dz2ywk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:33:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VUnofnTg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VUnofnTg; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDpPy29pXz2yJ7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 16:32:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632292372;
 bh=oOKtcnE42E4GjwCCGGuvDi0A9xV8AbB9AZO0apESED4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VUnofnTgoYy5agZFqINorFC5BF/f1NF6P0JmO6XMO+PAkKRvvE7syS4y9/jTg8WQc
 C5a8SGdZAQUaaga0BSjmXM8tk1xAv6XI4nWkWdk6rGI8smqGF33qViCjMHKtZygObX
 6O3VqWxcgdZroENvAldBPtLtbyOfOj/hVj6SUZ76a73J9KZZgd3jK09ydGagoFAScR
 XuJtnceCqYCSVlf37W/HaLAgtlBiDaYUUnP0Gx2pVPGEpfLI+U/di/KbA/7N4lA0mS
 GZZCfwWx0akG42Yc+DmQw4in+KQWO+H1ZECEWW86WFKTCZE7NdKtAjGGom4ROqC3xa
 B9clYvLOteUiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HDpPw0YnLz9s0r;
 Wed, 22 Sep 2021 16:32:51 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
In-Reply-To: <20210921031213.2029824-1-nathanl@linux.ibm.com>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
Date: Wed, 22 Sep 2021 16:32:47 +1000
Message-ID: <87fstxi0hc.fsf@mpe.ellerman.id.au>
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> vcpu_is_preempted() can be used outside of preempt-disabled critical
> sections, yielding warnings such as:
>
> BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
> caller is rwsem_spin_on_owner+0x1cc/0x2d0
> CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
> Call Trace:
> [c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
> [c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
> [c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
> [c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
> [c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
> [c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
> [c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
> [c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
> [c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250
>
> The result of vcpu_is_preempted() is always subject to invalidation by
> events inside and outside of Linux; it's just a best guess at a point in
> time. Use raw_smp_processor_id() to avoid such warnings.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: ca3f969dcb11 ("powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()")
> ---
>  arch/powerpc/include/asm/paravirt.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index bcb7b5f917be..e429aca566de 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -97,7 +97,14 @@ static inline bool vcpu_is_preempted(int cpu)
>  
>  #ifdef CONFIG_PPC_SPLPAR
>  	if (!is_kvm_guest()) {
> -		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
> +		int first_cpu;
> +
> +		/*
> +		 * This is only a guess at best, and this function may be
> +		 * called with preemption enabled. Using raw_smp_processor_id()
> +		 * does not damage accuracy.
> +		 */
> +		first_cpu = cpu_first_thread_sibling(raw_smp_processor_id());

This change seems good, except I think the comment needs to be a lot
more explicit about what it's doing and why.

A casual reader is going to be confused about vcpu preemption vs
"preemption", which are basically unrelated yet use the same word.

It's not clear how raw_smp_processor_id() is related to (Linux)
preemption, unless you know that smp_processor_id() is the alternative
and it contains a preemption check.

And "this is only a guess" is not clear on what *this* is, you're
referring to the result of the whole function, but that's not obvious.

>  		/*
>  		 * Preemption can only happen at core granularity. This CPU
                   ^^^^^^^^^^
                   Means something different to "preemption" above.

I know you didn't write that comment, and maybe we need to rewrite some
of those existing comments to make it clear they're not talking about
Linux preemption.

cheers
