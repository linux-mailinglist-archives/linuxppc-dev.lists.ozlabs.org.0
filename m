Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA2329CE8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 12:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqZtz1hdmz3d2k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 22:40:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gz/h8ua+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gz/h8ua+; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqZtZ6mxvz30PK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 22:40:06 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DqZtX1LwJz9sVt;
 Tue,  2 Mar 2021 22:40:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614685205;
 bh=zOGT8bj8ifBQh24/0m1Tf2gT7cTgyGIpmxD6cBaKfmk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gz/h8ua+vCSnhQX5pZeLs0F7oBJEBvvfLAA3vx+vrC7aFcX8YkmXFGwuwdGdn6Lwm
 7Peej5u/D0rBl1VfOKX/SaNFsJkFTawze2yEQpwiGucrjlfsb5ExB2dZYYWKgRrFyK
 xId3CqZWs+4Sbe3Z6ESiSaYRzkD89rs5gf0tNMX6X6T4csNAkoJz8oQqvSsgZOe9jn
 fflE9j8Vd3t3QcBvdOAmESipqsXXuK0fQPzOGgxA2h9rW8nslZJGtGHaGevD9nRfVC
 uvWf3KVX/ePWPqXyP060I97XNoT4QHbELGfDkJwhxmcK/7r1I5L/c7Z1DYojYrVy98
 lqzDK0gborrEg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Marco Elver
 <elver@google.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
In-Reply-To: <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
Date: Tue, 02 Mar 2021 22:40:03 +1100
Message-ID: <87h7ltss18.fsf@mpe.ellerman.id.au>
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 02/03/2021 =C3=A0 10:53, Marco Elver a =C3=A9crit=C2=A0:
>> On Tue, 2 Mar 2021 at 10:27, Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>> Le 02/03/2021 =C3=A0 10:21, Alexander Potapenko a =C3=A9crit :
>>>>> [   14.998426] BUG: KFENCE: invalid read in finish_task_switch.isra.0=
+0x54/0x23c
>>>>> [   14.998426]
>>>>> [   15.007061] Invalid read at 0x(ptrval):
>>>>> [   15.010906]  finish_task_switch.isra.0+0x54/0x23c
>>>>> [   15.015633]  kunit_try_run_case+0x5c/0xd0
>>>>> [   15.019682]  kunit_generic_run_threadfn_adapter+0x24/0x30
>>>>> [   15.025099]  kthread+0x15c/0x174
>>>>> [   15.028359]  ret_from_kernel_thread+0x14/0x1c
>>>>> [   15.032747]
>>>>> [   15.034251] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
>>>>> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
>>>>> [   15.045811] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> [   15.053324]     # test_invalid_access: EXPECTATION FAILED at mm/kf=
ence/kfence_test.c:636
>>>>> [   15.053324]     Expected report_matches(&expect) to be true, but i=
s false
>>>>> [   15.068359]     not ok 21 - test_invalid_access
>>>>
>>>> The test expects the function name to be test_invalid_access, i. e.
>>>> the first line should be "BUG: KFENCE: invalid read in
>>>> test_invalid_access".
>>>> The error reporting function unwinds the stack, skips a couple of
>>>> "uninteresting" frames
>>>> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#=
L43)
>>>> and uses the first "interesting" one frame to print the report header
>>>> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#=
L226).
>>>>
>>>> It's strange that test_invalid_access is missing altogether from the
>>>> stack trace - is that expected?
>>>> Can you try printing the whole stacktrace without skipping any frames
>>>> to see if that function is there?
>>>>
>>>
>>> Booting with 'no_hash_pointers" I get the following. Does it helps ?
>>>
>>> [   16.837198] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> [   16.848521] BUG: KFENCE: invalid read in finish_task_switch.isra.0+0=
x54/0x23c
>>> [   16.848521]
>>> [   16.857158] Invalid read at 0xdf98800a:
>>> [   16.861004]  finish_task_switch.isra.0+0x54/0x23c
>>> [   16.865731]  kunit_try_run_case+0x5c/0xd0
>>> [   16.869780]  kunit_generic_run_threadfn_adapter+0x24/0x30
>>> [   16.875199]  kthread+0x15c/0x174
>>> [   16.878460]  ret_from_kernel_thread+0x14/0x1c
>>> [   16.882847]
>>> [   16.884351] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
>>> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
>>> [   16.895908] NIP:  c016eb8c LR: c02f50dc CTR: c016eb38
>>> [   16.900963] REGS: e2449d90 TRAP: 0301   Tainted: G    B
>>> (5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty)
>>> [   16.911386] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 0000=
0000
>>> [   16.918153] DAR: df98800a DSISR: 20000000
>>> [   16.918153] GPR00: c02f50dc e2449e50 c1140d00 e100dd24 c084b13c 0000=
0008 c084b32b c016eb38
>>> [   16.918153] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
>>> [   16.936695] NIP [c016eb8c] test_invalid_access+0x54/0x108
>>> [   16.942125] LR [c02f50dc] kunit_try_run_case+0x5c/0xd0
>>> [   16.947292] Call Trace:
>>> [   16.949746] [e2449e50] [c005a5ec] finish_task_switch.isra.0+0x54/0x2=
3c (unreliable)
>>=20
>> The "(unreliable)" might be a clue that it's related to ppc32 stack
>> unwinding. Any ppc expert know what this is about?
>>=20
>>> [   16.957443] [e2449eb0] [c02f50dc] kunit_try_run_case+0x5c/0xd0
>>> [   16.963319] [e2449ed0] [c02f63ec] kunit_generic_run_threadfn_adapter=
+0x24/0x30
>>> [   16.970574] [e2449ef0] [c004e710] kthread+0x15c/0x174
>>> [   16.975670] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
>>> [   16.981896] Instruction dump:
>>> [   16.984879] 8129d608 38e7eb38 81020280 911f004c 39000000 995f0024 90=
7f0028 90ff001c
>>> [   16.992710] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0 =
812a4b98 3d40c02f
>>> [   17.000711] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> [   17.008223]     # test_invalid_access: EXPECTATION FAILED at mm/kfen=
ce/kfence_test.c:636
>>> [   17.008223]     Expected report_matches(&expect) to be true, but is =
false
>>> [   17.023243]     not ok 21 - test_invalid_access
>>=20
>> On a fault in test_invalid_access, KFENCE prints the stack trace based
>> on the information in pt_regs. So we do not think there's anything we
>> can do to improve stack printing pe-se.
>
> stack printing, probably not. Would be good anyway to mark the last level=
 [unreliable] as the ppc does.
>
> IIUC, on ppc the address in the stack frame of the caller is written by t=
he caller. In most tests,=20
> there is some function call being done before the fault, for instance=20
> test_kmalloc_aligned_oob_read() does a call to kunit_do_assertion which p=
opulates the address of the=20
> call in the stack. However this is fragile.
>
> This works for function calls because in order to call a subfunction, a f=
unction has to set up a=20
> stack frame in order to same the value in the Link Register, which contai=
ns the address of the=20
> function's parent and that will be clobbered by the sub-function call.
>
> However, it cannot be done by exceptions, because exceptions can happen i=
n a function that has no=20
> stack frame (because that function has no need to call a subfunction and =
doesn't need to same=20
> anything on the stack). If the exception handler was writting the caller'=
s address in the stack=20
> frame, it would in fact write it in the parent's frame, leading to a mess.
>
> But in fact the information is in pt_regs, it is in regs->nip so KFENCE s=
hould be able to use that=20
> instead of the stack.
>
>>=20
>> What's confusing is that it's only this test, and none of the others.
>> Given that, it might be code-gen related, which results in some subtle
>> issue with stack unwinding. There are a few things to try, if you feel
>> like it:
>>=20
>> -- Change the unwinder, if it's possible for ppc32.
>
> I don't think it is possible.

I think this actually is the solution.

It seems the good architectures have all added support for
arch_stack_walk(), and we have not.

Looking at some of the implementations of arch_stack_walk() it seems
it's expected that the first entry emitted includes the PC (or NIP on
ppc).

For us stack_trace_save() calls save_stack_trace() which only emits
entries from the stack, which doesn't necessarily include the function
NIP is pointing to.

So I think it's probably on us to update to that new API. Or at least
update our save_stack_trace() to fabricate an entry using the NIP, as it
seems that's what callers expect.

cheers
