Return-Path: <linuxppc-dev+bounces-13786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9254DC34A43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 10:01:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1fSj3RHwz30Qk;
	Wed,  5 Nov 2025 20:01:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762333285;
	cv=none; b=OB2LaCC2hxnioGsxZFC7yJIcW7Cc7sLDvEkWBlWvqRRvWHJ+8Or+uY3yXZKw7qMKJDhaUB3f69LsiKzE3BGpqsKB2mqd74Ne5db9dAFZNPG0Byb/GIC2tLKZL4iFQlAjdBuEQIjJ1x4z3SOYeO9PGrNnHdINGy/JygnEZn2+Qxc+rP+4IAXcQM322kdL7WdCOA03rFaTacr+OdeVC+Mys/nSlA7wIDSv7DnHmdSpNDB9UkRI+6U+DyoiE84qXBxX+tXF7vOrE+mjIXbJgQh4Kunb8tPawh3a9aejpjXagk9RUhyNiehyFVYKF7ZEYCfTjG/m8xXGoXQpUFohh1s1og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762333285; c=relaxed/relaxed;
	bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=CcMdPA9gWF464nm4ZgpH8/lT2Argd4b5fItSXJ+fHgAWDdoiytTZ/TRY/HbtQLu4pI8u4LkwuX6LkEVjg5x5ZREc5ZpiqnELDsZh4Rg+KDkpfcI6Y1KQukSIULknRuTaKtdzl5HNE3PpS6k+vax8KNMpxfgQymyor98LySxFXshQ9xJLdS7/fWX5BIIW8lB+jSauaxKEEJPN9Fr3hyYInlTo44GFkiySTRjPn9qXNQAA8B4rmUWA4LkhKU05OiA3lZpl/GXGV1i4A257Gxy8TUDSxcwfIYliz+iKREVGkd/LSeeN5WNoOGYft1wQh5m68NqefHG+gt2BqZjVLhs+jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XNUnLxvN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XNUnLxvN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1fSh2BPpz2yjp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 20:01:23 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3407f385dd0so4241101a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 01:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762333277; x=1762938077; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=;
        b=XNUnLxvNu9cYkx8CqAQjZm3e04j0HJzlUC+V6ykt+4N6Ahw7NSIolxU0FUcgfGXZHF
         L1/Rn6FJmYOrb5R3OQ1qVfRVTPp7tGTUMrC6olI2HQedFDIssiXLqEjka3k0ZctDwIRS
         ku7AyiGsIiNwgG+HLJIoKMRhexJqvu8NSkkFxAwSn77EX2APn9RhkCv7eEKoiupCsTIm
         hW69/JEAHl/ZhnGdbVKf4nmKijHl0RaA+SwnfIi5VuvI4u4jy+VWuHCkNoboVqIeF2b/
         u/hquZUOzXDrYnwbqBHinArLNgFTSIe+72XY1ONLBUZDNVf43Tx3UgRO+l0HSTbUUyat
         XVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762333277; x=1762938077;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=;
        b=FoGknfGlcXXnVa6wlowV6ClgxZu+yFoa+FMl1z4WKvf2stB7m7emy0PJna1b7e/8F+
         z7JaVJVSpiHosFuUA6esXsh0LO7UxylgrhSHlniAmp7jE0cIZAtcJA5IVAI1hRUcu8nu
         XlptuTpnIfMhsvw2RLapulesYG5ZDtx8FoeGKXE16omO3/+Ge10XMaj00fPiFY2m/U49
         GvhJvboZqwMoYx2jmJZ24FlcocNBCzqmt/n1S7HDzYV9gDphEvjrxY6qE7GtPh7OtVzb
         M0ce1p8eE6fYT1n4SdSfhsPRe8sMobXyBIfwfAZNjTTzvI0XYzL3DAOC2h3rdjNlzfRf
         v/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHcoEFZ998zNXPUwNjmFdD3uHL91Srf0zpXv4Ofu7Aw0rN7+sJ/1ozryOJW0BA8Rv/Mythf1fbZ79aavk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzU6b6KHg2JcyjtNFSARqLI6LvlrKCYflkYs0amF0UDCJl2ctky
	RnucKSDUAkhcP4cbZ9Z+HNwjK0BB86/f1BrNJdkeobib4FsFHkzWZzxz
X-Gm-Gg: ASbGncu1BdNuKDZ2TtpMS986JaaRA2nAWD5+88IL7F0w6IzpwTtFFP8yA6dqbI9hNOt
	Dt3rGonEUGYAq6pnypdEP4owi9TV9wz33P7W31QFOksAsAnY9HCG9aS3SKJ7UufMMSHeMMXdWmF
	eMrrq1fJ26pIO82NZ6WZTv9H+pyNDIYzvsENHaMTp2zDUgDoZZnYmXiwyau5vSsA8d5FdMO+ro9
	S5LB1kWM4NlcpZDD/+oE4Qmcw8UzyINTz+G4Q6EdVfAMss9mG8VWp0OP1A+x6aG6x/GLpzGX1o0
	iUK1p//+yCyr/TZjkiEvyzOSxAXkFBoVSv89j/FYM/y6KYeq3v51t2iUc9kU9c9BoP1YBXyFvwv
	y1LIqKiigVqobB/NoSmCWn8Hfbi7HrSROOlJxb7wvRigeWvTRoWhZj4B87SAEu1sRrzhO+9JQu7
	t8pOIM
X-Google-Smtp-Source: AGHT+IHHv+LyuTSVYYYzkbgRnz7hULJzgzWM0oNnTXqbUlny/y0AGDg1tLVk5Pgi5QjOwQ4eknTvSQ==
X-Received: by 2002:a17:90b:51c8:b0:340:f05a:3ed1 with SMTP id 98e67ed59e1d1-341a6dc8735mr2732523a91.21.1762333276313;
        Wed, 05 Nov 2025 01:01:16 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68c822dsm2153637a91.8.2025.11.05.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:01:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <20251029100909.3381140-8-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 14:19:03 +0530
Message-ID: <87ms5050g0.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner call to leave() disables the batching optimisation before
> the outer section ends.
>
> This patch actually enables lazy_mmu sections to nest by tracking
> the nesting level in task_struct, in a similar fashion to e.g.
> pagefault_{enable,disable}(). This is fully handled by the generic
> lazy_mmu helpers that were recently introduced.
>
> lazy_mmu sections were not initially intended to nest, so we need to
> clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
> This patch takes the following approach:
>
> * The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
>   calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.
>
> * Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
>   to the arch via arch_{enter,leave} - lazy MMU remains enabled so
>   the assumption is that these callbacks are not relevant. However,
>   existing code may rely on a call to disable() to flush any batched
>   state, regardless of nesting. arch_flush_lazy_mmu_mode() is
>   therefore called in that situation.
>
> A separate interface was recently introduced to temporarily pause
> the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
> exits the mode *regardless of the nesting level*, and resume()
> restores the mode at the same nesting level.
>
> Whether the mode is actually enabled or not at any point is tracked
> by a separate "active" field in task_struct; this makes it possible
> to check invariants in the generic API, and to expose a new
> in_lazy_mmu_mode() helper to replace the various ways arch's
> currently track whether the mode is enabled (this will be done in
> later patches).
>
> In summary (nesting/active represent the values *after* the call):
>
> lazy_mmu_mode_enable()		-> arch_enter()	    nesting=3D1 active=3D1
>     lazy_mmu_mode_enable()	-> =C3=B8		    nesting=3D2 active=3D1
> 	lazy_mmu_mode_pause()	-> arch_leave()     nesting=3D2 active=3D0
> 	lazy_mmu_mode_resume()	-> arch_enter()     nesting=3D2 active=3D1
>     lazy_mmu_mode_disable()	-> arch_flush()     nesting=3D1 active=3D1
> lazy_mmu_mode_disable()		-> arch_leave()     nesting=3D0 active=3D0
>
> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
> headers included by <linux/pgtable.h> to use it.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 12 ------
>  include/linux/mm_types_task.h    |  5 +++
>  include/linux/pgtable.h          | 67 ++++++++++++++++++++++++++++++--
>  include/linux/sched.h            | 16 ++++++++
>  4 files changed, 84 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 54f8d6bb6f22..535435248923 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -82,18 +82,6 @@ static inline void queue_pte_barriers(void)
>=20=20
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
> -	/*
> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
> -	 * permissions on the linear map with apply_to_page_range(), which
> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
> -	 * flush and clear the flag such that the remainder of the work in the
> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
> -	 * keeps tracking simple.
> -	 */
> -
>  	if (in_interrupt())
>  		return;
>=20=20
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index a82aa80c0ba4..632d404f8191 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>  #endif
>  };
>=20=20
> +struct lazy_mmu_state {
> +	u8 nesting_level;
> +	bool active;
> +};
> +
>  #endif /* _LINUX_MM_TYPES_TASK_H */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b5fdf32c437f..e6064e00b22d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -228,27 +228,86 @@ static inline int pmd_dirty(pmd_t pmd)
>   * of the lazy mode. So the implementation must assume preemption may be=
 enabled
>   * and cpu migration is possible; it must take steps to be robust agains=
t this.
>   * (In practice, for user PTE updates, the appropriate page table lock(s=
) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not pe=
rmitted
> - * and the mode cannot be used in interrupt context.
> + * held, but for kernel PTE updates, no lock is held). The mode cannot b=
e used
> + * in interrupt context.
> + *
> + * The lazy MMU mode is enabled for a given block of code using:
> + *
> + *   lazy_mmu_mode_enable();
> + *   <code>
> + *   lazy_mmu_mode_disable();
> + *
> + * Nesting is permitted: <code> may itself use an enable()/disable() pai=
r.
> + * A nested call to enable() has no functional effect; however disable()=
 causes
> + * any batched architectural state to be flushed regardless of nesting. =
After a
> + * call to disable(), the caller can therefore rely on all previous page=
 table
> + * modifications to have taken effect, but the lazy MMU mode may still be
> + * enabled.
> + *
> + * In certain cases, it may be desirable to temporarily pause the lazy M=
MU mode.
> + * This can be done using:
> + *
> + *   lazy_mmu_mode_pause();
> + *   <code>
> + *   lazy_mmu_mode_resume();
> + *
> + * This sequence must only be used if the lazy MMU mode is already enabl=
ed.
> + * pause() ensures that the mode is exited regardless of the nesting lev=
el;
> + * resume() re-enters the mode at the same nesting level. <code> must no=
t modify
> + * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
> + * helpers).
> + *
> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> + * currently enabled.
>   */
>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  static inline void lazy_mmu_mode_enable(void)
>  {
> -	arch_enter_lazy_mmu_mode();
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D U8_MAX);
> +	/* enable() must not be called while paused */
> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
> +
> +	if (state->nesting_level++ =3D=3D 0) {
> +		state->active =3D true;
> +		arch_enter_lazy_mmu_mode();
> +	}
>  }

Some architectures disables preemption in their
arch_enter_lazy_mmu_mode(). So shouldn't the state->active =3D true should
happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.

  static inline void lazy_mmu_mode_enable(void)
  {
 -	arch_enter_lazy_mmu_mode();
 +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
 +
 +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D U8_MAX);
 +	/* enable() must not be called while paused */
 +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
 +
 +	if (state->nesting_level++ =3D=3D 0) {
 +		arch_enter_lazy_mmu_mode();
 +		state->active =3D true;
 +	}
  }

... I think it make more sense to enable the state after the arch_**
call right.

>=20=20
>  static inline void lazy_mmu_mode_disable(void)
>  {
> -	arch_leave_lazy_mmu_mode();
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D 0);
> +	VM_WARN_ON(!state->active);
> +
> +	if (--state->nesting_level =3D=3D 0) {
> +		state->active =3D false;
> +		arch_leave_lazy_mmu_mode();
> +	} else {
> +		/* Exiting a nested section */
> +		arch_flush_lazy_mmu_mode();
> +	}
>  }

This looks ok though.

>=20=20
>  static inline void lazy_mmu_mode_pause(void)
>  {
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level =3D=3D 0 || !state->active);
> +
> +	state->active =3D false;
>  	arch_leave_lazy_mmu_mode();
>  }
>=20=20
>  static inline void lazy_mmu_mode_resume(void)
>  {
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level =3D=3D 0 || state->active);
> +
> +	state->active =3D true;
>  	arch_enter_lazy_mmu_mode();
>  }

Ditto.

-ritesh


>  #else
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index cbb7340c5866..11566d973f42 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1441,6 +1441,10 @@ struct task_struct {
>=20=20
>  	struct page_frag		task_frag;
>=20=20
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +	struct lazy_mmu_state		lazy_mmu_state;
> +#endif
> +
>  #ifdef CONFIG_TASK_DELAY_ACCT
>  	struct task_delay_info		*delays;
>  #endif
> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_=
struct *tsk)
>  	return task_index_to_char(task_state_index(tsk));
>  }
>=20=20
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return current->lazy_mmu_state.active;
> +}
> +#else
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  extern struct pid *cad_pid;
>=20=20
>  /*
> --=20
> 2.47.0

