Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B79E5B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:32:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HlYn2wMszDqjV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S4YqL4df"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HlX155DMzDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:30:56 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id i30so13839661pfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=COCdOeUTsal14HhM7PbGDO4aVfMBc7iX/4E7kaFgmNU=;
 b=S4YqL4df8TUV/BxPBBGIEyylumLvWAkFrDiXkq5qnxD49tW4HmztvjXX92qi1K81jp
 rNaeRexbpjb1a5HWTfY87cjrhI/aIF/OewX407t3QQmQ+BpljNp2i0h/tC8bJ5zMwyNe
 0iJutBahSEdG9yBmg1AVVRc6Z/abJMRnEK8MBUog/rGW4jkTJDT+ct5Iy64LTHgOQQrF
 5eH/4smcP7DnnqQLrY7hIRa+xBTfGfViRyHT+3zT+xgI3B0IhHQcPdhfclPhrol+lHUO
 RI377dMgWzVmc/xvddKkFgmOaVkbk7dklNhltapfnYbNnadga73OmDPkVCjJtPc184Ms
 b3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=COCdOeUTsal14HhM7PbGDO4aVfMBc7iX/4E7kaFgmNU=;
 b=H4x3VlJ1cF0Z7ZpGOJCEom9sZQ37MSPoV3IHdXNTTfpIIVbDlX6LfIDZUg9tpnebxw
 QAPUuZoLnPWE5Ws76uecOTIOt+ooCQDAKs3QFt3SmpdiFnWGSS+ftg0aDAj0/9mw3ahh
 iV+xlb2XgQMkbX2O4GOnSa6wTB6u2AXYqohzqQT0BVRMkIOtSPTZfiIILkD3Q9wg3mP+
 KkDak15+51+JoeSLiEKesn3jJEPaYs3Kg9DskUnL/3+Ju/Lvo2f3WxIKk0UF3x7GYjQE
 hZZer7b0YZj1Ls7NqgQwrM35MWw/lUUwc2kocV/nR3PQ6RwURK0Qo4YsRWZxz8OcB3Gz
 iZjQ==
X-Gm-Message-State: APjAAAU5E5uIECvU+a9YM9jmQo9S7BhoJJgPJtGvp4z8tOyrG9V1bKLR
 K0xA6vlW1qTfZHrI4CrK2LmYOk0T
X-Google-Smtp-Source: APXvYqyyqf1FfmueFYPUOHoxv/rNBh49uVzqsRKs4efX3+MnMs8PqfNd+ze5Efgfprcq0PXoMORKOw==
X-Received: by 2002:aa7:93aa:: with SMTP id x10mr25804338pff.83.1566901853611; 
 Tue, 27 Aug 2019 03:30:53 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id o4sm4786308pje.28.2019.08.27.03.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:30:53 -0700 (PDT)
Date: Tue, 27 Aug 2019 20:30:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/64: system call implement the bulk of the
 logic in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-6-npiggin@gmail.com>
 <3ebe3e11-f3d7-d714-50dc-334527dfee90@c-s.fr>
In-Reply-To: <3ebe3e11-f3d7-d714-50dc-334527dfee90@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566901303.w31ylv2pn0.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on August 27, 2019 4:46 pm:
>=20
>=20
> Le 27/08/2019 =C3=A0 05:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> System call entry and particularly exit code is beyond the limit of what
>> is reasonable to implement in asm.
>>=20
>> This conversion moves all conditional branches out of the asm code,
>> except a relatively simple test to see whether all GPRs should be
>> restored at exit time.
>>=20
>> Null syscall test is about 5% faster after this patch, because the exit
>> work is handled under local_irq_disable, and the hard mask and pending
>> interrupt replay is handled after that, which avoids games with MSR.
>=20
> Interesting optimisation.
>=20
>>=20
>> The asm instruction scheduling has not really been analysed and
>> optimised yet, as there are higher level features and improvements to
>> add first.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h |  11 -
>>   arch/powerpc/include/asm/ptrace.h         |   3 +
>>   arch/powerpc/include/asm/signal.h         |   2 +
>>   arch/powerpc/include/asm/switch_to.h      |   4 +
>>   arch/powerpc/include/asm/time.h           |   3 +
>>   arch/powerpc/kernel/Makefile              |   3 +-
>>   arch/powerpc/kernel/entry_64.S            | 343 ++++------------------
>>   arch/powerpc/kernel/process.c             |   6 +-
>>   arch/powerpc/kernel/signal.h              |   2 -
>>   arch/powerpc/kernel/syscall_64.c          | 202 +++++++++++++
>>   10 files changed, 271 insertions(+), 308 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/syscall_64.c
>>=20
>=20
> [...]
>=20
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process=
.c
>> index 24621e7e5033..f444525da9ce 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -1609,7 +1609,6 @@ int copy_thread_tls(unsigned long clone_flags, uns=
igned long usp,
>>   	extern void ret_from_kernel_thread(void);
>>   	void (*f)(void);
>>   	unsigned long sp =3D (unsigned long)task_stack_page(p) + THREAD_SIZE;
>> -	struct thread_info *ti =3D task_thread_info(p);
>>  =20
>>   	klp_init_thread_info(p);
>>  =20
>> @@ -1617,6 +1616,8 @@ int copy_thread_tls(unsigned long clone_flags, uns=
igned long usp,
>>   	sp -=3D sizeof(struct pt_regs);
>>   	childregs =3D (struct pt_regs *) sp;
>>   	if (unlikely(p->flags & PF_KTHREAD)) {
>> +		struct thread_info *ti =3D task_thread_info(p);
>> +
>>   		/* kernel thread */
>>   		memset(childregs, 0, sizeof(struct pt_regs));
>>   		childregs->gpr[1] =3D sp + sizeof(struct pt_regs);
>> @@ -1634,12 +1635,13 @@ int copy_thread_tls(unsigned long clone_flags, u=
nsigned long usp,
>>   	} else {
>>   		/* user thread */
>>   		struct pt_regs *regs =3D current_pt_regs();
>> +
>>   		CHECK_FULL_REGS(regs);
>>   		*childregs =3D *regs;
>>   		if (usp)
>>   			childregs->gpr[1] =3D usp;
>>   		p->thread.regs =3D childregs;
>> -		childregs->gpr[3] =3D 0;  /* Result from fork() */
>> +		/* ret_from_fork sets fork() result to 0 */
>=20
> Does PPC32 ret_from_fork() do it as well ?

AFAICT it does, but I guess it should be a patch by itself
with powerpc: prefix. I will split it out.

>> +#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
>> +static inline void account_cpu_user_entry(void)
>> +{
>> +	unsigned long tb =3D mftb();
>> +
>> +	local_paca->accounting.utime +=3D (tb - local_paca->accounting.startti=
me_user);
>> +	local_paca->accounting.starttime =3D tb;
>> +}
>> +static inline void account_cpu_user_exit(void)
>> +{
>> +	unsigned long tb =3D mftb();
>> +
>> +	local_paca->accounting.stime +=3D (tb - local_paca->accounting.startti=
me);
>> +	local_paca->accounting.starttime_user =3D tb;
>> +}
>> +#else
>> +static inline void account_cpu_user_entry(void)
>> +{
>> +}
>> +static inline void account_cpu_user_exit(void)
>> +{
>> +}
>> +#endif
>=20
> I think this block should go in arch/powerpc/include/asm/cputime.h, we=20
> should limit #ifdefs as much as possible in C files.
>=20
> And use get_accounting() instead of local_paca->accounting in order to=20
> be usable on PPC32 as well

Sure thing. I need to move them for other interrupt return in C as
well.

>> +
>> +typedef long (*syscall_fn)(long, long, long, long, long, long);
>> +
>> +long system_call_exception(long r3, long r4, long r5, long r6, long r7,=
 long r8, unsigned long r0, struct pt_regs *regs)
>> +{
>> +	unsigned long ti_flags;
>> +	syscall_fn f;
>> +
>> +	BUG_ON(!(regs->msr & MSR_PR));
>> +
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +	if (unlikely(regs->msr & MSR_TS_T))
>> +		tabort_syscall();
>> +#endif
>=20
> MSR_TS_T and tabort_syscall() are declared regardless of=20
> CONFIG_PPC_TRANSACTIONAL_MEM so IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM)=20
> should be used instead of #ifdef

Will do.

>> +#if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SP=
LPAR)
>> +	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
>> +		struct lppaca *lp =3D get_lppaca();
>> +
>> +		if (unlikely(local_paca->dtl_ridx !=3D lp->dtl_idx))
>> +			accumulate_stolen_time();
>> +	}
>> +#endif
>=20
> Same here, I think everything is available so IS_ENABLED() should be=20
> used instead of #if

Will do.

>> +
>> +#ifdef CONFIG_PPC_KUAP_DEBUG
>> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
>> +		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
>> +#endif
>=20
> This should go in a helper in one of the kup/kuap header files.

Will do.

>> +
>> +	/*
>> +	 * A syscall should always be called with interrupts enabled
>> +	 * so we just unconditionally hard-enable here. When some kind
>> +	 * of irq tracing is used, we additionally check that condition
>> +	 * is correct
>> +	 */
>> +#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)
>> +	WARN_ON(irq_soft_mask_return() !=3D IRQS_ENABLED);
>> +	WARN_ON(local_paca->irq_happened);
>> +#endif
>=20
> Can we use IS_ENABLED() here as well ?

I think so.

>> +#ifdef CONFIG_ALTIVEC
>> +	if ((regs->msr & (MSR_FP|MSR_VEC)) !=3D (MSR_FP|MSR_VEC))
>> +#else
>> +	if ((regs->msr & MSR_FP) !=3D MSR_FP)
>> +#endif
>=20
> Use 'if (IS_ENABLED(CONFIG_ALTIVEC)) / else' instead of an=20
> #ifdef/#else/#endif

Yeah that'll be nicer.

>> +#ifdef CONFIG_PPC_KUAP_DEBUG
>> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
>> +		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
>> +#endif
>=20
> Same, define a helper in the kuap header files to avoid the #ifdefs and=20
> platform specif stuff here.

Will do. Thanks for the quick review.

Thanks,
Nick
=
