Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FBE216658
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 08:25:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1C9Q4S6jzDqlp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h9lf/B0b; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1C6v4XsCzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 16:23:19 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id f7so40841225wrw.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 23:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mUuQCqYIwOC25gOT2EFxOEaAQnqSgoTvw8D2ux4O6UI=;
 b=h9lf/B0btJd/13OCG9UQ253ApsSlOogblINREeb5Z8eyedtWBs2BPElvy9EBxdI8Z6
 TxnJzPRVNsB3+bG+kC0PtXDBrR4YzhhSv0xBhRmMtRp4/9VfJXTdY/u+GocMvWNcrOHb
 RGNlSF1A/HjkZQ4fpiG2gvepZC8ZhGj0m5+qJMkGCAVcePXYoClJ0HF0E+Z75tCzpkgQ
 ogYs3CsK7I8vPz4ja+ZAHl+db017i3OqEOI5ko1Douc1qmxe+zxoctLOoXhNm4C+g9AI
 e4vanTPz/Wx+MysWAwuBhtIaTCpU23HOLvdWw7yxR6D1en+J5Tl9NCUnfXtEzKQa7P94
 tN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mUuQCqYIwOC25gOT2EFxOEaAQnqSgoTvw8D2ux4O6UI=;
 b=JK34G9u7KXT55Tr3+jva99Bh1WbGKHaEgjRti/1tQg6r+Kngik8tld0SEsRQuad7BB
 jacOe8FdNvNllIPYgq4+bQBQmmzXOnz2T1HBoloLZ9mkagHkYwf2tPPCAlMA5bfQ0b3W
 JOX2aNjq8SFK6P3mFK4ahggaH0L68nLrj2S1ZvcXHVAJ9Ke022K+sDDj0QQssuVBYbGO
 rb4RT5lPdYCfIsKVjlxP/M5C9XB3u1I1J7zKuwrcqoWp1YZjbt2ZNtK8Oxylg/N1rr+Q
 VzqdLKsHFlQHRIFHJBv3pb8j62BuRDoRoObdGK6ldkaxs1hqkEfigTfS/piWawrZybYw
 D2SQ==
X-Gm-Message-State: AOAM532/zvvtX6R4u2RIOotSrADB6ntU+Br7+z+RNJEXqKAFlCAnxKRI
 Us5kqqIS5M+Aa89mI+QrFcc=
X-Google-Smtp-Source: ABdhPJz6lkYFeP79hizzpVO7vZjRmqoQNBD8WqJmYIORfVDXHdxyzcpmmcLdfN+5L4ll+i626VuK2w==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr51076962wrt.160.1594102994721; 
 Mon, 06 Jul 2020 23:23:14 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 22sm2181038wmb.11.2020.07.06.23.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 23:23:13 -0700 (PDT)
Date: Tue, 07 Jul 2020 16:23:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 24/41] powerpc/book3s64/pkeys: Store/restore userspace
 AMR correctly on entry and exit from kernel
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200615061430.770174-1-aneesh.kumar@linux.ibm.com>
 <20200615061430.770174-25-aneesh.kumar@linux.ibm.com>
 <1593766495.dqos6wxr3o.astroid@bobo.none>
 <83a38d37-099a-7b98-1262-c16b4f5a0cc4@linux.ibm.com>
In-Reply-To: <83a38d37-099a-7b98-1262-c16b4f5a0cc4@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1594102615.u8426he4lt.astroid@bobo.none>
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

Excerpts from Aneesh Kumar K.V's message of July 3, 2020 7:30 pm:
> On 7/3/20 2:48 PM, Nicholas Piggin wrote:
>> Excerpts from Aneesh Kumar K.V's message of June 15, 2020 4:14 pm:
>>> This prepare kernel to operate with a different value than userspace AM=
R.
>>> For this, AMR needs to be saved and restored on entry and return from t=
he
>>> kernel.
>>>
>>> With KUAP we modify kernel AMR when accessing user address from the ker=
nel
>>> via copy_to/from_user interfaces.
>>>
>>> If MMU_FTR_KEY is enabled we always use the key mechanism to implement =
KUAP
>>> feature. If MMU_FTR_KEY is not supported and if we support MMU_FTR_KUAP
>>> (radix translation on POWER9), we can skip restoring AMR on return
>>> to userspace. Userspace won't be using AMR in that specific config.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   arch/powerpc/include/asm/book3s/64/kup.h | 141 ++++++++++++++++++----=
-
>>>   arch/powerpc/kernel/entry_64.S           |   6 +-
>>>   arch/powerpc/kernel/exceptions-64s.S     |   4 +-
>>>   arch/powerpc/kernel/syscall_64.c         |  26 ++++-
>>>   4 files changed, 144 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/in=
clude/asm/book3s/64/kup.h
>>> index e6ee1c34842f..6979cd1a0003 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>>> @@ -13,18 +13,47 @@
>>>  =20
>>>   #ifdef __ASSEMBLY__
>>>  =20
>>> -.macro kuap_restore_amr	gpr1, gpr2
>>> -#ifdef CONFIG_PPC_KUAP
>>> +.macro kuap_restore_user_amr gpr1
>>> +#if defined(CONFIG_PPC_MEM_KEYS)
>>>   	BEGIN_MMU_FTR_SECTION_NESTED(67)
>>> -	mfspr	\gpr1, SPRN_AMR
>>> +	/*
>>> +	 * AMR is going to be different when
>>> +	 * returning to userspace.
>>> +	 */
>>> +	ld	\gpr1, STACK_REGS_KUAP(r1)
>>> +	isync
>>> +	mtspr	SPRN_AMR, \gpr1
>>> +
>>> +	/* No isync required, see kuap_restore_user_amr() */
>>> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
>>> +#endif
>>> +.endm
>>> +
>>> +.macro kuap_restore_kernel_amr	gpr1, gpr2
>>> +#if defined(CONFIG_PPC_MEM_KEYS)
>>> +	BEGIN_MMU_FTR_SECTION_NESTED(67)
>>> +	b	99f  // handle_pkey_restore_amr
>>> +	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_PKEY , 67)
>>> +
>>> +	BEGIN_MMU_FTR_SECTION_NESTED(68)
>>> +	b	99f  // handle_kuap_restore_amr
>>> +	MMU_FTR_SECTION_ELSE_NESTED(68)
>>> +	b	100f  // skip_restore_amr
>>> +	ALT_MMU_FTR_SECTION_END_NESTED_IFSET(MMU_FTR_KUAP, 68)
>>> +
>>> +99:
>>> +	/*
>>> +	 * AMR is going to be mostly the same since we are
>>> +	 * returning to the kernel. Compare and do a mtspr.
>>> +	 */
>>>   	ld	\gpr2, STACK_REGS_KUAP(r1)
>>> +	mfspr	\gpr1, SPRN_AMR
>>>   	cmpd	\gpr1, \gpr2
>>> -	beq	998f
>>> +	beq	100f
>>>   	isync
>>>   	mtspr	SPRN_AMR, \gpr2
>>>   	/* No isync required, see kuap_restore_amr() */
>>> -998:
>>> -	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_KUAP, 67)
>>> +100:  // skip_restore_amr
>>=20
>> Can't you code it like this? (_IFCLR requires none of the bits to be
>> set)
>>=20
>> BEGIN_MMU_FTR_SECTION_NESTED(67)
>> 	b	99f	// nothing using AMR, no need to restore
>> END_MMU_FTR_SECTION_NESTED_IFCLR(MMU_FTR_PKEY | MMU_FTR_KUAP, 67)
>>=20
>> That saves you a branch in the common case of using AMR. Similar
>> for others.
>=20
>=20
>=20
> Yes i could switch to that. The code is taking extra 200 cycles even=20
> with KUAP/KUEP disabled and no keys being used on hash. I am yet to=20
> analyze this closely. So will rework things based on that analysis.
>=20
>>=20
>>> @@ -69,22 +133,40 @@
>>>  =20
>>>   extern u64 default_uamor;
>>>  =20
>>> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned lon=
g amr)
>>> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
>>>   {
>>> -	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap !=3D amr)) {
>>> -		isync();
>>> -		mtspr(SPRN_AMR, regs->kuap);
>>> -		/*
>>> -		 * No isync required here because we are about to RFI back to
>>> -		 * previous context before any user accesses would be made,
>>> -		 * which is a CSI.
>>> -		 */
>>> +	if (!mmu_has_feature(MMU_FTR_PKEY))
>>> +		return;
>>=20
>> If you have PKEY but not KUAP, do you still have to restore?
>>=20
>=20
>=20
> Yes, because user space pkey is now set on the exit path. This is needed=20
> to handle things like exec/fork().
>=20
>=20
>>> +
>>> +	isync();
>>> +	mtspr(SPRN_AMR, regs->kuap);
>>> +	/*
>>> +	 * No isync required here because we are about to rfi
>>> +	 * back to previous context before any user accesses
>>> +	 * would be made, which is a CSI.
>>> +	 */
>>> +}
>>> +
>>> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs,
>>> +					   unsigned long amr)
>>> +{
>>> +	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
>>> +
>>> +		if (unlikely(regs->kuap !=3D amr)) {
>>> +			isync();
>>> +			mtspr(SPRN_AMR, regs->kuap);
>>> +			/*
>>> +			 * No isync required here because we are about to rfi
>>> +			 * back to previous context before any user accesses
>>> +			 * would be made, which is a CSI.
>>> +			 */
>>> +		}
>>>   	}
>>>   }
>>>  =20
>>>   static inline unsigned long kuap_get_and_check_amr(void)
>>>   {
>>> -	if (mmu_has_feature(MMU_FTR_KUAP)) {
>>> +	if (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)) {
>>>   		unsigned long amr =3D mfspr(SPRN_AMR);
>>>   		if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG)) /* kuap_check_amr() */
>>>   			WARN_ON_ONCE(amr !=3D AMR_KUAP_BLOCKED);
>>=20
>> We could do a static key that's based on this condition, but that can
>> wait for another day.
>>=20
>>>  =20
>>>   static inline void kuap_check_amr(void)
>>>   {
>>> -	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_KUAP=
))
>>> +	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) &&
>>> +	    (mmu_has_feature(MMU_FTR_KUAP) || mmu_has_feature(MMU_FTR_PKEY)))
>>>   		WARN_ON_ONCE(mfspr(SPRN_AMR) !=3D AMR_KUAP_BLOCKED);
>>>   }
>>>  =20
>>>   #else /* CONFIG_PPC_MEM_KEYS */
>>>  =20
>>> -static inline void kuap_restore_amr(struct pt_regs *regs, unsigned lon=
g amr)
>>> +static inline void kuap_restore_user_amr(struct pt_regs *regs)
>>> +{
>>> +}
>>> +
>>> +static inline void kuap_restore_kernel_amr(struct pt_regs *regs, unsig=
ned long amr)
>>>   {
>>>   }
>>>  =20
>>> @@ -113,6 +200,7 @@ static inline unsigned long kuap_get_and_check_amr(=
void)
>>>   {
>>>   	return 0;
>>>   }
>>> +
>>>   #endif /* CONFIG_PPC_MEM_KEYS */
>>>  =20
>>>  =20
>>> @@ -187,7 +275,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long =
address, bool is_write)
>>>   		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>>>   }
>>>   #endif /* CONFIG_PPC_KUAP */
>>> -
>>>   #endif /* __ASSEMBLY__ */
>>>  =20
>>>   #endif /* _ASM_POWERPC_BOOK3S_64_KUP_H */
>>=20
>> Unnecessary hunks.
>=20
>=20
> will remove
>=20
>>=20
>>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry=
_64.S
>>> index 9d49338e0c85..a087cbe0b17d 100644
>>> --- a/arch/powerpc/kernel/entry_64.S
>>> +++ b/arch/powerpc/kernel/entry_64.S
>>> @@ -481,8 +481,8 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
>>>   	kuap_check_amr r3, r4
>>>   	ld	r5,_MSR(r1)
>>>   	andi.	r0,r5,MSR_PR
>>> -	bne	.Lfast_user_interrupt_return
>>> -	kuap_restore_amr r3, r4
>>> +	bne	.Lfast_user_interrupt_return_amr
>>> +	kuap_restore_kernel_amr r3, r4
>>>   	andi.	r0,r5,MSR_RI
>>>   	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
>>>   	bne+	.Lfast_kernel_interrupt_return
>>> @@ -502,6 +502,8 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
>>>   	cmpdi	r3,0
>>>   	bne-	.Lrestore_nvgprs
>>>  =20
>>> +.Lfast_user_interrupt_return_amr:
>>> +	kuap_restore_user_amr r3
>>>   .Lfast_user_interrupt_return:
>>>   	ld	r11,_NIP(r1)
>>>   	ld	r12,_MSR(r1)
>>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel=
/exceptions-64s.S
>>> index e70ebb5c318c..8226af444d77 100644
>>> --- a/arch/powerpc/kernel/exceptions-64s.S
>>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>>> @@ -971,7 +971,7 @@ EXC_COMMON_BEGIN(system_reset_common)
>>>   	ld	r10,SOFTE(r1)
>>>   	stb	r10,PACAIRQSOFTMASK(r13)
>>>  =20
>>> -	kuap_restore_amr r9, r10
>>> +	kuap_restore_kernel_amr r9, r10
>>>   	EXCEPTION_RESTORE_REGS
>>>   	RFI_TO_USER_OR_KERNEL
>>>  =20
>>> @@ -2784,7 +2784,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
>>>   	ld	r10,SOFTE(r1)
>>>   	stb	r10,PACAIRQSOFTMASK(r13)
>>>  =20
>>> -	kuap_restore_amr r9, r10
>>> +	kuap_restore_kernel_amr r9, r10
>>>   	EXCEPTION_RESTORE_REGS hsrr=3D0
>>>   	RFI_TO_KERNEL
>>>  =20
>>> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sys=
call_64.c
>>> index 7e560a01afa4..fded67982fbe 100644
>>> --- a/arch/powerpc/kernel/syscall_64.c
>>> +++ b/arch/powerpc/kernel/syscall_64.c
>>> @@ -35,7 +35,21 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
>>>   	BUG_ON(!FULL_REGS(regs));
>>>   	BUG_ON(regs->softe !=3D IRQS_ENABLED);
>>>  =20
>>> -	kuap_check_amr();
>>> +#ifdef CONFIG_PPC_MEM_KEYS
>>> +	if (mmu_has_feature(MMU_FTR_PKEY)) {
>>> +		unsigned long amr;
>>> +		/*
>>> +		 * When entering from userspace we mostly have the AMR
>>> +		 * different from kernel default values. Hence don't compare.
>>> +		 */
>>> +		amr =3D mfspr(SPRN_AMR);
>>> +		regs->kuap =3D amr;
>>> +		if (mmu_has_feature(MMU_FTR_KUAP))
>>> +			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
>>> +		isync();
>>=20
>> isync should be inside the if(). Again do pkeys need to save this if
>> KUAP is not being used? I haven't really looked at how all that works,
>> but what's changing for the PKEY && !KUAP case?
>>=20
>=20
> There is no SPR switch in context switch now and all the AMR/IAMR=20
> handling is now in the exit to userspace.

If we have pkeys and no kuap, we could keep the switch in context=20
switch?

If you don't think it's worth bothering to optimise that case because we=20
expect KUAP to be used, that's probably okay although maybe an=20
adjustment to the comment (we don't expect userspace to have different
from kernel values if kernel is not using it for KUAP).

>>> +	/*
>>> +	 * We do this at the end so that we do context switch with KERNEL AMR
>>> +	 */
>>> +	kuap_restore_user_amr(regs);
>>>   	return ret;
>>=20
>> Comment doesn't make sense, newline required before return.
>=20
>=20
> Ok the detail there was we need to make sure we restore AMR towrads the=20
> end and make sure all the kernel code continue to run with KERNEL AMR=20
> value. There is a schedule() call in there with _TIF_NEED_RESCHED. But=20
> those details are not really relevant. That was me tracking down some=20
> issues and writing comment around that part of the code. The only real=20
> detail is switch to userspace AMR in the end.

Yep, I don't think that comment is needed at all. A space before the
return would be nice. I guess after the account_cpu_user_exit is fine,
that thing's a pain anyway that needs to be changed to avoid an SPR
stall I think so I'll look at that afterward anyway.

Thanks,
Nick
