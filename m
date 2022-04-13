Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCFF4FF6DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 14:32:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdhmw6Rxqz3bpc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 22:32:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pp/1Fcf3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdhmK3L1bz2xy3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 22:31:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pp/1Fcf3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KdhmG0JjTz4xL3;
 Wed, 13 Apr 2022 22:31:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649853102;
 bh=wRogKyz2dq+2vxcQK2B+MiPFOoX9By0Up7rAIWGue2w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pp/1Fcf34yGDY8rdGzZL4ZZC/QtH6XXJsKWW/odPYUVHxakCpYZ3aqicUaaQocYQ6
 XKocItLeJKTZJT3pgLNPHAv87ZsvIkDq1l61o+KCTzCTEzmhwA0wQ2X1BhqAhmuy0d
 v8xpB5WLOY/jDp2LA5W1bC3nCCOGzP31pQzmP9nDrT8r0/fTNhHU4Kt869D8ZJy/mn
 NWp8KgU0ED/nk0aLkN4ETSs7cY+lk5jkUra4DrhFh8vnVlcCYHO4Yk0VGgZ9Fks4Q7
 d3EbbAsnC4bpnm3/6B1ECfIRyMhvti8GlcxLuDCqeuoHP/rLymFKbNjuk+Mk+tMNI0
 KMvU2LeI343YA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] ELF: Remove elf_core_copy_kernel_regs()
In-Reply-To: <Yla2+ItaT0TuuDND@zn.tnic>
References: <20220325153953.162643-1-brgerst@gmail.com>
 <20220325153953.162643-3-brgerst@gmail.com> <Yla2+ItaT0TuuDND@zn.tnic>
Date: Wed, 13 Apr 2022 22:31:41 +1000
Message-ID: <87h76x5fma.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Borislav Petkov <bp@alien8.de> writes:
> + PPC ML as an FYI that this change will come through tip.

Ack.

cheers

> On Fri, Mar 25, 2022 at 11:39:51AM -0400, Brian Gerst wrote:
>> x86-32 was the last architecture that implemented separate user and
>> kernel registers.
>> 
>> Signed-off-by: Brian Gerst <brgerst@gmail.com>
>> ---
>>  arch/powerpc/kernel/fadump.c               | 2 +-
>>  arch/powerpc/platforms/powernv/opal-core.c | 2 +-
>>  include/linux/elfcore.h                    | 9 ---------
>>  kernel/kexec_core.c                        | 2 +-
>>  4 files changed, 3 insertions(+), 12 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 4fdb7c77fda1..c0cf17196d6c 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -752,7 +752,7 @@ u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
>>  	 * FIXME: How do i get PID? Do I really need it?
>>  	 * prstatus.pr_pid = ????
>>  	 */
>> -	elf_core_copy_kernel_regs(&prstatus.pr_reg, regs);
>> +	elf_core_copy_regs(&prstatus.pr_reg, regs);
>>  	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
>>  			      &prstatus, sizeof(prstatus));
>>  	return buf;
>> diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
>> index 0331f1973f0e..dd6e99edff76 100644
>> --- a/arch/powerpc/platforms/powernv/opal-core.c
>> +++ b/arch/powerpc/platforms/powernv/opal-core.c
>> @@ -112,7 +112,7 @@ static void __init fill_prstatus(struct elf_prstatus *prstatus, int pir,
>>  			  struct pt_regs *regs)
>>  {
>>  	memset(prstatus, 0, sizeof(struct elf_prstatus));
>> -	elf_core_copy_kernel_regs(&(prstatus->pr_reg), regs);
>> +	elf_core_copy_regs(&(prstatus->pr_reg), regs);
>>  
>>  	/*
>>  	 * Overload PID with PIR value.
>> diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
>> index f8e206e82476..346a8b56cdc8 100644
>> --- a/include/linux/elfcore.h
>> +++ b/include/linux/elfcore.h
>> @@ -84,15 +84,6 @@ static inline void elf_core_copy_regs(elf_gregset_t *elfregs, struct pt_regs *re
>>  #endif
>>  }
>>  
>> -static inline void elf_core_copy_kernel_regs(elf_gregset_t *elfregs, struct pt_regs *regs)
>> -{
>> -#ifdef ELF_CORE_COPY_KERNEL_REGS
>> -	ELF_CORE_COPY_KERNEL_REGS((*elfregs), regs);
>> -#else
>> -	elf_core_copy_regs(elfregs, regs);
>> -#endif
>> -}
>> -
>>  static inline int elf_core_copy_task_regs(struct task_struct *t, elf_gregset_t* elfregs)
>>  {
>>  #if defined (ELF_CORE_COPY_TASK_REGS)
>> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
>> index 68480f731192..be4b54c2c615 100644
>> --- a/kernel/kexec_core.c
>> +++ b/kernel/kexec_core.c
>> @@ -1078,7 +1078,7 @@ void crash_save_cpu(struct pt_regs *regs, int cpu)
>>  		return;
>>  	memset(&prstatus, 0, sizeof(prstatus));
>>  	prstatus.common.pr_pid = current->pid;
>> -	elf_core_copy_kernel_regs(&prstatus.pr_reg, regs);
>> +	elf_core_copy_regs(&prstatus.pr_reg, regs);
>>  	buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
>>  			      &prstatus, sizeof(prstatus));
>>  	final_note(buf);
>> -- 
>> 2.35.1
>> 
>
> -- 
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
