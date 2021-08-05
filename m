Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD993E0DFC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 08:14:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgJGh0BKTz3cl6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 16:14:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LOp9N8lI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LOp9N8lI; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgJGB5g2tz307D
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 16:13:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GgJG20Slyz9sRR;
 Thu,  5 Aug 2021 16:13:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628144028;
 bh=AaeKzUY4cQd9+YNvX25PrxBV+zlU6inRR6HWZxDBVmU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LOp9N8lIe4VUmzG6DfvicD53CAUxPORkm0XJwE1a9xANkRb/+6ME4NuygO5GE8Mej
 ExH/jDhSMfhJXv4+iCYoZm0MPeG7qykHijpoR2O2QiyMoSZ54CKlTFyxl8Pb/HjWTj
 ojQtOwC8qzNZsF3BVu9cV8r0TbyqhcXzkroai6KiQ6XpKlPgwXHkQTQ24tBc6GKh0g
 gRcpOsuZYX4n2Qi4o2bDcTv2R8lmsHwCGjYXvrXvvDJDeomLdE66gJSKrCjtqDsR9R
 VNv3dEHvkny4A2J7R6e5KHPZaqJzpf5ARTAhbmU0E6cXiQUp5xJhiqNrhNiRpAk+3c
 Ea2XEXcIqSnaw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pu Lehui <pulehui@huawei.com>, oleg@redhat.com,
 benh@kernel.crashing.org, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, mhiramat@kernel.org,
 christophe.leroy@csgroup.eu, peterz@infradead.org, npiggin@gmail.com,
 ruscur@russell.cc
Subject: Re: [PATCH] powerpc/kprobes: Fix kprobe Oops happens in booke
In-Reply-To: <20210804143735.148547-1-pulehui@huawei.com>
References: <20210804143735.148547-1-pulehui@huawei.com>
Date: Thu, 05 Aug 2021 16:13:41 +1000
Message-ID: <87fsvoo1uy.fsf@mpe.ellerman.id.au>
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
Cc: zhangjinhao2@huawei.com, xukuohai@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pu Lehui <pulehui@huawei.com> writes:
> When using kprobe on powerpc booke series processor, Oops happens
> as show bellow:
>
> [   35.861352] Oops: Exception in kernel mode, sig: 5 [#1]
> [   35.861676] BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
> [   35.861905] Modules linked in:
> [   35.862144] CPU: 0 PID: 76 Comm: sh Not tainted 5.14.0-rc3-00060-g7e96bf476270 #18
> [   35.862610] NIP:  c0b96470 LR: c00107b4 CTR: c0161c80
> [   35.862805] REGS: c387fe70 TRAP: 0700   Not tainted (5.14.0-rc3-00060-g7e96bf476270)
> [   35.863198] MSR:  00029002 <CE,EE,ME>  CR: 24022824  XER: 20000000
> [   35.863577]
> [   35.863577] GPR00: c0015218 c387ff20 c313e300 c387ff50 00000004 40000002 40000000 0a1a2cce
> [   35.863577] GPR08: 00000000 00000004 00000000 59764000 24022422 102490c2 00000000 00000000
> [   35.863577] GPR16: 00000000 00000000 00000040 10240000 10240000 10240000 10240000 10220000
> [   35.863577] GPR24: ffffffff 10240000 00000000 00000000 bfc655e8 00000800 c387ff50 00000000
> [   35.865367] NIP [c0b96470] schedule+0x0/0x130
> [   35.865606] LR [c00107b4] interrupt_exit_user_prepare_main+0xf4/0x100
> [   35.865974] Call Trace:
> [   35.866142] [c387ff20] [c0053224] irq_exit+0x114/0x120 (unreliable)
> [   35.866472] [c387ff40] [c0015218] interrupt_return+0x14/0x13c
> [   35.866728] --- interrupt: 900 at 0x100af3dc
> [   35.866963] NIP:  100af3dc LR: 100de020 CTR: 00000000
> [   35.867177] REGS: c387ff50 TRAP: 0900   Not tainted (5.14.0-rc3-00060-g7e96bf476270)
> [   35.867488] MSR:  0002f902 <CE,EE,PR,FP,ME>  CR: 20022422  XER: 20000000
> [   35.867808]
> [   35.867808] GPR00: c001509c bfc65570 1024b4d0 00000000 100de020 20022422 bfc655a8 100af3dc
> [   35.867808] GPR08: 0002f902 00000000 00000000 00000000 72656773 102490c2 00000000 00000000
> [   35.867808] GPR16: 00000000 00000000 00000040 10240000 10240000 10240000 10240000 10220000
> [   35.867808] GPR24: ffffffff 10240000 00000000 00000000 bfc655e8 10245910 ffffffff 00000001
> [   35.869406] NIP [100af3dc] 0x100af3dc
> [   35.869578] LR [100de020] 0x100de020
> [   35.869751] --- interrupt: 900
> [   35.870001] Instruction dump:
> [   35.870283] 40c20010 815e0518 714a0100 41e2fd04 39200000 913e00c0 3b1e0450 4bfffd80
> [   35.870666] 0fe00000 92a10024 4bfff1a9 60000000 <7fe00008> 7c0802a6 93e1001c 7c5f1378
> [   35.871339] ---[ end trace 23ff848139efa9b9 ]---
>
> There is no real mode for booke arch and the MMU translation is
> always on. The corresponding MSR_IS/MSR_DS bit in booke is used
> to switch the address space, but not for real mode judgment.
>
> Fixes: 21f8b2fa3ca5 ("powerpc/kprobes: Ignore traps that happened in real mode")
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  arch/powerpc/include/asm/ptrace.h | 6 ++++++
>  arch/powerpc/kernel/kprobes.c     | 5 +----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index 3e5d470a6155..4aec1a97024b 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -187,6 +187,12 @@ static inline unsigned long frame_pointer(struct pt_regs *regs)
>  #define user_mode(regs) (((regs)->msr & MSR_PR) != 0)
>  #endif
>  
> +#ifdef CONFIG_BOOKE
> +#define real_mode(regs)	0
> +#else
> +#define real_mode(regs)	(!((regs)->msr & MSR_IR) || !((regs)->msr & MSR_DR))
> +#endif

I'm not sure about this helper.

Arguably it should only return true if both MSR_IR and MSR_DR are clear.


> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index cbc28d1a2e1b..fac9a5974718 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -289,10 +289,7 @@ int kprobe_handler(struct pt_regs *regs)
>  	unsigned int *addr = (unsigned int *)regs->nip;
>  	struct kprobe_ctlblk *kcb;
>  
> -	if (user_mode(regs))
> -		return 0;
> -
> -	if (!(regs->msr & MSR_IR) || !(regs->msr & MSR_DR))
> +	if (user_mode(regs) || real_mode(regs))
>  		return 0;

I think just adding an IS_ENABLED(CONFIG_BOOKE) here might be better.

cheers
