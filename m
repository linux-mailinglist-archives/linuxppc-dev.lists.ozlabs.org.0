Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E956D32D225
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 13:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrqFL6nSQz3d8K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 23:00:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrqF05dYYz30LZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 23:00:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrqDp6YzNz9txSQ;
 Thu,  4 Mar 2021 13:00:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ul2e4nFalk73; Thu,  4 Mar 2021 13:00:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrqDp5jDSz9txSN;
 Thu,  4 Mar 2021 13:00:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7298D8B773;
 Thu,  4 Mar 2021 13:00:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3Rhw-N1jCZuV; Thu,  4 Mar 2021 13:00:12 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFDDC8B7FF;
 Thu,  4 Mar 2021 13:00:11 +0100 (CET)
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marco Elver <elver@google.com>
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
Message-ID: <72e31c34-e947-1084-2bd2-f5b80786f827@csgroup.eu>
Date: Thu, 4 Mar 2021 13:00:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
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



Le 04/03/2021 à 12:48, Christophe Leroy a écrit :
> 
> 
> Le 04/03/2021 à 12:31, Marco Elver a écrit :
>> On Thu, 4 Mar 2021 at 12:23, Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>> Le 03/03/2021 à 11:56, Marco Elver a écrit :
>>>>
>>>> Somewhat tangentially, I also note that e.g. show_regs(regs) (which
>>>> was printed along the KFENCE report above) didn't include the top
>>>> frame in the "Call Trace", so this assumption is definitely not
>>>> isolated to KFENCE.
>>>>
>>>
>>> Now, I have tested PPC64 (with the patch I sent yesterday to modify save_stack_trace_regs()
>>> applied), and I get many failures. Any idea ?
>>>
>>> [   17.653751][   T58] ==================================================================
>>> [   17.654379][   T58] BUG: KFENCE: invalid free in .kfence_guarded_free+0x2e4/0x530
>>> [   17.654379][   T58]
>>> [   17.654831][   T58] Invalid free of 0xc00000003c9c0000 (in kfence-#77):
>>> [   17.655358][   T58]  .kfence_guarded_free+0x2e4/0x530
>>> [   17.655775][   T58]  .__slab_free+0x320/0x5a0
>>> [   17.656039][   T58]  .test_double_free+0xe0/0x198
>>> [   17.656308][   T58]  .kunit_try_run_case+0x80/0x110
>>> [   17.656523][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
>>> [   17.657161][   T58]  .kthread+0x18c/0x1a0
>>> [   17.659148][   T58]  .ret_from_kernel_thread+0x58/0x70
>>> [   17.659869][   T58]
>>> [   17.663954][   T58] kfence-#77 [0xc00000003c9c0000-0xc00000003c9c001f, size=32, cache=kmalloc-32]
>>> allocated by task 58:
>>> [   17.666113][   T58]  .__kfence_alloc+0x1bc/0x510
>>> [   17.667069][   T58]  .__kmalloc+0x280/0x4f0
>>> [   17.667452][   T58]  .test_alloc+0x19c/0x430
>>> [   17.667732][   T58]  .test_double_free+0x88/0x198
>>> [   17.667971][   T58]  .kunit_try_run_case+0x80/0x110
>>> [   17.668283][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
>>> [   17.668553][   T58]  .kthread+0x18c/0x1a0
>>> [   17.669315][   T58]  .ret_from_kernel_thread+0x58/0x70
>>> [   17.669711][   T58]
>>> [   17.669711][   T58] freed by task 58:
>>> [   17.670116][   T58]  .kfence_guarded_free+0x3d0/0x530
>>> [   17.670421][   T58]  .__slab_free+0x320/0x5a0
>>> [   17.670603][   T58]  .test_double_free+0xb4/0x198
>>> [   17.670827][   T58]  .kunit_try_run_case+0x80/0x110
>>> [   17.671073][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
>>> [   17.671410][   T58]  .kthread+0x18c/0x1a0
>>> [   17.671618][   T58]  .ret_from_kernel_thread+0x58/0x70
>>> [   17.671972][   T58]
>>> [   17.672638][   T58] CPU: 0 PID: 58 Comm: kunit_try_catch Tainted: G    B
>>> 5.12.0-rc1-01540-g0783285cc1b8-dirty #4685
>>> [   17.673768][   T58] ==================================================================
>>> [   17.677031][   T58]     # test_double_free: EXPECTATION FAILED at mm/kfence/kfence_test.c:380
>>> [   17.677031][   T58]     Expected report_matches(&expect) to be true, but is false
>>> [   17.684397][    T1]     not ok 7 - test_double_free
>>> [   17.686463][   T59]     # test_double_free-memcache: setup_test_cache: size=32, ctor=0x0
>>> [   17.688403][   T59]     # test_double_free-memcache: test_alloc: size=32, gfp=cc0, policy=any,
>>> cache=1
>>
>> Looks like something is prepending '.' to function names. We expect
>> the function name to appear as-is, e.g. "kfence_guarded_free",
>> "test_double_free", etc.
>>
>> Is there something special on ppc64, where the '.' is some convention?
>>
> 
> I think so, see https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html#FUNC-DES
> 
> Also see commit https://github.com/linuxppc/linux/commit/02424d896
> 

But I'm wondering, if the dot is the problem, how so is the following one ok ?

[   79.574457][   T75]     # test_krealloc: test_alloc: size=32, gfp=cc0, policy=any, cache=0
[   79.682728][   T75] ==================================================================
[   79.684017][   T75] BUG: KFENCE: use-after-free read in .test_krealloc+0x4fc/0x5b8
[   79.684017][   T75]
[   79.684955][   T75] Use-after-free read at 0xc00000003d060000 (in kfence-#130):
[   79.687581][   T75]  .test_krealloc+0x4fc/0x5b8
[   79.688216][   T75]  .test_krealloc+0x4e4/0x5b8
[   79.688824][   T75]  .kunit_try_run_case+0x80/0x110
[   79.689737][   T75]  .kunit_generic_run_threadfn_adapter+0x38/0x50
[   79.690335][   T75]  .kthread+0x18c/0x1a0
[   79.691092][   T75]  .ret_from_kernel_thread+0x58/0x70
[   79.692081][   T75]
[   79.692671][   T75] kfence-#130 [0xc00000003d060000-0xc00000003d06001f, size=32, 
cache=kmalloc-32] allocated by task 75:
[   79.700977][   T75]  .__kfence_alloc+0x1bc/0x510
[   79.701812][   T75]  .__kmalloc+0x280/0x4f0
[   79.702695][   T75]  .test_alloc+0x19c/0x430
[   79.703051][   T75]  .test_krealloc+0xa8/0x5b8
[   79.703276][   T75]  .kunit_try_run_case+0x80/0x110
[   79.703693][   T75]  .kunit_generic_run_threadfn_adapter+0x38/0x50
[   79.704223][   T75]  .kthread+0x18c/0x1a0
[   79.704586][   T75]  .ret_from_kernel_thread+0x58/0x70
[   79.704968][   T75]
[   79.704968][   T75] freed by task 75:
[   79.705756][   T75]  .kfence_guarded_free+0x3d0/0x530
[   79.706754][   T75]  .__slab_free+0x320/0x5a0
[   79.708575][   T75]  .krealloc+0xe8/0x180
[   79.708970][   T75]  .test_krealloc+0x1c8/0x5b8
[   79.709606][   T75]  .kunit_try_run_case+0x80/0x110
[   79.710204][   T75]  .kunit_generic_run_threadfn_adapter+0x38/0x50
[   79.710639][   T75]  .kthread+0x18c/0x1a0
[   79.710996][   T75]  .ret_from_kernel_thread+0x58/0x70
[   79.711349][   T75]
[   79.717435][   T75] CPU: 0 PID: 75 Comm: kunit_try_catch Tainted: G    B 
5.12.0-rc1-01540-g0783285cc1b8-dirty #4685
[   79.718124][   T75] NIP:  c000000000468a40 LR: c000000000468a28 CTR: 0000000000000000
[   79.727741][   T75] REGS: c000000007dd3830 TRAP: 0300   Tainted: G    B 
(5.12.0-rc1-01540-g0783285cc1b8-dirty)
[   79.733377][   T75] MSR:  8000000002009032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 28000440  XER: 00000000
[   79.738770][   T75] CFAR: c000000000888c7c DAR: c00000003d060000 DSISR: 40000000 IRQMASK: 0
[   79.738770][   T75] GPR00: c000000000468a28 c000000007dd3ad0 c000000001eaad00 c0000000073c3988
[   79.738770][   T75] GPR04: c000000007dd3b60 0000000000000001 0000000000000000 c00000003d060000
[   79.738770][   T75] GPR08: 00000000000002c8 0000000000000001 c0000000011bb410 c00000003fe903d8
[   79.738770][   T75] GPR12: 0000000028000440 c0000000020f0000 c0000000001a6460 c00000000724bb80
[   79.738770][   T75] GPR16: 0000000000000000 c00000000731749f c0000000011bb278 c00000000731749f
[   79.738770][   T75] GPR20: 00000001000002c1 0000000000000000 c0000000011bb278 c0000000011bb3b8
[   79.738770][   T75] GPR24: c0000000073174a0 c0000000011aa7b8 c000000001e35328 c00000000208ad00
[   79.738770][   T75] GPR28: 0000000000000000 c0000000011bb0b8 c0000000073c3988 c000000007dd3ad0
[   79.751744][   T75] NIP [c000000000468a40] .test_krealloc+0x4fc/0x5b8
[   79.752243][   T75] LR [c000000000468a28] .test_krealloc+0x4e4/0x5b8
[   79.752699][   T75] Call Trace:
[   79.753027][   T75] [c000000007dd3ad0] [c000000000468a28] .test_krealloc+0x4e4/0x5b8 (unreliable)
[   79.753878][   T75] [c000000007dd3c40] [c0000000008886d0] .kunit_try_run_case+0x80/0x110
[   79.754641][   T75] [c000000007dd3cd0] [c00000000088a808] 
.kunit_generic_run_threadfn_adapter+0x38/0x50
[   79.755494][   T75] [c000000007dd3d50] [c0000000001a65ec] .kthread+0x18c/0x1a0
[   79.757254][   T75] [c000000007dd3e10] [c00000000000dd68] .ret_from_kernel_thread+0x58/0x70
[   79.775521][   T75] Instruction dump:
[   79.776890][   T75] 68a50001 9b9f00c8 fbdf0090 fbbf00a0 fb5f00b8 484201cd 60000000 e8ff0080
[   79.783146][   T75] 3d42ff31 390002c8 394a0710 39200001 <88e70000> 38a00000 fb9f00a8 e8fbe80e
[   79.787563][   T75] ==================================================================
[   79.804667][    T1]     ok 24 - test_krealloc

Christophe
