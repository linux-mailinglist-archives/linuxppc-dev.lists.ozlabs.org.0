Return-Path: <linuxppc-dev+bounces-1315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D0977B03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 10:31:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4nZc6MBsz2ydR;
	Fri, 13 Sep 2024 18:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726216264;
	cv=none; b=A9PFgpvHnlp1ItGrqg2WH70Xp6JkW3+CucdYXEg3TDk8HIl6WU8irjaCbQo1K+nH7yaMXaNYfZl29hcpBJmw3genYHfxoz5gxQn8/SEI7VOflkDTNs5Tjtz8cq0dJINzTHPhJGcVp49T0jNvN84Dys/B2ewvQf+RdHUP18IKydrZ6wPmXUP4TT1fLIGm6AsZFngazW3swXPuDXCym1+36r86hvpA7cTK/rWtp26zBx6UPvrwpRzPCDL5yW34AHzzLnDzMLSODz8lJU3cVBZz1fWu7i8Rl4J2dViNWttbHN1ajSZBcmkEOFyultmf3+EQXWT0kaprXF+fyCmDdPuwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726216264; c=relaxed/relaxed;
	bh=kPurAE5r55+itDQ4VQefqj5SjyND8MKEaZ8r11zXSvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SuE13zdqm6+5suKDltVZ7qdeiY0A0VAVLZNVt7mfBKvneRL38ivvCGJ3OI7DNUhTIReNZdydhckYdfgVaZFezOaxS9KEmZjtDVu2I1GOhexluVh3anQitNU0chbHDHKawWQZuwvjkYFqnldK+w2IM76EIAs0uz3sg8TMjLMMcLFF2lgl7feIQm41dyfQ2Gvo9CXhYQjH8LC2PHmvFbVVyVS35FYzFvSLYNKyiSx4x0fS3npDjDdvFy5N0tVlM06X8GJiUZXe9+TccTrocmTFsDRPTinV+JHs1VJ45sNP8e6690sOr1IcfZs7cCyJqM8i1lLfMea3xkb6+L5F19LNTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4nZc3rYLz2yYk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 18:31:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4nZV4c6yz9scx;
	Fri, 13 Sep 2024 10:30:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CsX7-oCed2Zm; Fri, 13 Sep 2024 10:30:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4nZT2Pgbz9scR;
	Fri, 13 Sep 2024 10:30:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E87D8B77A;
	Fri, 13 Sep 2024 10:30:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NpS8B5KE_7ER; Fri, 13 Sep 2024 10:30:57 +0200 (CEST)
Received: from [192.168.233.70] (unknown [192.168.233.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C0CE68B766;
	Fri, 13 Sep 2024 10:30:56 +0200 (CEST)
Message-ID: <854eef54-4779-4233-a958-0c98ae5fcb7e@csgroup.eu>
Date: Fri, 13 Sep 2024 10:30:56 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
To: Luming Yu <luming.yu@shingroup.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, jialong.yang@shingroup.cn,
 luming.yu@gmail.com
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
 <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
 <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
 <95ced963-b584-4ccf-ba34-8f2ba99172f4@csgroup.eu>
 <0332BAE1905768B6+ZuPsBvgv0nwmFAjW@HX09040029.powercore.com.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0332BAE1905768B6+ZuPsBvgv0nwmFAjW@HX09040029.powercore.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/09/2024 à 09:38, Luming Yu a écrit :
> On Fri, Sep 13, 2024 at 08:54:12AM +0200, Christophe Leroy wrote:
>>
>>
>> Le 13/09/2024 à 03:40, Luming Yu a écrit :
>>> On Thu, Sep 12, 2024 at 12:23:29PM +0200, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 12/09/2024 à 10:24, Luming Yu a écrit :
>>>>> From: Yu Luming <luming.yu@gmail.com>
>>>>>
>>>>> convert powerpc entry code in syscall and fault to use syscall_work
>>>>> and irqentry_state as well as common calls from generic entry infrastructure.
>>>>>
>>>>> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
>>>>> ---
>>>>>     arch/powerpc/Kconfig                   | 1 +
>>>>>     arch/powerpc/include/asm/hw_irq.h      | 5 +++++
>>>>>     arch/powerpc/include/asm/processor.h   | 6 ++++++
>>>>>     arch/powerpc/include/asm/syscall.h     | 5 +++++
>>>>>     arch/powerpc/include/asm/thread_info.h | 1 +
>>>>>     arch/powerpc/kernel/syscall.c          | 6 +++++-
>>>>>     arch/powerpc/mm/fault.c                | 5 +++++
>>>>>     7 files changed, 28 insertions(+), 1 deletion(-)
>>>>
>>>> There is another build problem:
>>>>
>>>>     CC      kernel/entry/common.o
>>>> kernel/entry/common.c: In function 'irqentry_exit':
>>>> kernel/entry/common.c:335:21: error: implicit declaration of function
>>>> 'regs_irqs_disabled'; did you mean 'raw_irqs_disabled'?
>>>> [-Werror=implicit-function-declaration]
>>>>     335 |         } else if (!regs_irqs_disabled(regs)) {
>>>>         |                     ^~~~~~~~~~~~~~~~~~
>>>>         |                     raw_irqs_disabled
>>>>
>>>>
>>>> You have put regs_irqs_disabled() in a section dedicated to PPC64, so it
>>>> fails on PPC32.
>>>>
>>>>
>>>> After fixing this problem and providing an empty asm/entry-common.h it is
>>>> now possible to build the kernel. But that's not enough, the board is stuck
>>>> after:
>>>>
>>>> ...
>>>> [    2.871391] Freeing unused kernel image (initmem) memory: 1228K
>>>> [    2.877990] Run /init as init process
>>>
>>> Thanks for these questions. :-)
>>> I haven't gotten chance to run it in ppc32 qemu.
>>> the common syscall trace enter lost this hunk
>>> -       if (!is_32bit_task())
>>> -               audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
>>> -                                   regs->gpr[5], regs->gpr[6]);
>>> -       else
>>> -               audit_syscall_entry(regs->gpr[0],
>>> -                                   regs->gpr[3] & 0xffffffff,
>>> -                                   regs->gpr[4] & 0xffffffff,
>>> -                                   regs->gpr[5] & 0xffffffff,
>>> -                                   regs->gpr[6] & 0xffffffff);
>>> which I don't understand whether we need a arch callbacks for it.
>>
>> I don't thing so.
>>
>> As far as I can see, audit_syscall_entry() is called by
>> syscall_enter_audit() in kernel/entry/common.c
>>
>> And the masking of arguments based on is_32bit_task() is done in
>> syscall_get_arguments() with is called by
>> syscall_enter_audit() just before calling audit_syscall_entry() and which is
>> an arch callback that does the same as the removed hunk.
> so, syscall_get_arguments is the ppc arch callback. thanks. :-)
>>>
>>> Before I sent out the RFC patch set, the very limited compile and boot test goes well with a ppc64 qemu VM. Surely, there will be a lot of test, debug and following up patch set update that is necessary to make it a complete convert.
>>
>> Even on ppc64 it doesn't build, at the first place because
>> arch/powerpc/include/asm/entry-common.h is missing in your patch. Did you
>> forget to 'git add' it ?
> oh, I forget that I was testing this patch on top of the early user notifier patch:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Flinuxppc%2Fissues%2Fissues%2F477&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C35a08ca9a81f4c6ff8ce08dcd3c73555%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638618099770810941%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=yCQWLIAXL%2BNHnzrh0e91WIBvF0c5WfF6pY6ZMHstocA%3D&reserved=0, https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc-dev%2Fpatch%2F1FD36D52828D2506%2B20231218031309.2063-1-luming.yu%40shingroup.cn%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C35a08ca9a81f4c6ff8ce08dcd3c73555%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638618099770819779%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=0WBSUlpAbL6EMdPEAtJv1HUHkbeUjjUcP98wYf9IxM4%3D&reserved=0
> and the entry-common.h is as follows:
> [root@localhost linux]# cat arch/powerpc/include/asm/entry-common.h
> /* SPDX-License-Identifier: GPL-2.0 */
> #ifndef ARCH_POWERPC_ENTRY_COMMON_H
> #define ARCH_POWERPC_ENTRY_COMMON_H
> 
> #include <linux/user-return-notifier.h>
> 
> static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>                                                    unsigned long ti_work)
> {
>          if (ti_work & _TIF_USER_RETURN_NOTIFY)
>                  fire_user_return_notifiers();
> }
> 
> #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
> 
> #endif
> 
> As you could see , it looks irrelevant.
>>
>> And same as with PPC32, when I build PPC64 with an empty asm/entry-common.h,
>> it doesn't work. So, I guess you had some needed code in that file and you
>> have to send it.
> 
> please send me your kernel config and let me reproduce and double check
> if there could be another bit of code make the difference. My test p8 64bit VM boots
> an unmodified fedora 38 user space just fine with the patch.
> After boot, the only difference is make install of kernel could hang for a while, that
> I'm not sure how that could happen yet. and I plan to do some unit test for many common
> features like : lockdep, ptrace, rcu, audit...
>>
> 


I tested with both ppc64_defconfig and ppc64le_defconfig. With those two 
configs QEMU remains stuck after the following lines. I use QEMU with 
machine pseries:

[    2.701874][    T1] Running code patching self-tests ...
[    2.734007][    T1] registered taskstats version 1
[    2.735891][    T1] Loading compiled-in X.509 certificates
[    2.756472][    T1] Loaded X.509 cert 'Build time autogenerated 
kernel key: 003f25410c2285abf44b4685b6d63682a2dc9f11'
[    2.784474][    T1] Demotion targets for Node 0: null
[    2.784748][    T1] page_owner is disabled
[    2.786795][    T1] Secure boot mode disabled
[    2.787436][    T1] ima: No TPM chip found, activating TPM-bypass!
[    2.787568][    T1] Loading compiled-in module X.509 certificates
[    2.790854][    T1] Loaded X.509 cert 'Build time autogenerated 
kernel key: 003f25410c2285abf44b4685b6d63682a2dc9f11'
[    2.791289][    T1] ima: Allocated hash algorithm: sha256
[    2.796260][    T1] Secure boot mode disabled
[    2.796448][    T1] Trusted boot mode disabled
[    2.796560][    T1] ima: No architecture policies found
[    2.799580][    T1] printk: legacy console [netcon0] enabled
[    2.799696][    T1] netconsole: network logging started
[    2.880282][    T1] Freeing unused kernel image (initmem) memory: 6528K
[    2.884618][    T1] Checked W+X mappings: passed, no W+X pages found
[    2.885366][    T1] rodata_test: all tests were successful
[    2.885749][    T1] Run /init as init process
[    3.214730][   T58] mount (58) used greatest stack depth: 28672 bytes 
left
...
nothing happens after that.


For PPC32 I use pmac32_defconfig and QEMU machine mac99

Christophe

