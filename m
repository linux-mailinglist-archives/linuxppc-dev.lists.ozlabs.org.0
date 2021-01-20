Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF52FC9DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 05:23:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLC7x2LJ4zDqr6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 15:23:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l/LyYDgm; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLC6003fyzDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 15:21:54 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id j12so1334021pjy.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 20:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KfFM6Hk1muQ8Hvybb25WvcZ4AuWGoU/xKooDRoa/PXU=;
 b=l/LyYDgmqkKBF6RKcEZoFeicwJqcWg2PIFvr3dDtgLonEo9OcxnRWV8nhaKCyFfz00
 QmN1y9aC4tx8i2K7l57NAoGxB7BXVofonRVwQ5lwYPsTX6Xq1Dg8j/EdlCEY3X8ysKTp
 YWybJn5lAXoXCQNCvfTxIxWx3uEb7QtoY9WXBPf6PlswgZdJYaWZuvR8XdLkCmGQc29d
 f5q7TqbjDPZ12xhzAFGKEmAruupin+LpVEaAs47zGDl80qbDPB1CdTyGb9MGM/QB1Gkw
 MpmUIAdgVpNjSFcTq6heUKCjvvHSK1/QzhFKNNqMNGcuYxPw82Vnbp2+CsMOSSck4rXw
 WNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KfFM6Hk1muQ8Hvybb25WvcZ4AuWGoU/xKooDRoa/PXU=;
 b=DGhddH0o13ybsqagnDD9yTLVY9n1dHe8KLyCQqO5KNv1Hdk07QQkrcuTUM8ARd11xB
 D1m2oKZazUHietw/qFUEx20WsS6jZIufOhmvqNt8z01/ViKSoGWh9CR9A0q/xhvxFk3+
 /vdYt+9aF152O5BepuzOv85f8Kvs6Jt0Dcugydr3Ha/nqYjl4PoTUsdDq3TNLKDHiWpH
 4Nu2VvDlvjdgffaVafG1ftOujTpAQFc0bEpLYXVRVO4JWM4ijqpLocUpv1iZOJPcAMEs
 WcC+1IzXC8I5TvA65rQCBTaLMyXm38f3kpANLKzC/cXXIDzfcerpYnwQjY5QnhNni9lE
 /dwA==
X-Gm-Message-State: AOAM531aRkhTQhBMGLa1ibomjInJ1ayqPcTnBNabt4ZhpEroGCFi4mfr
 nAokSaDXRwxQUvWr5Rte+fw=
X-Google-Smtp-Source: ABdhPJwHq6gQa6FVjzTV7quBs5uw+TvRsjFUvseRkwnVrGmnUfmxYKD7M5XuPuHR5LLmyfj0jaVm6A==
X-Received: by 2002:a17:902:8a8d:b029:dc:8ac6:a149 with SMTP id
 p13-20020a1709028a8db02900dc8ac6a149mr8251113plo.18.1611116511116; 
 Tue, 19 Jan 2021 20:21:51 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id a141sm598752pfa.189.2021.01.19.20.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 20:21:50 -0800 (PST)
Date: Wed, 20 Jan 2021 14:21:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 14/39] powerpc/perf: move perf irq/nmi handling details
 into traps.c
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-15-npiggin@gmail.com>
 <AB6E725D-225E-4FBD-B484-4C8FA627D096@linux.vnet.ibm.com>
 <1611108829.0isdl3z9na.astroid@bobo.none>
In-Reply-To: <1611108829.0isdl3z9na.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1611116256.ntg9xvtsyb.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of January 20, 2021 1:09 pm:
> Excerpts from Athira Rajeev's message of January 19, 2021 8:24 pm:
>>=20
>> [  883.900762] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swappe=
r/0:0]
>> [  883.901381] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           OE    =
 5.11.0-rc3+ #34
>> --
>> [  883.901999] NIP [c0000000000168d0] replay_soft_interrupts+0x70/0x2f0
>> [  883.902032] LR [c00000000003b2b8] interrupt_exit_kernel_prepare+0x1e8=
/0x240
>> [  883.902063] Call Trace:
>> [  883.902085] [c000000001c96f50] [c00000000003b2b8] interrupt_exit_kern=
el_prepare+0x1e8/0x240 (unreliable)
>> [  883.902139] [c000000001c96fb0] [c00000000000fd88] interrupt_return+0x=
158/0x200
>> [  883.902185] --- interrupt: ea0 at __rb_reserve_next+0xc0/0x5b0
>> [  883.902224] NIP:  c0000000002d8980 LR: c0000000002d897c CTR: c0000000=
001aad90
>> [  883.902262] REGS: c000000001c97020 TRAP: 0ea0   Tainted: G           =
OE      (5.11.0-rc3+)
>> [  883.902301] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 280=
00484  XER: 20040000
>> [  883.902387] CFAR: c00000000000fe00 IRQMASK: 0=20
>> --
>> [  883.902757] NIP [c0000000002d8980] __rb_reserve_next+0xc0/0x5b0
>> [  883.902786] LR [c0000000002d897c] __rb_reserve_next+0xbc/0x5b0
>> [  883.902824] --- interrupt: ea0
>> [  883.902848] [c000000001c97360] [c0000000002d8fcc] ring_buffer_lock_re=
serve+0x15c/0x580
>> [  883.902894] [c000000001c973f0] [c0000000002e82fc] trace_function+0x4c=
/0x1c0
>> [  883.902930] [c000000001c97440] [c0000000002f6f50] function_trace_call=
+0x140/0x190
>> [  883.902976] [c000000001c97470] [c00000000007d6f8] ftrace_call+0x4/0x4=
4
>> [  883.903021] [c000000001c97660] [c000000000dcf70c] __do_softirq+0x15c/=
0x3d4
>> [  883.903066] [c000000001c97750] [c00000000015fc68] irq_exit+0x198/0x1b=
0
>> [  883.903102] [c000000001c97780] [c000000000dc1790] timer_interrupt+0x1=
70/0x3b0
>> [  883.903148] [c000000001c977e0] [c000000000016994] replay_soft_interru=
pts+0x134/0x2f0
>> [  883.903193] [c000000001c979d0] [c00000000003b2b8] interrupt_exit_kern=
el_prepare+0x1e8/0x240
>> [  883.903240] [c000000001c97a30] [c00000000000fd88] interrupt_return+0x=
158/0x200
>> [  883.903276] --- interrupt: ea0 at arch_local_irq_restore+0x70/0xc0
>=20
> You got a 0xea0 interrupt in the ftrace code. I wonder where it is=20
> looping. Do you see more soft lockup messages?

We should probably fix this recursion too. I was vaguely aware of it and=20
thought it might have existed with the old interrupt exit and replay=20
code as well and was pretty well bounded, but I'm not entirely sure it's
okay. And now that I've thought about it a bit harder, I think there is
actualy a simple way to fix it -

[PATCH] powerpc/64: prevent replayed interrupt handlers from running
 softirqs

Running softirqs enables interrupts, which can then end up recursing
into the irq soft-mask code we're trying to adjust, including replaying
interrupts itself which may not be bounded. This abridged trace shows
how this can occur:

  NIP replay_soft_interrupts
  LR  interrupt_exit_kernel_prepare
  Call Trace:
    interrupt_exit_kernel_prepare (unreliable)
    interrupt_return
  --- interrupt: ea0 at __rb_reserve_next
  NIP __rb_reserve_next
  LR __rb_reserve_next
  Call Trace:
    ring_buffer_lock_reserve
    trace_function
    function_trace_call
    ftrace_call
    __do_softirq
    irq_exit
   timer_interrupt
   replay_soft_interrupts
   interrupt_exit_kernel_prepare
   interrupt_return
  --- interrupt: ea0 at arch_local_irq_restore

Fix this by disabling bhs (softirqs) around the interrupt replay.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 681abb7c0507..bb0d4fc8df89 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -189,6 +189,18 @@ void replay_soft_interrupts(void)
 	unsigned char happened =3D local_paca->irq_happened;
 	struct pt_regs regs;
=20
+	/*
+	 * Prevent softirqs from being run when an interrupt handler returns
+	 * and calls irq_exit(), because softirq processing enables interrupts.
+	 * If an interrupt is taken, it may then call replay_soft_interrupts
+	 * on its way out, which gets messy and recursive.
+	 *
+	 * softirqs created by replayed interrupts will be run at the end of
+	 * this function when bhs are enabled (if they were enabled in our
+	 * caller).
+	 */
+	local_bh_disable();
+
 	ppc_save_regs(&regs);
 	regs.softe =3D IRQS_ENABLED;
=20
@@ -264,6 +276,8 @@ void replay_soft_interrupts(void)
 		trace_hardirqs_off();
 		goto again;
 	}
+
+	local_bh_enable();
 }
=20
 notrace void arch_local_irq_restore(unsigned long mask)
--=20
2.23.0

