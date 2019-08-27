Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5399E861
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 14:52:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hpg94gcWzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nz76BwGo"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HpbW4cbxzDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 22:49:11 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t14so11733904plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=6ZFqFHRXSVgB76+jQv0yGNyeEOATQA5Fq5064fFB84Y=;
 b=Nz76BwGoaBuHpEfaGtiEVVwVkKCFh+wT09563rJsuhGNNA3CGybNU3blKGeZLpG2TQ
 E28fVdZfd51sPITvyo1cscQWzYrOa+jaZ/nC1+v6+51zWohzIoAaFIrOS15hv2kM/7S0
 FA6qJzYJyIH7UnFPfsBTyvT1OcdB6X+Cyqcga/16xW3L7HEsdfXEQR57sEqzINNdGaFv
 HwlcxAgIpGyhfXI2wJQ0kAKUjo/cgWeKy7HliMjY6YIXPbYpteeH79ibbVuDYG0v5OwF
 9VxqE6Z+pfgkUc1Z1BpyfabgmpD3b2QaLdA0TXmSDs6np47n0R7F9jfT3idRnOKWfV4B
 miNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=6ZFqFHRXSVgB76+jQv0yGNyeEOATQA5Fq5064fFB84Y=;
 b=s0V3AqoeeJjoscQLW1p63Gs22K/RFennfcUDW1ME2i3JQnnDuudfFiTumWFpgqWGny
 3Fq6XyQ93sb6WuZzGSMU1AVS7QuiWLkAt5JiYE9o591L5PanOtAEG5/3m6hRQzxH72BJ
 mUDfQTTBPlMW9AvEZi7GzYXgjY9+jn3PdioCt3nWRvkGqcM7f0YuoMDnNM38SfMW+Csg
 cx8SygYykCC0dBvqskdT/0Kawa0qEYAffRkyKxl5HAHk3PsJTCLp9e3I7gYnQIhng+vn
 8wrRZhsELcnY1XUjjlfwM7ZajxxMeZJV2tc4lSsBDPzx143B3Jsvxvuge5TQ9IVWAn6X
 HFVw==
X-Gm-Message-State: APjAAAWDGvfNkq/+xCPKoxS0nLb/vE425okSmCcuIjiN0qCuTWKQeC79
 48l6NN/4YLXJTfwulYG/fBY=
X-Google-Smtp-Source: APXvYqyBvg9ztoOHMn/uG4MxUZeCV06J4IFbuJCyr7j4czCeAKLyX5Q2VP/OIrQK9RbT71/QMi93kw==
X-Received: by 2002:a17:902:a60f:: with SMTP id
 u15mr24077889plq.201.1566910147467; 
 Tue, 27 Aug 2019 05:49:07 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id 131sm16437330pge.37.2019.08.27.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 05:49:06 -0700 (PDT)
Date: Tue, 27 Aug 2019 22:48:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc: cleanup hw_irq.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <0f7e164afb5d1b022441559fe5a999bb6d3c0a23.1566893505.git.christophe.leroy@c-s.fr>
 <81f39fa06ae582f4a783d26abd2b310204eba8f4.1566893505.git.christophe.leroy@c-s.fr>
In-Reply-To: <81f39fa06ae582f4a783d26abd2b310204eba8f4.1566893505.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566909844.x4jee1jjda.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on August 27, 2019 6:13 pm:
> SET_MSR_EE() is just use in this file and doesn't provide
> any added value compared to mtmsr(). Drop it.
>=20
> Add macros to use wrtee/wrteei insn.
>=20
> Replace #ifdefs by IS_ENABLED()
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 57 ++++++++++++++++++---------------=
------
>  arch/powerpc/include/asm/reg.h    |  2 ++
>  2 files changed, 28 insertions(+), 31 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 32a18f2f49bc..c25d57f25a8b 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -226,8 +226,8 @@ static inline bool arch_irqs_disabled(void)
>  #endif /* CONFIG_PPC_BOOK3S */
> =20
>  #ifdef CONFIG_PPC_BOOK3E
> -#define __hard_irq_enable()	asm volatile("wrteei 1" : : : "memory")
> -#define __hard_irq_disable()	asm volatile("wrteei 0" : : : "memory")
> +#define __hard_irq_enable()	wrteei(1)
> +#define __hard_irq_disable()	wrteei(0)
>  #else
>  #define __hard_irq_enable()	__mtmsrd(MSR_EE|MSR_RI, 1)
>  #define __hard_irq_disable()	__mtmsrd(MSR_RI, 1)
> @@ -280,8 +280,6 @@ extern void force_external_irq_replay(void);
> =20
>  #else /* CONFIG_PPC64 */
> =20
> -#define SET_MSR_EE(x)	mtmsr(x)
> -
>  static inline unsigned long arch_local_save_flags(void)
>  {
>  	return mfmsr();
> @@ -289,47 +287,44 @@ static inline unsigned long arch_local_save_flags(v=
oid)
> =20
>  static inline void arch_local_irq_restore(unsigned long flags)
>  {
> -#if defined(CONFIG_BOOKE)
> -	asm volatile("wrtee %0" : : "r" (flags) : "memory");
> -#else
> -	mtmsr(flags);
> -#endif
> +	if (IS_ENABLED(CONFIG_BOOKE))
> +		wrtee(flags);
> +	else
> +		mtmsr(flags);
>  }
> =20
>  static inline unsigned long arch_local_irq_save(void)
>  {
>  	unsigned long flags =3D arch_local_save_flags();
> -#ifdef CONFIG_BOOKE
> -	asm volatile("wrteei 0" : : : "memory");
> -#elif defined(CONFIG_PPC_8xx)
> -	wrtspr(SPRN_EID);
> -#else
> -	SET_MSR_EE(flags & ~MSR_EE);
> -#endif
> +
> +	if (IS_ENABLED(CONFIG_BOOKE))
> +		wrteei(0);
> +	else if (IS_ENABLED(CONFIG_PPC_8xx))
> +		wrtspr(SPRN_EID);
> +	else
> +		mtmsr(flags & ~MSR_EE);
> +
>  	return flags;
>  }
> =20
>  static inline void arch_local_irq_disable(void)
>  {
> -#ifdef CONFIG_BOOKE
> -	asm volatile("wrteei 0" : : : "memory");
> -#elif defined(CONFIG_PPC_8xx)
> -	wrtspr(SPRN_EID);
> -#else
> -	arch_local_irq_save();
> -#endif
> +	if (IS_ENABLED(CONFIG_BOOKE))
> +		wrteei(0);
> +	else if (IS_ENABLED(CONFIG_PPC_8xx))
> +		wrtspr(SPRN_EID);
> +	else
> +		mtmsr(mfmsr() & ~MSR_EE);
>  }
> =20
>  static inline void arch_local_irq_enable(void)
>  {
> -#ifdef CONFIG_BOOKE
> -	asm volatile("wrteei 1" : : : "memory");
> -#elif defined(CONFIG_PPC_8xx)
> -	wrtspr(SPRN_EIE);
> -#else
> -	unsigned long msr =3D mfmsr();
> -	SET_MSR_EE(msr | MSR_EE);
> -#endif
> +	if (IS_ENABLED(CONFIG_BOOKE))
> +		wrteei(1);
> +	else if (IS_ENABLED(CONFIG_PPC_8xx))
> +		wrtspr(SPRN_EIE);
> +	else
> +		mtmsr(mfmsr() | MSR_EE);
>  }
> =20
>  static inline bool arch_irqs_disabled_flags(unsigned long flags)
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index b17ee25df226..04896dd09455 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1361,6 +1361,8 @@ static inline void mtmsr_isync(unsigned long val)
>  #endif
>  #define wrtspr(rn)	asm volatile("mtspr " __stringify(rn) ",0" : \
>  				     : : "memory")
> +#define wrtee(val)	asm volatile("wrtee %0" : : "r" (val) : "memory")
> +#define wrteei(val)	asm volatile("wrteei %0" : : "i" (val) : "memory")

Can you implement just one macro that uses __builtin_constant_p to=20
select between the imm and reg versions? I forgot if there's some
corner cases that prevent that working with inline asm i constraints.

Otherwise, looks like a nice cleanup.

Thanks,
Nick
=
