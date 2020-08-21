Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DE924CD23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 07:13:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXqRl4mgYzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 15:13:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXqPj0g28zDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 15:11:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BXqPX0Cgfz9vCxp;
 Fri, 21 Aug 2020 07:11:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zLQZtjGtEvxd; Fri, 21 Aug 2020 07:11:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BXqPW6Lh9z9vCxn;
 Fri, 21 Aug 2020 07:11:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 048398B86E;
 Fri, 21 Aug 2020 07:11:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eSJQic3OinEk; Fri, 21 Aug 2020 07:11:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF61E8B75F;
 Fri, 21 Aug 2020 07:11:40 +0200 (CEST)
Subject: Re: [PATCH v2 3/6] powerpc/32s: Only leave NX unset on segments used
 for modules
To: Andreas Schwab <schwab@linux-m68k.org>
References: <cover.1593428200.git.christophe.leroy@csgroup.eu>
 <7172c0f5253419315e434a1816ee3d6ed6505bc0.1593428200.git.christophe.leroy@csgroup.eu>
 <87eeo1kmet.fsf@igel.home>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6c480b23-297a-4f3d-daff-962a01b0b54c@csgroup.eu>
Date: Fri, 21 Aug 2020 07:11:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87eeo1kmet.fsf@igel.home>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/08/2020 à 00:00, Andreas Schwab a écrit :
> On Jun 29 2020, Christophe Leroy wrote:
> 
>> Instead of leaving NX unset on all segments above the start
>> of vmalloc space, only leave NX unset on segments used for
>> modules.
> 
> I'm getting this crash:
> 
> kernel tried to execute exec-protected page (f294b000) - exploit attempt (uid: 0)
> BUG: Unable to handle kernel instruction fetch
> Faulting instruction address: 0xf294b000
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=4K MMU=Hash PowerMac
> Modules linked in: pata_macio(+)
> CPU: 0 PID: 87 Comm: udevd Not tainted 5.8.0-rc2-test #49
> NIP:  f294b000 LR: 0005c60 CTR: f294b000
> REGS: f18d9cc0 TRAP: 0400  Not tainted  (5.8.0-rc2-test)
> MSR:  10009032 <E,ME,IR,DR,RI>  CR: 84222422  XER: 20000000
> GPR00: c0005c14 f18d9d78 ef30ca20 00000000 ef0000e0 c00993d0 ef6da038 0000005e
> GPR08: c09050b8 c08b0000 00000000 f18d9d78 44222422 10072070 00000000 0fefaca4
> GPR16: 1006a00c f294d50b 00000120 00000124 c0096ea8 0000000e ef2776c0 ef2776e4
> GPR24: f18fd6e8 00000001 c086fe64 c086fe04 00000000 c08b0000 f294b000 ffffffff
> NIP [f294b000] pata_macio_init+0x0/0xc0 [pata_macio]
> LR [c0005c60] do_one_initcall+0x6c/0x160
> Call Trace:
> [f18d9d78] [c0005c14] do_one_initcall+0x20/0x160 (unreliable)
> [f18d9dd8] [c009a22c] do_init_module+0x60/0x1c0
> [f18d9df8] [c00993d8] load_module+0x16a8/0x1c14
> [f18d9ea8] [c0099aa4] sys_finit_module+0x8c/0x94
> [f18d9f38] [c0012174] ret_from_syscall+0x0/0x34
> --- interrupt: c01 at 0xfdb4318
>     LR = 0xfeee9c0
> Instruction dump:
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX <3d20c08b> 3d40c086 9421ffe0 8129106c
> ---[ end trace 85a98cc836109871 ]---
> 

Please try the patch at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/07884ed033c31e074747b7eb8eaa329d15db07ec.1596641219.git.christophe.leroy@csgroup.eu/

And if you are using KAsan, also take 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/6eddca2d5611fd57312a88eae31278c87a8fc99d.1596641224.git.christophe.leroy@csgroup.eu/

Allthough I have some doubt that it will fix it, because the faulting 
instruction address is at 0xf294b000 which is within the vmalloc area. 
In the likely case the patch doesn't fix the issue, can you provide your 
.config and a dump of /sys/kernel/debug/powerpc/segment_registers (You 
have to have CONFIG_PPC_PTDUMP enabled for that) and also the below part 
from boot log.

[    0.000000] Memory: 509556K/524288K available (7088K kernel code, 
592K rwdata, 1304K rodata, 356K init, 803K bss, 14732K reserved, 0K 
cma-reserved)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xff7ff000..0xfffff000  : fixmap
[    0.000000]   * 0xff7fd000..0xff7ff000  : early ioremap
[    0.000000]   * 0xe1000000..0xff7fd000  : vmalloc & ioremap


Thanks
Christophe
