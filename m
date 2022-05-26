Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998F534A06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 06:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7wVj31qcz3bvl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 14:50:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q2yZidqn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q2yZidqn;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7wV33722z2yyQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 14:50:18 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id f21so779067pfa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 21:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=rzE18qKLWcgTZ6e9NohyX5zWDT5k6BJCSd3i3Wg5zNw=;
        b=q2yZidqnOuljDjNxWV+f1ED+rXUhlvsctHJs0+yoF32aKmIdOeghJ968Yt4bWIdSRG
         ANXtcSJDDmKuhvBiro9LPxk6mqvEsCU0b5wlEKVlWAZWAPLy2e92aEKrr1TrF2ORym7E
         KKlqvcx29Lnx1o7JnmY1o4st8taXvRQJ6bUEe51uZDVPKUwycl66X9uCDafcXZ1tc4+3
         3CM0SiGCNZNPzc36RhcdobKWyjE3WgBsYgdEREJhvTnRe8teoV0cHTUHiMY7pKmjKOt3
         T6gb7x2j6ECxHEOxFtQhMKEuNLWkMvn2AUqGS0syfzLXLAZTSKsUuT7m7JsS2RwzeicX
         wPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=rzE18qKLWcgTZ6e9NohyX5zWDT5k6BJCSd3i3Wg5zNw=;
        b=LektqS+lzPTPJrusNQz7VgwrRw7iN5EHo1p9LW0bVoGNex330q/9dBiza89mrB4gFQ
         flvGxfg6FEenY8Gm/s0+KIi4SOnZs02a7S+uKSiS8XCLtGQ9qCHDxpven+fZ/lbUEh7/
         IbIttXhPpGL/lLDb2PJB8gOabstutDfzBNYjglAlpHOGU4H2vKaJ5xQBNYDTvUIlsovw
         T1NREzLZixCZaPdFF00X/G12/KC5y78hFHfFefvkn9okxD2XGYZzGA62YADNX6R2xnR+
         /G9bZK97EE9/lP2UWU315J6If6jaFOuOUGM6UoNyZmQjao3F0TV36dFRPitJAsfITf25
         PIjg==
X-Gm-Message-State: AOAM5315fI1ZXJ0RSxNdImiWyO32Bu/+rcrYvqPuLkFBXQ5Pq5eFJcvn
	PAGHqtlLMsTi0sA78lIu3Rs6rTNAGH0=
X-Google-Smtp-Source: ABdhPJzSUvj7hNDgrSRtuso81P1J/A0fAUWluJzfIHbxQhAs9nIJbBIWYJI+/FI1jLAjJogy0WK/iA==
X-Received: by 2002:a63:2209:0:b0:3ab:113b:9a2b with SMTP id i9-20020a632209000000b003ab113b9a2bmr31930140pgi.235.1653540613354;
        Wed, 25 May 2022 21:50:13 -0700 (PDT)
Received: from localhost (220-244-74-131.tpgi.com.au. [220.244.74.131])
        by smtp.gmail.com with ESMTPSA id u12-20020a170903304c00b0015e8d4eb288sm299703pla.210.2022.05.25.21.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 21:50:11 -0700 (PDT)
Date: Thu, 26 May 2022 14:50:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64/interrupt: Fix return to masked context after
 hard-mask irq becomes pending
To: Sachin Sant <sachinp@linux.ibm.com>
References: <20220307145159.166519-1-npiggin@gmail.com>
	<BE8D6B08-1276-4BBB-8859-C7D48242D0DF@linux.ibm.com>
In-Reply-To: <BE8D6B08-1276-4BBB-8859-C7D48242D0DF@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1653536815.6wga69vb1l.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Sachin Sant's message of March 9, 2022 6:37 pm:
>=20
>=20
>> On 07-Mar-2022, at 8:21 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> When a synchronous interrupt[1] is taken in a local_irq_disable() region
>> which has MSR[EE]=3D1, the interrupt handler will enable MSR[EE] as part
>> of enabling MSR[RI], for peformance and profiling reasons.
>>=20
>> [1] Typically a hash fault, but in error cases this could be a page
>>    fault or facility unavailable as well.
>>=20
>> If an asynchronous interrupt hits here and its masked handler requires
>> MSR[EE] to be cleared (it is a PACA_IRQ_MUST_HARD_MASK interrupt), then
>> MSR[EE] must remain disabled until that pending interrupt is replayed.
>> The problem is that the MSR of the original context has MSR[EE]=3D1, so
>> returning directly to that causes MSR[EE] to be enabled while the
>> interrupt is still pending.
>>=20
>> This issue was hacked around in the interrupt return code by just
>> clearing the hard mask to avoid a warning, and taking the masked
>> interrupt again immediately in the return context, which would disable
>> MSR[EE]. However in the case of a pending PMI, it is possible that it is
>> not maked in the calling context so the full handler will be run while
>> there is a PMI pending, and this confuses the perf code and causes
>> warnings with its PMI pending management.
>>=20
>> Fix this by removing the hack, and adjusting the return MSR if it has
>> MSR[EE]=3D1 and there is a PACA_IRQ_MUST_HARD_MASK interrupt pending.
>>=20
>> Fixes: 4423eb5ae32e ("powerpc/64/interrupt: make normal synchronous inte=
rrupts enable MSR[EE] if possible")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> arch/powerpc/kernel/interrupt.c    | 10 ---------
>> arch/powerpc/kernel/interrupt_64.S | 34 +++++++++++++++++++++++++++---
>> 2 files changed, 31 insertions(+), 13 deletions(-)
>=20
> With this patch on top of powerpc/merge following rcu stalls are seen whi=
le
> running powerpc selftests (mitigation-patching) on P9. I don=E2=80=99t se=
e this
> issue on P10.
>=20
> [ 1841.248838] link-stack-flush: flush disabled.
> [ 1841.248905] count-cache-flush: software flush enabled.
> [ 1841.248911] link-stack-flush: software flush enabled.
> [ 1901.249668] rcu: INFO: rcu_sched self-detected stall on CPU
> [ 1901.249703] rcu: 	12-...!: (5999 ticks this GP) idle=3Dd0f/1/0x4000000=
000000002 softirq=3D37019/37027 fqs=3D0=20
> [ 1901.249720] 	(t=3D6000 jiffies g=3D106273 q=3D1624)
> [ 1901.249729] rcu: rcu_sched kthread starved for 6000 jiffies! g106273 f=
0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D6
> [ 1901.249743] rcu: 	Unless rcu_sched kthread gets sufficient CPU time, O=
OM is now expected behavior.
> [ 1901.249752] rcu: RCU grace-period kthread stack dump:
> [ 1901.249759] task:rcu_sched       state:R  running task     stack:    0=
 pid:   11 ppid:     2 flags:0x00000800
> [ 1901.249775] Call Trace:
> [ 1901.249781] [c0000000076ab870] [0000000000000001] 0x1 (unreliable)
> [ 1901.249795] [c0000000076aba60] [c00000000001e508] __switch_to+0x288/0x=
4a0
> [ 1901.249811] [c0000000076abac0] [c000000000d15950] __schedule+0x2c0/0x9=
50
> [ 1901.249824] [c0000000076abb80] [c000000000d16048] schedule+0x68/0x130
> [ 1901.249836] [c0000000076abbb0] [c000000000d1df1c] schedule_timeout+0x2=
5c/0x3f0
> [ 1901.249849] [c0000000076abc90] [c00000000021522c] rcu_gp_fqs_loop+0x2f=
c/0x3e0
> [ 1901.249863] [c0000000076abd40] [c00000000021a0fc] rcu_gp_kthread+0x13c=
/0x180
> [ 1901.249875] [c0000000076abdc0] [c00000000018ce94] kthread+0x124/0x130
> [ 1901.249887] [c0000000076abe10] [c00000000000cec0] ret_from_kernel_thre=
ad+0x5c/0x64
> [ 1901.249900] rcu: Stack dump where RCU GP kthread last ran:
> [ 1901.249908] Sending NMI from CPU 12 to CPUs 6:
> [ 1901.249944] NMI backtrace for cpu 6
> [ 1901.249957] CPU: 6 PID: 40 Comm: migration/6 Not tainted 5.17.0-rc6-00=
327-g782b30d101f6-dirty #3
> [ 1901.249971] Stopper: multi_cpu_stop+0x0/0x230 <- stop_machine_cpuslock=
ed+0x188/0x1e0
> [ 1901.249987] NIP:  c000000000d14e0c LR: c000000000214280 CTR: c00000000=
02914f0
> [ 1901.249996] REGS: c00000000785b980 TRAP: 0500   Not tainted  (5.17.0-r=
c6-00327-g782b30d101f6-dirty)
> [ 1901.250007] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48002822  XER: 00000000
> [ 1901.250038] CFAR: 0000000000000000 IRQMASK: 0=20
> [ 1901.250038] GPR00: c00000000029165c c00000000785bc20 c000000002a20000 =
0000000000000002=20
> [ 1901.250038] GPR04: 0000000000000000 c0000009fb60ab80 c0000009fb60ab70 =
c00000000001e508=20
> [ 1901.250038] GPR08: 0000000000000000 c0000009fb68f5a8 00000009f94c0000 =
000000000098967f=20
> [ 1901.250038] GPR12: 0000000000000000 c00000001ec57a00 c00000000018cd78 =
c000000007234f80=20
> [ 1901.250038] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [ 1901.250038] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
> [ 1901.250038] GPR24: 0000000000000002 0000000000000003 0000000000000000 =
c000000002a62138=20
> [ 1901.250038] GPR28: c0000000ee70faf8 0000000000000001 c0000000ee70fb1c =
0000000000000001=20
> [ 1901.250157] NIP [c000000000d14e0c] rcu_dynticks_inc+0x1c/0x40
> [ 1901.250168] LR [c000000000214280] rcu_momentary_dyntick_idle+0x30/0x60
> [ 1901.250180] Call Trace:
> [ 1901.250185] [c00000000785bc20] [c000000007a96738] 0xc000000007a96738 (=
unreliable)
> [ 1901.250198] [c00000000785bc40] [c00000000029165c] multi_cpu_stop+0x16c=
/0x230
> [ 1901.250210] [c00000000785bcb0] [c000000000291244] cpu_stopper_thread+0=
xe4/0x240
> [ 1901.250223] [c00000000785bd60] [c000000000193214] smpboot_thread_fn+0x=
1e4/0x250
> [ 1901.250237] [c00000000785bdc0] [c00000000018ce94] kthread+0x124/0x130
> [ 1901.250249] [c00000000785be10] [c00000000000cec0] ret_from_kernel_thre=
ad+0x5c/0x64
> [ 1901.250262] Instruction dump:
> [ 1901.250269] f821ffa1 4b43b81d 00000000 00000000 00000000 3c4c01d1 3842=
b210 e94d0030=20
> [ 1901.250290] 3d22ff7b 3929f5a8 7d295214 7c0004ac <7d404828> 7d4a1814 7d=
40492d 40c2fff4=20
> [ 1901.250313] Sending NMI from CPU 12 to CPUs 0:
> [ 1901.250328] NMI backtrace for cpu 0
>=20
> Have attached o/p captured during mitigation-patching test run.

Hey, I haven't been able to reproduce this. Are you just running make=20
run_tests in the selftests/powerpc/security/ directory? Any particular
config?

Thanks,
Nick

