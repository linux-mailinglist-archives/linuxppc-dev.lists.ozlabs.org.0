Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A959B3BCA45
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 12:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJzgV4rH4z3bXr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 20:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJzg86FHVz2yWr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 20:43:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GJzg27570zBFbj;
 Tue,  6 Jul 2021 12:43:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nn1Mb2WTkRyn; Tue,  6 Jul 2021 12:43:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GJzg269BSzBFbg;
 Tue,  6 Jul 2021 12:43:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD0038B7A5;
 Tue,  6 Jul 2021 12:43:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9s8Xhydx-Ix2; Tue,  6 Jul 2021 12:43:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6893A8B7A3;
 Tue,  6 Jul 2021 12:43:26 +0200 (CEST)
Subject: Re: Hitting BUG_ON in do_notify_resume() with gdb and SIGTRAP
To: Radu Rendec <radu.rendec@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <6b5327e32549860c1e6c73e5b669528bfb383df2.camel@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d02fca74-933b-4586-496b-65511e435628@csgroup.eu>
Date: Tue, 6 Jul 2021 12:43:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6b5327e32549860c1e6c73e5b669528bfb383df2.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/07/2021 à 23:38, Radu Rendec a écrit :
> Hi Everyone,
> 
> I'm trying to set up my (virtual) environment to test an old bug in the
> PPC32 ptrace() code. I came across a completely different problem,
> which seems to make gdb pretty much unusable on PPC32. I'm not sure if
> this is a real kernel bug or maybe something wrong with my
> configuration.
> 
> I'm running kernel 5.13 in a qemu VM with one e500mc CPU. I am running
> native gdb (inside the VM) and setting a breakpoint in main() in a test
> "hello world" program. Upon running the test program, I am hitting the
> BUG_ON in do_notify_resume() on line 292. The kernel bug log snippet is
> included below at the end of the email.
> 
> FWIW, gdb says:
> Program terminated with signal SIGTRAP, Trace/breakpoint trap.
> The program no longer exists.
> 
> I also added a pr_info() to do_notify_resume() just to see how much
> different 'regs' and 'current->thread.regs' are. Surprisingly, they are
> just 0x30 apart: regs=c7955f10 cur=c7955f40. Also, 'current' seems to
> be OK (pid and comm are consistent with the test program).

The TRAP = 0x7d8 is obviously wrong.

Need to know which 'TRAP' it is exactly.
Could you try to dump what we have at the correct regs ?
Something like 'show_regs(current->thread.regs)' should do it.


> 
> If I'm not missing something, the 'regs' pointer that is eventually
> passed to do_notify_resume() is calculated in interrupt_return() by
> adding STACK_FRAME_OVERHEAD (defined to 112) to the value of r1. That
> means all registers are saved on the stack before entering the
> interrupt handler and, upon returning, a pointer to the register
> structure is calculated from the stack pointer. Either the offset
> itself is wrong, or the stack pointer is off by 0x30.
> 
> This is as far as I have gone. Hopefully this rings a bell to someone
> who is familiar with that part of the code and has a better
> understanding of PPC32 interrupt handling in general.
> 
> Last but not least, my configuration is fairly standard. I'm using the
> powerpc-e500mc--glibc--bleeding-edge-2020.08-1 toolchain from Bootlin
> to compile everything (kernel and user-space). The qemu version is
> 5.2.0 (Fedora 34) and the user-space is a small Busybox based rootfs
> that I built using Buildroot 2021.05. The gdb version is 9.2.
> 
> regs=c7955f10 cur=c7955f40 pid=138 comm=test
> ------------[ cut here ]------------
> kernel BUG at arch/powerpc/kernel/signal.c:296!
> Oops: Exception in kernel mode, sig: 5 [#1]
> BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
> Modules linked in:
> CPU: 0 PID: 138 Comm: test Not tainted 5.13.0-dirty #3
> NIP:  c0009694 LR: c0009694 CTR: c065f540
> REGS: c7955dc0 TRAP: 0700   Not tainted  (5.13.0-dirty)
> MSR:  00028002 <CE,EE>  CR: 28000282  XER: 20000000
> 
> GPR00: c0009694 c7955e80 c7145100 0000002c dfbdc3d4 dfbe5d24 00000027 dfbdc3d8
> GPR08: c0ffe988 00000000 00000000 00000000 22000282 00000000 00000000 b7fe17b4
> GPR16: 00000000 b7ffd588 b7ffe8b8 b7ffee10 b7fff214 b7ffdf40 b7fff208 bffff858
> GPR24: bffff970 b7fff130 00000001 bffff960 c7955f10 00000800 c7145100 00000102
> NIP [c0009694] do_notify_resume+0x314/0x320
> LR [c0009694] do_notify_resume+0x314/0x320
> Call Trace:
> [c7955e80] [c0009694] do_notify_resume+0x314/0x320 (unreliable)
> [c7955ee0] [c0010b94] interrupt_exit_user_prepare+0x94/0xc0
> [c7955f00] [c00151e8] interrupt_return+0x14/0x13c
> --- interrupt: 7d8 at 0xb7fc3714
> NIP:  b7fc3714 LR: b7fc3714 CTR: 00000003
> REGS: c7955f10 TRAP: 07d8   Not tainted  (5.13.0-dirty)
> MSR:  1002d002 <CE,EE,PR,ME>  CR: 22000284  XER: 00000000
> 
> GPR00: b7fc3584 bffff850 00000000 00000000 00000000 00000000 000000a0 6474e552
> GPR08: b7fbe0d4 00000001 b7fff230 bffff850 b7fc36d8 00000000 00000000 b7fe17b4
> GPR16: 00000000 b7ffd588 b7ffe8b8 b7ffee10 b7fff214 b7ffdf40 b7fff208 bffff858
> GPR24: bffff970 b7fff130 00000001 bffff960 b7fff2b0 b7ffd5f0 b7ffe8a8 bffff850
> NIP [b7fc3714] 0xb7fc3714
> LR [b7fc3714] 0xb7fc3714
> --- interrupt: 7d8
> Instruction dump:
> 4bffff04 7c0802a6 93a10054 90010064 93c10058 48b95369 80c20398 3c60c0dc
> 7f84e378 38e204b0 3863ce30 4809d819 <0fe00000> 60000000 60000000 3d20c0ff
> ---[ end trace 065671519ba3d526 ]---
> 
> Note: the BUG() line is slightly different because I had made this
> small change to print the pointers:
> 
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index 9ded046edb0e..57ea6e500a6f 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -289,7 +289,12 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
>   		klp_update_patch_state(current);
>   
>   	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
> -		BUG_ON(regs != current->thread.regs);
> +		if (regs != current->thread.regs) {
> +			pr_info("regs=%px cur=%px pid=%d comm=%s\n",
> +				regs, current->thread.regs,
> +				current->pid, current->comm);
> +			BUG();
> +		}
>   		do_signal(current);
>   	}
>   
> 
