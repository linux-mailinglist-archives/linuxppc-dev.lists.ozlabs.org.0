Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75A15FDF0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 11:20:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KR8t4kRvzDqs1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 21:20:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=iIehxhB0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KR7K6XX6zDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 21:19:25 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48KR7F59hZz9v083;
 Sat, 15 Feb 2020 11:19:21 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iIehxhB0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zSMHdjP8NiV6; Sat, 15 Feb 2020 11:19:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48KR7F40Hqz9v082;
 Sat, 15 Feb 2020 11:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581761961; bh=gHmKpOkY142YCLiV9aU9W2mIDnnXf6Ft89oAZlJBoh0=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=iIehxhB0d8sKwAYvbpPWF1TkS9W1v3muM4z+T1JqwsZrnEyhdoH6ewgb7MBeYouKN
 DH2kozSDFVo4F2ilhy3cEENJNZE/t+c8kC81RGn1fX9P6zMmoht6fchYFV/c2ACVXS
 kk08XGQPCkQdduAgIfOQAwDNOx0NyX+qIaXXYBC0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A39878B781;
 Sat, 15 Feb 2020 11:19:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 27Sb5f3BcJTv; Sat, 15 Feb 2020 11:19:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAC4F8B755;
 Sat, 15 Feb 2020 11:19:21 +0100 (CET)
Subject: Re: [PATCH] powerpc/kprobes: Fix trap address when trap happened in
 real mode
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
Message-ID: <fd9610d5-2b7a-37bd-9ced-a46850d2eec9@c-s.fr>
Date: Sat, 15 Feb 2020 11:19:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, stable@kernel.vger.org,
 Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/02/2020 à 13:47, Christophe Leroy a écrit :
> When a program check exception happens while MMU translation is
> disabled, following Oops happens in kprobe_handler() in the following
> test:
> 
> 		} else if (*addr != BREAKPOINT_INSTRUCTION) {
> 
> [   33.098554] BUG: Unable to handle kernel data access on read at 0x0000e268
> [   33.105091] Faulting instruction address: 0xc000ec34
> [   33.110010] Oops: Kernel access of bad area, sig: 11 [#1]
> [   33.115348] BE PAGE_SIZE=16K PREEMPT CMPC885
> [   33.119540] Modules linked in:
> [   33.122591] CPU: 0 PID: 429 Comm: cat Not tainted 5.6.0-rc1-s3k-dev-00824-g84195dc6c58a #3267
> [   33.131005] NIP:  c000ec34 LR: c000ecd8 CTR: c019cab8
> [   33.136002] REGS: ca4d3b58 TRAP: 0300   Not tainted  (5.6.0-rc1-s3k-dev-00824-g84195dc6c58a)
> [   33.144324] MSR:  00001032 <ME,IR,DR,RI>  CR: 2a4d3c52  XER: 00000000
> [   33.150699] DAR: 0000e268 DSISR: c0000000
> [   33.150699] GPR00: c000b09c ca4d3c10 c66d0620 00000000 ca4d3c60 00000000 00009032 00000000
> [   33.150699] GPR08: 00020000 00000000 c087de44 c000afe0 c66d0ad0 100d3dd6 fffffff3 00000000
> [   33.150699] GPR16: 00000000 00000041 00000000 ca4d3d70 00000000 00000000 0000416d 00000000
> [   33.150699] GPR24: 00000004 c53b6128 00000000 0000e268 00000000 c07c0000 c07bb6fc ca4d3c60
> [   33.188015] NIP [c000ec34] kprobe_handler+0x128/0x290
> [   33.192989] LR [c000ecd8] kprobe_handler+0x1cc/0x290
> [   33.197854] Call Trace:
> [   33.200340] [ca4d3c30] [c000b09c] program_check_exception+0xbc/0x6fc
> [   33.206590] [ca4d3c50] [c000e43c] ret_from_except_full+0x0/0x4
> [   33.212392] --- interrupt: 700 at 0xe268
> [   33.270401] Instruction dump:
> [   33.273335] 913e0008 81220000 38600001 3929ffff 91220000 80010024 bb410008 7c0803a6
> [   33.280992] 38210020 4e800020 38600000 4e800020 <813b0000> 6d2a7fe0 2f8a0008 419e0154
> [   33.288841] ---[ end trace 5b9152d4cdadd06d ]---
> 
> Check MSR and convert regs->nip to virtual address if the trap
> happened with MSR_IR cleared.
> 
> Reported-by: Larry Finger <Larry.Finger@lwfinger.net>
> Fixes: 6cc89bad60a6 ("powerpc/kprobes: Invoke handlers directly")
> Cc: stable@kernel.vger.org

Oops, I meant

Cc: stable@vger.kernel.org

> Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> ---
> The bug might have existed even before that commit from Naveen.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/kernel/kprobes.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 2d27ec4feee4..f8b848aa65bd 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -23,6 +23,7 @@
>   #include <asm/cacheflush.h>
>   #include <asm/sstep.h>
>   #include <asm/sections.h>
> +#include <asm/io.h>
>   #include <linux/uaccess.h>
>   
>   DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
> @@ -264,6 +265,9 @@ int kprobe_handler(struct pt_regs *regs)
>   	if (user_mode(regs))
>   		return 0;
>   
> +	if (!(regs->msr & MSR_IR))
> +		addr = phys_to_virt(regs->nip);
> +
>   	/*
>   	 * We don't want to be preempted for the entire
>   	 * duration of kprobe processing
> 
