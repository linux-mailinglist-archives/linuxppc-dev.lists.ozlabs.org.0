Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1C4534A32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 07:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7xBk2plBz3bmF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 15:22:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sANy6hA8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sANy6hA8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7x9y4PGCz309j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 15:21:25 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24Q5HseN021488
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 05:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=3M/3z7A2aSkU4SHIj3eSGOH0g1o53C/NZcp6dfM3Y18=;
 b=sANy6hA86ZJ6gTorzmYSqLn9KFH38kriNsV1F8TqWM0OEeHHUQ1Cj2TnAyHMapWcEiR0
 1obZbi5MxjvSG5cvKGDVqj1zxQp40bEht2EmBnryWZpcX13GE35clE/76CpH2a0lpKjF
 8aw+sN1Sq1b2zOoZMrXtmm90d/p1k5c8AmC06FnwqjdGRFR+FKCd6D+qVJK2Rgm/zWLK
 fT99ZjXN8t0kjXigF5NJAnv2j48Xw2NL4aCJA+hVoeawgAaGRDjJ7QRTAlhjw3JFyCD2
 eY8KW8Id7DjBvnJ2vbBM8DotNqRTG2FL9jUokPWEEJstKO1f3TFsSQ/SXsDX1TpGAlOx Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ga395r118-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 05:21:21 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24Q5IlfM023724
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 05:21:21 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ga395r111-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 05:21:21 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24Q5JWHH028636;
	Thu, 26 May 2022 05:21:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3g9p0p8kqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 05:21:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24Q576J448562682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 May 2022 05:07:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF40AA405C;
	Thu, 26 May 2022 05:21:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4614CA4054;
	Thu, 26 May 2022 05:21:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.199.197.87])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 26 May 2022 05:21:16 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] powerpc/64/interrupt: Fix return to masked context after
 hard-mask irq becomes pending
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <1653536815.6wga69vb1l.astroid@bobo.none>
Date: Thu, 26 May 2022 10:51:15 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <115C68A0-70FE-4365-86E3-F57D605FC44B@linux.ibm.com>
References: <20220307145159.166519-1-npiggin@gmail.com>
 <BE8D6B08-1276-4BBB-8859-C7D48242D0DF@linux.ibm.com>
 <1653536815.6wga69vb1l.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FNueIb4dgHaPnnsertjGUAEZrR-bBeb8
X-Proofpoint-ORIG-GUID: Q5Sfl20MKCrSQpweIei6BpKQxi9oEJvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_01,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=558 bulkscore=0 adultscore=0 impostorscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260028
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-May-2022, at 10:20 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> Excerpts from Sachin Sant's message of March 9, 2022 6:37 pm:
>>=20
>>=20
>>> On 07-Mar-2022, at 8:21 PM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>>>=20
>>> When a synchronous interrupt[1] is taken in a local_irq_disable() =
region
>>> which has MSR[EE]=3D1, the interrupt handler will enable MSR[EE] as =
part
>>> of enabling MSR[RI], for peformance and profiling reasons.
>>>=20
>>> [1] Typically a hash fault, but in error cases this could be a page
>>> fault or facility unavailable as well.
>>>=20
>>> If an asynchronous interrupt hits here and its masked handler =
requires
>>> MSR[EE] to be cleared (it is a PACA_IRQ_MUST_HARD_MASK interrupt), =
then
>>> MSR[EE] must remain disabled until that pending interrupt is =
replayed.
>>> The problem is that the MSR of the original context has MSR[EE]=3D1, =
so
>>> returning directly to that causes MSR[EE] to be enabled while the
>>> interrupt is still pending.
>>>=20
>>> This issue was hacked around in the interrupt return code by just
>>> clearing the hard mask to avoid a warning, and taking the masked
>>> interrupt again immediately in the return context, which would =
disable
>>> MSR[EE]. However in the case of a pending PMI, it is possible that =
it is
>>> not maked in the calling context so the full handler will be run =
while
>>> there is a PMI pending, and this confuses the perf code and causes
>>> warnings with its PMI pending management.
>>>=20
>>> Fix this by removing the hack, and adjusting the return MSR if it =
has
>>> MSR[EE]=3D1 and there is a PACA_IRQ_MUST_HARD_MASK interrupt =
pending.
>>>=20
>>> Fixes: 4423eb5ae32e ("powerpc/64/interrupt: make normal synchronous =
interrupts enable MSR[EE] if possible")
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>> arch/powerpc/kernel/interrupt.c | 10 ---------
>>> arch/powerpc/kernel/interrupt_64.S | 34 =
+++++++++++++++++++++++++++---
>>> 2 files changed, 31 insertions(+), 13 deletions(-)
>>=20
>> With this patch on top of powerpc/merge following rcu stalls are seen =
while
>> running powerpc selftests (mitigation-patching) on P9. I don=E2=80=99t =
see this
>> issue on P10.
>>=20
>> [ 1841.248838] link-stack-flush: flush disabled.
>> [ 1841.248905] count-cache-flush: software flush enabled.
>> [ 1841.248911] link-stack-flush: software flush enabled.
>> [ 1901.249668] rcu: INFO: rcu_sched self-detected stall on CPU
>> [ 1901.249703] rcu: 	12-...!: (5999 ticks this GP) =
idle=3Dd0f/1/0x4000000000000002 softirq=3D37019/37027 fqs=3D0=20
>> [ 1901.249720] 	(t=3D6000 jiffies g=3D106273 q=3D1624)
>> [ 1901.249729] rcu: rcu_sched kthread starved for 6000 jiffies! =
g106273 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D6
>> [ 1901.249743] rcu: 	Unless rcu_sched kthread gets sufficient CPU =
time, OOM is now expected behavior.
>> [ 1901.249752] rcu: RCU grace-period kthread stack dump:
>> [ 1901.249759] task:rcu_sched state:R running task stack: 0 pid: 11 =
ppid: 2 flags:0x00000800
>> [ 1901.249775] Call Trace:
>> [ 1901.249781] [c0000000076ab870] [0000000000000001] 0x1 (unreliable)
>> [ 1901.249795] [c0000000076aba60] [c00000000001e508] =
__switch_to+0x288/0x4a0
>> [ 1901.249811] [c0000000076abac0] [c000000000d15950] =
__schedule+0x2c0/0x950
>> [ 1901.249824] [c0000000076abb80] [c000000000d16048] =
schedule+0x68/0x130
>> [ 1901.249836] [c0000000076abbb0] [c000000000d1df1c] =
schedule_timeout+0x25c/0x3f0
>> [ 1901.249849] [c0000000076abc90] [c00000000021522c] =
rcu_gp_fqs_loop+0x2fc/0x3e0
>> [ 1901.249863] [c0000000076abd40] [c00000000021a0fc] =
rcu_gp_kthread+0x13c/0x180
>> [ 1901.249875] [c0000000076abdc0] [c00000000018ce94] =
kthread+0x124/0x130
>> [ 1901.249887] [c0000000076abe10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
>> [ 1901.249900] rcu: Stack dump where RCU GP kthread last ran:
>> [ 1901.249908] Sending NMI from CPU 12 to CPUs 6:
>> [ 1901.249944] NMI backtrace for cpu 6
>> [ 1901.249957] CPU: 6 PID: 40 Comm: migration/6 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
>> [ 1901.249971] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
>> [ 1901.249987] NIP: c000000000d14e0c LR: c000000000214280 CTR: =
c0000000002914f0
>> [ 1901.249996] REGS: c00000000785b980 TRAP: 0500 Not tainted =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
>> [ 1901.250007] MSR: 800000000280b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 48002822 XER: 00000000
>> [ 1901.250038] CFAR: 0000000000000000 IRQMASK: 0=20
>> [ 1901.250038] GPR00: c00000000029165c c00000000785bc20 =
c000000002a20000 0000000000000002=20
>> [ 1901.250038] GPR04: 0000000000000000 c0000009fb60ab80 =
c0000009fb60ab70 c00000000001e508=20
>> [ 1901.250038] GPR08: 0000000000000000 c0000009fb68f5a8 =
00000009f94c0000 000000000098967f=20
>> [ 1901.250038] GPR12: 0000000000000000 c00000001ec57a00 =
c00000000018cd78 c000000007234f80=20
>> [ 1901.250038] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000=20
>> [ 1901.250038] GPR20: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000001=20
>> [ 1901.250038] GPR24: 0000000000000002 0000000000000003 =
0000000000000000 c000000002a62138=20
>> [ 1901.250038] GPR28: c0000000ee70faf8 0000000000000001 =
c0000000ee70fb1c 0000000000000001=20
>> [ 1901.250157] NIP [c000000000d14e0c] rcu_dynticks_inc+0x1c/0x40
>> [ 1901.250168] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
>> [ 1901.250180] Call Trace:
>> [ 1901.250185] [c00000000785bc20] [c000000007a96738] =
0xc000000007a96738 (unreliable)
>> [ 1901.250198] [c00000000785bc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
>> [ 1901.250210] [c00000000785bcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
>> [ 1901.250223] [c00000000785bd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
>> [ 1901.250237] [c00000000785bdc0] [c00000000018ce94] =
kthread+0x124/0x130
>> [ 1901.250249] [c00000000785be10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
>> [ 1901.250262] Instruction dump:
>> [ 1901.250269] f821ffa1 4b43b81d 00000000 00000000 00000000 3c4c01d1 =
3842b210 e94d0030=20
>> [ 1901.250290] 3d22ff7b 3929f5a8 7d295214 7c0004ac <7d404828> =
7d4a1814 7d40492d 40c2fff4=20
>> [ 1901.250313] Sending NMI from CPU 12 to CPUs 0:
>> [ 1901.250328] NMI backtrace for cpu 0
>>=20
>> Have attached o/p captured during mitigation-patching test run.
>=20
> Hey, I haven't been able to reproduce this. Are you just running make=20=

> run_tests in the selftests/powerpc/security/ directory? Any particular
> config?
>=20
Yes, seen while running powerpc selftests. Nothing special wrt config.
Let me try the patch on top of latest code. Will report back with =
results.

- Sachin

