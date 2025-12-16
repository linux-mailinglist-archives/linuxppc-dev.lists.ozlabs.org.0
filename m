Return-Path: <linuxppc-dev+bounces-14795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0ECC1C7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVs6j3T0pz2yDY;
	Tue, 16 Dec 2025 20:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765877293;
	cv=none; b=E2X9uV3PqzI1nulh8huzcXj8CRoEd/mvcNed32RthsEzpgoega+WDw5KnBWD2LvYHsO7kxEFpvjAaKh1nfQ8OfqlA94Epk847SUFsoNu4y/e8RVJZZrcNP/clv0BI9IFllwtnWBI9RIse+QrdQDS0pViDjEIWiGOcdaUD11IXoaqFq2/GbxSfe+sN6tsSJBMpcDeT1xLI+z0XmUSZk0DBCMNnnvk/dZABvJ8HaKsro6VpDwnc+BhOu99OR4yZI9AF0xUTKwwzlVKUDGMLy56Qrg6CpSa4BQIoRqbDMaxjKfn042LtQeAODTmvQmR4Yq1sQThNZJ0TDePCt8+/5Dg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765877293; c=relaxed/relaxed;
	bh=KsXTvpgITYNFaINVMe9eA2xnV4cOVXwaNRovKXYc3iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DNYA0Am1OhVoz5p9xhBzqRXoy6vtdmYXjlQ7wbfH2p6bUUHEXzFmUcrzFNeEnmW+26nzKjmdNTxxNZWgZ9BqKGMHDR1MwED7W81Eof97toTF0jV1A74izY6sOE2nulTFPa/mykA6RGGgcp6lgWnHe5KL77Sk4D6XphgFJ6o5IiNuZ0LcYtJjXz26W3YI4IS6tfl3lk+cIYgTNF0EmsSnQhxdG6Q4w2J5smqXZqdSKtequNKsGnx2UL6WHm3lrSF4hcsYaryG6GDcg5XjV3yx89nHdxN4dYe6lnwQXuZ9OxPB9jRTQdHbHMOVyTXU6taeyjiq6+0XCdXg18NnwU91eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sWRkCu9N; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sWRkCu9N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVs6h1sZrz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:28:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BA3560010;
	Tue, 16 Dec 2025 09:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C02C4CEF1;
	Tue, 16 Dec 2025 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765877288;
	bh=nskcN7+91SwtgZwPitOrm1ZJ0MeQwA3xHMNEFW8+0oY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=sWRkCu9NOgjPX6PNLc8hQbcOAZYgA8KLJlG7Si2JGSSTZ8YYXl6NZdRTjutUC6oU9
	 iXFTseEBFKZd0zEnk3sSFPyxaM/oDTiYAUxTxluTcZJeaUE0+TEfIPbcppgL/PyNSl
	 6bqUwev1dpznsxBkgwIqWNYlhh8BW7PD1TIIP3BqG+8ND6YFcg/wgXgavowJAm9ODf
	 fwzpjSHZSvSIBMkuRDz1wHWUZu+vgXYGnD/2CTYu+5f/0Pt0G0CjKzJ+pFCgTtRr1A
	 n4GuCBASCZkULN9uitTBDXcD0jYcgnYEb/ZEvf8YYDF1LmbX0p9Gcvo71pg5KgnKdT
	 IstK6WR+LQU6g==
Message-ID: <cddd0a2c-10e1-493a-9a02-521a1770c675@kernel.org>
Date: Tue, 16 Dec 2025 10:27:55 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] powerpc: Prepare to build with generic entry/exit
 framework
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, oleg@redhat.com, kees@kernel.org,
 luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
 thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
 macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
 ankur.a.arora@oracle.com, segher@kernel.crashing.org, tglx@linutronix.de,
 thomas.weissschuh@linutronix.de, peterz@infradead.org,
 menglong8.dong@gmail.com, bigeasy@linutronix.de, namcao@linutronix.de,
 kan.liang@linux.intel.com, mingo@kernel.org, atrajeev@linux.vnet.ibm.com,
 mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-3-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-3-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> This patch introduces preparatory changes needed to support building
> PowerPC with the generic entry/exit (irqentry) framework.
> 
> The following infrastructure updates are added:
>   - Add a syscall_work field to struct thread_info to hold SYSCALL_WORK_* flags.
>   - Provide a stub implementation of arch_syscall_is_vdso_sigreturn(),
>     returning false for now.
>   - Introduce on_thread_stack() helper to detect if the current stack pointer
>     lies within the task’s kernel stack.
> 
> These additions enable later integration with the generic entry/exit
> infrastructure while keeping existing PowerPC behavior unchanged.
> 
> No functional change is intended in this patch.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/entry-common.h | 11 +++++++++++
>   arch/powerpc/include/asm/stacktrace.h   |  6 ++++++
>   arch/powerpc/include/asm/syscall.h      |  5 +++++
>   arch/powerpc/include/asm/thread_info.h  |  1 +
>   4 files changed, 23 insertions(+)
>   create mode 100644 arch/powerpc/include/asm/entry-common.h
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> new file mode 100644
> index 000000000000..3af16d821d07
> --- /dev/null
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_PPC_ENTRY_COMMON_H
> +#define _ASM_PPC_ENTRY_COMMON_H
> +
> +#ifdef CONFIG_GENERIC_IRQ_ENTRY

Why do you need this #ifdef ? I see no reason, the build works well 
without this #ifdef.

At the time being, CONFIG_GENERIC_IRQ_ENTRY is never selected by 
powerpc, meaning you are introducing dead code. If really needed it 
would be more explicit to add a "#if 0"

> +
> +#include <asm/stacktrace.h>
> +
> +#endif /* CONFIG_GENERIC_IRQ_ENTRY */
> +#endif /* _ASM_PPC_ENTRY_COMMON_H */
> diff --git a/arch/powerpc/include/asm/stacktrace.h b/arch/powerpc/include/asm/stacktrace.h
> index 6149b53b3bc8..a81a9373d723 100644
> --- a/arch/powerpc/include/asm/stacktrace.h
> +++ b/arch/powerpc/include/asm/stacktrace.h
> @@ -10,4 +10,10 @@
>   
>   void show_user_instructions(struct pt_regs *regs);
>   
> +static inline bool on_thread_stack(void)

Shouldn't it be __always_inline ?

> +{
> +	return !(((unsigned long)(current->stack) ^ current_stack_pointer)
> +			& ~(THREAD_SIZE - 1));
> +}
> +
>   #endif /* _ASM_POWERPC_STACKTRACE_H */
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 4b3c52ed6e9d..834fcc4f7b54 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -139,4 +139,9 @@ static inline int syscall_get_arch(struct task_struct *task)
>   	else
>   		return AUDIT_ARCH_PPC64;
>   }
> +
> +static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> +{
> +	return false;
> +}
>   #endif	/* _ASM_SYSCALL_H */
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index b0f200aba2b3..9c8270354f0b 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -57,6 +57,7 @@ struct thread_info {
>   #ifdef CONFIG_SMP
>   	unsigned int	cpu;
>   #endif
> +	unsigned long	syscall_work;		/* SYSCALL_WORK_ flags */

This is not used, why add it here ?

>   	unsigned long	local_flags;		/* private flags for thread */
>   #ifdef CONFIG_LIVEPATCH_64
>   	unsigned long *livepatch_sp;


