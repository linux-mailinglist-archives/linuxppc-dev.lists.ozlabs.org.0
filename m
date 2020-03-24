Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E899190536
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 06:33:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mfzh2pz8zDqrj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 16:33:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mftC2txMzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 16:28:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DpiFmblg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mftB6K2vz9sQt;
 Tue, 24 Mar 2020 16:28:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585027715;
 bh=soQCgidOAvEO7sKr1d1bXMywnVUZ8mtXNcqtK0ngruY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DpiFmblgTQHdYN+fsW5aGwdxVPu5LvUDediBwy8vK/C8eAKGy6WCFL1iOp6vV/Kf9
 rS/S/zwE4OD6bQn0xKp5TQGLyYZFoMpwnmUC7/APB3g4IRRLTy6u2RIzR0rbAAbFkO
 1NFsV+yLQcfB1/c1nP1+vSGS1gs8W29IvWWJqMrIUQ5Ku9mkrRMguJRBnlb0KkIovY
 XraVVlhRwZWHr5JwIj6ERSP7+eNX7iPBeR5cazcu8obf2mfbQWhNjSivO9JkzJkf0x
 GFfgmM5QrkJ/Bl/x5O70mEgW0ftg3/k4vh4sQ9TF51DGcWbE+y7UTBgZNO9Sz+pnXU
 NyKvmuGn4mW/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v3] powerpc/kprobes: Ignore traps that happened in real
 mode
In-Reply-To: <f28a0219-abf1-07d4-b98b-b19db4af0f12@c-s.fr>
References: <424331e2006e7291a1bfe40e7f3fa58825f565e1.1582054578.git.christophe.leroy@c-s.fr>
 <f28a0219-abf1-07d4-b98b-b19db4af0f12@c-s.fr>
Date: Tue, 24 Mar 2020 16:28:42 +1100
Message-ID: <87o8smxqwl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> ping
>
>
> Le 18/02/2020 =C3=A0 20:38, Christophe Leroy a =C3=A9crit=C2=A0:
>> When a program check exception happens while MMU translation is
>> disabled, following Oops happens in kprobe_handler() in the following
>> code:
>
> Michael, we have several traps in assembly while MMU is still disabled=20
> (TRACE_IRQFLAGS, KUAP DEBUG, syscall from kernel, machine check in RTAS,=
=20
> ...).
> Without this fix, all of them trigger an Oops when CONFIG_KPROBE is set.

Only on 32-bit.

But I guess this fix is good, if someone really wants to handle kprobes
in real mode they can tell us and do the work to make it solid.

cheers

>> 		} else if (*addr !=3D BREAKPOINT_INSTRUCTION) {
>>=20
>> [   33.098554] BUG: Unable to handle kernel data access on read at 0x000=
0e268
>> [   33.105091] Faulting instruction address: 0xc000ec34
>> [   33.110010] Oops: Kernel access of bad area, sig: 11 [#1]
>> [   33.115348] BE PAGE_SIZE=3D16K PREEMPT CMPC885
>> [   33.119540] Modules linked in:
>> [   33.122591] CPU: 0 PID: 429 Comm: cat Not tainted 5.6.0-rc1-s3k-dev-0=
0824-g84195dc6c58a #3267
>> [   33.131005] NIP:  c000ec34 LR: c000ecd8 CTR: c019cab8
>> [   33.136002] REGS: ca4d3b58 TRAP: 0300   Not tainted  (5.6.0-rc1-s3k-d=
ev-00824-g84195dc6c58a)
>> [   33.144324] MSR:  00001032 <ME,IR,DR,RI>  CR: 2a4d3c52  XER: 00000000
>> [   33.150699] DAR: 0000e268 DSISR: c0000000
>> [   33.150699] GPR00: c000b09c ca4d3c10 c66d0620 00000000 ca4d3c60 00000=
000 00009032 00000000
>> [   33.150699] GPR08: 00020000 00000000 c087de44 c000afe0 c66d0ad0 100d3=
dd6 fffffff3 00000000
>> [   33.150699] GPR16: 00000000 00000041 00000000 ca4d3d70 00000000 00000=
000 0000416d 00000000
>> [   33.150699] GPR24: 00000004 c53b6128 00000000 0000e268 00000000 c07c0=
000 c07bb6fc ca4d3c60
>> [   33.188015] NIP [c000ec34] kprobe_handler+0x128/0x290
>> [   33.192989] LR [c000ecd8] kprobe_handler+0x1cc/0x290
>> [   33.197854] Call Trace:
>> [   33.200340] [ca4d3c30] [c000b09c] program_check_exception+0xbc/0x6fc
>> [   33.206590] [ca4d3c50] [c000e43c] ret_from_except_full+0x0/0x4
>> [   33.212392] --- interrupt: 700 at 0xe268
>> [   33.270401] Instruction dump:
>> [   33.273335] 913e0008 81220000 38600001 3929ffff 91220000 80010024 bb4=
10008 7c0803a6
>> [   33.280992] 38210020 4e800020 38600000 4e800020 <813b0000> 6d2a7fe0 2=
f8a0008 419e0154
>> [   33.288841] ---[ end trace 5b9152d4cdadd06d ]---
>>=20
>> kprobe is not prepared to handle events in real mode and functions
>> running in real mode should have been blacklisted, so kprobe_handler()
>> can safely bail out telling 'this trap is not mine' for any trap that
>> happened while in real-mode.
>>=20
>> If the trap happened with MSR_IR or MSR_DR cleared, return 0 immediately.
>>=20
>> Reported-by: Larry Finger <Larry.Finger@lwfinger.net>
>> Fixes: 6cc89bad60a6 ("powerpc/kprobes: Invoke handlers directly")
>> Cc: stable@vger.kernel.org
>> Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> Cc: Masami Hiramatsu <mhiramat@kernel.org>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>=20
>> ---
>> v3: Also bail out if MSR_DR is cleared.
>>=20
>> Resending v2 with a more appropriate name
>>=20
>> v2: bailing out instead of converting real-time address to virtual and c=
ontinuing.
>>=20
>> The bug might have existed even before that commit from Naveen.
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/kernel/kprobes.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>=20
>> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes=
.c
>> index 2d27ec4feee4..9b340af02c38 100644
>> --- a/arch/powerpc/kernel/kprobes.c
>> +++ b/arch/powerpc/kernel/kprobes.c
>> @@ -264,6 +264,9 @@ int kprobe_handler(struct pt_regs *regs)
>>   	if (user_mode(regs))
>>   		return 0;
>>=20=20=20
>> +	if (!(regs->msr & MSR_IR) || !(regs->msr & MSR_DR))
>> +		return 0;
>> +
>>   	/*
>>   	 * We don't want to be preempted for the entire
>>   	 * duration of kprobe processing
>>=20
