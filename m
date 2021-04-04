Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524C35360E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 02:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCZvQ2T1Qz3bth
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 10:50:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lzw4/pQG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lzw4/pQG; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCZtw30FMz2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Apr 2021 10:49:44 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id t23so1129991pjy.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Apr 2021 17:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=40faVX+5+SnZpR7dHTidKS5RcQ7ZL/MEviq5HIQ2L3g=;
 b=lzw4/pQGi8OVAqBKY/e6JpTlbWByV1p1AjjukR+jy7sH81Kt9UzL+AmsICNixyFiCV
 omvwOYSiqxbrPsQFkb4qC41acLyESZ2OyQV0/b0xmajFT/3CUmMr3Ws+4DgubITMwJib
 SN7zXSmR+QGoMScv27RGC7HtYrs2yy7BiTqilqgvzsUr0Bkmv09JF4L28rRGx+7KEpRq
 VqbPYcjqiW3vXQX2gtrHjBy+vn8VCdG/YdbusUB8S07XL62U0nlGT9fQ7Q9/GRT2xr/3
 CirNzbrxgKAE0l3NB2mxqsziiu7/EeKaHQOXwZBMO58/h2TQj4sW+stes0GcQl6K1ThM
 b6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=40faVX+5+SnZpR7dHTidKS5RcQ7ZL/MEviq5HIQ2L3g=;
 b=Yyc4gzl8jAynukq4yKWTVS5IgkY8hjrFb3Ncbcv4PUiS90UUwGTH/jlBAXAs961qJc
 oZC26wKsiVYBTdMu6Kugdi6xW2BckA1MNGJCAZHGEgIAmlmp6nSsrGIVx1a6MZaz7SNW
 UGzZ+e5aQ/QFRz6L4WW6Yg0F1ombukJYZznGfzhCDbHAgWFatvwfCl7JHbPReinePaw9
 5ytzAKTmMBoFUyVTHPTtv0MfNmWFqM2QFc6xp+U1Qi6OrXletwsT0rgmwI6vEK4uUC/s
 KyU1rof7fnrN0ty8hx4xWayBNyF0wARvTHHabpseFz+bluOXJL8CK6Bi+BjnbJ3CKlm2
 cpbQ==
X-Gm-Message-State: AOAM531+8PFvb3eKdKHLiNngqdxaM2ouuRpvtIcLu71aralGsjOXLe9K
 oHd9YYoLScfVSjMjKTnoO30jmZKtLuSmDg==
X-Google-Smtp-Source: ABdhPJw1YxHnXzqHl7Xy8+oJj6gxl3yEnycHUzagCmJAYy7PlUWECneKLRrEkFbi2oCqCanWYPReKQ==
X-Received: by 2002:a17:902:d2c7:b029:e6:34e2:7a83 with SMTP id
 n7-20020a170902d2c7b02900e634e27a83mr18401132plc.60.1617497381220; 
 Sat, 03 Apr 2021 17:49:41 -0700 (PDT)
Received: from localhost ([1.132.155.16])
 by smtp.gmail.com with ESMTPSA id o4sm11974268pfk.15.2021.04.03.17.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Apr 2021 17:49:40 -0700 (PDT)
Date: Sun, 04 Apr 2021 10:49:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 04/14] powerpc/64s: avoid reloading (H)SRR registers if
 they are still valid
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-5-npiggin@gmail.com>
 <877dlk1fbg.fsf@mpe.ellerman.id.au>
In-Reply-To: <877dlk1fbg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1617497349.0g6vi5v1lf.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of April 3, 2021 8:39 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> When an interrupt is taken, the SRR registers are set to return to
>> where it left off. Unless they are modified in the meantime, or the
>> return address or MSR are modified, there is no need to reload these
>> registers when returning from interrupt.
>>
>> Introduce per-CPU flags that track the validity of SRR and HSRR
>> registers, clear them when returning from interrupt, using the registers
>> for something else (e.g., OPAL calls), or adjusting return address or MS=
R.
>>
>> This improves the performance of interrupt returns.
>>
>> XXX: may not need to invalidate both hsrr and srr all the time
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
> I needed something like below to get 32-bit building.

That looks much better.

Thanks,
Nick

>=20
> cheers
>=20
>=20
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm=
/ptrace.h
> index 6d6237e0cbd7..7f9bbd19db10 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -153,15 +153,21 @@ static inline void regs_set_return_value(struct pt_=
regs *regs, unsigned long rc)
>  	regs->gpr[3] =3D rc;
>  }
> =20
> -static inline void regs_set_return_ip(struct pt_regs *regs, unsigned lon=
g ip)
> +static inline void invalidate_srrs(void)
>  {
> -	regs->nip =3D ip;
>  #ifdef CONFIG_PPC_BOOK3S_64
> +	// XXX: We may not need to invalidate both hsrr and srr all the time
>  	local_paca->hsrr_valid =3D 0;
>  	local_paca->srr_valid =3D 0;
>  #endif
>  }
> =20
> +static inline void regs_set_return_ip(struct pt_regs *regs, unsigned lon=
g ip)
> +{
> +	regs->nip =3D ip;
> +	invalidate_srrs();
> +}
> +
>  static inline void regs_add_return_ip(struct pt_regs *regs, long offset)
>  {
>  	regs_set_return_ip(regs, regs->nip + offset);
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.=
c
> index 200b4805f999..82623b57e2d6 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -98,8 +98,7 @@ static void check_if_tm_restore_required(struct task_st=
ruct *tsk)
>  	    !test_thread_flag(TIF_RESTORE_TM)) {
>  		tsk->thread.ckpt_regs.msr =3D tsk->thread.regs->msr;
>  		set_thread_flag(TIF_RESTORE_TM);
> -		local_paca->hsrr_valid =3D 0;
> -		local_paca->srr_valid =3D 0;
> +		invalidate_srrs();
>  	}
>  }
> =20
> @@ -164,8 +163,7 @@ static void __giveup_fpu(struct task_struct *tsk)
>  	if (cpu_has_feature(CPU_FTR_VSX))
>  		msr &=3D ~MSR_VSX;
>  	tsk->thread.regs->msr =3D msr;
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +	invalidate_srrs();
>  }
> =20
>  void giveup_fpu(struct task_struct *tsk)
> @@ -249,8 +247,7 @@ static void __giveup_altivec(struct task_struct *tsk)
>  	if (cpu_has_feature(CPU_FTR_VSX))
>  		msr &=3D ~MSR_VSX;
>  	tsk->thread.regs->msr =3D msr;
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +	invalidate_srrs();
>  }
> =20
>  void giveup_altivec(struct task_struct *tsk)
> @@ -566,8 +563,7 @@ void notrace restore_math(struct pt_regs *regs)
>  		msr_check_and_clear(new_msr);
> =20
>  		regs->msr |=3D new_msr | fpexc_mode;
> -		local_paca->hsrr_valid =3D 0;
> -		local_paca->srr_valid =3D 0;
> +		invalidate_srrs();
>  	}
>  }
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> @@ -1293,8 +1289,7 @@ struct task_struct *__switch_to(struct task_struct =
*prev,
>  			atomic_read(&current->mm->context.vas_windows)))
>  			asm volatile(PPC_CP_ABORT);
>  	}
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +	invalidate_srrs();
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> =20
>  	return last;
> @@ -1884,8 +1879,7 @@ void start_thread(struct pt_regs *regs, unsigned lo=
ng start, unsigned long sp)
>  	current->thread.load_tm =3D 0;
>  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> =20
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +	invalidate_srrs();
>  }
>  EXPORT_SYMBOL(start_thread);
> =20
> @@ -1936,8 +1930,7 @@ int set_fpexc_mode(struct task_struct *tsk, unsigne=
d int val)
>  	if (regs !=3D NULL && (regs->msr & MSR_FP) !=3D 0) {
>  		regs->msr =3D (regs->msr & ~(MSR_FE0|MSR_FE1))
>  			| tsk->thread.fpexc_mode;
> -		local_paca->hsrr_valid =3D 0;
> -		local_paca->srr_valid =3D 0;
> +		invalidate_srrs();
>  	}
>  	return 0;
>  }
> @@ -1990,8 +1983,7 @@ int set_endian(struct task_struct *tsk, unsigned in=
t val)
>  	else
>  		return -EINVAL;
> =20
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +	invalidate_srrs();
> =20
>  	return 0;
>  }
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index 4cb38afa28a8..9d1d6070a516 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -115,8 +115,8 @@ SYSCALL_DEFINE0(switch_endian)
>  	struct thread_info *ti;
> =20
>  	current->thread.regs->msr ^=3D MSR_LE;
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +
> +	invalidate_srrs();
> =20
>  	/*
>  	 * Set TIF_RESTOREALL so that r3 isn't clobbered on return to
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 96505d4bba1c..2b94bf21d6ae 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -3480,8 +3480,7 @@ int emulate_step(struct pt_regs *regs, struct ppc_i=
nst instr)
>  	unsigned long val;
>  	unsigned long ea;
> =20
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +	invalidate_srrs();
> =20
>  	r =3D analyse_instr(&op, regs, instr);
>  	if (r < 0)
>=20
