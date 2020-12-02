Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2836E2CB4D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 07:05:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm7jZ4bjGzDqwY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 17:05:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm7gt5MkGzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 17:03:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=P34mkPtD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cm7gt29spz9sPB;
 Wed,  2 Dec 2020 17:03:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606889018;
 bh=yjBNONjmlyjB2X7tVa92zqCKTrhXU3N9Of8pQiSQerk=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=P34mkPtDoDdEfP6P0DH73oNm4Sddrb1JdOs1kz9PDG5kPGQTrDpY0MzNP2zp3/CJw
 ULc33I7txNNK0EMRjMcX9wiDkgEHAxdq1MlqYmGGRYWxgicuNiVAjyEzmGpFSqDEF8
 b/QVod+nJMQe1R7Pt5Yr7+jLWUy/gCgrDhgWvLo2qnhGchv0pMkvRCIl+n+f+JKcw4
 Gc//tarSLNJ3sm+Z6H9Z0xivBObr8tnF7blf9TX9Y5b8kUfWu00Q4NKbSHQcrX7Q2H
 tC8L8/XPOH6gmSup9tUHv153zrr7o1naB4/HKQbrL5+UvfMYmu2N93ONw2KlUFTm8c
 CprvE3AodgRtw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc: show registers when unwinding interrupt
 frames
In-Reply-To: <3d0fbd5d-6332-fe01-a9e3-e8f204705979@csgroup.eu>
References: <20201107023305.2384874-1-npiggin@gmail.com>
 <3d0fbd5d-6332-fe01-a9e3-e8f204705979@csgroup.eu>
Date: Wed, 02 Dec 2020 17:03:34 +1100
Message-ID: <87blfcwxqh.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 07/11/2020 =C3=A0 03:33, Nicholas Piggin a =C3=A9crit=C2=A0:
>> It's often useful to know the register state for interrupts in
>> the stack frame. In the below example (with this patch applied),
>> the important information is the state of the page fault.
>>=20
>> A blatant case like this probably rather should have the page
>> fault regs passed down to the warning, but quite often there are
>> less obvious cases where an interrupt shows up that might give
>> some more clues.
>>=20
>> The downside is longer and more complex bug output.
>
> Do we want all interrupts, including system call ?

I think we do.

> I don't find the dump of the syscall interrupt so usefull, do you ?

Yes :)

Because it's consistent, ie. we always show the full chain back to
userspace.

I think it's also helpful for folks who are less familiar with how
things work to show all the pieces, rather than hiding syscalls or
treating them specially.

Also I'm pretty sure I've had occasions where I've been debugging and
wanted to see the values that came in from userspace.

cheers


> See below an (unexpected?) KUAP warning due to an expected NULL pointer d=
ereference in=20
> copy_from_kernel_nofault() called from kthread_probe_data()
>
>
> [ 1117.202054] ------------[ cut here ]------------
> [ 1117.202102] Bug: fault blocked by AP register !
> [ 1117.202261] WARNING: CPU: 0 PID: 377 at arch/powerpc/include/asm/nohas=
h/32/kup-8xx.h:66=20
> do_page_fault+0x4a8/0x5ec
> [ 1117.202310] Modules linked in:
> [ 1117.202428] CPU: 0 PID: 377 Comm: sh Tainted: G        W=20
> 5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty #4175
> [ 1117.202499] NIP:  c0012048 LR: c0012048 CTR: 00000000
> [ 1117.202573] REGS: cacdbb88 TRAP: 0700   Tainted: G        W=20
> (5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty)
> [ 1117.202625] MSR:  00021032 <ME,IR,DR,RI>  CR: 24082222  XER: 20000000
> [ 1117.202899]
> [ 1117.202899] GPR00: c0012048 cacdbc40 c2929290 00000023 c092e554 000000=
01 c09865e8 c092e640
> [ 1117.202899] GPR08: 00001032 00000000 00000000 00014efc 28082224 100d16=
6a 100a0920 00000000
> [ 1117.202899] GPR16: 100cac0c 100b0000 1080c3fc 1080d685 100d0000 100d00=
00 00000000 100a0900
> [ 1117.202899] GPR24: 100d0000 c07892ec 00000000 c0921510 c21f4440 000000=
5c c0000000 cacdbc80
> [ 1117.204362] NIP [c0012048] do_page_fault+0x4a8/0x5ec
> [ 1117.204461] LR [c0012048] do_page_fault+0x4a8/0x5ec
> [ 1117.204509] Call Trace:
> [ 1117.204609] [cacdbc40] [c0012048] do_page_fault+0x4a8/0x5ec (unreliabl=
e)
> [ 1117.204771] [cacdbc70] [c00112f0] handle_page_fault+0x8/0x34
> [ 1117.204911] --- interrupt: 301 at copy_from_kernel_nofault+0x70/0x1c0
> [ 1117.204979] NIP:  c010dbec LR: c010dbac CTR: 00000001
> [ 1117.205053] REGS: cacdbc80 TRAP: 0301   Tainted: G        W=20
> (5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty)
> [ 1117.205104] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 28082224  XER: 000000=
00
> [ 1117.205416] DAR: 0000005c DSISR: c0000000
> [ 1117.205416] GPR00: c0045948 cacdbd38 c2929290 00000001 00000017 000000=
17 00000027 0000000f
> [ 1117.205416] GPR08: c09926ec 00000000 00000000 3ffff000 24082224
> [ 1117.206106] NIP [c010dbec] copy_from_kernel_nofault+0x70/0x1c0
> [ 1117.206202] LR [c010dbac] copy_from_kernel_nofault+0x30/0x1c0
> [ 1117.206258] --- interrupt: 301
> [ 1117.206372] [cacdbd38] [c004bbb0] kthread_probe_data+0x44/0x70 (unreli=
able)
> [ 1117.206561] [cacdbd58] [c0045948] print_worker_info+0xe0/0x194
> [ 1117.206717] [cacdbdb8] [c00548ac] sched_show_task+0x134/0x168
> [ 1117.206851] [cacdbdd8] [c005a268] show_state_filter+0x70/0x100
> [ 1117.206989] [cacdbe08] [c039baa0] sysrq_handle_showstate+0x14/0x24
> [ 1117.207122] [cacdbe18] [c039bf18] __handle_sysrq+0xac/0x1d0
> [ 1117.207257] [cacdbe48] [c039c0c0] write_sysrq_trigger+0x4c/0x74
> [ 1117.207407] [cacdbe68] [c01fba48] proc_reg_write+0xb4/0x114
> [ 1117.207550] [cacdbe88] [c0179968] vfs_write+0x12c/0x478
> [ 1117.207686] [cacdbf08] [c0179e60] ksys_write+0x78/0x128
> [ 1117.207826] [cacdbf38] [c00110d0] ret_from_syscall+0x0/0x34
> [ 1117.207938] --- interrupt: c01 at 0xfd4e784
> [ 1117.208008] NIP:  0fd4e784 LR: 0fe0f244 CTR: 10048d38
> [ 1117.208083] REGS: cacdbf48 TRAP: 0c01   Tainted: G        W=20
> (5.10.0-rc5-s3k-dev-01340-g83f53be2de31-dirty)
> [ 1117.208134] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 44002222  XER: 000=
00000
> [ 1117.208470]
> [ 1117.208470] GPR00: 00000004 7fc34090 77bfb4e0 00000001 1080fa40 000000=
02 7400000f fefefeff
> [ 1117.208470] GPR08: 7f7f7f7f 10048d38 1080c414 7fc343c0 00000000
> [ 1117.209104] NIP [0fd4e784] 0xfd4e784
> [ 1117.209180] LR [0fe0f244] 0xfe0f244
> [ 1117.209236] --- interrupt: c01
> [ 1117.209274] Instruction dump:
> [ 1117.209353] 714a4000 418200f0 73ca0001 40820084 73ca0032 408200f8 73c9=
0040 4082ff60
> [ 1117.209727] 0fe00000 3c60c082 386399f4 48013b65 <0fe00000> 80010034 38=
60000b 7c0803a6
> [ 1117.210102] ---[ end trace 1927c0323393af3e ]---
>
> Christophe
>
>
>>=20
>>    Bug: Write fault blocked by AMR!
>>    WARNING: CPU: 0 PID: 72 at arch/powerpc/include/asm/book3s/64/kup-rad=
ix.h:164 __do_page_fault+0x880/0xa90
>>    Modules linked in:
>>    CPU: 0 PID: 72 Comm: systemd-gpt-aut Not tainted
>>    NIP:  c00000000006e2f0 LR: c00000000006e2ec CTR: 0000000000000000
>>    REGS: c00000000a4f3420 TRAP: 0700
>>    MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28002840  XER: 200400=
00
>>    CFAR: c000000000128be0 IRQMASK: 3
>>    GPR00: c00000000006e2ec c00000000a4f36c0 c0000000014f0700 00000000000=
00020
>>    GPR04: 0000000000000001 c000000001290f50 0000000000000001 c0000000012=
90f80
>>    GPR08: c000000001612b08 0000000000000000 0000000000000000 00000000fff=
fe0f7
>>    GPR12: 0000000048002840 c0000000016e0000 c00c000000021c80 c000000000f=
d6f60
>>    GPR16: 0000000000000000 c00000000a104698 0000000000000003 c0000000087=
f0000
>>    GPR20: 0000000000000100 c0000000070330b8 0000000000000000 00000000000=
00004
>>    GPR24: 0000000002000000 0000000000000300 0000000002000000 c00000000a5=
b0c00
>>    GPR28: 0000000000000000 000000000a000000 00007fffb2a90038 c00000000a4=
f3820
>>    NIP [c00000000006e2f0] __do_page_fault+0x880/0xa90
>>    LR [c00000000006e2ec] __do_page_fault+0x87c/0xa90
>>    Call Trace:
>>    [c00000000a4f36c0] [c00000000006e2ec] __do_page_fault+0x87c/0xa90 (un=
reliable)
>>    [c00000000a4f3780] [c000000000e1c034] do_page_fault+0x34/0x90
>>    [c00000000a4f37b0] [c000000000008908] data_access_common_virt+0x158/0=
x1b0
>>    --- interrupt: 300 at __copy_tofrom_user_base+0x9c/0x5a4
>>    NIP:  c00000000009b028 LR: c000000000802978 CTR: 0000000000000800
>>    REGS: c00000000a4f3820 TRAP: 0300
>>    MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2400484=
0  XER: 00000000
>>    CFAR: c00000000009aff4 DAR: 00007fffb2a90038 DSISR: 0a000000 IRQMASK:=
 0
>>    GPR00: 0000000000000000 c00000000a4f3ac0 c0000000014f0700 00007fffb2a=
90028
>>    GPR04: c000000008720010 0000000000010000 0000000000000000 00000000000=
00000
>>    GPR08: 0000000000000000 0000000000000000 0000000000000000 00000000000=
00001
>>    GPR12: 0000000000004000 c0000000016e0000 c00c000000021c80 c000000000f=
d6f60
>>    GPR16: 0000000000000000 c00000000a104698 0000000000000003 c0000000087=
f0000
>>    GPR20: 0000000000000100 c0000000070330b8 0000000000000000 00000000000=
00004
>>    GPR24: c00000000a4f3c80 c000000008720000 0000000000010000 00000000000=
00000
>>    GPR28: 0000000000010000 0000000008720000 0000000000010000 c0000000015=
15b98
>>    NIP [c00000000009b028] __copy_tofrom_user_base+0x9c/0x5a4
>>    LR [c000000000802978] copyout+0x68/0xc0
>>    --- interrupt: 300
>>    [c00000000a4f3af0] [c0000000008074b8] copy_page_to_iter+0x188/0x540
>>    [c00000000a4f3b50] [c00000000035c678] generic_file_buffered_read+0x35=
8/0xd80
>>    [c00000000a4f3c40] [c0000000004c1e90] blkdev_read_iter+0x50/0x80
>>    [c00000000a4f3c60] [c00000000045733c] new_sync_read+0x12c/0x1c0
>>    [c00000000a4f3d00] [c00000000045a1f0] vfs_read+0x1d0/0x240
>>    [c00000000a4f3d50] [c00000000045a7f4] ksys_read+0x84/0x140
>>    [c00000000a4f3da0] [c000000000033a60] system_call_exception+0x100/0x2=
80
>>    [c00000000a4f3e10] [c00000000000c508] system_call_common+0xf8/0x2f8
>>    Instruction dump:
>>    eae10078 3be0000b 4bfff890 60420000 792917e1 4182ff18 3c82ffab 3884a5=
e0
>>    3c62ffab 3863a6e8 480ba891 60000000 <0fe00000> 3be0000b 4bfff860 e93c=
0938
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/process.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process=
.c
>> index ea36a29c8b01..799f00b32f74 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -1475,12 +1475,10 @@ static void print_msr_bits(unsigned long val)
>>   #define LAST_VOLATILE	12
>>   #endif
>>=20=20=20
>> -void show_regs(struct pt_regs * regs)
>> +static void __show_regs(struct pt_regs *regs)
>>   {
>>   	int i, trap;
>>=20=20=20
>> -	show_regs_print_info(KERN_DEFAULT);
>> -
>>   	printk("NIP:  "REG" LR: "REG" CTR: "REG"\n",
>>   	       regs->nip, regs->link, regs->ctr);
>>   	printk("REGS: %px TRAP: %04lx   %s  (%s)\n",
>> @@ -1522,6 +1520,12 @@ void show_regs(struct pt_regs * regs)
>>   		printk("NIP ["REG"] %pS\n", regs->nip, (void *)regs->nip);
>>   		printk("LR ["REG"] %pS\n", regs->link, (void *)regs->link);
>>   	}
>> +}
>> +
>> +void show_regs(struct pt_regs *regs)
>> +{
>> +	show_regs_print_info(KERN_DEFAULT);
>> +	__show_regs(regs);
>>   	show_stack(current, (unsigned long *) regs->gpr[1], KERN_DEFAULT);
>>   	if (!user_mode(regs))
>>   		show_instructions(regs);
>> @@ -2192,10 +2196,14 @@ void show_stack(struct task_struct *tsk, unsigne=
d long *stack,
>>   		    && stack[STACK_FRAME_MARKER] =3D=3D STACK_FRAME_REGS_MARKER) {
>>   			struct pt_regs *regs =3D (struct pt_regs *)
>>   				(sp + STACK_FRAME_OVERHEAD);
>> +
>>   			lr =3D regs->link;
>> -			printk("%s--- interrupt: %lx at %pS\n    LR =3D %pS\n",
>> -			       loglvl, regs->trap,
>> -			       (void *)regs->nip, (void *)lr);
>> +			printk("%s--- interrupt: %lx at %pS\n",
>> +			       loglvl, regs->trap, (void *)regs->nip);
>> +			__show_regs(regs);
>> +			printk("%s--- interrupt: %lx\n",
>> +			       loglvl, regs->trap);
>> +
>>   			firstframe =3D 1;
>>   		}
>>=20=20=20
>>=20
