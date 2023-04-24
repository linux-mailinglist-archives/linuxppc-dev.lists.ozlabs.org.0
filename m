Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9A6ECCCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 15:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4lwb243kz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 23:14:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UZJMUxEa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4lvl4XTkz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 23:14:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UZJMUxEa;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q4lvc1NK5z4xFk;
	Mon, 24 Apr 2023 23:14:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682342044;
	bh=rAKfGIpfGUfQJGxo6deg2EVn0G/Z65TZXTVSjeW+nY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UZJMUxEapjvdGCgfPjbLgLah58rNqMaCXZk/CLhW8lSR3KYbNzGV7Wy7rOCQh1rPm
	 FPufVJM3J2hRt0cz4/lpju9GndP/USzGsSkSsGznvvjwS2d7xVnOir+JXTy4Qq3xOo
	 v8XtlhieBrHHOKgC39Q9AxF6hegs3dTbjg7KQ8inL2GOB6XZm12Kn7hqVD/VtUjkho
	 Ndq20DVImSQpNp1zVCdAoJQNnHtTwIth6ZzUDPzyMctdjmgm7BsLxfr6Ka3YLbRC55
	 CdIYCDmLxtYM9dRuYeBZu89xBQYeJco2CbnlbLYVDmrGw44TH9Afxm0HClqwW961CX
	 AOhTQ8EcRmPxg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
In-Reply-To: <ZEXOMC2casTlobE1@boqun-archlinux>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux>
Date: Mon, 24 Apr 2023 23:14:00 +1000
Message-ID: <87fs8pzalj.fsf@mail.concordia>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Boqun,

Thanks for debugging this ...

Boqun Feng <boqun.feng@gmail.com> writes:
> On Sat, Apr 22, 2023 at 09:28:39PM +0200, Joel Fernandes wrote:
>> On Sat, Apr 22, 2023 at 2:47=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmail.co=
m> wrote:
>> >
>> > Dear PowerPC and RCU developers:
>> > During the RCU torture test on mainline (on the VM of Opensource Lab
>> > of Oregon State University), SRCU-P failed with __stack_chk_fail:
>> > [  264.381952][   T99] [c000000006c7bab0] [c0000000010c67c0]
>> > dump_stack_lvl+0x94/0xd8 (unreliable)
>> > [  264.383786][   T99] [c000000006c7bae0] [c00000000014fc94] panic+0x1=
9c/0x468
>> > [  264.385128][   T99] [c000000006c7bb80] [c0000000010fca24]
>> > __stack_chk_fail+0x24/0x30
>> > [  264.386610][   T99] [c000000006c7bbe0] [c0000000002293b4]
>> > srcu_gp_start_if_needed+0x5c4/0x5d0
>> > [  264.388188][   T99] [c000000006c7bc70] [c00000000022f7f4]
>> > srcu_torture_call+0x34/0x50
>> > [  264.389611][   T99] [c000000006c7bc90] [c00000000022b5e8]
>> > rcu_torture_fwd_prog+0x8c8/0xa60
>> > [  264.391439][   T99] [c000000006c7be00] [c00000000018e37c] kthread+0=
x15c/0x170
>> > [  264.392792][   T99] [c000000006c7be50] [c00000000000df94]
>> > ret_from_kernel_thread+0x5c/0x64
>> > The kernel config file can be found in [1].
>> > And I write a bash script to accelerate the bug reproducing [2].
>> > After a week's debugging, I found the cause of the bug is because the
>> > register r10 used to judge for stack overflow is not constant between
>> > context switches.
>> > The assembly code for srcu_gp_start_if_needed is located at [3]:
>> > c000000000226eb4:   78 6b aa 7d     mr      r10,r13
>> > c000000000226eb8:   14 42 29 7d     add     r9,r9,r8
>> > c000000000226ebc:   ac 04 00 7c     hwsync
>> > c000000000226ec0:   10 00 7b 3b     addi    r27,r27,16
>> > c000000000226ec4:   14 da 29 7d     add     r9,r9,r27
>> > c000000000226ec8:   a8 48 00 7d     ldarx   r8,0,r9
>> > c000000000226ecc:   01 00 08 31     addic   r8,r8,1
>> > c000000000226ed0:   ad 49 00 7d     stdcx.  r8,0,r9
>> > c000000000226ed4:   f4 ff c2 40     bne-    c000000000226ec8
>> > <srcu_gp_start_if_needed+0x1c8>
>> > c000000000226ed8:   28 00 21 e9     ld      r9,40(r1)
>> > c000000000226edc:   78 0c 4a e9     ld      r10,3192(r10)
>> > c000000000226ee0:   79 52 29 7d     xor.    r9,r9,r10
>> > c000000000226ee4:   00 00 40 39     li      r10,0
>> > c000000000226ee8:   b8 03 82 40     bne     c0000000002272a0
>> > <srcu_gp_start_if_needed+0x5a0>
>> > by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
>> > but if there is a context-switch before c000000000226edc, a false
>> > positive will be reported.
>> >
>> > [1] http://154.220.3.115/logs/0422/configformainline.txt
>> > [2] 154.220.3.115/logs/0422/whilebash.sh
>> > [3] http://154.220.3.115/logs/0422/srcu_gp_start_if_needed.txt
>> >
>> > My analysis and debugging may not be correct, but the bug is easily
>> > reproducible.
>>=20
>> If this is a bug in the stack smashing protection as you seem to hint,
>> I wonder if you see the issue with a specific gcc version and is a
>> compiler-specific issue. It's hard to say, but considering this I
>
> Very likely, more asm code from Zhouyi's link:
>
> This is the __srcu_read_unlock_nmisafe(), since "hwsync" is
> smp_mb__{after,before}_atomic(), and the following code is first
> barrier then atomic, so it's the unlock.
>
> 	c000000000226eb4:	78 6b aa 7d 	mr      r10,r13
>
> ^ r13 is the pointer to percpu data on PPC64 kernel, and it's also
> the pointer to TLS data for userspace code.

I've never understood why the compiler wants to make a copy of a
register variable into another register!? >:#

> 	c000000000226eb8:	14 42 29 7d 	add     r9,r9,r8
> 	c000000000226ebc:	ac 04 00 7c 	hwsync
> 	c000000000226ec0:	10 00 7b 3b 	addi    r27,r27,16
> 	c000000000226ec4:	14 da 29 7d 	add     r9,r9,r27
> 	c000000000226ec8:	a8 48 00 7d 	ldarx   r8,0,r9
> 	c000000000226ecc:	01 00 08 31 	addic   r8,r8,1
> 	c000000000226ed0:	ad 49 00 7d 	stdcx.  r8,0,r9
> 	c000000000226ed4:	f4 ff c2 40 	bne-    c000000000226ec8 <srcu_gp_start_i=
f_needed+0x1c8>
> 	c000000000226ed8:	28 00 21 e9 	ld      r9,40(r1)
> 	c000000000226edc:	78 0c 4a e9 	ld      r10,3192(r10)
>
> here I think that the compiler is using r10 as an alias to r13, since
> for userspace program, it's safe to assume the TLS pointer doesn't
> change. However this is not true for kernel percpu pointer.
>
> The real intention here is to compare 40(r1) vs 3192(r13) for stack
> guard checking, however since r13 is the percpu pointer in kernel, so
> the value of r13 can be changed if the thread gets scheduled to a
> different CPU after reading r13 for r10.

Yeah that's not good.

> If I'm correct, the following should be a workaround:
>
> 	diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> 	index ab4ee58af84b..f5ae3be3d04d 100644
> 	--- a/kernel/rcu/srcutree.c
> 	+++ b/kernel/rcu/srcutree.c
> 	@@ -747,6 +747,7 @@ void __srcu_read_unlock_nmisafe(struct srcu_struct *=
ssp, int idx)
>
> 		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section=
. */
> 		atomic_long_inc(&sdp->srcu_unlock_count[idx]);
> 	+       asm volatile("" : : : "r13", "memory");
> 	 }
> 	 EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
>
> Zhouyi, could you give a try? Note I think the "memory" clobber here is
> unnecesarry, but I just add it in case I'm wrong.
>
> Needless to say, the correct fix is to make ppc stack protector aware of
> r13 is volatile.

I suspect the compiler developers will tell us to go jump :)

The problem of the compiler caching r13 has come up in the past, but I
only remember it being "a worry" rather than causing an actual bug.

We've had the DEBUG_PREEMPT checks in get_paca(), which have given us at
least some comfort that if the compiler is caching r13, it shouldn't be
doing it in preemptable regions.

But obviously that doesn't help at all with the stack protector check.

I don't see an easy fix.

Adding "volatile" to the definition of local_paca seems to reduce but
not elimate the caching of r13, and the GCC docs explicitly say *not* to
use volatile. It also triggers lots of warnings about volatile being
discarded.

Short term we can make stack protector depend on !PREEMPT.

Longer term possibly we can move to having current in a register like
32-bit does, and then use that as the stack protector reg.

Or something simple I haven't thought of? :)

cheers
