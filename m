Return-Path: <linuxppc-dev+bounces-2561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1F19AF631
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 02:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZNvt4TTVz2yLg;
	Fri, 25 Oct 2024 11:29:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729816186;
	cv=none; b=EcauDPLp3SIe5i2kGodIRJDI763YqoKSi1b+Jzay1Ntuxju56SWaPT3yCykLZMrVhLAyPtF/Ai5jk15ZzAIw17dR7oZ2RUKEQFc67gQdJapJNuieiZJ71mEBhSDxc7IJEuHDutBjdeTgIgmIOClj9phSXYfOWB/SxCbIS8WXQPs/IPMHciWvGCipP5UlHQ0xQEMzOL81Ts4Itou9nzxALaHbYgmjKp7mEiq1YtEX6uXLUIqzhNJfzG2F5V7q5/tQGX2EnH8ML/qM/kCc/eCC6mRxI8wPt0ELuiCpHnLPRaPZ43MT4y15NAPktPLeWNuBhMpM9nVnN1yw9eVChEvl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729816186; c=relaxed/relaxed;
	bh=EnB2ce/rVYDY5AA6/sx9y4i1CZuXEVtDGbu8N7gt0+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OLJhcNPB8yIWfbN2iUXTtlmKfEonUW8Jux0N8Uj0zCwJ2sZ0oXBg/T6j5zWJlthDZM/amDyodOUFFpJsX8BLzQb2h5SSLbflid8jz0mQjsCCYxy3Dwwi+Mm1Y+rOBul9+2ZuZdaVd7TnJc4qaQOhioX3iuIqpNM2wTmkAc4HUaeYPFZ7Lxqvacz5S5ksy/9kDaDTZKRFs/vfnHiTOV20cERtE83Cph8VuGKSBU7fXgiMhEAH+oL4j3YF65RvcKdPCQPqhcIuqtsgRwEYXmkIpMYMD7ADo9qtlWwdF3WTnkKzxXwQdzFIjF1BAD2r9jfD82kcYZplcQPYbAupW7HlzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iabFei46; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iabFei46;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZNvq4L7Gz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 11:29:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729816180;
	bh=EnB2ce/rVYDY5AA6/sx9y4i1CZuXEVtDGbu8N7gt0+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iabFei46eTD/ZABVvZ6sJZ8FoaRnbZc0gsNTN7ITADjc8l4Isggqg8L8ZZm2BQw2G
	 hZhVqbbbO5Abiy+EBJ8OLftUG7OYK7V57k0+qm20ipD+Xpiq88+l7NLLWKscAbZB/X
	 3StMn1YeJGl0pvUG/KOHJViw0qbhWvdMD+GFq0NhRnCgk+uPNmxLD7HkDDJojf2PmU
	 0Phdv4G2lFFeeDxZdPQk40AIutU5DJfklA8tnxUNaoKh17PNsRLT2SyK4kqfF2HYIk
	 nK7/g1OT4qt4LJGqzdMi0/RK+HzwyV9C2QFv0vgSuQFBX92bnnmY+Yagksy+sGz1VA
	 go5DInxlYiB9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZNvl59fLz4x2g;
	Fri, 25 Oct 2024 11:29:39 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Cc: linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A" <nysal@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Vlastimil Babka <vbabka@suse.cz>, Kent
 Overstreet <kent.overstreet@linux.dev>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] sched/membarrier: Fix redundant load of membarrier_state
In-Reply-To: <20241007053936.833392-1-nysal@linux.ibm.com>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
Date: Fri, 25 Oct 2024 11:29:38 +1100
Message-ID: <87frolja8d.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

[To += Mathieu]

"Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> From: "Nysal Jan K.A" <nysal@linux.ibm.com>
>
> On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> is not selected, sync_core_before_usermode() is a no-op.
> In membarrier_mm_sync_core_before_usermode() the compiler does not
> eliminate redundant branches and the load of mm->membarrier_state
> for this case as the atomic_read() cannot be optimized away.

I was wondering if this was caused by powerpc's arch_atomic_read() which
uses asm volatile.

But replacing arch_atomic_read() with READ_ONCE() makes no difference,
presumably because the compiler still can't see that the READ_ONCE() is
unnecessary (which is kind of by design).

> Here's a snippet of the code generated for finish_task_switch() on powerpc:
>
> 1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
> .......
> 1b78c8:   cmpdi   cr7,r26,0
> 1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
> 1b78d0:   ld      r9,2312(r13)    # current
> 1b78d4:   ld      r9,1888(r9)     # current->mm
> 1b78d8:   cmpd    cr7,r26,r9
> 1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
> 1b78e0:   hwsync
> 1b78e4:   cmplwi  cr7,r27,128
> .......
> 1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
> 1b7a74:   b       1b78e0 <finish_task_switch+0xcc>
>
> This was found while analyzing "perf c2c" reports on kernels prior
> to commit c1753fd02a00 ("mm: move mm_count into its own cache line")
> where mm_count was false sharing with membarrier_state.

So it was causing a noticable performance blip? But isn't anymore?

> There is a minor improvement in the size of finish_task_switch().
> The following are results from bloat-o-meter:
>
> GCC 7.5.0:
> ----------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch                           884     852     -32
>
> GCC 12.2.1:
> -----------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch.isra                      852     820     -32

GCC 12 is a couple of years old, I assume GCC 14 behaves similarly?

> LLVM 17.0.6:
> ------------
> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-36 (-36)
> Function                                     old     new   delta
> rt_mutex_schedule                            120     104     -16
> finish_task_switch                           792     772     -20
>
> Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>
> ---
>  include/linux/sched/mm.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 07bb8d4181d7..042e60ab853a 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -540,6 +540,8 @@ enum {
>  
>  static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>  {
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
> +		return;
>  	if (current->mm != mm)
>  		return;
>  	if (likely(!(atomic_read(&mm->membarrier_state) &

The other option would be to have a completely separate stub, eg:

  #ifdef CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
  static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
  {
          if (current->mm != mm)
                  return;
          if (likely(!(atomic_read(&mm->membarrier_state) &
                       MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE)))
                  return;
          sync_core_before_usermode();
  }
  #else
  static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm) { }
  #endif

Not sure what folks prefer.

In either case I think it's probably worth a short comment explaining
why it's worth the trouble (ie. that the atomic_read() prevents the
compiler from doing DCE).

cheers

