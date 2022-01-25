Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8F49B30E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 12:46:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjlS04jXBz3bb7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 22:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E61Fp0d9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjlRK2LKpz2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 22:45:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=E61Fp0d9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JjlRC2rn1z4xmj;
 Tue, 25 Jan 2022 22:45:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643111143;
 bh=3viCN3BwdlfpdJwC0C4uIZqqjBgEpns0SlOnhYgOkr0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=E61Fp0d9lPbxt4mVc2WmjEkCp3SvcbRQwvg3KI/bAyVFVjc/CoT+hs+276kgSd2Wm
 X5qAnrErfSGZlMzlPUORjg+hHEd4zBVBcLKVYtDLGvzrenMbcYtjE1ndLp4h26WJ2G
 3F+7Fc/e4q2JdyfVBPV22kfo0GH+xYhcc/p1sDxzz2eJRFNaSWUy8eCYDR4XW9GG+c
 BTkfF+elughGlqeEfKtQBphaxVEu8GJPTuUYrukWENZLai6PGGLUvdiiQoAhWZf4IH
 bdrSEDb3LytGHkciGXeh4SaPdLPt4aih6oUh+4KRyww/0YsEYo4+IFgrmwUVzeMtTU
 Tibxe/2JBp5cg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/uprobes: Reject uprobe on a system call
 instruction
In-Reply-To: <20220124055741.3686496-3-npiggin@gmail.com>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <20220124055741.3686496-3-npiggin@gmail.com>
Date: Tue, 25 Jan 2022 22:45:38 +1100
Message-ID: <874k5sm42l.fsf@mpe.ellerman.id.au>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Per the ISA, a Trace interrupt is not generated for a system call
> [vectored] instruction. Reject uprobes on such instructions as we are
> not emulating a system call [vectored] instruction anymore.

This should really be patch 1, otherwise there's a single commit window
where we allow uprobes on sc but don't honour them.

> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> [np: Switch to pr_info_ratelimited]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h | 1 +
>  arch/powerpc/kernel/uprobes.c         | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
> index 9675303b724e..8bbe16ce5173 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -411,6 +411,7 @@
>  #define PPC_RAW_DCBFPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (4 << 21))
>  #define PPC_RAW_DCBSTPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (6 << 21))
>  #define PPC_RAW_SC()			(0x44000002)
> +#define PPC_RAW_SCV()			(0x44000001)
>  #define PPC_RAW_SYNC()			(0x7c0004ac)
>  #define PPC_RAW_ISYNC()			(0x4c00012c)
>  
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index c6975467d9ff..3779fde804bd 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -41,6 +41,12 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
>  	if (addr & 0x03)
>  		return -EINVAL;
>  
> +	if (ppc_inst_val(ppc_inst_read(auprobe->insn)) == PPC_RAW_SC() ||
> +	    ppc_inst_val(ppc_inst_read(auprobe->insn)) == PPC_RAW_SCV()) {

We should probably reject hypercall too?

There's also a lot of reserved fields in `sc`, so doing an exact match
like this risks missing instructions that are badly formed but the CPU
will happily execute as `sc`.

We'd obviously never expect to see those in compiler generated code, but
it'd still be safer to mask. We could probably just reject opcode 17
entirely.

And I guess for a subsequent patch, but we should be rejecting some
others here as well shouldn't we? Like rfid etc.

cheers


> +		pr_info_ratelimited("Rejecting uprobe on system call instruction\n");
> +		return -EINVAL;
> +	}
> +
>  	if (cpu_has_feature(CPU_FTR_ARCH_31) &&
>  	    ppc_inst_prefixed(ppc_inst_read(auprobe->insn)) &&
>  	    (addr & 0x3f) == 60) {
> -- 
> 2.23.0
