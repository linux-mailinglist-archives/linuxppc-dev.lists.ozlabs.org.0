Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF63332CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:37:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwF7z5Nftz3cZR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 12:37:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Og2RkqQi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Og2RkqQi; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwF7X3nMtz3bPW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 12:37:27 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id w7so4173969pll.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 17:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=d34zYJWgTA8c5Ujr7dblIGWfKQ8pynSGIl67Hphzq54=;
 b=Og2RkqQiOEne1+Gi6J2O4Hjwwyiz1gKu6i/HaU63P6yngPcIvLsN05veNm3o9RNFAn
 qj7kRjjOin/0wLSLLZwRKzU3VnoUQslskUoFK50QstseVsZ5ljc/0Y39/pBdMt5wklvS
 ajWGEoYIaHXYjy1/22t0Ay227dDZz4FpSFyB1Ula67JHp1xGjlo61/bSsW60dIOhigTJ
 qYGrx94BmrM2NriCFIvgfba4866E12TEY1nAaUN+C+WwC+KJRYiQbE9M9FwIa7KnAN7r
 OdX4SjCGlmUEFTfLJGBeCTBTkUjAZ8+rH5QSYhRyFt1KXTNDrNtaYeLiAjZkhuT8JAGf
 I13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=d34zYJWgTA8c5Ujr7dblIGWfKQ8pynSGIl67Hphzq54=;
 b=KtdHRWR07OiS2qDrtwD3z/+BaorqbnKOwvgAFpiwTgESTiGn2ilYWNo+uiB4Sc2ag8
 xgzWnX+b/mzRjdDa/H+ck/oonLJ+xCSLmsXTU71caa7AIeREhXHNLEcQ//dRgeFpju5B
 WNHxEUOuSpTC8gtnrw4N3PMPKblZPvyqBnnNzTaJQOCm5Fn7HiyVYQCZeKznSkNH6sYQ
 ofJf0JXV2pqRGUni9vKKOm60m0WRv+LD6wp3veM4Ir4QUO4dhHIMeDI3uipged1g2qHY
 uwvx8UL0cymCNs8hYp1GkTuSCpHVRqxzO2pimxnNi6BCp+mMWTBv/yVuB/WR5rMG2FZk
 pFiw==
X-Gm-Message-State: AOAM533N9D/3goSiwYknBKRH71M8L00DZxDWYbANAH8zHPmQldmEcsvq
 svrz2JmZIbdz/V62c9mOWvE=
X-Google-Smtp-Source: ABdhPJwe5UZ2T1wGyZQha2NcygpxsFF8QBaWQ2n+ZMxWbZ708LSjMbOf49G2004b3456bB5kUgPEsA==
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr856742pjb.74.1615340244654; 
 Tue, 09 Mar 2021 17:37:24 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id 9sm13858029pgy.79.2021.03.09.17.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 17:37:24 -0800 (PST)
Date: Wed, 10 Mar 2021 11:37:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 40/43] powerpc/64s: Make kuap_check_amr() and
 kuap_get_and_check_amr() generic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <7167aef44fb816f6df17f65d540ac07ca98c4af9.1615291474.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7167aef44fb816f6df17f65d540ac07ca98c4af9.1615291474.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615340152.vcj9lsklbx.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 9, 2021 10:10 pm:
> In preparation of porting powerpc32 to C syscall entry/exit,
> rename kuap_check_amr() and kuap_get_and_check_amr() as kuap_check()
> and kuap_get_and_check(), and move in the generic asm/kup.h the stub
> for when CONFIG_PPC_KUAP is not selected.

Looks pretty straightforward to me.

While you're renaming things, could kuap_check_amr() be changed to
kuap_assert_locked() or similar? Otherwise,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h | 24 ++----------------------
>  arch/powerpc/include/asm/kup.h           | 10 +++++++++-
>  arch/powerpc/kernel/interrupt.c          | 12 ++++++------
>  arch/powerpc/kernel/irq.c                |  2 +-
>  4 files changed, 18 insertions(+), 30 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/incl=
ude/asm/book3s/64/kup.h
> index 8bd905050896..d9b07e9998be 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -287,7 +287,7 @@ static inline void kuap_kernel_restore(struct pt_regs=
 *regs,
>  	 */
>  }
> =20
> -static inline unsigned long kuap_get_and_check_amr(void)
> +static inline unsigned long kuap_get_and_check(void)
>  {
>  	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
>  		unsigned long amr =3D mfspr(SPRN_AMR);
> @@ -298,27 +298,7 @@ static inline unsigned long kuap_get_and_check_amr(v=
oid)
>  	return 0;
>  }
> =20
> -#else /* CONFIG_PPC_PKEY */
> -
> -static inline void kuap_user_restore(struct pt_regs *regs)
> -{
> -}
> -
> -static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned lo=
ng amr)
> -{
> -}
> -
> -static inline unsigned long kuap_get_and_check_amr(void)
> -{
> -	return 0;
> -}
> -
> -#endif /* CONFIG_PPC_PKEY */
> -
> -
> -#ifdef CONFIG_PPC_KUAP
> -
> -static inline void kuap_check_amr(void)
> +static inline void kuap_check(void)
>  {
>  	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_BOOK3S=
_KUAP))
>  		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
> diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/ku=
p.h
> index 25671f711ec2..b7efa46b3109 100644
> --- a/arch/powerpc/include/asm/kup.h
> +++ b/arch/powerpc/include/asm/kup.h
> @@ -74,7 +74,15 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long add=
ress, bool is_write)
>  	return false;
>  }
> =20
> -static inline void kuap_check_amr(void) { }
> +static inline void kuap_check(void) { }
> +static inline void kuap_save_and_lock(struct pt_regs *regs) { }
> +static inline void kuap_user_restore(struct pt_regs *regs) { }
> +static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned lo=
ng amr) { }
> +
> +static inline unsigned long kuap_get_and_check(void)
> +{
> +	return 0;
> +}
> =20
>  /*
>   * book3s/64/kup-radix.h defines these functions for the !KUAP case to f=
lush
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 727b7848c9cc..40ed55064e54 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -76,7 +76,7 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  	} else
>  #endif
>  #ifdef CONFIG_PPC64
> -		kuap_check_amr();
> +		kuap_check();
>  #endif
> =20
>  	booke_restore_dbcr0();
> @@ -254,7 +254,7 @@ notrace unsigned long syscall_exit_prepare(unsigned l=
ong r3,
>  	CT_WARN_ON(ct_state() =3D=3D CONTEXT_USER);
> =20
>  #ifdef CONFIG_PPC64
> -	kuap_check_amr();
> +	kuap_check();
>  #endif
> =20
>  	regs->result =3D r3;
> @@ -380,7 +380,7 @@ notrace unsigned long interrupt_exit_user_prepare(str=
uct pt_regs *regs, unsigned
>  	 * AMR can only have been unlocked if we interrupted the kernel.
>  	 */
>  #ifdef CONFIG_PPC64
> -	kuap_check_amr();
> +	kuap_check();
>  #endif
> =20
>  	local_irq_save(flags);
> @@ -451,7 +451,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs, unsign
>  	unsigned long flags;
>  	unsigned long ret =3D 0;
>  #ifdef CONFIG_PPC64
> -	unsigned long amr;
> +	unsigned long kuap;
>  #endif
> =20
>  	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
> @@ -467,7 +467,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs, unsign
>  		CT_WARN_ON(ct_state() =3D=3D CONTEXT_USER);
> =20
>  #ifdef CONFIG_PPC64
> -	amr =3D kuap_get_and_check_amr();
> +	kuap =3D kuap_get_and_check();
>  #endif
> =20
>  	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) =
{
> @@ -511,7 +511,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(s=
truct pt_regs *regs, unsign
>  	 * value from the check above.
>  	 */
>  #ifdef CONFIG_PPC64
> -	kuap_kernel_restore(regs, amr);
> +	kuap_kernel_restore(regs, kuap);
>  #endif
> =20
>  	return ret;
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index d71fd10a1dd4..3b18d2b2c702 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -282,7 +282,7 @@ static inline void replay_soft_interrupts_irqrestore(=
void)
>  	 * and re-locking AMR but we shouldn't get here in the first place,
>  	 * hence the warning.
>  	 */
> -	kuap_check_amr();
> +	kuap_check();
> =20
>  	if (kuap_state !=3D AMR_KUAP_BLOCKED)
>  		set_kuap(AMR_KUAP_BLOCKED);
> --=20
> 2.25.0
>=20
>=20
