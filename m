Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2E72DFD5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 16:19:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D036G5Cn3zDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 02:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D034J2GQ5zDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 02:17:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D03416pnjz9tyMp;
 Mon, 21 Dec 2020 16:17:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9twfJxgVyBAC; Mon, 21 Dec 2020 16:17:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D03415mwrz9tyMm;
 Mon, 21 Dec 2020 16:17:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 067228B7F3;
 Mon, 21 Dec 2020 16:17:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oY-6q2O7O4pv; Mon, 21 Dec 2020 16:17:26 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD4098B7E9;
 Mon, 21 Dec 2020 16:17:26 +0100 (CET)
Subject: Re: [PATCH] powerpc:Don't print raw EIP/LR hex values in dump_stack()
 and show_regs()
To: Xiaoming Ni <nixiaoming@huawei.com>, linux-kernel@vger.kernel.org,
 benh@kernel.crashing.org, mpe@ellerman.id.au, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, yanaijie@huawei.com, npiggin@gmail.com,
 ravi.bangoria@linux.ibm.com, mikey@neuling.org, aneesh.kumar@linux.ibm.com,
 haren@linux.ibm.com
References: <20201221032758.12143-1-nixiaoming@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2279fc96-1f10-0c3f-64d9-734f18758620@csgroup.eu>
Date: Mon, 21 Dec 2020 16:17:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221032758.12143-1-nixiaoming@huawei.com>
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
Cc: wangle6@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/12/2020 à 04:27, Xiaoming Ni a écrit :
> Since the commit 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR
> infrastructure"), the powerpc system is ready to support KASLR.
> To reduces the risk of invalidating address randomization, don't print the
> EIP/LR hex values in dump_stack() and show_regs().

I think this change is worth providing more details. Explain how the change improves debugging.

> 
> This patch follows x86 and arm64's lead:
>      commit a25ffd3a6302a6 ("arm64: traps: Don't print stack or raw
>       PC/LR values in backtraces")
>      commit bb5e5ce545f203 ("x86/dumpstack: Remove kernel text
>       addresses from stack dump")

I think your change is not enough to hide EIP address, see below a dump with you patch, you get 
"Faulting instruction address: 0xc03a0c14"

Also, you replace a 8 digits value by a potentially long ling. Should should therefore put NIP and 
LR on different lines, and put CTR somewhere else (next to XER ?)

Now, the NIP and LR before the REGS and after the GPRs are exactly the same. No need to duplicate.

root@vgoip:~# busybox echo ACCESS_USERSPACE > /sys/kernel/debug/provoke-crash/DI
RECT
[  198.698395] lkdtm: Performing direct entry ACCESS_USERSPACE
[  198.698742] lkdtm: attempting bad read at 77ce8000
[  198.698844] Kernel attempted to read user page (77ce8000) - exploit attempt? (uid: 0)
[  198.706489] BUG: Unable to handle kernel data access on read at 0x77ce8000
[  198.713274] Faulting instruction address: 0xc03a0c14
[  198.718187] Oops: Kernel access of bad area, sig: 11 [#1]
[  198.723516] BE PAGE_SIZE=16K PREEMPT CMPC885
[  198.731272] CPU: 0 PID: 370 Comm: busybox Not tainted 5.10.0-s3k-dev-13158-g8e389861badd #4386
[  198.739785] NIP: lkdtm_ACCESS_USERSPACE+0xbc/0x110 LR: lkdtm_ACCESS_USERSPACE+0xbc/0x110 CTR: 
00000000
[  198.748994] REGS: cad83d30 TRAP: 0300   Not tainted  (5.10.0-s3k-dev-13158-g8e389861badd)
[  198.757081] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 24002222  XER: 00000000
[  198.763881] DAR: 77ce8000 DSISR: 88000000
[  198.763881] GPR00: c03a0c14 cad83df0 c28a8000 00000026 c093e518 00000001 00000027 00000027
[  198.763881] GPR08: c09a26dc 00000000 00000000 3ffff000 24002228 100d3dd6 100a2ffc 00000000
[  198.763881] GPR16: 100cd280 100b0000 107e42ec 107e54b5 100d0000 100d0000 00000000 100a2fdc
[  198.763881] GPR24: ffffffef ffffffff cad83f10 00000011 c078298c c2930000 c084b980 77ce8000
[  198.802865] NIP lkdtm_ACCESS_USERSPACE+0xbc/0x110
[  198.807514] LR lkdtm_ACCESS_USERSPACE+0xbc/0x110
[  198.812077] Call Trace:
[  198.814485]  [cad83df0] lkdtm_ACCESS_USERSPACE+0xbc/0x110 (unreliable)
[  198.820940]  [cad83e20] direct_entry+0xe0/0x164
[  198.825415]  [cad83e50] full_proxy_write+0x78/0xbc
[  198.830148]  [cad83e80] vfs_write+0x12c/0x478
[  198.834452]  [cad83f00] ksys_write+0x78/0x128
[  198.838754]  [cad83f30] ret_from_syscall+0x0/0x34
[  198.843401] --- interrupt: c01 at 0xfd51d0c
[  198.847532] NIP: 0xfd51d0c LR: 0x10008404 CTR: 0fcff380
[  198.852696] REGS: cad83f40 TRAP: 0c01   Not tainted  (5.10.0-s3k-dev-13158-g8e389861badd)
[  198.860784] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 44002424  XER: 00000000
[  198.867928]
[  198.867928] GPR00: 00000004 7fde21f0 77cf34d0 00000001 10640008 00000011 00000000 0fd5b36c
[  198.867928] GPR08: 00000000 00024000 00000000 00000009 84022222
[  198.884193] NIP 0xfd51d0c
[  198.886775] LR 0x10008404
[  198.889357] --- interrupt: c01
[  198.892373] Instruction dump:
[  198.895298] 7d295279 39400000 40820078 80010034 83e1002c 7c0803a6 38210030 4e800020
[  198.903214] 3c60c085 7fe4fb78 3863c874 4bcc5805 <813f0000> 3c60c085 3d29c0df 3929c0de
[  198.911316] ---[ end trace ba4047052f99b7bf ]---
[  198.915865]
Segmentation fault




> 
> Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
> ---
>   arch/powerpc/kernel/process.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index a66f435dabbf..913cf1ea702e 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1455,8 +1455,8 @@ static void __show_regs(struct pt_regs *regs)
>   {
>   	int i, trap;
>   
> -	printk("NIP:  "REG" LR: "REG" CTR: "REG"\n",
> -	       regs->nip, regs->link, regs->ctr);
> +	printk("NIP: %pS LR: %pS CTR: "REG"\n",
> +	       (void *)regs->nip, (void *)regs->link, regs->ctr);
>   	printk("REGS: %px TRAP: %04lx   %s  (%s)\n",
>   	       regs, regs->trap, print_tainted(), init_utsname()->release);
>   	printk("MSR:  "REG" ", regs->msr);
> @@ -1493,8 +1493,8 @@ static void __show_regs(struct pt_regs *regs)
>   	 * above info out without failing
>   	 */
>   	if (IS_ENABLED(CONFIG_KALLSYMS)) {
> -		printk("NIP ["REG"] %pS\n", regs->nip, (void *)regs->nip);
> -		printk("LR ["REG"] %pS\n", regs->link, (void *)regs->link);
> +		printk("NIP %pS\n", (void *)regs->nip);
> +		printk("LR %pS\n", (void *)regs->link);
>   	}
>   }
>   
> @@ -2160,8 +2160,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>   		newsp = stack[0];
>   		ip = stack[STACK_FRAME_LR_SAVE];
>   		if (!firstframe || ip != lr) {
> -			printk("%s["REG"] ["REG"] %pS",
> -				loglvl, sp, ip, (void *)ip);
> +			printk("%s ["REG"] %pS",
> +				loglvl, sp, (void *)ip);
>   			ret_addr = ftrace_graph_ret_addr(current,
>   						&ftrace_idx, ip, stack);
>   			if (ret_addr != ip)
> 
