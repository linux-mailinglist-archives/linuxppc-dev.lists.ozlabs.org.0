Return-Path: <linuxppc-dev+bounces-10570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8FFB1A170
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 14:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwbY76kCWz3069;
	Mon,  4 Aug 2025 22:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754310747;
	cv=none; b=fTYPTWM0e3nhBW2AT8TfTLYPfx5cd10f6SEQivoorhlCYykvwN9ccm/ih9CLukcLyXxLkKTiXESPQp0FCdXx2cZMml342w2RK7K+e7AMS9k1m0Fv0ufWtUeG6C9NNpeOyKYFpl7U0Y/R7hx2q1KAgpw649qSmwF1v4TJNIv/nHL+FZg7ccTzZ/InQgeJwCileWLav/Yo9RodnWkj2Ckv6D2I/oR05StSuLHK4pOCuEpiEKKvS2MqLB1SSn8gaxV3s1sQeYZD9WHCvwaB7GRWBiHNWhKBy2PDz2YquhcROpvLMyWKWTj0H9ZedlSoTm0VaFj0PB1GggaXCs3kaWQ+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754310747; c=relaxed/relaxed;
	bh=sz81oS+khM9qasQTVZz4MiZgKna2JCQJHFNcckb6X6E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Nnlsi/OsdsWDfg6kt2OTDrcORAzooAUFaDtb0bVlKyB7PZ1O+rWNDu56+b03Iei/LetKkAN5iQ4Ysb3IZnTzSgoAAlh+eeq3KCbPLt1hNQVbNMEAdB0WkQEng/Ns1lj0U/PnEA5B1neEkhzIoEc32LI6XApXJUz8/Nm6Q5RbXt86m3UIErKB3AwhPDB3KBVT8UTtBGrG0JGmrnKHzUYfJI3p/T5YUW62TAaHO0VtfYenZi8tV7eFJ1cvJ2McOVAFX3w6guNIcYyHOAUqZh3PH4b2ezRU+STZl2HMHhWLFUUxwEGjAQjsy0CHHJJL6uVITcuOpSNt3JpFAUmAmOA0pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CFW1S9Dm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CFW1S9Dm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwbY6330Tz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 22:32:25 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b424d2eb139so1107035a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754310741; x=1754915541; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz81oS+khM9qasQTVZz4MiZgKna2JCQJHFNcckb6X6E=;
        b=CFW1S9DmRxTU6La/vNUK3+Viy6KtJNVUXg053yAQVC+e4cEAthjUdDNPT1x2OBwyBq
         0B6vgjUl9sp5+5+HhDJ6RW1CnrgLnAcGotJsXx1bnfRHppDDprzAKXR1quVDv2gFdofW
         /oO6gGbO+vPM8l0Xtx/+GehQuR8b7IsgGIMJAhLybptsCsopREr6OMVU8BRfJHtKByhc
         cHXXVntsgl2uUTQH6gDNtY8/sBRo0jJVzOOpBBDyzw8bAZKhG4yvFbzOMsCRNuegxluS
         GCxozYyZkQZtJjMOrC1WmcdQZrdnwDKz2IGhIPYX2KhlFPjP1yap68cTLwg7rfSuxDRc
         XkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310741; x=1754915541;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sz81oS+khM9qasQTVZz4MiZgKna2JCQJHFNcckb6X6E=;
        b=OWJ4GxJ9g7sQnjreU/KaObs8iQwSnT6M9BAk5WwOV/tL5XDZNMfCtYeUL60gdMIkJI
         04D18jPkNxldxdmkVhzzUwkPCsPNyV8WhPfYuliW0X6iPJhrfbE40QySuGa0Y6pMbHW8
         A4SZ8U5wSNzI4L9Wvjani8O3xeXVo8gHFQ3m9W6rg5oIk2ugfiid2/BdyRBzMcIS6W4y
         FoDy+i+IaCl5ZrpM3K8VyN+7sdeiwEQcKulPgdLe226ElQMgq1Sy/vX+EM22yHM7DvF4
         nOk3jP4E3aY145szZb7tlyIGqBGC+aAkLsr9xRB5eqADj7TlRmt4SahohOC6OCd6LDu8
         PwYg==
X-Forwarded-Encrypted: i=1; AJvYcCXwz1DP1H8pvCP/z9jf6FY2Cdib8bjjUwhYsCqlYLZsWB/KYtq3Gt34wOIUuKevV3ZmuhXX8Svj+EC7Ou8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzH1jH2T3XpzmNJc+/uhR8hZ3PAlwP5AbiqK6HdW4efNUlGcaHn
	fQ3BYV/sTKAjY4/sQAoBQn0OQq4NEhma+jHkQBbGZl/5O4is1VOFfBZm
X-Gm-Gg: ASbGncuH/fWNuPx8BIaxpyPNw0xkLbMy+m4/EY/6EAEWhYOAOimllFJnPwCh+qCH488
	23n/LnfwggYrFy+SuT7DZkmVODGj3dnv9OAf+nvBoHodUmeXdYmsI+mpGUaz57M46Hrwe4MrDXK
	asUo7cfakbimwhjO+QD3UQP2ZPKzChsEYMHGduI199/Qcn2IENl1e1oimlUbmDBTrFqHKgVf4j3
	MSlAJSmU7Lsi+SsUZTP7mVEDN4e0Oxbjk4E/hpXBU/SLLItJlwjSqRKqznwZTc7tJYEbNIuxzMo
	dkxFitC17tvaToX4tL8+DIx0DL0+V5U5dcvUbSpI1y+wgkp0SN7nw70vsU/wqXiP1Xxv1n4LoRz
	+xlxkExJUTU/HzTX3zuNzr5/FKbbSkd7HtRZkxArDvcLdh/sJdqH3FQ==
X-Google-Smtp-Source: AGHT+IEe2A8axB/3Y14iPkh2FI0QHWMcwcqvzGaU/WwLKwhmaCDZ0BvYQraBItJoSJLtr0gTXUl2IQ==
X-Received: by 2002:a17:90b:2b84:b0:31f:35f:96a1 with SMTP id 98e67ed59e1d1-32116ad3520mr9953044a91.15.1754310740620;
        Mon, 04 Aug 2025 05:32:20 -0700 (PDT)
Received: from localhost (123.253.189.97.qld.leaptel.network. [123.253.189.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102a5b2cdsm4417443a91.1.2025.08.04.05.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:32:20 -0700 (PDT)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 22:32:11 +1000
Message-Id: <DBTN94725QGF.9OV4JD5UDTHL@gmail.com>
Cc: "Ritesh Harjani" <ritesh.list@gmail.com>,
 <linux-kernel@vger.kernel.org>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Vishal Chourasia" <vishalc@linux.ibm.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc/mm: Fix SLB multihit issue during SLB
 preload
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Donet Tom" <donettom@linux.ibm.com>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.20.0
References: <20250801103747.21864-1-donettom@linux.ibm.com>
In-Reply-To: <20250801103747.21864-1-donettom@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hmm, interesting bug. Impressive work to track it down.

On Fri Aug 1, 2025 at 8:37 PM AEST, Donet Tom wrote:
> On systems using the hash MMU, there is a software SLB preload cache that
> mirrors the entries loaded into the hardware SLB buffer. This preload
> cache is subject to periodic eviction =E2=80=94 typically after every 256=
 context
> switches =E2=80=94 to remove old entry.
>
> To optimize performance, the kernel skips switch_mmu_context() in
> switch_mm_irqs_off() when the prev and next mm_struct are the same.
> However, on hash MMU systems, this can lead to inconsistencies between
> the hardware SLB and the software preload cache.
>
> If an SLB entry for a process is evicted from the software cache on one
> CPU, and the same process later runs on another CPU without executing
> switch_mmu_context(), the hardware SLB may retain stale entries. If the
> kernel then attempts to reload that entry, it can trigger an SLB
> multi-hit error.
>
> The following timeline shows how stale SLB entries are created and can
> cause a multi-hit error when a process moves between CPUs without a
> MMU context switch.
>
> CPU 0                                   CPU 1
> -----                                    -----
> Process P
> exec                                    swapper/1
>  load_elf_binary
>   begin_new_exc
>     activate_mm
>      switch_mm_irqs_off
>       switch_mmu_context
>        switch_slb
>        /*
>         * This invalidates all
>         * the entries in the HW
>         * and setup the new HW
>         * SLB entries as per the
>         * preload cache.
>         */
> context_switch
> sched_migrate_task migrates process P to cpu-1
>
> Process swapper/0                       context switch (to process P)
> (uses mm_struct of Process P)           switch_mm_irqs_off()
>                                          switch_slb
>                                            load_slb++
>                                             /*
>                                             * load_slb becomes 0 here
>                                             * and we evict an entry from
>                                             * the preload cache with
>                                             * preload_age(). We still
>                                             * keep HW SLB and preload
>                                             * cache in sync, that is
>                                             * because all HW SLB entries
>                                             * anyways gets evicted in
>                                             * switch_slb during SLBIA.
>                                             * We then only add those
>                                             * entries back in HW SLB,
>                                             * which are currently
>                                             * present in preload_cache
>                                             * (after eviction).
>                                             */
>                                         load_elf_binary continues...
>                                          setup_new_exec()
>                                           slb_setup_new_exec()
>
>                                         sched_switch event
>                                         sched_migrate_task migrates
>                                         process P to cpu-0
>
> context_switch from swapper/0 to Process P
>  switch_mm_irqs_off()
>   /*
>    * Since both prev and next mm struct are same we don't call
>    * switch_mmu_context(). This will cause the HW SLB and SW preload
>    * cache to go out of sync in preload_new_slb_context. Because there
>    * was an SLB entry which was evicted from both HW and preload cache
>    * on cpu-1. Now later in preload_new_slb_context(), when we will try
>    * to add the same preload entry again, we will add this to the SW
>    * preload cache and then will add it to the HW SLB. Since on cpu-0
>    * this entry was never invalidated, hence adding this entry to the HW
>    * SLB will cause a SLB multi-hit error.
>    */
> load_elf_binary continues...
>  START_THREAD
>   start_thread
>    preload_new_slb_context
>    /*
>     * This tries to add a new EA to preload cache which was earlier
>     * evicted from both cpu-1 HW SLB and preload cache. This caused the
>     * HW SLB of cpu-0 to go out of sync with the SW preload cache. The
>     * reason for this was, that when we context switched back on CPU-0,
>     * we should have ideally called switch_mmu_context() which will
>     * bring the HW SLB entries on CPU-0 in sync with SW preload cache
>     * entries by setting up the mmu context properly. But we didn't do
>     * that since the prev mm_struct running on cpu-0 was same as the
>     * next mm_struct (which is true for swapper / kernel threads). So
>     * now when we try to add this new entry into the HW SLB of cpu-0,
>     * we hit a SLB multi-hit error.
>     */

Okay, so what happens is CPU0 has SLB entries remaining from when
P last ran on there, and the preload aging happens on CPU1 at a
time when that CPU does clear its SLB. That slb aging step doesn't
account for the fact CPU0 SLB entries still exist.
>
> WARNING: CPU: 0 PID: 1810970 at arch/powerpc/mm/book3s64/slb.c:62
> assert_slb_presence+0x2c/0x50(48 results) 02:47:29 [20157/42149]
> Modules linked in:
> CPU: 0 UID: 0 PID: 1810970 Comm: dd Not tainted 6.16.0-rc3-dirty #12
> VOLUNTARY
> Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected)
> 0x4d0200 0xf000004 of:SLOF,HEAD hv:linux,kvm pSeries
> NIP:  c00000000015426c LR: c0000000001543b4 CTR: 0000000000000000
> REGS: c0000000497c77e0 TRAP: 0700   Not tainted  (6.16.0-rc3-dirty)
> MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 28888482  XER:=
 00000000
> CFAR: c0000000001543b0 IRQMASK: 3
> <...>
> NIP [c00000000015426c] assert_slb_presence+0x2c/0x50
> LR [c0000000001543b4] slb_insert_entry+0x124/0x390
> Call Trace:
>   0x7fffceb5ffff (unreliable)
>   preload_new_slb_context+0x100/0x1a0
>   start_thread+0x26c/0x420
>   load_elf_binary+0x1b04/0x1c40
>   bprm_execve+0x358/0x680
>   do_execveat_common+0x1f8/0x240
>   sys_execve+0x58/0x70
>   system_call_exception+0x114/0x300
>   system_call_common+0x160/0x2c4
>
> To fix this issue, we add a code change to always switch the MMU context =
on
> hash MMU if the SLB preload cache has aged. With this change, the
> SLB multi-hit error no longer occurs.
>
> cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> cc: Michael Ellerman <mpe@ellerman.id.au>
> cc: Nicholas Piggin <npiggin@gmail.com>
> Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
> cc: stable@vger.kernel.org
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>
> v1 -> v2 : Changed commit message and added a comment in
> switch_mm_irqs_off()
>
> v1 - https://lore.kernel.org/all/20250731161027.966196-1-donettom@linux.i=
bm.com/
> ---
>  arch/powerpc/mm/book3s64/slb.c | 2 +-
>  arch/powerpc/mm/mmu_context.c  | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/sl=
b.c
> index 6b783552403c..08daac3f978c 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -509,7 +509,7 @@ void switch_slb(struct task_struct *tsk, struct mm_st=
ruct *mm)
>  	 * SLB preload cache.
>  	 */
>  	tsk->thread.load_slb++;
> -	if (!tsk->thread.load_slb) {
> +	if (tsk->thread.load_slb =3D=3D U8_MAX) {
>  		unsigned long pc =3D KSTK_EIP(tsk);
> =20
>  		preload_age(ti);
> diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.=
c
> index 3e3af29b4523..95455d787288 100644
> --- a/arch/powerpc/mm/mmu_context.c
> +++ b/arch/powerpc/mm/mmu_context.c
> @@ -83,8 +83,11 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct=
 mm_struct *next,
>  	/* Some subarchs need to track the PGD elsewhere */
>  	switch_mm_pgdir(tsk, next);
> =20
> -	/* Nothing else to do if we aren't actually switching */
> -	if (prev =3D=3D next)
> +	/*
> +	 * Nothing else to do if we aren't actually switching and
> +	 * the preload slb cache has not aged
> +	 */
> +	if ((prev =3D=3D next) && (tsk->thread.load_slb !=3D U8_MAX))
>  		return;
> =20
>  	/*

I see couple of issues with this fix. First of all, it's a bit wrong to
call switch subsequent switch_mm functions if prev =3D=3D next, they are no=
t
all powerpc specific. We could work around that somehow with some hash
specific knowledge. But worse I think is that load_slb could be
incremented again if we context switched P again before migrating back
here, then we would miss it.

How about removing preload_new_slb_context() and slb_setup_new_exec()
entirely? Then slb preload is a much simpler thing that is only loaded
after the SLB has been cleared. Those functions were always a bit
janky and for performance, context switch is the most improtant I think,
new thread/proc creation less so.

Thanks,
Nick

