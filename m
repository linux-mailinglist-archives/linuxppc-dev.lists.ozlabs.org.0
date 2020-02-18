Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF3162E32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 19:16:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MTZW0hFkzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 05:16:34 +1100 (AEDT)
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
 header.s=mail header.b=ixwbY2D3; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MTPV15FLzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 05:08:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48MTPK2hSPz9v2jR;
 Tue, 18 Feb 2020 19:08:37 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ixwbY2D3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AkAmJR9A7TxA; Tue, 18 Feb 2020 19:08:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48MTPJ6Hzzz9v2jQ;
 Tue, 18 Feb 2020 19:08:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582049316; bh=5PCndBmU3NN4vjjE75l/kPng3IIVIBX860ZrSa+2zCI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ixwbY2D3+9ra87Jjowtaa4QU6UOjgj2iURLkl7/eYjl+woHw+uhCr/RBEY7GAdXdJ
 alpxNzB0OQzUIs3Cee0q8KPaY9fi4d37ktruGfwOja+GMUoBnhysqRgg1Yoj8q2cVa
 rewGsqnlSveKDfPbIlH5q5XTIrjaP/8FcnCg3rco=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95C2F8B814;
 Tue, 18 Feb 2020 19:08:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LiymYYqn3YCQ; Tue, 18 Feb 2020 19:08:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E44E8B80C;
 Tue, 18 Feb 2020 19:08:38 +0100 (CET)
Subject: Re: MCE handler gets NIP wrong on MPC8378
To: Radu Rendec <radu.rendec@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
Date: Tue, 18 Feb 2020 19:08:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
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



Le 18/02/2020 à 18:07, Radu Rendec a écrit :
> Hi Everyone,
> 
> The saved NIP seems to be broken inside machine_check_exception() on
> MPC8378, running Linux 4.9.191. The value is 0x900 most of the times,
> but I have seen other weird values.
> 
> I've been able to track down the entry code to head_32.S (vector 0x200),
> but I'm not sure where/how the NIP value (where the exception occurred)
> is captured.

NIP value is supposed to come from SRR0, loaded in r12 in PROLOG_2 and 
saved into _NIP(r11) in transfer_to_handler in entry_32.S

Can something clobber r12 at some point ?

Maybe add the following at some place to trap when it happens ?

tweqi r12, 0x900

If you put it just after reading SRR0, and just before writing into 
NIP(r11), you'll see if its wrong from the begining or if it is 
overwriten later.

Christophe

> 
> I also noticed most of the code has moved to head_32.h in newer kernel
> versions, but EXCEPTION_PROLOG_1 and EXCEPTION_PROLOG_2 look pretty much
> the same. I guess the same thing happens on a recent kernel, even though
> I don't have an easy way to test it.
> 
> The original MCE that I see is triggered by a failed PCIe transaction,
> but I was able to reproduce it by just reading from a (physically)
> unmapped memory area. Sample code and kernel crash dump are included
> below.
> 
> Can anyone please provide any suggestion as to what to look at next?
> 
> Thanks,
> Radu
> 
> 8<--------------------------------------------------------------------
> 
> #include <linux/module.h>
> #include <linux/delay.h>
> #include <asm/io.h>
> 
> static void __iomem *bad_addr_base;
> 
> static int __init test_mce_init(void)
> {
>          unsigned int x;
> 
>          bad_addr_base = ioremap(0xf0000000, 0x100);
> 
>          if (bad_addr_base) {
>                  __asm__ __volatile__ ("isync");
>                  x = ioread32(bad_addr_base);
>                  pr_info("Test: %#0x\n", x);
>          } else
>                  pr_err("Cannot map\n");
> 
>          return 0;
> }
> 
> static void __exit test_mce_exit(void)
> {
>          iounmap(bad_addr_base);
> }
> 
> module_init(test_mce_init);
> module_exit(test_mce_exit);
> 
> MODULE_LICENSE("GPL");
> 
> 8<--------------------------------------------------------------------
> 
> [   14.977053] mce: loading out-of-tree module taints kernel.
> [   15.004285] Disabling lock debugging due to kernel taint
> [   15.026151] Machine check in kernel mode.
> [   15.030153] Caused by (from SRR1=41000): [   15.033982] Transfer
> error ack signal
> [   15.037652] Oops: Machine check 1, sig: 7 [#1]
> [   15.042088] PREEMPT [   15.044091] MPC8378_CUSTOM
> [   15.046967] Modules linked in: mce(O+) iptable_filter ip_tables
> x_tables ipv6 mpc8xxx_wdt yaffs spidev spi_fsl_spi spi_fsl_lib
> spi_fsl_cpm fsl_mph_dr_of ehci_fsl ehci_hcd
> [   15.067486] CPU: 0 PID: 1213 Comm: insmod Tainted: G   M     C O
> 4.9.191-default-mpc8378-p3c692a64ae1d #31
> [   15.078175] task: 9e83e550 task.stack: 9ea2e000
> [   15.082699] NIP: 00000900 LR: b147e030 CTR: 80015d50
> [   15.087659] REGS: 9ea2fca0 TRAP: 0200   Tainted: G   M     C O
> (4.9.191-default-mpc8378-p3c692a64ae1d)
> [   15.098084] MSR: 00041000 <ME>[   15.100973]   CR: 42002228  XER: 00000000
> [   15.104976] DAR: 80017414 DSISR: 00000000
> GPR00: b147e030 9ea2fd50 9e83e550 00000000 b1480000 9c652200 9ea2fd18 00000000
> GPR08: 9c652200 00000000 b1480000 00001032 80015d50 100b93d0 b147e308 805eb3d8
> GPR16: 0000003a 00000550 b1473b5c b147c2a4 8048e444 80082b08 00000000 b147c0e8
> GPR24: 00000124 00000578 00000000 00000000 b147c0a0 b147e000 9eb7c280 b147c0a0
> NIP [00000900] 0x900
> [   15.139310] LR [b147e030] test_mce_init+0x30/0xa8 [mce]
> [   15.144528] Call Trace:
> [   15.146973] [9ea2fd50] [b147e000] test_mce_init+0x0/0xa8 [mce] (unreliable)
> [   15.153940] [9ea2fd60] [b147e030] test_mce_init+0x30/0xa8 [mce]
> [   15.159864] [9ea2fd70] [80003ac4] do_one_initcall+0xbc/0x184
> [   15.165527] [9ea2fde0] [804857e8] do_init_module+0x64/0x1e4
> [   15.171107] [9ea2fe00] [80086014] load_module+0x1c78/0x2268
> [   15.176680] [9ea2fec0] [80086780] SyS_init_module+0x17c/0x190
> [   15.182433] [9ea2ff40] [80010acc] ret_from_syscall+0x0/0x38
> [   15.188005] --- interrupt: c01 at 0xfdfdb64
> [   15.188005]     LR = 0x10013c64
> [   15.195309] Instruction dump:
> [   15.198274] 00000000 XXXXXXXX 00000000 XXXXXXXX 00000000 XXXXXXXX
> 00000000 XXXXXXXX
> [   15.206047] 00000000 XXXXXXXX 00000000 XXXXXXXX 7d5043a6 XXXXXXXX
> 7d400026 XXXXXXXX
> [   15.213824] ---[ end trace d38922938e009d45 ]---
> [   15.218434]
> [   16.219951] Kernel panic - not syncing: Fatal exception
> [   16.225174] Rebooting in 1 seconds..
> 
