Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEED32CE869
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 08:08:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnP1M2J2tzDrRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 18:08:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AhugiSj4; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnNzn5b0BzDrDJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 18:06:42 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id b26so3082632pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 23:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=dwVSxo/1M8Xnxof7fMzvWiOBGddp/mlVm0/8qxQR6mk=;
 b=AhugiSj4YJkXajtvEzfvX3moDLw+5SLDF+ycyp2F6eeUGPNWtZ0JsFXZd/X+JHC/Gj
 ZucGXjwL4NWbZq8nulSLC3Gc12igAVspRrM1Je4YFt1KwMiaVyzUN+fQ+oTUM9heWFxs
 5uKrnkb2kUa/5Zc2MvQI9wapHq8dS+XClP4zsUK2cwjkdJfGLrbQkOkXLAFTbdoEC2Cc
 lR3G+gHvamcmMgPMPRd/OsOhv3X+IfOnxUbqFB0emsSjKA8HQx9iEudOkEMMWNL39sHb
 EjuGWwpFLjImyDhBtxSCB6qycdrit+l3HsPQ0Wd+hoK1D1bXv6kFhiMUdZXXhyYCBypH
 LgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dwVSxo/1M8Xnxof7fMzvWiOBGddp/mlVm0/8qxQR6mk=;
 b=oDlktKRl8wvaQ9hk3rDwKXuSxrK48TTwCdIDJP+1nTgX4PLslQLx34d/5gZXfsAxQz
 AD9cadKREmz0Ti34hCg4QFfO9owSKITkWYNnWAmOc7iqAG4JjGoKdhbXapMl+GYZ8JI4
 qIH+3n4MlbUPQMvi7YxHQqJEQdA8qkYom3+ZHhXW3n87nu69HHLi1JjBWUMzkCc0sitF
 UNyJcRCE6ptn90YJPMk840hwGI1lkWbPdqB5OIJXZErpyJHMBOzF/mvL1QYxwvgNInOV
 Zv8iUsgDRhu6DOHCmRL4lSuONosNok23DDatFD6P5zVx0XyEKze5sY5x1OSoyfBirWVL
 b6Fg==
X-Gm-Message-State: AOAM530VgtOxTKXMqnbW0QrCOyjkpwAarAalPhGmz1GEJcvn0aJEA0Zd
 dXXNEk6pj3VSTkMwPDRYm08=
X-Google-Smtp-Source: ABdhPJwg8+UkY63KZldOOJwcvxUsaRy0zBOIGCCPjMwwIJi9lyXUsbx8/+G9pNWlaAjZwFOxEMvGNg==
X-Received: by 2002:a62:ea09:0:b029:198:3d34:989 with SMTP id
 t9-20020a62ea090000b02901983d340989mr2681973pfh.42.1607065598913; 
 Thu, 03 Dec 2020 23:06:38 -0800 (PST)
Received: from localhost ([1.129.136.33])
 by smtp.gmail.com with ESMTPSA id b13sm3676126pfo.15.2020.12.03.23.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 23:06:38 -0800 (PST)
Date: Fri, 04 Dec 2020 17:06:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC v2 1/2] [NEEDS HELP] x86/mm: Handle unlazying membarrier
 core sync in the arch code
To: Andy Lutomirski <luto@kernel.org>
References: <cover.1607059162.git.luto@kernel.org>
 <203d39d11562575fd8bd6a094d97a3a332d8b265.1607059162.git.luto@kernel.org>
In-Reply-To: <203d39d11562575fd8bd6a094d97a3a332d8b265.1607059162.git.luto@kernel.org>
MIME-Version: 1.0
Message-Id: <1607064851.hub15e677x.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>,
 X86 ML <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Rik van Riel <riel@surriel.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of December 4, 2020 3:26 pm:
> The core scheduler isn't a great place for
> membarrier_mm_sync_core_before_usermode() -- the core scheduler doesn't
> actually know whether we are lazy.  With the old code, if a CPU is
> running a membarrier-registered task, goes idle, gets unlazied via a TLB
> shootdown IPI, and switches back to the membarrier-registered task, it
> will do an unnecessary core sync.
>=20
> Conveniently, x86 is the only architecture that does anything in this
> hook, so we can just move the code.

This should go on top of my series that adds the exit_lazy_mm call
and switches x86 over, at least.

> XXX: there are some comments in swich_mm_irqs_off() that seem to be
> trying to document what barriers are expected, and it's not clear to me
> that these barriers are actually present in all paths through the
> code.  So I think this change makes the code more comprehensible and
> has no effect on the code's correctness, but I'm not at all convinced
> that the code is correct.
>=20
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  arch/x86/mm/tlb.c   | 17 ++++++++++++++++-
>  kernel/sched/core.c | 14 +++++++-------
>  2 files changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 3338a1feccf9..23df035b80e8 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -8,6 +8,7 @@
>  #include <linux/export.h>
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
> +#include <linux/sched/mm.h>
> =20
>  #include <asm/tlbflush.h>
>  #include <asm/mmu_context.h>
> @@ -496,6 +497,8 @@ void switch_mm_irqs_off(struct mm_struct *prev, struc=
t mm_struct *next,
>  		 * from one thread in a process to another thread in the same
>  		 * process. No TLB flush required.
>  		 */
> +
> +		// XXX: why is this okay wrt membarrier?
>  		if (!was_lazy)
>  			return;
> =20
> @@ -508,12 +511,24 @@ void switch_mm_irqs_off(struct mm_struct *prev, str=
uct mm_struct *next,
>  		smp_mb();
>  		next_tlb_gen =3D atomic64_read(&next->context.tlb_gen);
>  		if (this_cpu_read(cpu_tlbstate.ctxs[prev_asid].tlb_gen) =3D=3D
> -				next_tlb_gen)
> +		    next_tlb_gen) {
> +			/*
> +			 * We're reactivating an mm, and membarrier might
> +			 * need to serialize.  Tell membarrier.
> +			 */
> +
> +			// XXX: I can't understand the logic in
> +			// membarrier_mm_sync_core_before_usermode().  What's
> +			// the mm check for?

Writing CR3 is serializing, apparently. Another x86ism that gets=20
commented and moved into arch/x86 with my patch.


> +			membarrier_mm_sync_core_before_usermode(next);
>  			return;
> +		}
> =20
>  		/*
>  		 * TLB contents went out of date while we were in lazy
>  		 * mode. Fall through to the TLB switching code below.
> +		 * No need for an explicit membarrier invocation -- the CR3
> +		 * write will serialize.
>  		 */
>  		new_asid =3D prev_asid;
>  		need_flush =3D true;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2d95dc3f4644..6c4b76147166 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3619,22 +3619,22 @@ static struct rq *finish_task_switch(struct task_=
struct *prev)
>  	kcov_finish_switch(current);
> =20
>  	fire_sched_in_preempt_notifiers(current);
> +
>  	/*
>  	 * When switching through a kernel thread, the loop in
>  	 * membarrier_{private,global}_expedited() may have observed that
>  	 * kernel thread and not issued an IPI. It is therefore possible to
>  	 * schedule between user->kernel->user threads without passing though
>  	 * switch_mm(). Membarrier requires a barrier after storing to
> -	 * rq->curr, before returning to userspace, so provide them here:
> +	 * rq->curr, before returning to userspace, and mmdrop() provides
> +	 * this barrier.
>  	 *
> -	 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
> -	 *   provided by mmdrop(),
> -	 * - a sync_core for SYNC_CORE.
> +	 * XXX: I don't think mmdrop() actually does this.  There's no
> +	 * smp_mb__before/after_atomic() in there.

mmdrop definitely does provide a full barrier.

>  	 */
> -	if (mm) {
> -		membarrier_mm_sync_core_before_usermode(mm);
> +	if (mm)
>  		mmdrop(mm);
> -	}
> +
>  	if (unlikely(prev_state =3D=3D TASK_DEAD)) {
>  		if (prev->sched_class->task_dead)
>  			prev->sched_class->task_dead(prev);
> --=20
> 2.28.0
>=20
>=20
