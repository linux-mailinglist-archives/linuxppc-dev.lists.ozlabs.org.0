Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D62DB32D1FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 12:49:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drq0G6GKpz3d8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:49:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drpzy0bN0z30hv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:48:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Drpzp3xTYz9v1sK;
 Thu,  4 Mar 2021 12:48:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id h-mitI98mN7r; Thu,  4 Mar 2021 12:48:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Drpzp2DxPz9v1sG;
 Thu,  4 Mar 2021 12:48:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2270C8B7FF;
 Thu,  4 Mar 2021 12:48:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VRrx4alowTpf; Thu,  4 Mar 2021 12:48:56 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 665B48B773;
 Thu,  4 Mar 2021 12:48:55 +0100 (CET)
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
Date: Thu, 4 Mar 2021 12:48:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
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



Le 04/03/2021 à 12:31, Marco Elver a écrit :
> On Thu, 4 Mar 2021 at 12:23, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> Le 03/03/2021 à 11:56, Marco Elver a écrit :
>>>
>>> Somewhat tangentially, I also note that e.g. show_regs(regs) (which
>>> was printed along the KFENCE report above) didn't include the top
>>> frame in the "Call Trace", so this assumption is definitely not
>>> isolated to KFENCE.
>>>
>>
>> Now, I have tested PPC64 (with the patch I sent yesterday to modify save_stack_trace_regs()
>> applied), and I get many failures. Any idea ?
>>
>> [   17.653751][   T58] ==================================================================
>> [   17.654379][   T58] BUG: KFENCE: invalid free in .kfence_guarded_free+0x2e4/0x530
>> [   17.654379][   T58]
>> [   17.654831][   T58] Invalid free of 0xc00000003c9c0000 (in kfence-#77):
>> [   17.655358][   T58]  .kfence_guarded_free+0x2e4/0x530
>> [   17.655775][   T58]  .__slab_free+0x320/0x5a0
>> [   17.656039][   T58]  .test_double_free+0xe0/0x198
>> [   17.656308][   T58]  .kunit_try_run_case+0x80/0x110
>> [   17.656523][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
>> [   17.657161][   T58]  .kthread+0x18c/0x1a0
>> [   17.659148][   T58]  .ret_from_kernel_thread+0x58/0x70
>> [   17.659869][   T58]
>> [   17.663954][   T58] kfence-#77 [0xc00000003c9c0000-0xc00000003c9c001f, size=32, cache=kmalloc-32]
>> allocated by task 58:
>> [   17.666113][   T58]  .__kfence_alloc+0x1bc/0x510
>> [   17.667069][   T58]  .__kmalloc+0x280/0x4f0
>> [   17.667452][   T58]  .test_alloc+0x19c/0x430
>> [   17.667732][   T58]  .test_double_free+0x88/0x198
>> [   17.667971][   T58]  .kunit_try_run_case+0x80/0x110
>> [   17.668283][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
>> [   17.668553][   T58]  .kthread+0x18c/0x1a0
>> [   17.669315][   T58]  .ret_from_kernel_thread+0x58/0x70
>> [   17.669711][   T58]
>> [   17.669711][   T58] freed by task 58:
>> [   17.670116][   T58]  .kfence_guarded_free+0x3d0/0x530
>> [   17.670421][   T58]  .__slab_free+0x320/0x5a0
>> [   17.670603][   T58]  .test_double_free+0xb4/0x198
>> [   17.670827][   T58]  .kunit_try_run_case+0x80/0x110
>> [   17.671073][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
>> [   17.671410][   T58]  .kthread+0x18c/0x1a0
>> [   17.671618][   T58]  .ret_from_kernel_thread+0x58/0x70
>> [   17.671972][   T58]
>> [   17.672638][   T58] CPU: 0 PID: 58 Comm: kunit_try_catch Tainted: G    B
>> 5.12.0-rc1-01540-g0783285cc1b8-dirty #4685
>> [   17.673768][   T58] ==================================================================
>> [   17.677031][   T58]     # test_double_free: EXPECTATION FAILED at mm/kfence/kfence_test.c:380
>> [   17.677031][   T58]     Expected report_matches(&expect) to be true, but is false
>> [   17.684397][    T1]     not ok 7 - test_double_free
>> [   17.686463][   T59]     # test_double_free-memcache: setup_test_cache: size=32, ctor=0x0
>> [   17.688403][   T59]     # test_double_free-memcache: test_alloc: size=32, gfp=cc0, policy=any,
>> cache=1
> 
> Looks like something is prepending '.' to function names. We expect
> the function name to appear as-is, e.g. "kfence_guarded_free",
> "test_double_free", etc.
> 
> Is there something special on ppc64, where the '.' is some convention?
> 

I think so, see https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html#FUNC-DES

Also see commit https://github.com/linuxppc/linux/commit/02424d896

Christophe
