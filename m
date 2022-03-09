Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539C44D2ABF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 09:38:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD5Dq0R2Dz3bcg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 19:38:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iM+8nZ9M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iM+8nZ9M; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD5D11t32z2yww
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 19:37:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2294eGot012127
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 9 Mar 2022 08:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=VOts4bYR1czxGh6jTlAVfU3U6pBUx/Oaun7g+AnFvc0=;
 b=iM+8nZ9MusL5QcYkgdRX/mZBisuVfEK6HQXvc29n/2fWV7XKGevK419YvkhAZKaEOWh0
 2FuWgpe1G0GW/oijH+YcQ1h/v0n17KaNj2aBkczgx6TNXBx2iYm/IB9eAHTHeHCx2IU4
 JBoTDZOVwTFjePnk5OWDjjpg+a9poZw7sjAFTn3zWpG3gmQBK5pzh+x+Y9sjB4yXvJ3N
 1LQTdpLtpFODKroYXVgl2Q9YH3Lb2+46ebJWtDqUKII6FY6r02W+RrcogCZbrgmprUjk
 oG8oQEtKnEKuzanqqheSafiaJ0S0hmaZG1sJSI5ZvHZXp+wj5tqUdlpoSG5jGTpW6D/b gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3envcvhhbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Mar 2022 08:37:16 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2298aVZ5009600
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 9 Mar 2022 08:37:16 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3envcvhhb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 08:37:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2298YjiT008489;
 Wed, 9 Mar 2022 08:37:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3ekyg91hfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 08:37:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2298Q0Fk43974974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Mar 2022 08:26:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77B695204F;
 Wed,  9 Mar 2022 08:37:11 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.36.222])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7BF695204E;
 Wed,  9 Mar 2022 08:37:10 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Message-Id: <BE8D6B08-1276-4BBB-8859-C7D48242D0DF@linux.ibm.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_76C0C631-D150-4F01-9ED9-E0CD3F085C6B"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH] powerpc/64/interrupt: Fix return to masked context after
 hard-mask irq becomes pending
Date: Wed, 9 Mar 2022 14:07:09 +0530
In-Reply-To: <20220307145159.166519-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
References: <20220307145159.166519-1-npiggin@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cEEsXs5mFgmeHI5_UtxBOk0-gr5y3n4q
X-Proofpoint-ORIG-GUID: hQfaUpaLxGT9QnMDhsUBxUd7ilQRn1G_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_04,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1011 phishscore=0 impostorscore=0 mlxlogscore=619
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090045
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_76C0C631-D150-4F01-9ED9-E0CD3F085C6B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 07-Mar-2022, at 8:21 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> When a synchronous interrupt[1] is taken in a local_irq_disable() =
region
> which has MSR[EE]=3D1, the interrupt handler will enable MSR[EE] as =
part
> of enabling MSR[RI], for peformance and profiling reasons.
>=20
> [1] Typically a hash fault, but in error cases this could be a page
>    fault or facility unavailable as well.
>=20
> If an asynchronous interrupt hits here and its masked handler requires
> MSR[EE] to be cleared (it is a PACA_IRQ_MUST_HARD_MASK interrupt), =
then
> MSR[EE] must remain disabled until that pending interrupt is replayed.
> The problem is that the MSR of the original context has MSR[EE]=3D1, =
so
> returning directly to that causes MSR[EE] to be enabled while the
> interrupt is still pending.
>=20
> This issue was hacked around in the interrupt return code by just
> clearing the hard mask to avoid a warning, and taking the masked
> interrupt again immediately in the return context, which would disable
> MSR[EE]. However in the case of a pending PMI, it is possible that it =
is
> not maked in the calling context so the full handler will be run while
> there is a PMI pending, and this confuses the perf code and causes
> warnings with its PMI pending management.
>=20
> Fix this by removing the hack, and adjusting the return MSR if it has
> MSR[EE]=3D1 and there is a PACA_IRQ_MUST_HARD_MASK interrupt pending.
>=20
> Fixes: 4423eb5ae32e ("powerpc/64/interrupt: make normal synchronous =
interrupts enable MSR[EE] if possible")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> arch/powerpc/kernel/interrupt.c    | 10 ---------
> arch/powerpc/kernel/interrupt_64.S | 34 +++++++++++++++++++++++++++---
> 2 files changed, 31 insertions(+), 13 deletions(-)

With this patch on top of powerpc/merge following rcu stalls are seen =
while
running powerpc selftests (mitigation-patching) on P9. I don=E2=80=99t =
see this
issue on P10.

[ 1841.248838] link-stack-flush: flush disabled.
[ 1841.248905] count-cache-flush: software flush enabled.
[ 1841.248911] link-stack-flush: software flush enabled.
[ 1901.249668] rcu: INFO: rcu_sched self-detected stall on CPU
[ 1901.249703] rcu: 	12-...!: (5999 ticks this GP) =
idle=3Dd0f/1/0x4000000000000002 softirq=3D37019/37027 fqs=3D0=20
[ 1901.249720] 	(t=3D6000 jiffies g=3D106273 q=3D1624)
[ 1901.249729] rcu: rcu_sched kthread starved for 6000 jiffies! g106273 =
f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D6
[ 1901.249743] rcu: 	Unless rcu_sched kthread gets sufficient CPU =
time, OOM is now expected behavior.
[ 1901.249752] rcu: RCU grace-period kthread stack dump:
[ 1901.249759] task:rcu_sched       state:R  running task     stack:    =
0 pid:   11 ppid:     2 flags:0x00000800
[ 1901.249775] Call Trace:
[ 1901.249781] [c0000000076ab870] [0000000000000001] 0x1 (unreliable)
[ 1901.249795] [c0000000076aba60] [c00000000001e508] =
__switch_to+0x288/0x4a0
[ 1901.249811] [c0000000076abac0] [c000000000d15950] =
__schedule+0x2c0/0x950
[ 1901.249824] [c0000000076abb80] [c000000000d16048] schedule+0x68/0x130
[ 1901.249836] [c0000000076abbb0] [c000000000d1df1c] =
schedule_timeout+0x25c/0x3f0
[ 1901.249849] [c0000000076abc90] [c00000000021522c] =
rcu_gp_fqs_loop+0x2fc/0x3e0
[ 1901.249863] [c0000000076abd40] [c00000000021a0fc] =
rcu_gp_kthread+0x13c/0x180
[ 1901.249875] [c0000000076abdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.249887] [c0000000076abe10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.249900] rcu: Stack dump where RCU GP kthread last ran:
[ 1901.249908] Sending NMI from CPU 12 to CPUs 6:
[ 1901.249944] NMI backtrace for cpu 6
[ 1901.249957] CPU: 6 PID: 40 Comm: migration/6 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.249971] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.249987] NIP:  c000000000d14e0c LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.249996] REGS: c00000000785b980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.250007] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48002822  XER: 00000000
[ 1901.250038] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.250038] GPR00: c00000000029165c c00000000785bc20 c000000002a20000 =
0000000000000002=20
[ 1901.250038] GPR04: 0000000000000000 c0000009fb60ab80 c0000009fb60ab70 =
c00000000001e508=20
[ 1901.250038] GPR08: 0000000000000000 c0000009fb68f5a8 00000009f94c0000 =
000000000098967f=20
[ 1901.250038] GPR12: 0000000000000000 c00000001ec57a00 c00000000018cd78 =
c000000007234f80=20
[ 1901.250038] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.250038] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.250038] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.250038] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.250157] NIP [c000000000d14e0c] rcu_dynticks_inc+0x1c/0x40
[ 1901.250168] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.250180] Call Trace:
[ 1901.250185] [c00000000785bc20] [c000000007a96738] 0xc000000007a96738 =
(unreliable)
[ 1901.250198] [c00000000785bc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.250210] [c00000000785bcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.250223] [c00000000785bd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.250237] [c00000000785bdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.250249] [c00000000785be10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.250262] Instruction dump:
[ 1901.250269] f821ffa1 4b43b81d 00000000 00000000 00000000 3c4c01d1 =
3842b210 e94d0030=20
[ 1901.250290] 3d22ff7b 3929f5a8 7d295214 7c0004ac <7d404828> 7d4a1814 =
7d40492d 40c2fff4=20
[ 1901.250313] Sending NMI from CPU 12 to CPUs 0:
[ 1901.250328] NMI backtrace for cpu 0

Have attached o/p captured during mitigation-patching test run.

Thanks
-Sachin


--Apple-Mail=_76C0C631-D150-4F01-9ED9-E0CD3F085C6B
Content-Disposition: attachment;
	filename=powerpc-selftests.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="powerpc-selftests.txt"
Content-Transfer-Encoding: quoted-printable

# selftests: powerpc/security: mitigation-patching.sh
# Spawned threads enabling/disabling mitigations ...
# Waiting for timeout ...
[ 1837.112267] barrier-nospec: using ORI speculation barrier
[ 1837.116490] count-cache-flush: flush disabled.
[ 1837.116510] link-stack-flush: flush disabled.
[ 1837.116587] count-cache-flush: software flush enabled.
[ 1837.116592] link-stack-flush: software flush enabled.
......
......
[ 1841.162267] count-cache-flush: flush disabled.
[ 1841.162279] link-stack-flush: flush disabled.
[ 1841.162364] count-cache-flush: software flush enabled.
[ 1841.162372] link-stack-flush: software flush enabled.
[ 1841.171560] barrier-nospec: using ORI speculation barrier
[ 1841.181332] count-cache-flush: flush disabled.
[ 1841.181343] link-stack-flush: flush disabled.
[ 1841.181438] count-cache-flush: software flush enabled.
[ 1841.181447] link-stack-flush: software flush enabled.
[ 1841.196451] barrier-nospec: using ORI speculation barrier
[ 1841.202460] count-cache-flush: flush disabled.
[ 1841.202470] link-stack-flush: flush disabled.
[ 1841.202554] count-cache-flush: software flush enabled.
[ 1841.202562] link-stack-flush: software flush enabled.
[ 1841.207830] barrier-nospec: using ORI speculation barrier
[ 1841.219753] count-cache-flush: flush disabled.
[ 1841.219765] link-stack-flush: flush disabled.
[ 1841.219859] count-cache-flush: software flush enabled.
[ 1841.219868] link-stack-flush: software flush enabled.
[ 1841.228760] barrier-nospec: using ORI speculation barrier
[ 1841.235547] count-cache-flush: flush disabled.
[ 1841.235557] link-stack-flush: flush disabled.
[ 1841.235626] count-cache-flush: software flush enabled.
[ 1841.235632] link-stack-flush: software flush enabled.
[ 1841.244055] barrier-nospec: using ORI speculation barrier
[ 1841.248828] count-cache-flush: flush disabled.
[ 1841.248838] link-stack-flush: flush disabled.
[ 1841.248905] count-cache-flush: software flush enabled.
[ 1841.248911] link-stack-flush: software flush enabled.
[ 1901.249668] rcu: INFO: rcu_sched self-detected stall on CPU
[ 1901.249703] rcu: 	12-...!: (5999 ticks this GP) =
idle=3Dd0f/1/0x4000000000000002 softirq=3D37019/37027 fqs=3D0=20
[ 1901.249720] 	(t=3D6000 jiffies g=3D106273 q=3D1624)
[ 1901.249729] rcu: rcu_sched kthread starved for 6000 jiffies! g106273 =
f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D6
[ 1901.249743] rcu: 	Unless rcu_sched kthread gets sufficient CPU =
time, OOM is now expected behavior.
[ 1901.249752] rcu: RCU grace-period kthread stack dump:
[ 1901.249759] task:rcu_sched       state:R  running task     stack:    =
0 pid:   11 ppid:     2 flags:0x00000800
[ 1901.249775] Call Trace:
[ 1901.249781] [c0000000076ab870] [0000000000000001] 0x1 (unreliable)
[ 1901.249795] [c0000000076aba60] [c00000000001e508] =
__switch_to+0x288/0x4a0
[ 1901.249811] [c0000000076abac0] [c000000000d15950] =
__schedule+0x2c0/0x950
[ 1901.249824] [c0000000076abb80] [c000000000d16048] schedule+0x68/0x130
[ 1901.249836] [c0000000076abbb0] [c000000000d1df1c] =
schedule_timeout+0x25c/0x3f0
[ 1901.249849] [c0000000076abc90] [c00000000021522c] =
rcu_gp_fqs_loop+0x2fc/0x3e0
[ 1901.249863] [c0000000076abd40] [c00000000021a0fc] =
rcu_gp_kthread+0x13c/0x180
[ 1901.249875] [c0000000076abdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.249887] [c0000000076abe10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.249900] rcu: Stack dump where RCU GP kthread last ran:
[ 1901.249908] Sending NMI from CPU 12 to CPUs 6:
[ 1901.249944] NMI backtrace for cpu 6
[ 1901.249957] CPU: 6 PID: 40 Comm: migration/6 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.249971] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.249987] NIP:  c000000000d14e0c LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.249996] REGS: c00000000785b980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.250007] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48002822  XER: 00000000
[ 1901.250038] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.250038] GPR00: c00000000029165c c00000000785bc20 c000000002a20000 =
0000000000000002=20
[ 1901.250038] GPR04: 0000000000000000 c0000009fb60ab80 c0000009fb60ab70 =
c00000000001e508=20
[ 1901.250038] GPR08: 0000000000000000 c0000009fb68f5a8 00000009f94c0000 =
000000000098967f=20
[ 1901.250038] GPR12: 0000000000000000 c00000001ec57a00 c00000000018cd78 =
c000000007234f80=20
[ 1901.250038] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.250038] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.250038] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.250038] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.250157] NIP [c000000000d14e0c] rcu_dynticks_inc+0x1c/0x40
[ 1901.250168] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.250180] Call Trace:
[ 1901.250185] [c00000000785bc20] [c000000007a96738] 0xc000000007a96738 =
(unreliable)
[ 1901.250198] [c00000000785bc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.250210] [c00000000785bcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.250223] [c00000000785bd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.250237] [c00000000785bdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.250249] [c00000000785be10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.250262] Instruction dump:
[ 1901.250269] f821ffa1 4b43b81d 00000000 00000000 00000000 3c4c01d1 =
3842b210 e94d0030=20
[ 1901.250290] 3d22ff7b 3929f5a8 7d295214 7c0004ac <7d404828> 7d4a1814 =
7d40492d 40c2fff4=20
[ 1901.250313] Sending NMI from CPU 12 to CPUs 0:
[ 1901.250328] NMI backtrace for cpu 0
[ 1901.250334] CPU: 0 PID: 12 Comm: migration/0 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.250346] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.250359] NIP:  c000000000d14e0c LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.250369] REGS: c0000000076af980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.250379] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48004422  XER: 00000000
[ 1901.250408] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.250408] GPR00: c00000000029165c c0000000076afc20 c000000002a20000 =
0000000000000002=20
[ 1901.250408] GPR04: 0000000000000000 c0000009fb00ab80 c0000009fb00ab70 =
c00000000001e508=20
[ 1901.250408] GPR08: 0000000000000000 c0000009fb08f5a8 00000009f8ec0000 =
000000000098967f=20
[ 1901.250408] GPR12: 0000000000000000 c000000002d30000 c00000000018cd78 =
c000000007230e80=20
[ 1901.250408] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.250408] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.250408] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.250408] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.250525] NIP [c000000000d14e0c] rcu_dynticks_inc+0x1c/0x40
[ 1901.250535] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.250547] Call Trace:
[ 1901.250551] [c0000000076afc20] [c000000007611c38] 0xc000000007611c38 =
(unreliable)
[ 1901.250564] [c0000000076afc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.250576] [c0000000076afcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.250588] [c0000000076afd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.250602] [c0000000076afdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.250613] [c0000000076afe10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.250625] Instruction dump:
[ 1901.250631] f821ffa1 4b43b81d 00000000 00000000 00000000 3c4c01d1 =
3842b210 e94d0030=20
[ 1901.250652] 3d22ff7b 3929f5a8 7d295214 7c0004ac <7d404828> 7d4a1814 =
7d40492d 40c2fff4=20
[ 1901.250674] Sending NMI from CPU 12 to CPUs 2:
[ 1901.250688] NMI backtrace for cpu 2
[ 1901.250694] CPU: 2 PID: 20 Comm: migration/2 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.250706] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.250720] NIP:  c000000000d14e0c LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.250729] REGS: c00000000780b980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.250739] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48002822  XER: 00000000
[ 1901.250768] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.250768] GPR00: c00000000029165c c00000000780bc20 c000000002a20000 =
0000000000000002=20
[ 1901.250768] GPR04: 0000000000000000 c0000009fb20ab80 c0000009fb20ab70 =
c00000000001e508=20
[ 1901.250768] GPR08: 0000000000000000 c0000009fb28f5a8 00000009f90c0000 =
c0000009fb28e600=20
[ 1901.250768] GPR12: 0000000000000000 c00000001ec5d680 c00000000018cd78 =
c000000007234f80=20
[ 1901.250768] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.250768] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.250768] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.250768] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.250884] NIP [c000000000d14e0c] rcu_dynticks_inc+0x1c/0x40
[ 1901.250894] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.250905] Call Trace:
[ 1901.250910] [c00000000780bc20] [c000000007635b38] 0xc000000007635b38 =
(unreliable)
[ 1901.250922] [c00000000780bc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.250934] [c00000000780bcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.250946] [c00000000780bd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.250959] [c00000000780bdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.250970] [c00000000780be10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.250982] Instruction dump:
[ 1901.250988] f821ffa1 4b43b81d 00000000 00000000 00000000 3c4c01d1 =
3842b210 e94d0030=20
[ 1901.251009] 3d22ff7b 3929f5a8 7d295214 7c0004ac <7d404828> 7d4a1814 =
7d40492d 40c2fff4=20
[ 1901.251031] Sending NMI from CPU 12 to CPUs 3:
[ 1901.251045] NMI backtrace for cpu 3
[ 1901.251052] CPU: 3 PID: 25 Comm: migration/3 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.251065] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.251080] NIP:  c000000000d14e18 LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.251089] REGS: c00000000781f980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.251100] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28002822  XER: 00000000
[ 1901.251130] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.251130] GPR00: c00000000029165c c00000000781fc20 c000000002a20000 =
0000000000000002=20
[ 1901.251130] GPR04: 0000000000000000 c0000009fb30ab80 c0000009fb30ab70 =
c00000000001e508=20
[ 1901.251130] GPR08: 0000000000000000 c0000009fb38f5a8 0000000048967cb5 =
c0000009fb38e600=20
[ 1901.251130] GPR12: 0000000000000000 c00000001ec5ae80 c00000000018cd78 =
c000000007234f80=20
[ 1901.251130] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.251130] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.251130] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.251130] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.251248] NIP [c000000000d14e18] rcu_dynticks_inc+0x28/0x40
[ 1901.251259] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.251271] Call Trace:
[ 1901.251275] [c00000000781fc20] [c00000000763d838] 0xc00000000763d838 =
(unreliable)
[ 1901.251289] [c00000000781fc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.251301] [c00000000781fcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.251314] [c00000000781fd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.251327] [c00000000781fdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.251338] [c00000000781fe10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.251351] Instruction dump:
[ 1901.251357] 00000000 00000000 3c4c01d1 3842b210 e94d0030 3d22ff7b =
3929f5a8 7d295214=20
[ 1901.251379] 7c0004ac 7d404828 7d4a1814 7d40492d <40c2fff4> 7d4307b4 =
7c0004ac 4e800020=20
[ 1901.251402] Sending NMI from CPU 12 to CPUs 4:
[ 1901.251415] NMI backtrace for cpu 4
[ 1901.251421] CPU: 4 PID: 30 Comm: migration/4 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.251434] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.251447] NIP:  c000000000d14e18 LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.251456] REGS: c000000007833980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.251466] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28002822  XER: 00000000
[ 1901.251496] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.251496] GPR00: c00000000029165c c000000007833c20 c000000002a20000 =
0000000000000002=20
[ 1901.251496] GPR04: 0000000000000000 c0000009fb40ab80 c0000009fb40ab70 =
c00000000001e508=20
[ 1901.251496] GPR08: 0000000000000000 c0000009fb48f5a8 0000000048a30a1d =
00000000000e2000=20
[ 1901.251496] GPR12: 0000000000000000 c00000001ec59d00 c00000000018cd78 =
c000000007234f80=20
[ 1901.251496] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.251496] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.251496] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.251496] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.251612] NIP [c000000000d14e18] rcu_dynticks_inc+0x28/0x40
[ 1901.251622] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.251633] Call Trace:
[ 1901.251638] [c000000007833c20] [c000000007a86d38] 0xc000000007a86d38 =
(unreliable)
[ 1901.251650] [c000000007833c40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.251663] [c000000007833cb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.251675] [c000000007833d60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.251688] [c000000007833dc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.251699] [c000000007833e10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.251712] Instruction dump:
[ 1901.251718] 00000000 00000000 3c4c01d1 3842b210 e94d0030 3d22ff7b =
3929f5a8 7d295214=20
[ 1901.251739] 7c0004ac 7d404828 7d4a1814 7d40492d <40c2fff4> 7d4307b4 =
7c0004ac 4e800020=20
[ 1901.251762] Sending NMI from CPU 12 to CPUs 5:
[ 1901.251775] NMI backtrace for cpu 5
[ 1901.251782] CPU: 5 PID: 35 Comm: migration/5 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.251795] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.251808] NIP:  c000000000d14e24 LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.251817] REGS: c000000007847980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.251828] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28002822  XER: 00000000
[ 1901.251857] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.251857] GPR00: c00000000029165c c000000007847c20 c000000002a20000 =
0000000048b999d3=20
[ 1901.251857] GPR04: 0000000000000000 c0000009fb50ab80 c0000009fb50ab70 =
c00000000001e508=20
[ 1901.251857] GPR08: 0000000000000000 c0000009fb58f5a8 0000000048b999d3 =
000000000098967f=20
[ 1901.251857] GPR12: 0000000000000000 c00000001ec58b80 c00000000018cd78 =
c000000007234f80=20
[ 1901.251857] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.251857] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.251857] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.251857] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.251974] NIP [c000000000d14e24] rcu_dynticks_inc+0x34/0x40
[ 1901.251984] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.251995] Call Trace:
[ 1901.252000] [c000000007847c20] [c000000007a8ea38] 0xc000000007a8ea38 =
(unreliable)
[ 1901.252013] [c000000007847c40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.252025] [c000000007847cb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.252038] [c000000007847d60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.252052] [c000000007847dc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.252063] [c000000007847e10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.252075] Instruction dump:
[ 1901.252081] 3842b210 e94d0030 3d22ff7b 3929f5a8 7d295214 7c0004ac =
7d404828 7d4a1814=20
[ 1901.252102] 7d40492d 40c2fff4 7d4307b4 7c0004ac <4e800020> 60000000 =
60000000 3c4c01d1=20
[ 1901.252125] Sending NMI from CPU 12 to CPUs 6:
[ 1901.252137] NMI backtrace for cpu 6
[ 1901.252144] CPU: 6 PID: 40 Comm: migration/6 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.252156] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.252169] NIP:  c000000000d14e24 LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.252178] REGS: c00000000785b980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.252189] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28002822  XER: 00000000
[ 1901.252217] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.252217] GPR00: c00000000029165c c00000000785bc20 c000000002a20000 =
0000000048b1a253=20
[ 1901.252217] GPR04: 0000000000000000 c0000009fb60ab80 c0000009fb60ab70 =
c00000000001e508=20
[ 1901.252217] GPR08: 0000000000000000 c0000009fb68f5a8 0000000048b1a253 =
000000000098967f=20
[ 1901.252217] GPR12: 0000000000000000 c00000001ec57a00 c00000000018cd78 =
c000000007234f80=20
[ 1901.252217] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.252217] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.252217] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.252217] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.252334] NIP [c000000000d14e24] rcu_dynticks_inc+0x34/0x40
[ 1901.252344] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.252360] Call Trace:
[ 1901.252364] [c00000000785bc20] [c000000007a96738] 0xc000000007a96738 =
(unreliable)
[ 1901.255944] [c00000000785bc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.255957] [c00000000785bcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.255969] [c00000000785bd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.255983] [c00000000785bdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.255994] [c00000000785be10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.256006] Instruction dump:
[ 1901.256013] 3842b210 e94d0030 3d22ff7b 3929f5a8 7d295214 7c0004ac =
7d404828 7d4a1814=20
[ 1901.256034] 7d40492d 40c2fff4 7d4307b4 7c0004ac <4e800020> 60000000 =
60000000 3c4c01d1=20
[ 1901.256057] Sending NMI from CPU 12 to CPUs 7:
[ 1901.256070] NMI backtrace for cpu 7
[ 1901.256077] CPU: 7 PID: 45 Comm: migration/7 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.256089] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.256102] NIP:  c000000000d14e24 LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.260871] REGS: c00000000786f980 TRAP: 0500   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.260882] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28002822  XER: 00000000
[ 1901.260910] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.260910] GPR00: c00000000029165c c00000000786fc20 c000000002a20000 =
000000004851681f=20
[ 1901.260910] GPR04: 0000000000000000 c0000009fb70ab80 c0000009fb70ab70 =
c00000000001e508=20
[ 1901.260910] GPR08: 0000000000000000 c0000009fb78f5a8 000000004851681f =
c0000009fb78e600=20
[ 1901.260910] GPR12: 0000000000000000 c00000001ec56280 c00000000018cd78 =
c000000007234f80=20
[ 1901.260910] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.260910] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.260910] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.260910] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.265833] NIP [c000000000d14e24] rcu_dynticks_inc+0x34/0x40
[ 1901.265843] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.265854] Call Trace:
[ 1901.265859] [c00000000786fc20] [c000000007a9e438] 0xc000000007a9e438 =
(unreliable)
[ 1901.265871] [c00000000786fc40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.265884] [c00000000786fcb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.265896] [c00000000786fd60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.265909] [c00000000786fdc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.265920] [c00000000786fe10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.265933] Instruction dump:
[ 1901.265939] 3842b210 e94d0030 3d22ff7b 3929f5a8 7d295214 7c0004ac =
7d404828 7d4a1814=20
[ 1901.265960] 7d40492d 40c2fff4 7d4307b4 7c0004ac <4e800020> 60000000 =
60000000 3c4c01d1=20
[ 1901.265983] Sending NMI from CPU 12 to CPUs 8:
[ 1901.270881] NMI backtrace for cpu 8
[ 1901.270888] CPU: 8 PID: 50 Comm: migration/8 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1901.270902] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1901.270918] NIP:  c000000000d14e18 LR: c000000000214280 CTR: =
c0000000002914f0
[ 1901.270928] REGS: c000000007f03980 TRAP: 0a00   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1901.270940] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 28002822  XER: 00000000
[ 1901.270974] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1901.270974] GPR00: c00000000029165c c000000007f03c20 c000000002a20000 =
0000000000000002=20
[ 1901.270974] GPR04: 0000000000000000 c0000009fb80ab80 c0000009fb80ab70 =
c00000000001e508=20
[ 1901.270974] GPR08: 0000000000000000 c0000009fb88f5a8 0000000049bf8c6b =
c0000009fb88e600=20
[ 1901.270974] GPR12: 0000000000000000 c00000001ec54a80 c00000000018cd78 =
c000000007234f80=20
[ 1901.270974] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1901.270974] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1901.270974] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1901.270974] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1901.275831] NIP [c000000000d14e18] rcu_dynticks_inc+0x28/0x40
[ 1901.275843] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1901.275856] Call Trace:
[ 1901.275861] [c000000007f03c20] [c000000007aa6138] 0xc000000007aa6138 =
(unreliable)
[ 1901.275876] [c000000007f03c40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1901.275890] [c000000007f03cb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1901.275904] [c000000007f03d60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1901.275920] [c000000007f03dc0] [c00000000018ce94] kthread+0x124/0x130
[ 1901.275933] [c000000007f03e10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1901.280773] Instruction dump:
[ 1901.280781] 00000000 00000000 3c4c01d1 3842b210 e94d0030 3d22ff7b =
3929f5a8 7d295214=20
[ 1901.280804] 7c0004ac 7d404828 7d4a1814 7d40492d <40c2fff4> 7d4307b4 =
7c0004ac 4e800020=20
[ 1901.280830] Sending NMI from CPU 12 to CPUs 9:
[ 1907.111607] CPU 9 didn't respond to backtrace IPI, inspecting paca.
[ 1907.111618] irq_soft_mask: 0x03 in_mce: 0 in_nmi: 0 current: 55 =
(migration/9)
[ 1907.111631] Back trace of paca->saved_r1 (0xc0000000ee717b40) =
(possibly stale):
[ 1907.111640] Call Trace:
[ 1907.111646] Sending NMI from CPU 12 to CPUs 10:
[ 1912.942433] CPU 10 didn't respond to backtrace IPI, inspecting paca.
[ 1912.942442] irq_soft_mask: 0x03 in_mce: 0 in_nmi: 0 current: 60 =
(migration/10)
[ 1912.942454] Back trace of paca->saved_r1 (0xc000000029463ac0) =
(possibly stale):
[ 1912.942463] Call Trace:
[ 1912.942469] Sending NMI from CPU 12 to CPUs 11:
[ 1918.773273] CPU 11 didn't respond to backtrace IPI, inspecting paca.
[ 1918.773283] irq_soft_mask: 0x03 in_mce: 0 in_nmi: 0 current: 65 =
(migration/11)
[ 1918.773295] Back trace of paca->saved_r1 (0xc00000006ac13ac0) =
(possibly stale):
[ 1918.773304] Call Trace:
[ 1918.773310] NMI backtrace for cpu 12
[ 1918.773317] CPU: 12 PID: 70 Comm: migration/12 Not tainted =
5.17.0-rc6-00327-g782b30d101f6-dirty #3
[ 1918.773330] Stopper: multi_cpu_stop+0x0/0x230 <- =
stop_machine_cpuslocked+0x188/0x1e0
[ 1918.773345] Call Trace:
[ 1918.773350] [c000000007f533c0] [c0000000007264dc] =
dump_stack_lvl+0x70/0xa4 (unreliable)
[ 1918.773366] [c000000007f53400] [c000000000732fcc] =
nmi_cpu_backtrace+0x13c/0x1b0
[ 1918.773380] [c000000007f53490] [c0000000007331b8] =
nmi_trigger_cpumask_backtrace+0x178/0x1d0
[ 1918.773394] [c000000007f53520] [c000000000033698] =
arch_trigger_cpumask_backtrace+0x28/0x40
[ 1918.773408] [c000000007f53540] [c00000000021ce20] =
rcu_dump_cpu_stacks+0x14c/0x1ac
[ 1918.773423] [c000000007f535e0] [c00000000021b724] =
rcu_sched_clock_irq+0xa34/0xc30
[ 1918.773436] [c000000007f536e0] [c000000000234c14] =
update_process_times+0xc4/0x150
[ 1918.773451] [c000000007f53720] [c00000000024f6a8] =
tick_sched_handle.isra.24+0x58/0x80
[ 1918.773465] [c000000007f53740] [c00000000024fb08] =
tick_sched_timer+0x68/0xe0
[ 1918.773479] [c000000007f53780] [c00000000023610c] =
__hrtimer_run_queues+0x17c/0x370
[ 1918.773493] [c000000007f53800] [c000000000237158] =
hrtimer_interrupt+0x128/0x2f0
[ 1918.773508] [c000000007f538b0] [c000000000029f60] =
timer_interrupt+0x170/0x3e0
[ 1918.773523] [c000000007f53910] [c000000000009a08] =
decrementer_common_virt+0x208/0x210
[ 1918.773537] --- interrupt: 900 at rcu_dynticks_inc+0x1c/0x40
[ 1918.773548] NIP:  c000000000d14e0c LR: c000000000214280 CTR: =
c0000000002914f0
[ 1918.773558] REGS: c000000007f53980 TRAP: 0900   Not tainted  =
(5.17.0-rc6-00327-g782b30d101f6-dirty)
[ 1918.773569] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48002822  XER: 00000000
[ 1918.773601] CFAR: 0000000000000000 IRQMASK: 0=20
[ 1918.773601] GPR00: c00000000029165c c000000007f53c20 c000000002a20000 =
0000000000000002=20
[ 1918.773601] GPR04: 0000000000000000 c0000009fbc0ab80 c0000009fbc0ab70 =
c00000000001e508=20
[ 1918.773601] GPR08: 0000000000000000 c0000009fbc8f5a8 00000009f9ac0000 =
c0000009fbc8e600=20
[ 1918.773601] GPR12: 0000000000000000 c00000001ec3ea80 c00000000018cd78 =
c000000007234f80=20
[ 1918.773601] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[ 1918.773601] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
[ 1918.773601] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
[ 1918.773601] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
[ 1918.773729] NIP [c000000000d14e0c] rcu_dynticks_inc+0x1c/0x40
[ 1918.773739] LR [c000000000214280] =
rcu_momentary_dyntick_idle+0x30/0x60
[ 1918.773752] --- interrupt: 900
[ 1918.773758] [c000000007f53c20] [c000000007ac6d38] 0xc000000007ac6d38 =
(unreliable)
[ 1918.773771] [c000000007f53c40] [c00000000029165c] =
multi_cpu_stop+0x16c/0x230
[ 1918.773785] [c000000007f53cb0] [c000000000291244] =
cpu_stopper_thread+0xe4/0x240
[ 1918.773798] [c000000007f53d60] [c000000000193214] =
smpboot_thread_fn+0x1e4/0x250
[ 1918.773812] [c000000007f53dc0] [c00000000018ce94] kthread+0x124/0x130
[ 1918.773825] [c000000007f53e10] [c00000000000cec0] =
ret_from_kernel_thread+0x5c/0x64
[ 1918.773840] Sending NMI from CPU 12 to CPUs 13:
[ 1924.604622] CPU 13 didn't respond to backtrace IPI, inspecting paca.
[ 1924.604631] irq_soft_mask: 0x03 in_mce: 0 in_nmi: 0 current: 75 =
(migration/13)
[ 1924.604643] Back trace of paca->saved_r1 (0xc00000007e823ac0) =
(possibly stale):
[ 1924.604653] Call Trace:
[ 1924.604658] Sending NMI from CPU 12 to CPUs 15:
[ 1930.435393] CPU 15 didn't respond to backtrace IPI, inspecting paca.
[ 1930.435402] irq_soft_mask: 0x03 in_mce: 0 in_nmi: 0 current: 85 =
(migration/15)
[ 1930.435414] Back trace of paca->saved_r1 (0xc00000000d243ac0) =
(possibly stale):
[ 1930.435423] Call Trace:
[ 1930.441403] count-cache-flush: software flush enabled.
[ 1930.441426] link-stack-flush: software flush enabled.
#
not ok 5 selftests: powerpc/security: mitigation-patching.sh # TIMEOUT =
45 seconds

--Apple-Mail=_76C0C631-D150-4F01-9ED9-E0CD3F085C6B--

