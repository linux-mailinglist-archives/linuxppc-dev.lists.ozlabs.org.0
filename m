Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14C6ACF1E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:26:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVqqF1b1fz3f6W
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 07:26:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mm4oC6jA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mm4oC6jA;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVqpG2PMrz3cDM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 07:25:41 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id k199so9484978ybf.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 12:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678134337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hF7wS3Hx/Pvpcugsib0JQfyCay4rq+Y4wSQiQgHE58Q=;
        b=mm4oC6jA+okjPImEMJZmmO6uLRhBRnDeHNzV1d8O1Qh5/hafaokl8mjkr8c79UlkBN
         k4drUKORz+wffyx+9YyisfP5mpJImJQsPDv41zOqZG7QkOgo9ri/A5/XDvukiwTsY1A2
         KtUQMjA/qFFeEpXLtJpt5gUH2u4dfLnbgQu/CtMDzJH1c3fz5MOdwhGAc24HiP++snNm
         r1Te6JP4fRv/ob/XR9eV/TIsK4dBpU+dkv3Z52FWkIPRC2czaKV51YKxz4dhn0C6znLk
         9MFCBlOUUHEl5/EKZvJ0XYjeKqLAQIDKZ8xVkWg4Cqj6qtXlNAIezz8HeYtOxpAaL4c1
         0yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678134337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hF7wS3Hx/Pvpcugsib0JQfyCay4rq+Y4wSQiQgHE58Q=;
        b=Uu9TZk4DDU1od5NoNTePFPGT9Gj49gq42lffn9AE0ZVUejB+aCa86glG33KogGJrlr
         JdmhmVJ4yJ5e1I6AEE0dk49vz6wiGng7OAyC8/eLq4PseGPRXUQQtQmhACGo9sgLqd5O
         U0Qkeau49zjSyms1Xpzp6yKyc+MsEBVbMwgd6sg9KhNYXf6MevEO3YSQ72E8NByE0q2M
         Oa+PvmcEuef2x5g2MMXVqCp3MvPkHIeguDll0Jd8dN8r4fOLCnLt88+XCLfy0fa4TzZg
         xpCyszBVPrTTEb41B4sj+ejpUZVhndhKFlKP6S5Zc8+kpvr3p7Gf9hRYzMNBYHC2Rmog
         Zhww==
X-Gm-Message-State: AO0yUKUnw2wNBu1Tm4gI5EnBGZbfY0m4fdaJw+Wcfjt65b18StcbZQk+
	v5HxCrFXg9HeLpO1UNZxZuPCOo0a2mVF+/AzCiyqZg==
X-Google-Smtp-Source: AK7set8n4u10VCWBPTL7wngRuwzFB4EZKZN4IetFL6kNRt6cIBeVlYompKXHsIJ4rDipkAKfK7DTOCV1YSGWRZnP/FI=
X-Received: by 2002:a5b:e92:0:b0:ab8:1ed9:cfc9 with SMTP id
 z18-20020a5b0e92000000b00ab81ed9cfc9mr7085896ybr.6.1678134337360; Mon, 06 Mar
 2023 12:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com> <20230227173632.3292573-32-surenb@google.com>
In-Reply-To: <20230227173632.3292573-32-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 6 Mar 2023 12:25:26 -0800
Message-ID: <CAJuCfpECk6U_PEz7LkAEXyrkwJ+Uug_7i13mcg5fJnsDWZEg5A@mail.gmail.com>
Subject: Re: [PATCH v4 31/33] powerc/mm: try VMA lock-based page fault
 handling first
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com
 , mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 27, 2023 at 9:37 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> From: Laurent Dufour <ldufour@linux.ibm.com>
>
> Attempt VMA lock-based page fault handling first, and fall back to the
> existing mmap_lock-based handling if that fails.
> Copied from "x86/mm: try VMA lock-based page fault handling first"

Hi Andrew,
Laurent posted a fix for this patch at
https://lore.kernel.org/all/20230306154244.17560-1-ldufour@linux.ibm.com/.
Could you please squash the fix into this patch?
Thanks,
Suren.

>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  arch/powerpc/mm/fault.c                | 41 ++++++++++++++++++++++++++
>  arch/powerpc/platforms/powernv/Kconfig |  1 +
>  arch/powerpc/platforms/pseries/Kconfig |  1 +
>  3 files changed, 43 insertions(+)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 2bef19cc1b98..c7ae86b04b8a 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -469,6 +469,44 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>         if (is_exec)
>                 flags |= FAULT_FLAG_INSTRUCTION;
>
> +#ifdef CONFIG_PER_VMA_LOCK
> +       if (!(flags & FAULT_FLAG_USER))
> +               goto lock_mmap;
> +
> +       vma = lock_vma_under_rcu(mm, address);
> +       if (!vma)
> +               goto lock_mmap;
> +
> +       if (unlikely(access_pkey_error(is_write, is_exec,
> +                                      (error_code & DSISR_KEYFAULT), vma))) {
> +               int rc = bad_access_pkey(regs, address, vma);
> +
> +               vma_end_read(vma);
> +               return rc;
> +       }
> +
> +       if (unlikely(access_error(is_write, is_exec, vma))) {
> +               int rc = bad_access(regs, address);
> +
> +               vma_end_read(vma);
> +               return rc;
> +       }
> +
> +       fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
> +       vma_end_read(vma);
> +
> +       if (!(fault & VM_FAULT_RETRY)) {
> +               count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +               goto done;
> +       }
> +       count_vm_vma_lock_event(VMA_LOCK_RETRY);
> +
> +       if (fault_signal_pending(fault, regs))
> +               return user_mode(regs) ? 0 : SIGBUS;
> +
> +lock_mmap:
> +#endif /* CONFIG_PER_VMA_LOCK */
> +
>         /* When running in the kernel we expect faults to occur only to
>          * addresses in user space.  All other faults represent errors in the
>          * kernel and should generate an OOPS.  Unfortunately, in the case of an
> @@ -545,6 +583,9 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>
>         mmap_read_unlock(current->mm);
>
> +#ifdef CONFIG_PER_VMA_LOCK
> +done:
> +#endif
>         if (unlikely(fault & VM_FAULT_ERROR))
>                 return mm_fault_error(regs, address, fault);
>
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index ae248a161b43..70a46acc70d6 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -16,6 +16,7 @@ config PPC_POWERNV
>         select PPC_DOORBELL
>         select MMU_NOTIFIER
>         select FORCE_SMP
> +       select ARCH_SUPPORTS_PER_VMA_LOCK
>         default y
>
>  config OPAL_PRD
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index b481c5c8bae1..9c205fe0e619 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -21,6 +21,7 @@ config PPC_PSERIES
>         select HOTPLUG_CPU
>         select FORCE_SMP
>         select SWIOTLB
> +       select ARCH_SUPPORTS_PER_VMA_LOCK
>         default y
>
>  config PARAVIRT
> --
> 2.39.2.722.g9855ee24e9-goog
>
