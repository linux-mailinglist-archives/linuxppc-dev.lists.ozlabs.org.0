Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00614FF5F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 13:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdggv505Fz3bpL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 21:42:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=TQSr1CZV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kdgg80yWcz2yNH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 21:42:12 +1000 (AEST)
Received: from zn.tnic (p200300ea971b584e329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:971b:584e:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CA6631EC0528;
 Wed, 13 Apr 2022 13:41:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1649850105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=vrSuktU3IKV4kxVHDDfcm/5ZWdX3F9km7GwmFzhrtTE=;
 b=TQSr1CZVZ8mMXafk59pQiMXlPDNISVxulBYYnkygCHk50FgNdmVS6CvXjIsAK4lwsFbyQO
 mutXP1YukfA9PA5l9VeiFlCmiBHVq21vvR0pBa9xDd3E7RuB4xyxFeE6QxCtyHyGlCd04z
 x6FqRMM+dfwsrK6RgqQ54NLuPcd+upk=
Date: Wed, 13 Apr 2022 13:41:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Brian Gerst <brgerst@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] ELF: Remove elf_core_copy_kernel_regs()
Message-ID: <Yla2+ItaT0TuuDND@zn.tnic>
References: <20220325153953.162643-1-brgerst@gmail.com>
 <20220325153953.162643-3-brgerst@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220325153953.162643-3-brgerst@gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ PPC ML as an FYI that this change will come through tip.

On Fri, Mar 25, 2022 at 11:39:51AM -0400, Brian Gerst wrote:
> x86-32 was the last architecture that implemented separate user and
> kernel registers.
> 
> Signed-off-by: Brian Gerst <brgerst@gmail.com>
> ---
>  arch/powerpc/kernel/fadump.c               | 2 +-
>  arch/powerpc/platforms/powernv/opal-core.c | 2 +-
>  include/linux/elfcore.h                    | 9 ---------
>  kernel/kexec_core.c                        | 2 +-
>  4 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4fdb7c77fda1..c0cf17196d6c 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -752,7 +752,7 @@ u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
>  	 * FIXME: How do i get PID? Do I really need it?
>  	 * prstatus.pr_pid = ????
>  	 */
> -	elf_core_copy_kernel_regs(&prstatus.pr_reg, regs);
> +	elf_core_copy_regs(&prstatus.pr_reg, regs);
>  	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
>  			      &prstatus, sizeof(prstatus));
>  	return buf;
> diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
> index 0331f1973f0e..dd6e99edff76 100644
> --- a/arch/powerpc/platforms/powernv/opal-core.c
> +++ b/arch/powerpc/platforms/powernv/opal-core.c
> @@ -112,7 +112,7 @@ static void __init fill_prstatus(struct elf_prstatus *prstatus, int pir,
>  			  struct pt_regs *regs)
>  {
>  	memset(prstatus, 0, sizeof(struct elf_prstatus));
> -	elf_core_copy_kernel_regs(&(prstatus->pr_reg), regs);
> +	elf_core_copy_regs(&(prstatus->pr_reg), regs);
>  
>  	/*
>  	 * Overload PID with PIR value.
> diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
> index f8e206e82476..346a8b56cdc8 100644
> --- a/include/linux/elfcore.h
> +++ b/include/linux/elfcore.h
> @@ -84,15 +84,6 @@ static inline void elf_core_copy_regs(elf_gregset_t *elfregs, struct pt_regs *re
>  #endif
>  }
>  
> -static inline void elf_core_copy_kernel_regs(elf_gregset_t *elfregs, struct pt_regs *regs)
> -{
> -#ifdef ELF_CORE_COPY_KERNEL_REGS
> -	ELF_CORE_COPY_KERNEL_REGS((*elfregs), regs);
> -#else
> -	elf_core_copy_regs(elfregs, regs);
> -#endif
> -}
> -
>  static inline int elf_core_copy_task_regs(struct task_struct *t, elf_gregset_t* elfregs)
>  {
>  #if defined (ELF_CORE_COPY_TASK_REGS)
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index 68480f731192..be4b54c2c615 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -1078,7 +1078,7 @@ void crash_save_cpu(struct pt_regs *regs, int cpu)
>  		return;
>  	memset(&prstatus, 0, sizeof(prstatus));
>  	prstatus.common.pr_pid = current->pid;
> -	elf_core_copy_kernel_regs(&prstatus.pr_reg, regs);
> +	elf_core_copy_regs(&prstatus.pr_reg, regs);
>  	buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
>  			      &prstatus, sizeof(prstatus));
>  	final_note(buf);
> -- 
> 2.35.1
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
