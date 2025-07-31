Return-Path: <linuxppc-dev+bounces-10492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6583B1762A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 20:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btJ1R1yqNz3bm3;
	Fri,  1 Aug 2025 04:45:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753987531;
	cv=none; b=nqtPKMF+ln/QjeADasouZYm4Qj7LrSrMCPcrSZkLMWIDsW/hzTGnqdLaOiBhqrtZ1NWe1GOjHM7XO9iTFz10ClF2+fr9ZzOg7+Vwmg+lWg2libMJ15HaJZzWgrRD5+mz19qQoGV542kGz8W7/BESLZjmw68PkVHIjSuOgAhrFIo5HZHnDqAEAjtsez+GqNPYX5IWpY0H+LTUghW9chJJwc/xO/Wr5pTFPiz9uJVoJxwJFLpv9no9thfxzi79vcbyCCd668yDkVutTuHwaKpr9DfLG+yRqxa7suqlnGKe/fdFzKaEXkgUCBDNJx4RgXMw0mZLHzP9ixjjeAhXjhiTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753987531; c=relaxed/relaxed;
	bh=PJeyEpTILqOg780uBAW/1Q6eRMKdUSQqGOp04S222AQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=BAKgy3LFLgshEzjtyDOTc4kTTndGBYpKczwRxuqzv7v4zE/ao5m/w3JnQ2R7YFOG7wHmfnA0toVxUHERdjuRmifvVOx7SQmG8YyBZP2a6P4a+keAUvC/pHE0jjr7xD06R7mqwY5d874gPpYCIhyYhFTcIJDsj448hFethX8dRePFKnUG5/ZYCZf2mKEjh1jsZcej6idKlw31rQn6YGRAirEUKO5gncgN5vzuwxRR4vIhph2NDcvylAmgT5ZQJGWYazcFpRgtH4PxrQtX/keSMP8ceNcDjWolUHh5dNIMS0oSD6EdNAfKob0A/eEPZSEFmZtug14oVS8dejHY031MXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HvZcnE6a; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HvZcnE6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btJ1P3RJQz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 04:45:28 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b3220c39cffso94251a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 11:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753987523; x=1754592323; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJeyEpTILqOg780uBAW/1Q6eRMKdUSQqGOp04S222AQ=;
        b=HvZcnE6anKc20MZ/W0fSqrf3vj+0aiPDqkZey86pfRB9eTZPQ+xwJSPnUXMusrHdAw
         Xn3qRdM4f8z+G2uYgqnXBYa8zdcZL3nnjmQQdsjJ5hLJAdkcK4ZvsUmRkCRuv2gvEaZy
         8dCvFP410NgqNdtMLCkctqzcIaqoh0oztFs6GefM76wh+PpZaw2WtVQmFLA10X6yeHGR
         m3ov7HgidisS1nfivd1ZtObgZpbLG9X2vHkYsp2cUSBt+hb+EozYw56ZsGC79dguyMiV
         WPuKhq4tNOJj6WtVOczXYRI+UAyBVqwseE4jZ6h+KkffqQ7fk2F1mXHpqW7PNgdkyc75
         JJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753987523; x=1754592323;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJeyEpTILqOg780uBAW/1Q6eRMKdUSQqGOp04S222AQ=;
        b=V7fF7Gu7l3i3gdSZ9cRXsSNpA5071NQuIqcySy3FfrYv4YL2WUzInTEOGm+4UMTPss
         rKCnRQns5XMmku+UcB9CfJj8dvKX1EGHKF2yf31IIyCFu4yYTwhaoTe0/e+ce9Y8GBtt
         4+cu1iNnFS85tFFFd5hzx6AdGg6y9hOmFEUGRcNj7tbqjW6UJCxyWLzU+tFDT1dT9xqL
         JrdE2RBbUg83c71Tqqf/zGvfaMDFJmXmPW+9FinXlPtuwn5p1ulKmbb+AbxMZ7EuKVec
         GvSMpHLgdBGa5PHsRC3LAaofpdsAEA8F7B1YnfSITTRMj+ub/M/XkjukI9p+a0vZHlZM
         a6iA==
X-Forwarded-Encrypted: i=1; AJvYcCXrEmwvfrihc1eugtukfgquSxHjm0OPPVv6XuktaTvP1ZiclXKw9l5ed7i6FKYvwfoRipBU6v/ukyJ0kE8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybvHwqkMcDtIaT8zt+4CYB+zmEQ9VDf45+8XRoz3FFUDEbqZ2I
	+Gl4BsfqRN698y0vxI4syw/Xi4WoRzmDS973HmzfvUXJT9x+L374wDMobMy+rA==
X-Gm-Gg: ASbGncvQ/zYe8jljJ3MUBsXgxAhalHSUL0/kYG1lHN5uldajnFJjvkiNVTTfXzb3dd4
	xd9HPM/jhqkjZPVwF7iZGxALD9CSFAAb1i/tfH7wkhHVWrgfEYhaFENqDgbypMSzBGdnbA13nTt
	feS0UEoqTK//3Bx49ZRPi/GvSECxwia6QU48zis1EE+pnDLhVFS4KeuRCXRLbzdRBL+Bpqgvmge
	nYRXE6sn8jN38JB0us40MHpF/+0/mFSyM9VajqfRz9uiig65nDxqUn6acVaAvl/gIkPyMHkSPlp
	n0+s3oLC3o0z3pr7+YZ59fqDDFExvftRWEuZr/84qUJ4IFO0/DcmYrCDcqboWgXV0SaQ4uj3305
	N/WuiqMU7JjG2kh8=
X-Google-Smtp-Source: AGHT+IGIKXi870n++oqGLeS8pVvIqOPLThRSJdGG8l23A2iY/Sca4F/BW6iTpJ39GXAVOT3CjLDwRQ==
X-Received: by 2002:a17:90b:3d06:b0:31f:1db2:69b1 with SMTP id 98e67ed59e1d1-31f5de96c7cmr13967732a91.18.1753987523009;
        Thu, 31 Jul 2025 11:45:23 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da57b4sm5427406a91.5.2025.07.31.11.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 11:45:22 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Vishal Chourasia <vishalc@linux.ibm.com>, Donet Tom <donettom@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Switch MMU context on hash MMU if SLB preload cache is aged
In-Reply-To: <20250731161027.966196-1-donettom@linux.ibm.com>
Date: Thu, 31 Jul 2025 23:40:07 +0530
Message-ID: <87y0s4qlj4.fsf@gmail.com>
References: <20250731161027.966196-1-donettom@linux.ibm.com>
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
> Currently, the kernel skips the MMU context switch in switch_mm_irqs_off()
> if the prev and next mm_struct are the same, as an optimization. However,
> this behavior can lead to problems on hash MMU systems.
>

Let's also add detailed flow of events, as this was not really an easy
problem to catch. 

CPU 0                                   CPU 1

Process P
exec                                    swapper/1
 load_elf_binary
  begin_new_exc
    activate_mm
     switch_mm_irqs_off 
      switch_mmu_context
       switch_slb
       /* 
        * This invalidates all the
        * entries in the HW and setup 
        * the new HW SLB entries as per 
        * the preload cache.
        */
switch_switch
sched_migrate_task migrates process P to cpu-1

Process swapper/0                       context switch (to process P)
(uses mm_struct of Process P)           switch_mm_irqs_off()
                                         switch_slb
                                           load_slb++
                                            /*
                                            * load_slb becomes 0 here
                                            * and we evict an entry from
                                            * the preload cache with
                                            * preload_age(). We still
                                            * keep HW SLB and preload
                                            * cache in sync, that is
                                            * because all HW SLB entries
                                            * anyways gets evicted in
                                            * switch_slb during SLBIA.
                                            * We then only add those
                                            * entries back in HW SLB,
                                            * which are currently
                                            * present in preload_cache
                                            * (after eviction).
                                            */
                                        load_elf_binary continues...
                                         setup_new_exec()
                                          slb_setup_new_exec()

                                        sched_switch event
                                        sched_migrate_task migrates 
                                        process P to cpu-0

context_switch from swapper/0 to Process P
 switch_mm_irqs_off()
  /*
   * Since both prev and next mm struct are same we don't call
   * switch_mmu_context(). This will cause the HW SLB and SW preload
   * cache to go out of sync in preload_new_slb_context. Because there
   * was an SLB entry which was evicted from both HW and preload cache
   * on cpu-1. Now later in preload_new_slb_context(), when we will try
   * to add the same preload entry again, we will add this to the SW
   * preload cache and then will add it to the HW SLB. Since on cpu-0
   * this entry was never invalidated, hence adding this entry to the HW
   * SLB will cause a SLB multi-hit error.
   */
load_elf_binary continues...
 START_THREAD
  start_thread
   preload_new_slb_context
   /*
    * This tries to add a new EA to preload cache which was earlier
    * evicted from both cpu-1 HW SLB and preload cache. This caused the
    * HW SLB of cpu-0 to go out of sync with the SW preload cache. The
    * reason for this was, that when we context switched back on CPU-0,
    * we should have ideally called switch_mmu_context() which will
    * bring bring the HW SLB entries on CPU-0 in sync with SW preload cache
    * entries by setting up the mmu context properly. But we didn't do
    * that since the prev mm_struct running on cpu-0 was same as the
    * next mm_struct (which is true for swapper / kernel threads). So
    * now when we try to add this new entry into the HW SLB of cpu-0,
    * we hit a SLB multi-hit error.
    */

WARNING: CPU: 0 PID: 1810970 at arch/powerpc/mm/book3s64/slb.c:62 assert_slb_presence+0x2c/0x50(48 results) 02:47:29 [20157/42149]
Modules linked in:
CPU: 0 UID: 0 PID: 1810970 Comm: dd Not tainted 6.16.0-rc3-dirty #12 VOLUNTARY
Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected) 0x4d0200 0xf000004 of:SLOF,HEAD hv:linux,kvm pSeries
NIP:  c00000000015426c LR: c0000000001543b4 CTR: 0000000000000000
REGS: c0000000497c77e0 TRAP: 0700   Not tainted  (6.16.0-rc3-dirty)
MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 28888482  XER: 00000000
CFAR: c0000000001543b0 IRQMASK: 3
<...>
NIP [c00000000015426c] assert_slb_presence+0x2c/0x50
LR [c0000000001543b4] slb_insert_entry+0x124/0x390
Call Trace:
  0x7fffceb5ffff (unreliable)
  preload_new_slb_context+0x100/0x1a0
  start_thread+0x26c/0x420
  load_elf_binary+0x1b04/0x1c40
  bprm_execve+0x358/0x680
  do_execveat_common+0x1f8/0x240
  sys_execve+0x58/0x70
  system_call_exception+0x114/0x300
  system_call_common+0x160/0x2c4


> Consider the following scenario: a process is running on CPU A and gets
> context-switched to CPU B. During this time, one of its SLB preload cache
> entries is evicted. Later, the process is rescheduled on CPU A, which was
> running swapper in the meantime, using the same mm_struct. Because
> prev == next, the kernel skips the MMU context switch. As a result, the
> hardware SLB buffer still contains the entry, but the software preload
> cache does not.
> 
> The absence of the entry in the preload cache causes it to attempt to
> reload the SLB. However, since the entry is already present in the hardware
> SLB, this leads to a SLB multi-hit error.
>

Can we use the detailed commit msg from above instead of above two paragraphs.
It is easier to visualize and document if we have it that way.


> To fix this issue, we add a code change to always switch the MMU context on
> hash MMU if the SLB preload cache has aged. With this change, the
> SLB multi-hit error no longer occurs.
>
> Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")

CC: stable@vger.kernel.org

Otherwise LGTM.

> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/slb.c | 2 +-
>  arch/powerpc/mm/mmu_context.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index 6b783552403c..08daac3f978c 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -509,7 +509,7 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>  	 * SLB preload cache.
>  	 */
>  	tsk->thread.load_slb++;
> -	if (!tsk->thread.load_slb) {
> +	if (tsk->thread.load_slb == U8_MAX) {
>  		unsigned long pc = KSTK_EIP(tsk);
>  
>  		preload_age(ti);
> diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
> index 3e3af29b4523..d7b9ac8c9971 100644
> --- a/arch/powerpc/mm/mmu_context.c
> +++ b/arch/powerpc/mm/mmu_context.c
> @@ -84,7 +84,7 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
>  	switch_mm_pgdir(tsk, next);
>  
>  	/* Nothing else to do if we aren't actually switching */
> -	if (prev == next)
> +	if ((prev == next) && (tsk->thread.load_slb != U8_MAX))
>  		return;
>  
>  	/*
> -- 
> 2.50.1

