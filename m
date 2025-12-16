Return-Path: <linuxppc-dev+bounces-14801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFDCCC1DE9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:53:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVsgr588Bz2yDY;
	Tue, 16 Dec 2025 20:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765878808;
	cv=none; b=J8mGws7cX5e9Nd1+Ria0sk8y/EafC5uhCruA5uoPbIAaaV3TQWlfk6f7H4YAplbKDTiufMWK7jrLfoyPlkhHpGdr29Pe2nQP6/encTLn9wp6b4YOfAT2elWP/YOemvF/ectGJGzl+YQKcXQZhth1rf+GHFPIxC+PalxWw/+FnLo3+Kh1qpp5TIQQf6j3ipw8OaNf9laoKwR5QnezAaxCPA/Ud9RnlLCPcXNJd1o1C+FTwkZJLSTMkdvzOZlLTzZOOFBR6c1tl4+qTyccBwysECxPBr8+reCCG5pyfRYLHLympWRTc/qRBcczgX8/9/2SPhNCTT452gt+UufJKB30Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765878808; c=relaxed/relaxed;
	bh=ORrYqd+amgGs7eSjeJ8CV5V2ov4vFG7WuH81kCsydQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aHdDsILetPRHfr90mCf7HW9pj90hjuBT7N5fi1dY8Dom/R82/13Ba9BbHpobxBAqDItG/3fVEPPY77z3zPknPVE+2d85sAHqAVjBIUkQL6wbqCHYCt5scWdSadYVihpVF4CxU7YrydgMiIn9RvUivQ/AUuApuBCXfDsBNT8AGdHCHnbPIkbadfIE/mFc3Q/IA1lduxUZhLm/rQ21G8A2av9E/4/rW4B5OIE5C1DmomQDSC91Ify8X1CRaPe5aoZXXOxqr0RCsel2Gcvzf0Sc9J7/cz/wnckGjDaVX1YJgUDi73ygDwK2aKseUGqWIqpe+N8O7YtbukgB6sp32PmJew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bV+WUVyZ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bV+WUVyZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVsgq50nRz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:53:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A80F600CB;
	Tue, 16 Dec 2025 09:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87712C4CEF1;
	Tue, 16 Dec 2025 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765878775;
	bh=am8FPRVTaS1hjf4rslIoT/bUpHSPVBgphVi4D0noIaI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bV+WUVyZ27oq1R92uhpydzQhEiCsH8ievxu3KVH5x5r/YcJFwjgGnDhxZy3ibk4Hv
	 EpTxaTJ8Em/AfI4F2t8HG1H32zLp3iN1PMH9pa7JG2V4If0CqkrIDdjbkXizohhL66
	 YprPaYnCtoIaQLaguyOp7oavcCgkDwYCi4FLhQ0OuPCzymrP1Bg+yZBz8US0CcCXLt
	 mEpSSXL35AW8sx2Ey86gAd3CBcltEvpO9oLSudb0vkFyH+2l4GbH57CF7QBNBjldzR
	 4yFOAFtZCZGZ0+VQBR/bqUVVtffnwd5hN/+Vv73QNeMp5cx8Je+DDOvQI51B5xOugv
	 aAN2lpLbKNMjw==
Message-ID: <dc0edfb4-d2bc-43be-9221-a1acb1cae5ec@kernel.org>
Date: Tue, 16 Dec 2025 10:52:42 +0100
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
Subject: Re: [PATCH v2 5/8] powerpc: add exit_flags field in pt_regs
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
 <20251214130245.43664-6-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-6-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Add a new field `exit_flags` in the pt_regs structure. This field will hold
> the flags set during interrupt or syscall execution that are required during
> exit to user mode.
> 
> Specifically, the `TIF_RESTOREALL` flag, stored in this field, helps the
> exit routine determine if any NVGPRs were modified and need to be restored
> before returning to userspace.

In the current implementation we did our best to keep this information 
in a local var for performance reasons. Have you assessed the 
performance impact of going through the stack for that ?

> 
> This addition ensures a clean and architecture-specific mechanism to track
> per-syscall or per-interrupt state transitions related to register restore.
> 
> Changes:
>   - Add `exit_flags` and `__pt_regs_pad` to maintain 16-byte stack alignment
>   - Update asm-offsets.c and ptrace.c for offset and validation
>   - Update PT_* constants in uapi header to reflect the new layout
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/ptrace.h      |  3 +++
>   arch/powerpc/include/uapi/asm/ptrace.h | 14 +++++++++-----
>   arch/powerpc/kernel/asm-offsets.c      |  1 +
>   arch/powerpc/kernel/ptrace/ptrace.c    |  1 +
>   4 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index 94aa1de2b06e..3af8a5898fe3 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -53,6 +53,9 @@ struct pt_regs
>   				unsigned long esr;
>   			};
>   			unsigned long result;
> +			unsigned long exit_flags;
> +			/* Maintain 16 byte interrupt stack alignment */

On powerpc/32, one 'long' is 4 bytes not 8.

> +			unsigned long __pt_regs_pad[1];
>   		};
>   	};
>   #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_KUAP)
> diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
> index 01e630149d48..de56b216c9c5 100644
> --- a/arch/powerpc/include/uapi/asm/ptrace.h
> +++ b/arch/powerpc/include/uapi/asm/ptrace.h
> @@ -55,6 +55,8 @@ struct pt_regs
>   	unsigned long dar;		/* Fault registers */
>   	unsigned long dsisr;		/* on 4xx/Book-E used for ESR */
>   	unsigned long result;		/* Result of a system call */
> +	unsigned long exit_flags;	/* System call exit flags */
> +	unsigned long __pt_regs_pad[1];	/* Maintain 16 byte interrupt stack alignment */

On powerpc/32, one 'long' is 4 bytes not 8.

>   };
>   
>   #endif /* __ASSEMBLER__ */
> @@ -114,10 +116,12 @@ struct pt_regs
>   #define PT_DAR	41
>   #define PT_DSISR 42
>   #define PT_RESULT 43
> -#define PT_DSCR 44
> -#define PT_REGS_COUNT 44
> +#define PT_EXIT_FLAGS 44
> +#define PT_PAD 45
> +#define PT_DSCR 46
> +#define PT_REGS_COUNT 46
>   
> -#define PT_FPR0	48	/* each FP reg occupies 2 slots in this space */
> +#define PT_FPR0	(PT_REGS_COUNT + 4)	/* each FP reg occupies 2 slots in this space */
>   
>   #ifndef __powerpc64__
>   
> @@ -129,7 +133,7 @@ struct pt_regs
>   #define PT_FPSCR (PT_FPR0 + 32)	/* each FP reg occupies 1 slot in 64-bit space */
>   
>   
> -#define PT_VR0 82	/* each Vector reg occupies 2 slots in 64-bit */
> +#define PT_VR0	(PT_FPSCR + 2)	/* <82> each Vector reg occupies 2 slots in 64-bit */
>   #define PT_VSCR (PT_VR0 + 32*2 + 1)
>   #define PT_VRSAVE (PT_VR0 + 33*2)
>   
> @@ -137,7 +141,7 @@ struct pt_regs
>   /*
>    * Only store first 32 VSRs here. The second 32 VSRs in VR0-31
>    */
> -#define PT_VSR0 150	/* each VSR reg occupies 2 slots in 64-bit */
> +#define PT_VSR0	(PT_VRSAVE + 2)	/* each VSR reg occupies 2 slots in 64-bit */
>   #define PT_VSR31 (PT_VSR0 + 2*31)
>   #endif /* __powerpc64__ */
>   
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index a4bc80b30410..c0bb09f1db78 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -292,6 +292,7 @@ int main(void)
>   	STACK_PT_REGS_OFFSET(_ESR, esr);
>   	STACK_PT_REGS_OFFSET(ORIG_GPR3, orig_gpr3);
>   	STACK_PT_REGS_OFFSET(RESULT, result);
> +	STACK_PT_REGS_OFFSET(EXIT_FLAGS, exit_flags);

Where is that used ?

>   	STACK_PT_REGS_OFFSET(_TRAP, trap);
>   #ifdef CONFIG_PPC64
>   	STACK_PT_REGS_OFFSET(SOFTE, softe);
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index c6997df63287..2134b6d155ff 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -432,6 +432,7 @@ void __init pt_regs_check(void)
>   	CHECK_REG(PT_DAR, dar);
>   	CHECK_REG(PT_DSISR, dsisr);
>   	CHECK_REG(PT_RESULT, result);
> +	CHECK_REG(PT_EXIT_FLAGS, exit_flags);
>   	#undef CHECK_REG
>   
>   	BUILD_BUG_ON(PT_REGS_COUNT != sizeof(struct user_pt_regs) / sizeof(unsigned long));


