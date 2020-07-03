Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48171213785
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:20:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yqFg1qgtzDrF2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 19:20:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RoF8M9Gq; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yqCJ46l5zDrCN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 19:18:51 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bj10so7211952plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jul 2020 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=NBVacOluvI7k1zCfkSUZ6bl671249thtX/mD3omfcYg=;
 b=RoF8M9Gqya5IbDecP2OSYYiJIvfO3eqtgToGxht2ORvU5mORcJKJvjLKRx5eA0nB7D
 mxFuLMHFHWPL76A5HjHvZPpifiTxq+2DVJUEZ4s02NApqva3gjUAVj+oAo9RJ6UYzdJE
 lcxfGtSxJwOaA0/5Lew/jXLOl0FmW3cP+YrTKt5lDeSWJIexUd6qLNBLa2wIt5VVNO4I
 Qkv5iFV9Pd9eJUh6kAPTTW4t2Ogf/FWHuukEWtByj1ljo+cxtylrpP2vBICAtgW87D09
 t80fuNAvE0+n1sL5viLe0aOI+p1VVwH2LG039CTlolUBGErw9ZBwMgnS6jFBkRR3QBhW
 7hLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NBVacOluvI7k1zCfkSUZ6bl671249thtX/mD3omfcYg=;
 b=F6669VKZmTXzD25F5afe85Oy9/cDf6D1XRix6Weg63xQ1ijLTRkUNQ/Q9XdoOgNRki
 kkjHq0oN0bg4WHEvdGl3MkPylwmumz29eWKHxroXhbqkDl3dzegJe0yV8LCfnMgd3ioj
 /casKWoUKZ235ZX22vTSdOd2YyDpwu55S3vkn6wZvTPpHqTNOje/Yx52HDC/y2FXl4ps
 qAS0GJ0HPwQ3EE9BjeFWSYhv7kw0jsKew5BFbiuwy0/yA7zDlor14NjVnJLQrQ4tuYYX
 5VNDO85I4hI8S/b21kM69BCFVRcVRdoi5mKtsKxNV5R0SWUQU0JyChGLEee49MA4b/64
 1+Sg==
X-Gm-Message-State: AOAM533CI3b6xn944gxtarlv2ynSo1KJcfEP+DtGg63tqyz/cxm7aXOG
 rxaTXP6GkgMAu1QX88qsIoU=
X-Google-Smtp-Source: ABdhPJzCI56DRpBnZq4HjD0TU2L7Rpf1fncNK8uDWdSchZOZTckr5iA9UTqcCd6fHDsxU3YHIxbimA==
X-Received: by 2002:a17:90a:e602:: with SMTP id
 j2mr33379080pjy.200.1593767928635; 
 Fri, 03 Jul 2020 02:18:48 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 204sm11496314pfc.18.2020.07.03.02.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 02:18:48 -0700 (PDT)
Date: Fri, 03 Jul 2020 19:18:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 24/41] powerpc/book3s64/pkeys: Store/restore userspace
 AMR correctly on entry and exit from kernel
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
 <20200615061430.770174-25-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200615061430.770174-25-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1593766495.dqos6wxr3o.astroid@bobo.none>
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of June 15, 2020 4:14 pm:
> This prepare kernel to operate with a different value than userspace AMR.
> For this, AMR needs to be saved and restored on entry and return from the
> kernel.
>=20
> With KUAP we modify kernel AMR when accessing user address from the kerne=
l
> via copy_to/from_user interfaces.
>=20
> If MMU_FTR_KEY is enabled we always use the key mechanism to implement KU=
AP
> feature. If MMU_FTR_KEY is not supported and if we support MMU_FTR_KUAP
> (radix translation on POWER9), we can skip restoring AMR on return
> to userspace. Userspace won't be using AMR in that specific config.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h | 141 ++++++++++++++++++-----
>  arch/powerpc/kernel/entry_64.S           |   6 +-
>  arch/powerpc/kernel/exceptions-64s.S     |   4 +-
>  arch/powerpc/kernel/syscall_64.c         |  26 ++++-
>  4 files changed, 144 insertions(+), 33 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/incl=
ude/asm/book3s/64/kup.h
> index e6ee1c34842f..6979cd1a0003 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -13,18 +13,47 @@
> =20
>  #ifdef __ASSEMBLY__
> =20
> -.macro kuap_restore_amr	gpr1, gpr2
> -#ifdef CONFIG_PPC_KUAP
> +.macro kuap_restore_user_amr gpr1
> +#if defined(CONFIG_PPC_MEM_KEYS)
>  	BEGIN_MMU_FTR_SECTION_NESTED(67)
> -	mfspr	\gpr1, SPRN_AMR
> +	/*
> +	 * AMR is going to be different when
> +	 * returning to userspace.
> +	 */
> +	ld	\gpr1, STACK_REGS_KUAP(r1)
> +	isync
> +	mtspr	SPRN_AMR, \gpr1
> +
> +	/* No isync required, see kuap_restore_user_amr() */
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
> +#endif
> +.endm
> +
> +.macro kuap_restore_kernel_amr	gpr1, gpr2
> +#if defined(CONFIG_PPC_MEM_KEYS)
> +	BEGIN_MMU_FTR_SECTION_NESTED(67)
> +	b	99f  // handle_pkey_restore_amr
> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
> +
> +	BEGIN_MMU_FTR_SECTION_NESTED(68)
> +	b	99f  // handle_kuap_restore_amr
> +	MMU_FTR_SECTION_ELSE_NESTED(68)
> +	b	100f  // skip_restore_amr
> +	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
> +
> +99:
> +	/*
> +	 * AMR is going to be mostly the same since we are
> +	 * returning to the kernel. Compare and do a mtspr.
> +	 */
>  	ld	\gpr2, STACK_REGS_KUAP(r1)
> +	mfspr	\gpr1, SPRN_AMR
>  	cmpd	\gpr1, \gpr2
> -	beq	998f
> +	beq	100f
>  	isync
>  	mtspr	SPRN_AMR, \gpr2
>  	/* No isync required, see kuap_restore_amr() */
> -998:
> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
> +100:  // skip_restore_amr

Can't you code it like this? (_IFCLR requires none of the bits to be=20
set)

BEGIN_MMU_FTR_SECTION_NESTED(67)
	b	99f	// nothing using AMR, no need to restore
END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 67)

That saves you a branch in the common case of using AMR. Similar
for others.

> @@ -69,22 +133,40 @@
> =20
>  extern u64 default_uamor;
> =20
> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long =
amr)
> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
>  {
> -	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap !=3D amr)) {
> -		isync();
> -		mtspr(SPRN_AMR, regs->kuap);
> -		/*
> -		 * No isync required here because we are about to RFI back to
> -		 * previous context before any user accesses would be made,
> -		 * which is a CSI.
> -		 */
> +	if (!mmu_has_feature(MMU_FTR_PKEY))
> +		return;

If you have PKEY but not KUAP, do you still have to restore?

> +
> +	isync();
> +	mtspr(SPRN_AMR, regs->kuap);
> +	/*
> +	 * No isync required here because we are about to rfi
> +	 * back to previous context before any user accesses
> +	 * would be made, which is a CSI.
> +	 */
> +}
> +
> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
> +					   unsigned long amr)
> +{
> +	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
> +
> +		if (unlikely(regs->kuap !=3D amr)) {
> +			isync();
> +			mtspr(SPRN_AMR, regs->kuap);
> +			/*
> +			 * No isync required here because we are about to rfi
> +			 * back to previous context before any user accesses
> +			 * would be made, which is a CSI.
> +			 */
> +		}
>  	}
>  }
> =20
>  static inline unsigned long kuap_get_and_check_amr(void)
>  {
> -	if (mmu_has_feature(MMU_FTR_KUAP)) {
> +	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
>  		unsigned long amr =3D mfspr(SPRN_AMR);
>  		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
>  			WARN_ON_ONCE(amr !=3D AMR_KUAP_BLOCKED);

We could do a static key that's based on this condition, but that can=20
wait for another day.

> =20
>  static inline void kuap_check_amr(void)
>  {
> -	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP))
> +	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) &&
> +	    (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)))
>  		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
>  }
> =20
>  #else /* CONFIG_PPC_MEM_KEYS */
> =20
> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long =
amr)
> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
> +{
> +}
> +
> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs, unsigne=
d long amr)
>  {
>  }
> =20
> @@ -113,6 +200,7 @@ static inline unsigned long kuap_get_and_check_amr(vo=
id)
>  {
>  	return 0;
>  }
> +
>  #endif /* CONFIG_PPC_MEM_KEYS */
> =20
> =20
> @@ -187,7 +275,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long ad=
dress, bool is_write)
>  		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>  }
>  #endif /* CONFIG_PPC_KUAP */
> -
>  #endif /* __ASSEMBLY__ */
> =20
>  #endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */

Unnecessary hunks.

> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_6=
4.S
> index 9d49338e0c85..a087cbe0b17d 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -481,8 +481,8 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
>  	kuap_check_amr r3, r4
>  	ld	r5,_MSR(r1)
>  	andi.	r0,r5,MSR_PR
> -	bne	.Lfast_user_interrupt_return
> -	kuap_restore_amr r3, r4
> +	bne	.Lfast_user_interrupt_return_amr
> +	kuap_restore_kernel_amr r3, r4
>  	andi.	r0,r5,MSR_RI
>  	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
>  	bne+	.Lfast_kernel_interrupt_return
> @@ -502,6 +502,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
>  	cmpdi	r3,0
>  	bne-	.Lrestore_nvgprs
> =20
> +.Lfast_user_interrupt_return_amr:
> +	kuap_restore_user_amr r3
>  .Lfast_user_interrupt_return:
>  	ld	r11,_NIP(r1)
>  	ld	r12,_MSR(r1)
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index e70ebb5c318c..8226af444d77 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -971,7 +971,7 @@ EXC_COMMON_BEGIN(system_reset_common)
>  	ld	r10,SOFTE(r1)
>  	stb	r10,PACAIRQSOFTMASK(r13)
> =20
> -	kuap_restore_amr r9, r10
> +	kuap_restore_kernel_amr r9, r10
>  	EXCEPTION_RESTORE_REGS
>  	RFI_TO_USER_OR_KERNEL
> =20
> @@ -2784,7 +2784,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
>  	ld	r10,SOFTE(r1)
>  	stb	r10,PACAIRQSOFTMASK(r13)
> =20
> -	kuap_restore_amr r9, r10
> +	kuap_restore_kernel_amr r9, r10
>  	EXCEPTION_RESTORE_REGS hsrr=3D0
>  	RFI_TO_KERNEL
> =20
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sysca=
ll_64.c
> index 7e560a01afa4..fded67982fbe 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -35,7 +35,21 @@ notrace long system_call_exception(long r3, long r4, l=
ong r5,
>  	BUG_ON(!FULL_REGS(regs));
>  	BUG_ON(regs->softe !=3D IRQS_ENABLED);
> =20
> -	kuap_check_amr();
> +#ifdef CONFIG_PPC_MEM_KEYS
> +	if (mmu_has_feature(MMU_FTR_PKEY)) {
> +		unsigned long amr;
> +		/*
> +		 * When entering from userspace we mostly have the AMR
> +		 * different from kernel default values. Hence don't compare.
> +		 */
> +		amr =3D mfspr(SPRN_AMR);
> +		regs->kuap =3D amr;
> +		if (mmu_has_feature(MMU_FTR_KUAP))
> +			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
> +		isync();

isync should be inside the if(). Again do pkeys need to save this if=20
KUAP is not being used? I haven't really looked at how all that works,=20
but what's changing for the PKEY && !KUAP case?

This would be nice if it could all go into a wrapper function rather=20
than ifdef.

> +	} else
> +#endif
> +		kuap_check_amr();
> =20
>  	account_cpu_user_entry();
> =20
> @@ -222,6 +236,10 @@ notrace unsigned long syscall_exit_prepare(unsigned =
long r3,
> =20
>  	account_cpu_user_exit();
> =20
> +	/*
> +	 * We do this at the end so that we do context switch with KERNEL AMR
> +	 */
> +	kuap_restore_user_amr(regs);
>  	return ret;

Comment doesn't make sense, newline required before return.

>  }
> =20
> @@ -306,6 +324,10 @@ notrace unsigned long interrupt_exit_user_prepare(st=
ruct pt_regs *regs, unsigned
> =20
>  	account_cpu_user_exit();
> =20
> +	/*
> +	 * We do this at the end so that we do context switch with KERNEL AMR
> +	 */
> +	kuap_restore_user_amr(regs);

Duplicated comments I prefer to just have like this instead of trying to=20
keep them in sync. Can complete the circular reference by having a

* similarly in interrupt_exit_user_prepare

in the main comment, but if they come close to one another in the same=20
file it's not so important to keep them together.

 +	kuap_restore_user_amr(regs); /* see syscall_exit_prepare */

>  	return ret;
>  }
> =20
> @@ -376,7 +398,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs, unsign
>  	 * which would cause Read-After-Write stalls. Hence, we take the AMR
>  	 * value from the check above.
>  	 */
> -	kuap_restore_amr(regs, amr);
> +	kuap_restore_kernel_amr(regs, amr);
> =20
>  	return ret;
>  }
> --=20
> 2.26.2
>=20
>=20
