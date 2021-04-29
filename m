Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74E36EC5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:27:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHrQ5T6Lz3bT0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:27:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHr53ww5z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:26:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FWHqy2Gkgz9vkN;
 Thu, 29 Apr 2021 16:26:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9gQpGSJqnm9; Thu, 29 Apr 2021 16:26:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FWHqy1FmFz9vkL;
 Thu, 29 Apr 2021 16:26:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B3648B862;
 Thu, 29 Apr 2021 16:26:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CJz_ZtUp9fQg; Thu, 29 Apr 2021 16:26:36 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 780888B861;
 Thu, 29 Apr 2021 16:26:35 +0200 (CEST)
Subject: Re: PPC32: Boot regression on Nintendo Wii, after create_branch
 rework in 5.8
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Jordan Niethe <jniethe5@gmail.com>
References: <YIWNZI4YhFuRZwHg@latitude>
 <CACzsE9qOj2Fp4A9dYopQddw1oc7w--BCe_2_3xJfEo=d9WoC1Q@mail.gmail.com>
 <YIml+D0kB3t3BMXB@latitude>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <da0aef09-0374-fe94-291f-693a342d2104@csgroup.eu>
Date: Thu, 29 Apr 2021 16:26:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIml+D0kB3t3BMXB@latitude>
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 28/04/2021 à 20:14, Jonathan Neuschäfer a écrit :
> Hi,
> 
> On Wed, Apr 28, 2021 at 11:33:24AM +1000, Jordan Niethe wrote:
>> On Mon, Apr 26, 2021 at 1:40 AM Jonathan Neuschäfer
>> <j.neuschaefer@gmx.net> wrote:
>>>
>>> Hi,
>>>
>>> I recently booted my Wii again, and I noticed a regression at boot time.
>>> Output stops after the "Finalizing device tree... flat tree at 0xXXXXXX"
>>> message. I bisected it to this commit in the 5.8 development cycle:
>>>
>>> commit 7c95d8893fb55869882c9f68f4c94840dc43f18f
>>> Author: Jordan Niethe <jniethe5@gmail.com>
>>> Date:   Wed May 6 13:40:25 2020 +1000
>>>
>>>      powerpc: Change calling convention for create_branch() et. al.
> [...]
>>> Do you have any hints on how to debug and/or fix this issue?
>> Thanks for bisecting and reporting.
>> The "Finalizing device tree... flat tree at 0xXXXXXX" message comes
>> from the bootwrapper so if that is the last output it must be crashing
>> pretty early.
>> Commit 7c95d8893fb5 ("powerpc: Change calling convention for
>> create_branch() et. al.") made a change to machine_init() in
>> setup_32.c which seems like it might be a likely culprit for causing
>> early crashing.
>> The branch that is created and patched is just for optimization, so to
>> see if that is in fact the problem it might be worth trying to boot
>> with a patch like below
>>
>> diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
>> --- a/arch/powerpc/kernel/setup_32.c
>> +++ b/arch/powerpc/kernel/setup_32.c
>> @@ -87,9 +87,6 @@ notrace void __init machine_init(u64 dt_ptr)
>>
>>          patch_instruction_site(&patch__memcpy_nocache, ppc_inst(PPC_INST_NOP));
>>
>> -       create_cond_branch(&insn, addr, branch_target(addr), 0x820000);
>> -       patch_instruction(addr, insn);  /* replace b by bne cr0 */
>> -
>>          /* Do some early initialization based on the flat device tree */
>>          early_init_devtree(__va(dt_ptr));
> 
> This brings no improvement, unfortunately. The output is still:
> 
> top of MEM2 @ 13F00000
> 
> zImage starting: loaded at 0x00b00000 (sp: 0x01145f90)
> Allocating 0xae3970 bytes for kernel...
> Decompressing (0x00000000 <- 0x00b11000:0x01143576)...
> Done! Decompressed 0xa65fdc bytes
> 
> Linux/PowerPC load: root=/dev/mmcblk0p2 rootwait console=usbgecko1
> Finalizing device tree... flat tree at 0x11467a0
> 
> 
> I'll probably dig deeper next weekend.
> 

I think the problem is when calling apply_feature_fixups() from early_init().

At that time, code is not relocated yet and 'current' is not set up yet.

You probably have CONFIG_STACKPROTECTOR=y

Before this patch, do_feature_fixups() was a simple fonction that was not using the stack for 
storing data. But that patch changed it because it addresses the 'instr' by reference so it can't go 
in a general reg anymore, it goes into the stack.

So GCC sets up a stack guard:

00000000 <do_feature_fixups>:
    0:	7c 04 28 40 	cmplw   r4,r5
    4:	94 21 ff b0 	stwu    r1,-80(r1)
    8:	81 22 02 28 	lwz     r9,552(r2)      <= r2 is not set up yet
    c:	91 21 00 1c 	stw     r9,28(r1)
...
  180:	81 21 00 1c 	lwz     r9,28(r1)
  184:	81 42 02 28 	lwz     r10,552(r2)
  188:	7d 29 52 79 	xor.    r9,r9,r10
  18c:	39 40 00 00 	li      r10,0
  190:	40 82 00 84 	bne     214 <do_feature_fixups+0x214>
  194:	38 21 00 50 	addi    r1,r1,80
  198:	4e 80 00 20 	blr
...
  214:	7c 08 02 a6 	mflr    r0
  218:	90 01 00 54 	stw     r0,84(r1)
  21c:	92 e1 00 2c 	stw     r23,44(r1)
  220:	93 01 00 30 	stw     r24,48(r1)
  224:	93 21 00 34 	stw     r25,52(r1)
  228:	93 41 00 38 	stw     r26,56(r1)
  22c:	93 61 00 3c 	stw     r27,60(r1)
  230:	93 81 00 40 	stw     r28,64(r1)
  234:	93 a1 00 44 	stw     r29,68(r1)
  238:	93 c1 00 48 	stw     r30,72(r1)
  23c:	93 e1 00 4c 	stw     r31,76(r1)
  240:	48 00 00 01 	bl      240 <do_feature_fixups+0x240>
			240: R_PPC_REL24	__stack_chk_fail

So all feature fixup and code patching stuff it uses needs to be protected against the stack protector.

By the way, I also see some printk in do_feature_fixups(). That won't work either because of the 
relocation, the string won't be found. But that's not the problem you have at the moment.

Christophe
