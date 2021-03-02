Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5B3297D3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 10:28:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqWy61hJ2z3d31
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 20:27:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqWxp1Z6Nz3cGh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 20:27:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DqWxh65Czz9vBLF;
 Tue,  2 Mar 2021 10:27:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id D2UnChWDqhR1; Tue,  2 Mar 2021 10:27:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DqWxh58jrz9vBLD;
 Tue,  2 Mar 2021 10:27:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CDBF28B75F;
 Tue,  2 Mar 2021 10:27:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nNec12v5Mb1w; Tue,  2 Mar 2021 10:27:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 310CF8B7AD;
 Tue,  2 Mar 2021 10:27:37 +0100 (CET)
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Alexander Potapenko <glider@google.com>
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
Date: Tue, 2 Mar 2021 10:27:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
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
Cc: Marco Elver <elver@google.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/03/2021 à 10:21, Alexander Potapenko a écrit :
>> [   14.998426] BUG: KFENCE: invalid read in finish_task_switch.isra.0+0x54/0x23c
>> [   14.998426]
>> [   15.007061] Invalid read at 0x(ptrval):
>> [   15.010906]  finish_task_switch.isra.0+0x54/0x23c
>> [   15.015633]  kunit_try_run_case+0x5c/0xd0
>> [   15.019682]  kunit_generic_run_threadfn_adapter+0x24/0x30
>> [   15.025099]  kthread+0x15c/0x174
>> [   15.028359]  ret_from_kernel_thread+0x14/0x1c
>> [   15.032747]
>> [   15.034251] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
>> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
>> [   15.045811] ==================================================================
>> [   15.053324]     # test_invalid_access: EXPECTATION FAILED at mm/kfence/kfence_test.c:636
>> [   15.053324]     Expected report_matches(&expect) to be true, but is false
>> [   15.068359]     not ok 21 - test_invalid_access
> 
> The test expects the function name to be test_invalid_access, i. e.
> the first line should be "BUG: KFENCE: invalid read in
> test_invalid_access".
> The error reporting function unwinds the stack, skips a couple of
> "uninteresting" frames
> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L43)
> and uses the first "interesting" one frame to print the report header
> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L226).
> 
> It's strange that test_invalid_access is missing altogether from the
> stack trace - is that expected?
> Can you try printing the whole stacktrace without skipping any frames
> to see if that function is there?
> 

Booting with 'no_hash_pointers" I get the following. Does it helps ?

[   16.837198] ==================================================================
[   16.848521] BUG: KFENCE: invalid read in finish_task_switch.isra.0+0x54/0x23c
[   16.848521]
[   16.857158] Invalid read at 0xdf98800a:
[   16.861004]  finish_task_switch.isra.0+0x54/0x23c
[   16.865731]  kunit_try_run_case+0x5c/0xd0
[   16.869780]  kunit_generic_run_threadfn_adapter+0x24/0x30
[   16.875199]  kthread+0x15c/0x174
[   16.878460]  ret_from_kernel_thread+0x14/0x1c
[   16.882847]
[   16.884351] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B 
5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
[   16.895908] NIP:  c016eb8c LR: c02f50dc CTR: c016eb38
[   16.900963] REGS: e2449d90 TRAP: 0301   Tainted: G    B 
(5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty)
[   16.911386] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 00000000
[   16.918153] DAR: df98800a DSISR: 20000000
[   16.918153] GPR00: c02f50dc e2449e50 c1140d00 e100dd24 c084b13c 00000008 c084b32b c016eb38
[   16.918153] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
[   16.936695] NIP [c016eb8c] test_invalid_access+0x54/0x108
[   16.942125] LR [c02f50dc] kunit_try_run_case+0x5c/0xd0
[   16.947292] Call Trace:
[   16.949746] [e2449e50] [c005a5ec] finish_task_switch.isra.0+0x54/0x23c (unreliable)
[   16.957443] [e2449eb0] [c02f50dc] kunit_try_run_case+0x5c/0xd0
[   16.963319] [e2449ed0] [c02f63ec] kunit_generic_run_threadfn_adapter+0x24/0x30
[   16.970574] [e2449ef0] [c004e710] kthread+0x15c/0x174
[   16.975670] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
[   16.981896] Instruction dump:
[   16.984879] 8129d608 38e7eb38 81020280 911f004c 39000000 995f0024 907f0028 90ff001c
[   16.992710] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0 812a4b98 3d40c02f
[   17.000711] ==================================================================
[   17.008223]     # test_invalid_access: EXPECTATION FAILED at mm/kfence/kfence_test.c:636
[   17.008223]     Expected report_matches(&expect) to be true, but is false
[   17.023243]     not ok 21 - test_invalid_access
