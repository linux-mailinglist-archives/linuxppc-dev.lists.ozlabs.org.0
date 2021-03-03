Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBAA32B69A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 11:32:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr9Kw64dJz3d6X
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 21:32:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr9Kc1bZhz30Lk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 21:32:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dr9KW1qJQz9tygX;
 Wed,  3 Mar 2021 11:31:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0QULnvIuV7Xg; Wed,  3 Mar 2021 11:31:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dr9KW0l9sz9tygT;
 Wed,  3 Mar 2021 11:31:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C19B08B7CD;
 Wed,  3 Mar 2021 11:32:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jz1xUYx8uX1J; Wed,  3 Mar 2021 11:32:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 04AC38B7C3;
 Wed,  3 Mar 2021 11:31:59 +0100 (CET)
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Marco Elver <elver@google.com>
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3abbe4c9-16ad-c168-a90f-087978ccd8f7@csgroup.eu>
Date: Wed, 3 Mar 2021 11:31:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
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
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/03/2021 à 10:53, Marco Elver a écrit :
> On Tue, 2 Mar 2021 at 10:27, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> Le 02/03/2021 à 10:21, Alexander Potapenko a écrit :
>>>> [   14.998426] BUG: KFENCE: invalid read in finish_task_switch.isra.0+0x54/0x23c
>>>> [   14.998426]
>>>> [   15.007061] Invalid read at 0x(ptrval):
>>>> [   15.010906]  finish_task_switch.isra.0+0x54/0x23c
>>>> [   15.015633]  kunit_try_run_case+0x5c/0xd0
>>>> [   15.019682]  kunit_generic_run_threadfn_adapter+0x24/0x30
>>>> [   15.025099]  kthread+0x15c/0x174
>>>> [   15.028359]  ret_from_kernel_thread+0x14/0x1c
>>>> [   15.032747]
>>>> [   15.034251] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
>>>> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
>>>> [   15.045811] ==================================================================
>>>> [   15.053324]     # test_invalid_access: EXPECTATION FAILED at mm/kfence/kfence_test.c:636
>>>> [   15.053324]     Expected report_matches(&expect) to be true, but is false
>>>> [   15.068359]     not ok 21 - test_invalid_access
>>>
>>> The test expects the function name to be test_invalid_access, i. e.
>>> the first line should be "BUG: KFENCE: invalid read in
>>> test_invalid_access".
>>> The error reporting function unwinds the stack, skips a couple of
>>> "uninteresting" frames
>>> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L43)
>>> and uses the first "interesting" one frame to print the report header
>>> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L226).
>>>
>>> It's strange that test_invalid_access is missing altogether from the
>>> stack trace - is that expected?
>>> Can you try printing the whole stacktrace without skipping any frames
>>> to see if that function is there?
>>>
>>
>> Booting with 'no_hash_pointers" I get the following. Does it helps ?
>>
>> [   16.837198] ==================================================================
>> [   16.848521] BUG: KFENCE: invalid read in finish_task_switch.isra.0+0x54/0x23c
>> [   16.848521]
>> [   16.857158] Invalid read at 0xdf98800a:
>> [   16.861004]  finish_task_switch.isra.0+0x54/0x23c
>> [   16.865731]  kunit_try_run_case+0x5c/0xd0
>> [   16.869780]  kunit_generic_run_threadfn_adapter+0x24/0x30
>> [   16.875199]  kthread+0x15c/0x174
>> [   16.878460]  ret_from_kernel_thread+0x14/0x1c
>> [   16.882847]
>> [   16.884351] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
>> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
>> [   16.895908] NIP:  c016eb8c LR: c02f50dc CTR: c016eb38
>> [   16.900963] REGS: e2449d90 TRAP: 0301   Tainted: G    B
>> (5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty)
>> [   16.911386] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 00000000
>> [   16.918153] DAR: df98800a DSISR: 20000000
>> [   16.918153] GPR00: c02f50dc e2449e50 c1140d00 e100dd24 c084b13c 00000008 c084b32b c016eb38
>> [   16.918153] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
>> [   16.936695] NIP [c016eb8c] test_invalid_access+0x54/0x108
>> [   16.942125] LR [c02f50dc] kunit_try_run_case+0x5c/0xd0
>> [   16.947292] Call Trace:
>> [   16.949746] [e2449e50] [c005a5ec] finish_task_switch.isra.0+0x54/0x23c (unreliable)
> 
> The "(unreliable)" might be a clue that it's related to ppc32 stack
> unwinding. Any ppc expert know what this is about?
> 
>> [   16.957443] [e2449eb0] [c02f50dc] kunit_try_run_case+0x5c/0xd0
>> [   16.963319] [e2449ed0] [c02f63ec] kunit_generic_run_threadfn_adapter+0x24/0x30
>> [   16.970574] [e2449ef0] [c004e710] kthread+0x15c/0x174
>> [   16.975670] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
>> [   16.981896] Instruction dump:
>> [   16.984879] 8129d608 38e7eb38 81020280 911f004c 39000000 995f0024 907f0028 90ff001c
>> [   16.992710] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0 812a4b98 3d40c02f
>> [   17.000711] ==================================================================
>> [   17.008223]     # test_invalid_access: EXPECTATION FAILED at mm/kfence/kfence_test.c:636
>> [   17.008223]     Expected report_matches(&expect) to be true, but is false
>> [   17.023243]     not ok 21 - test_invalid_access
> 
> On a fault in test_invalid_access, KFENCE prints the stack trace based
> on the information in pt_regs. So we do not think there's anything we
> can do to improve stack printing pe-se.
> 
> What's confusing is that it's only this test, and none of the others.
> Given that, it might be code-gen related, which results in some subtle
> issue with stack unwinding. There are a few things to try, if you feel
> like it:
> 
> -- Change the unwinder, if it's possible for ppc32.
> 
> -- Add code to test_invalid_access(), to get the compiler to emit
> different code. E.g. add a bunch (unnecessary) function calls, or add
> barriers, etc.
> 
> -- Play with compiler options. We already pass
> -fno-optimize-sibling-calls for kfence_test.o to avoid tail-call
> optimizations that'd hide stack trace entries. But perhaps there's
> something ppc-specific we missed?
> 
> Well, the good thing is that KFENCE detects the bad access just fine.
> Since, according to the test, everything works from KFENCE's side, I'd
> be happy to give my Ack:
> 
>    Acked-by: Marco Elver <elver@google.com>
> 

Thanks.

For you information, I've got a pile of warnings from mm/kfence/report.o . Is that expected ?

   CC      mm/kfence/report.o
In file included from ./include/linux/printk.h:7,
                  from ./include/linux/kernel.h:16,
                  from mm/kfence/report.c:10:
mm/kfence/report.c: In function 'kfence_report_error':
./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', 
but argument 6 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=]
     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
       |                  ^~~~~~
./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
       |                  ^~~~~~~~
./include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
   343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |         ^~~~~~~~
mm/kfence/report.c:207:3: note: in expansion of macro 'pr_err'
   207 |   pr_err("Out-of-bounds %s at 0x%p (%luB %s of kfence-#%zd):\n",
       |   ^~~~~~
./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', 
but argument 4 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=]
     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
       |                  ^~~~~~
./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
       |                  ^~~~~~~~
./include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
   343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |         ^~~~~~~~
mm/kfence/report.c:216:3: note: in expansion of macro 'pr_err'
   216 |   pr_err("Use-after-free %s at 0x%p (in kfence-#%zd):\n",
       |   ^~~~~~
./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', 
but argument 2 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=]
     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
       |                  ^~~~~~
./include/linux/kern_levels.h:24:19: note: in expansion of macro 'KERN_SOH'
    24 | #define KERN_CONT KERN_SOH "c"
       |                   ^~~~~~~~
./include/linux/printk.h:385:9: note: in expansion of macro 'KERN_CONT'
   385 |  printk(KERN_CONT fmt, ##__VA_ARGS__)
       |         ^~~~~~~~~
mm/kfence/report.c:223:3: note: in expansion of macro 'pr_cont'
   223 |   pr_cont(" (in kfence-#%zd):\n", object_index);
       |   ^~~~~~~
./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argument of type 'signed size_t', 
but argument 3 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=]
     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
       |                  ^~~~~~
./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
       |                  ^~~~~~~~
./include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
   343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
       |         ^~~~~~~~
mm/kfence/report.c:233:3: note: in expansion of macro 'pr_err'
   233 |   pr_err("Invalid free of 0x%p (in kfence-#%zd):\n", (void *)address,
       |   ^~~~~~

Christophe
