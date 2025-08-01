Return-Path: <linuxppc-dev+bounces-10518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F0B186BC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 19:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bttKb5HjKz3bmc;
	Sat,  2 Aug 2025 03:31:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754069491;
	cv=none; b=BHcjgRe9ou4HSX5qFwUpnJO5jxxjdT73CXG9y/uuHbr1oKrj9j36l4GbR2zaTnNmA8egFuYLbwatsvzsBCfGdSReIYS6YsEWXtfgu74FW5HzRTyaTNfqQgsFXBinK0WuqA7yehrJ3IJyXBnB99GfI/wxu+pU3kojixCCEN3/GVbZfTRpfe2Wq7ywrziTHYeMyd1zVi2HNv568dv728LhOiipnkDj2f6lwfLu7PT9bZDojg2OqLN85XBYfl14eEbGLWrBem5+IoiwJZvxx4Cu0U9BHafQhsSBR2M595AZu/esZUNE2JNaQdQK1H878HGXv4+nOUgQWeqT991ODrXoow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754069491; c=relaxed/relaxed;
	bh=UYkhBI7Ln9fYlOieDEvuny+XS7GVAdJ2Y1G82qbanHk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=WS8TTD2hCnjK5O7hJ40F0Bda2BM2JYxJxrQwdAZmMRIpl78TMkx4qVUNiDlEx18WUUhKZUgEOIzf6LGdp/2wEXQ3tIxfAcqnYrd02GOpzcx8uacDlyKBXQC0vXTzH7a0Ovmtk8GtCnQSnePjWlod2WdlKe1pWE+Ho7uOXRotVdpCYvUIe2H/buLnGuEViJtt2yoohYqdmgRG35pRGZZa+mq+p5lR/yb0//4s78ghru7eUyA8u7MM3HrtIuhYbqPVhsDpzQJhDzRR7Hs7Q/m9IQ5HQwfbUEwQAoJg1cu/8Wo9BzMwi8vplg5rHNb/k9Z0PhAzoL6RDOAuBcECLUc5GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MaSNXZry; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MaSNXZry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bttKZ0X0gz3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 03:31:29 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b4245235a77so307206a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Aug 2025 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754069487; x=1754674287; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYkhBI7Ln9fYlOieDEvuny+XS7GVAdJ2Y1G82qbanHk=;
        b=MaSNXZry/Rcb33rB140YzB09LlJ6e+1/tB4BFb2Gs3wAGTcZtpDd/Ga0EumGkVuPLf
         EzGgX/vH6pEvjWOJ7HqvrAvPea3dqEqzpcdWtQ499P6l7kHQEZ6RbRZKNTriPe0gR4PE
         QwmHCaVaa+mxDf/CJiGuNnbTxLiuFTxUtF6+4cVSzxROPx2fZipgVFuq76/zE6Tf3nG5
         kK7SgY1zt6EMgPZxlPeqJ9Nc397Iy2OB/YicyCmYgihmSTmkhYEhDX71mo+dH14SZp7c
         j9D6agP5B1EAREscg+x4QfbpPSdJKv786K3BIk5yPnKBARWuO5SJbYrZeYVN7U4FpOM8
         bC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754069487; x=1754674287;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UYkhBI7Ln9fYlOieDEvuny+XS7GVAdJ2Y1G82qbanHk=;
        b=RxY+90vNoorw0O8Zy5LXBjISr0KX0S4EuoSQYwFDW2uhZ/P1qBhQGzAeaann8rOE3e
         kcXoeoulgiPjLT3LnskS75SDDTncFyPDKU0Vvx3E6LbB9qUa8JiMhRkAEJZqCIR5ONeo
         qMbESYxAlXDeB6APqX4znjlmJR57i9bBmIkU+wNgK3H4y2XreT5pBpLuNO0zprUUb4tW
         IxZCCWe3J4scsiyO4Ml09IS3J9LoH3w29/pH5/RE3ZLzldLDMdE3z6MhqZRibX1t+u9x
         xGi+u/6bjcu278DmSsTd8abvxCt0c1UGqBnuz8MHG/ysb+y5G/jHCnxbW89SdG5mXDVn
         hItQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdLmUUp3aOboiewdwhCCsZoJ/JxmJVjf+yKWyT+HDmWWOe+Ex5siZdIrlxBlW6B5/bv592//J/QnpNaDw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzuye+0if6/MH7kLCynqDpEgvIEwAhFjo4ijK481l7b+x202SLp
	ldZ1XBdDep+HtjSo26nsO+UII1SpedcXPFZBpwM15r0FCvuetd7u98VP
X-Gm-Gg: ASbGncv9r/x0YfLC1r6Mx0YmItVICTimPoqlA1ybivAuu1CNEbJ9Q9/3Opvi+VitgiZ
	iXjdwWWZE4bAF0pZgKorqT6y7G9H4/3AGh01fr3/SQBvFAqMU1jskgYWwyMrbDuvWaG39PnLaGr
	iKY90KM04l09C0X3hEsKlAQoNZYyYfTh6Tq4ql26cjcCCuKj4y3x2XF2bXXAcFsCi64xfayLd8p
	HuPUanL5OufWFXu4nAktUhCNiahBpP0ZMaY2ZkBVtn0DaerovAQUZ48GvtczEg/YFb/4fSAIrJm
	ZGPbSlb3CKanNjWhOPWgBBOSl5wdCuAHXvz3F1YWxp6bMOt7QikVQmBw6t9pdenuWj0XdIZi3Nc
	/yF2yj8WDmBcNyy4=
X-Google-Smtp-Source: AGHT+IEILVqTRLBBaQ0amWjTizr2ivYHmUAzrruxTd/9XNKSBJp43sLWgmmPtBYWsDPdQ0MV3QAGKg==
X-Received: by 2002:a17:90b:3ecb:b0:31e:c8fc:e62a with SMTP id 98e67ed59e1d1-32116315768mr748254a91.35.1754069486671;
        Fri, 01 Aug 2025 10:31:26 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bacbb74sm4183608a12.42.2025.08.01.10.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:31:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Donet Tom <donettom@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Vishal Chourasia <vishalc@linux.ibm.com>, Donet Tom <donettom@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/mm: Fix SLB multihit issue during SLB preload
In-Reply-To: <20250801103747.21864-1-donettom@linux.ibm.com>
Date: Fri, 01 Aug 2025 22:56:37 +0530
Message-ID: <87qzxvq7g2.fsf@gmail.com>
References: <20250801103747.21864-1-donettom@linux.ibm.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Donet Tom <donettom@linux.ibm.com> writes:

> On systems using the hash MMU, there is a software SLB preload cache that
> mirrors the entries loaded into the hardware SLB buffer. This preload
> cache is subject to periodic eviction — typically after every 256 context
> switches — to remove old entry.
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
> MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 28888482  XER: 00000000
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
> To fix this issue, we add a code change to always switch the MMU context on
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
> v1 - https://lore.kernel.org/all/20250731161027.966196-1-donettom@linux.ibm.com/

Thanks for adding the details in the commit msg. The change looks good
to me. Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

