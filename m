Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A197D32B8BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 15:53:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrH6m53J9z3cZM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 01:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrH6S1BMWz30Lh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 01:52:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrH6K5yVWz9tyY7;
 Wed,  3 Mar 2021 15:52:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rUeZkj7gGtB7; Wed,  3 Mar 2021 15:52:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrH6K50QRz9tyY3;
 Wed,  3 Mar 2021 15:52:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 85C278B7E6;
 Wed,  3 Mar 2021 15:52:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SVrpgpT8WrDo; Wed,  3 Mar 2021 15:52:41 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E37758B7DB;
 Wed,  3 Mar 2021 15:52:40 +0100 (CET)
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
To: Marco Elver <elver@google.com>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
Date: Wed, 3 Mar 2021 15:52:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/03/2021 à 15:38, Marco Elver a écrit :
> On Wed, 3 Mar 2021 at 15:09, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> It seems like all other sane architectures, namely x86 and arm64
>> at least, include the running function as top entry when saving
>> stack trace.
>>
>> Functionnalities like KFENCE expect it.
>>
>> Do the same on powerpc, it allows KFENCE to properly identify the faulting
>> function as depicted below. Before the patch KFENCE was identifying
>> finish_task_switch.isra as the faulting function.
>>
>> [   14.937370] ==================================================================
>> [   14.948692] BUG: KFENCE: invalid read in test_invalid_access+0x54/0x108
>> [   14.948692]
>> [   14.956814] Invalid read at 0xdf98800a:
>> [   14.960664]  test_invalid_access+0x54/0x108
>> [   14.964876]  finish_task_switch.isra.0+0x54/0x23c
>> [   14.969606]  kunit_try_run_case+0x5c/0xd0
>> [   14.973658]  kunit_generic_run_threadfn_adapter+0x24/0x30
>> [   14.979079]  kthread+0x15c/0x174
>> [   14.982342]  ret_from_kernel_thread+0x14/0x1c
>> [   14.986731]
>> [   14.988236] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B             5.12.0-rc1-01537-g95f6e2088d7e-dirty #4682
>> [   14.999795] NIP:  c016ec2c LR: c02f517c CTR: c016ebd8
>> [   15.004851] REGS: e2449d90 TRAP: 0301   Tainted: G    B              (5.12.0-rc1-01537-g95f6e2088d7e-dirty)
>> [   15.015274] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 00000000
>> [   15.022043] DAR: df98800a DSISR: 20000000
>> [   15.022043] GPR00: c02f517c e2449e50 c1142080 e100dd24 c084b13c 00000008 c084b32b c016ebd8
>> [   15.022043] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
>> [   15.040581] NIP [c016ec2c] test_invalid_access+0x54/0x108
>> [   15.046010] LR [c02f517c] kunit_try_run_case+0x5c/0xd0
>> [   15.051181] Call Trace:
>> [   15.053637] [e2449e50] [c005a68c] finish_task_switch.isra.0+0x54/0x23c (unreliable)
>> [   15.061338] [e2449eb0] [c02f517c] kunit_try_run_case+0x5c/0xd0
>> [   15.067215] [e2449ed0] [c02f648c] kunit_generic_run_threadfn_adapter+0x24/0x30
>> [   15.074472] [e2449ef0] [c004e7b0] kthread+0x15c/0x174
>> [   15.079571] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
>> [   15.085798] Instruction dump:
>> [   15.088784] 8129d608 38e7ebd8 81020280 911f004c 39000000 995f0024 907f0028 90ff001c
>> [   15.096613] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0 812a4b98 3d40c02f
>> [   15.104612] ==================================================================
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Acked-by: Marco Elver <elver@google.com>
> 
> Thank you, I think this looks like the right solution. Just a question below:
> 
...

>> @@ -59,23 +70,26 @@ void save_stack_trace(struct stack_trace *trace)
>>
>>          sp = current_stack_frame();
>>
>> -       save_context_stack(trace, sp, current, 1);
>> +       save_context_stack(trace, sp, (unsigned long)save_stack_trace, current, 1);
> 
> This causes ip == save_stack_trace and also below for
> save_stack_trace_tsk. Does this mean save_stack_trace() is included in
> the trace? Looking at kernel/stacktrace.c, I think the library wants
> to exclude itself from the trace, as it does '.skip = skipnr + 1' (and
> '.skip   = skipnr + (current == tsk)' for the _tsk variant).
> 
> If the arch-helper here is included, should this use _RET_IP_ instead?
> 

Don't really know, I was inspired by arm64 which has:

void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
		     struct task_struct *task, struct pt_regs *regs)
{
	struct stackframe frame;

	if (regs)
		start_backtrace(&frame, regs->regs[29], regs->pc);
	else if (task == current)
		start_backtrace(&frame,
				(unsigned long)__builtin_frame_address(0),
				(unsigned long)arch_stack_walk);
	else
		start_backtrace(&frame, thread_saved_fp(task),
				thread_saved_pc(task));

	walk_stackframe(task, &frame, consume_entry, cookie);
}


But looking at x86 you may be right, so what should be done really ?

Thanks
Christophe
