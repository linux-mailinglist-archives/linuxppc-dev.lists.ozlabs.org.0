Return-Path: <linuxppc-dev+bounces-630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91777961CF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 05:20:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtqR23x5lz2yRZ;
	Wed, 28 Aug 2024 13:19:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724815198;
	cv=none; b=Qz2Y50sGFN/e6HZ1sVC5hf44QAqdpUh9TET6UUxRAT16f0qYZPu+boEIF9iaqSFshEqVj/ZxdbqYl3XGt4Qg6CpVHh8n06EV0kSXeyFowP3tdJoT63hdGSNY/V0Qb9uKZMfxL9qnG/M/UpJUmj6vkIXCgw7XN4xVIabf9md9/I9Czzmz5AYDy40OEy1JDPmSo3JhPtFYZFMBKjPnmM0TAVsWjQboLTvXtRHh83++QrTT8Q7trYVH+JO+ZfwCcXcTWkI/KEW47MOa6S399Tqc8QgtoeNccOIEq2kaUs0+zomSN9FwofsmV6s2Q4ArcUIkE4VQyY4o4592SoP1fcC2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724815198; c=relaxed/relaxed;
	bh=FDm6/4kaYEwyIVMuVCKMTvyUYuOxVix/X+abE1xyWMc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To; b=G7g7AN+Dv0tPSYCBvcIm80A4dGoTtrrZ7LZFw1EIBjZxVUjwSeiN8y0IZ1ntAkeg0T2e1OK8tIfZTwyFj+TN493nAC3paXKqyQ8hcAfl3AIphKPUTBuDxB4UmbE/hw4/mqyfMY1/5NUGxiUb+q3T8isgwfO4NTJAS177Ns8MBxVp49T4+fzwlVEMToaf854Saj49cIfTtNKmbaWsrSBjsSps0Z1wlL3PAQJ//4tx0kZHxhXHwjSQVVHm37Dget/1H63YpNaXPpOLkpUDxg9oXC7JHdBWa1j3mOG++Jqm/Yuj2+Pg+IOOvuCZSPFIVUB+LLgTMSIVoFHn3LOffH0L5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OBdaKiYw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OBdaKiYw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtqR14qHfz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 13:19:57 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71430e7eaf8so4992448b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 20:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724815193; x=1725419993; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDm6/4kaYEwyIVMuVCKMTvyUYuOxVix/X+abE1xyWMc=;
        b=OBdaKiYw2O3mJFiP4P4IU+N/Bj7Re5wAjH06MADF7kNP+OMxjgWf0d8hcjeBdTYShl
         TE88ASuDXv45pnhEwZV3Q3OgI0h19l1Ddr0lQBB+UjIT0y1tOPVfEXeOUiggbUXjFh0V
         v8PDq3uvwi3qx+YnE9xLBmBqJRn5TNGWfUzahDXaG2YLglSUIZ0pWp+iWuwL3O9r4BVj
         73Kw2HHh4Fk6emJfexXA1vMIF2q8sy1bc2RHLaCIm0teeCCx/3MAPzsPxGQuxn0d72+Z
         ZXH8en1V1HzKF0wekIW8uuFEt//ejDYNYdQornuARyI7J2+vIQPRq5rFk42AS8e45sxe
         ZJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724815193; x=1725419993;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDm6/4kaYEwyIVMuVCKMTvyUYuOxVix/X+abE1xyWMc=;
        b=Zy9pm9XYkzc7X8RK+oIm821yK+7Jno4sKheZ2xYuAWl4G1k81yj0d2bzKAXjn4zEit
         uLnDYhNqKX52a1+m04sbtBY5nOvsS5/D1qrJKRVE5ypZWmSNjJi79bq8gUeAi1P87Hm/
         NBysVZ3NYk8bCRTJes3ZIgt904XTXQJ076JblJdhYduyUOZwDdwW1VPrV/mPScRvetuR
         5/e0+al6nwX7Zsu3ZxvB59aGiMcgPX12lqc65+tfUUWe5xta7QKyRMlILZn8yOIo9O4T
         0eFSA8+kNsG3dczK6MLsR/GzvdjFGUFXgK//XOJZl4i05LgZ3YHwdAxnz2dJAeTRTxv1
         bZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUMItTfqVHbb6RRMq1jdOouNOIwO5e2SgwfvU6qB6RrnEJ7udT/Ew1Sw7rvUd2ZlYtwFon8y6/CMEsqomA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlUoDrkWWnlvet+wEE5RsONgsVd74ew0tADppNxxtd+w7Glm4/
	stGOT46u6yktHv7+73lQMxkNeZaOA+e6JYQn/EcQTL5TuU7gOv8t
X-Google-Smtp-Source: AGHT+IH7U6Ym8EVJNn0TzIcpESz0eZ0goOZOElDkcUFly8uYuSzZ/P3XPGdhnJvtMWiChsyDbFgJ2g==
X-Received: by 2002:a05:6a21:4610:b0:1c3:ff33:277e with SMTP id adf61e73a8af0-1cc89e20eb2mr13633304637.32.1724815193127;
        Tue, 27 Aug 2024 20:19:53 -0700 (PDT)
Received: from localhost ([1.146.81.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8446415efsm338934a91.47.2024.08.27.20.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 20:19:52 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Aug 2024 13:19:46 +1000
Message-Id: <D3R7YDW8U4QJ.1ZC4SPQN5SY1G@gmail.com>
Subject: Re: [PATCH] powerpc/qspinlock: Fix deadlock in MCS queue
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Cc: <stable@vger.kernel.org>, "Geetika Moolchandani"
 <geetika@linux.ibm.com>, "Vaishnavi Bhat" <vaish123@in.ibm.com>, "Jijo
 Varghese" <vargjijo@in.ibm.com>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20240826081251.744325-1-nysal@linux.ibm.com>
In-Reply-To: <20240826081251.744325-1-nysal@linux.ibm.com>

Hey Nysal,

This is really good debugging, and a nice write up.

On Mon Aug 26, 2024 at 6:12 PM AEST, Nysal Jan K.A. wrote:
> If an interrupt occurs in queued_spin_lock_slowpath() after we increment
> qnodesp->count and before node->lock is initialized, another CPU might
> see stale lock values in get_tail_qnode(). If the stale lock value happen=
s
> to match the lock on that CPU, then we write to the "next" pointer of
> the wrong qnode. This causes a deadlock as the former CPU, once it become=
s
> the head of the MCS queue, will spin indefinitely until it's "next" point=
er
> is set by its successor in the queue. This results in lockups similar to
> the following.
>
>    watchdog: CPU 15 Hard LOCKUP
>    ......
>    NIP [c0000000000b78f4] queued_spin_lock_slowpath+0x1184/0x1490
>    LR [c000000001037c5c] _raw_spin_lock+0x6c/0x90
>    Call Trace:
>     0xc000002cfffa3bf0 (unreliable)
>     _raw_spin_lock+0x6c/0x90
>     raw_spin_rq_lock_nested.part.135+0x4c/0xd0
>     sched_ttwu_pending+0x60/0x1f0
>     __flush_smp_call_function_queue+0x1dc/0x670
>     smp_ipi_demux_relaxed+0xa4/0x100
>     xive_muxed_ipi_action+0x20/0x40
>     __handle_irq_event_percpu+0x80/0x240
>     handle_irq_event_percpu+0x2c/0x80
>     handle_percpu_irq+0x84/0xd0
>     generic_handle_irq+0x54/0x80
>     __do_irq+0xac/0x210
>     __do_IRQ+0x74/0xd0
>     0x0
>     do_IRQ+0x8c/0x170
>     hardware_interrupt_common_virt+0x29c/0x2a0
>    --- interrupt: 500 at queued_spin_lock_slowpath+0x4b8/0x1490
>    ......
>    NIP [c0000000000b6c28] queued_spin_lock_slowpath+0x4b8/0x1490
>    LR [c000000001037c5c] _raw_spin_lock+0x6c/0x90
>    --- interrupt: 500
>     0xc0000029c1a41d00 (unreliable)
>     _raw_spin_lock+0x6c/0x90
>     futex_wake+0x100/0x260
>     do_futex+0x21c/0x2a0
>     sys_futex+0x98/0x270
>     system_call_exception+0x14c/0x2f0
>     system_call_vectored_common+0x15c/0x2ec
>
> The following code flow illustrates how the deadlock occurs:
>
>         CPU0                                   CPU1
>         ----                                   ----
>   spin_lock_irqsave(A)                          |
>   spin_unlock_irqrestore(A)                     |
>     spin_lock(B)                                |
>          |                                      |
>          =E2=96=BC                                      |
>    id =3D qnodesp->count++;                       |
>   (Note that nodes[0].lock =3D=3D A)                |
>          |                                      |
>          =E2=96=BC                                      |
>       Interrupt                                 |
>   (happens before "nodes[0].lock =3D B")          |
>          |                                      |
>          =E2=96=BC                                      |
>   spin_lock_irqsave(A)                          |
>          |                                      |
>          =E2=96=BC                                      |
>    id =3D qnodesp->count++                        |
>    nodes[1].lock =3D A                            |
>          |                                      |
>          =E2=96=BC                                      |
>   Tail of MCS queue                             |
>          |                             spin_lock_irqsave(A)
>          =E2=96=BC                                      |
>   Head of MCS queue                             =E2=96=BC
>          |                             CPU0 is previous tail
>          =E2=96=BC                                      |
>    Spin indefinitely                            =E2=96=BC
>   (until "nodes[1].next !=3D NULL")      prev =3D get_tail_qnode(A, CPU0)
>                                                 |
>                                                 =E2=96=BC
>                                        prev =3D=3D &qnodes[CPU0].nodes[0]
>                                      (as qnodes[CPU0].nodes[0].lock =3D=
=3D A)
>                                                 |
>                                                 =E2=96=BC
>                                        WRITE_ONCE(prev->next, node)
>                                                 |
>                                                 =E2=96=BC
>                                         Spin indefinitely
>                                      (until nodes[0].locked =3D=3D 1)

I can follow your scenario, and agree it is a bug.

Generic qspinlock code does not have a similar path because it encodes
idx with the CPU in the spinlock word. The powerpc qspinlocks removed
that to save some bits in the word (to support more CPUs).

What probably makes it really difficult to hit is that I think both
locks A and B need contention from other sources to push them into
queueing slow path. I guess that's omitted for brevity in the flow
above, which is fine.

> Thanks to Saket Kumar Bhaskar for help with recreating the issue
>
> Fixes: 84990b169557 ("powerpc/qspinlock: add mcs queueing for contended w=
aiters")
> Cc: stable@vger.kernel.org # v6.2+
> Reported-by: Geetika Moolchandani <geetika@linux.ibm.com>
> Reported-by: Vaishnavi Bhat <vaish123@in.ibm.com>
> Reported-by: Jijo Varghese <vargjijo@in.ibm.com>
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
>  arch/powerpc/lib/qspinlock.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 5de4dd549f6e..59861c665cef 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -697,6 +697,12 @@ static __always_inline void queued_spin_lock_mcs_que=
ue(struct qspinlock *lock, b
>  	}
> =20
>  release:
> +	/*
> +	 * Clear the lock, as another CPU might see stale values if an
> +	 * interrupt occurs after we increment qnodesp->count but before
> +	 * node->lock is initialized
> +	 */
> +	node->lock =3D NULL;
>  	qnodesp->count--; /* release the node */

AFAIKS this fix works.

There is one complication which is those two stores could be swapped by
the compiler. So we could take an IRQ here that sees the node has been
freed, but node->lock has not yet been cleared. Basically equivalent to
the problem solved by the barrier() on the count++ side.

This reordering would not cause a problem in your scenario AFAIKS
because when the lock call returns, node->lock *will* be cleared so it
can not cause a problem later.

Still, should we put a barrier() between these just to make things a
bit cleaner? I.e., when count is decremented, we definitely won't do
any other stores to node. Otherwise,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

