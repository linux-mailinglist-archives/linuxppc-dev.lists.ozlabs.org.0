Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFED06AD683
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 05:46:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW2vv3d0vz3cNJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 15:46:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XAZPC4p1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XAZPC4p1;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW2ty6yMyz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 15:45:30 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id kb15so12078854pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 20:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678164328;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nQXlj8ZF5e19XF2bWoBX4hZUgDJ1cP2r6TZC9HO7nY=;
        b=XAZPC4p1tJ4PczD8l0f9yhjuLov17PLNhBTheG5oWKZUhHLQVRsxKSxJWJ5QryY6Cx
         7Fojvx42BE+CxaKVoDNPKpq7JBiXx9x0MMIA4sjyRFgrR4ZieTlMVIULVH2roUNoi4s3
         xu48dkcs/YRuCDEUwFxvEeXGg9u2SN+aR2SXgMEcPMqn3xqgpITXdE9bwe8S2Pmt2c+e
         GYXnQTBQXnYhKFGkHF6pPwXV8ukYS7l0Ut78RtY3vuQ+Df50r3PTA1pCSi9SEwnbL7Qc
         SicU5Y8IhvxjTnSrr4m0ZF0vkyev1+dSDWDmw4i9ezJ/MB0EaTAJXpO33wc9MrZoHTb3
         1NPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678164328;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7nQXlj8ZF5e19XF2bWoBX4hZUgDJ1cP2r6TZC9HO7nY=;
        b=zoNlTqGUt/8n0rwpEAgpZbDsCKwvxLp54ojqzvr6EHfefdbOePnnZ3SMTm2S9IO2h0
         QDNCjhxGxg5UYyu5NahFbv3Tj877uLKa3X5TxVhC69M2V4XXuCG3WgRjOxcy6KxVl0JZ
         ExSlKYk0ATuBbG/Fzc8l0EEWi9IrfUsPfGU3yyVJ3fpK6jhThlC2mfjgMfxxrtyDp/zC
         CYL71CbpsNVnm1APoM/pZo3tUDBtQC2/PSKPpGe/qsHokZGVyDuqPFuRRP5SdjnxmLS8
         1WVj558xtYpdqPT/6Hv0hpNAYoLjOC3VxLoRdt5KR7/PE8kGB0R7WJRhw73k8sd++58x
         EiuA==
X-Gm-Message-State: AO0yUKXmNHnALn/5CY26KSI/IKzd6qXK10NCihZLEQsG7HtFm2GZeqZs
	xxRJK4hju1hd/u2YlA+UCTw=
X-Google-Smtp-Source: AK7set8A3yisZUmoSf9ivTflaiWUyVfl92KZVoXYnmMwPaWx1YPPDYxuk1t4LMEyS2q3THyQqV3KKg==
X-Received: by 2002:a05:6a20:3caa:b0:af:7233:5bfc with SMTP id b42-20020a056a203caa00b000af72335bfcmr14454761pzj.8.1678164327957;
        Mon, 06 Mar 2023 20:45:27 -0800 (PST)
Received: from localhost ([203.220.77.23])
        by smtp.gmail.com with ESMTPSA id a4-20020aa78644000000b005a8ba70315bsm7039621pfo.6.2023.03.06.20.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 20:45:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Mar 2023 14:45:22 +1000
Message-Id: <CQZVLQQBO6K9.2A71BY640ZH5P@bobo>
Subject: Re: [RFC PATCH 02/13] powerpc: Add initial Dynamic Execution
 Control Register (DEXCR) support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-3-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-3-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> ISA 3.1B introduces the Dynamic Execution Control Register (DEXCR). It
> is a per-cpu register that allows control over various CPU behaviours
> including branch hint usage, indirect branch speculation, and
> hashst/hashchk support.
>
> Though introduced in 3.1B, no CPUs using 3.1 were released, so
> CPU_FTR_ARCH_31 is used to determine support for the register itself.
> Support for each DEXCR bit (aspect) is reported separately by the
> firmware.
>
> Add various definitions and basic support for the DEXCR in the kernel.
> Right now it just initialises and maintains the DEXCR on process
> creation/swap, and clears it in reset_sprs().
>

A couple of comments below, but it looks good:

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kexec.h |  3 +++
>  arch/powerpc/include/asm/cputable.h        |  8 ++++++-
>  arch/powerpc/include/asm/processor.h       | 13 +++++++++++
>  arch/powerpc/include/asm/reg.h             |  6 ++++++
>  arch/powerpc/kernel/Makefile               |  1 +
>  arch/powerpc/kernel/dexcr.c                | 25 ++++++++++++++++++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c          |  4 ++++
>  arch/powerpc/kernel/process.c              | 13 ++++++++++-
>  arch/powerpc/kernel/prom.c                 |  4 ++++
>  9 files changed, 75 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/kernel/dexcr.c
>
> diff --git a/arch/powerpc/include/asm/book3s/64/kexec.h b/arch/powerpc/in=
clude/asm/book3s/64/kexec.h
> index d4b9d476ecba..563baf94a962 100644
> --- a/arch/powerpc/include/asm/book3s/64/kexec.h
> +++ b/arch/powerpc/include/asm/book3s/64/kexec.h
> @@ -21,6 +21,9 @@ static inline void reset_sprs(void)
>  			plpar_set_ciabr(0);
>  	}
> =20
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		mtspr(SPRN_DEXCR, 0);
> +
>  	/*  Do we need isync()? We are going via a kexec reset */
>  	isync();
>  }
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/a=
sm/cputable.h
> index 757dbded11dc..03bc192f2d8b 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -192,6 +192,10 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
>  #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
>  #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
> +#define CPU_FTR_DEXCR_SBHE		LONG_ASM_CONST(0x0010000000000000)
> +#define CPU_FTR_DEXCR_IBRTPD		LONG_ASM_CONST(0x0020000000000000)
> +#define CPU_FTR_DEXCR_SRAPD		LONG_ASM_CONST(0x0040000000000000)
> +#define CPU_FTR_DEXCR_NPHIE		LONG_ASM_CONST(0x0080000000000000)

We potentially don't need to use CPU_FTR bits for each of these. We
only really want them to use instruction patching and make feature
tests fast. But we have been a bit liberal with using them and they
are kind of tied into cpu feature parsing code so maybe it's easier
to go with them for now.

> =20
>  #ifndef __ASSEMBLY__
> =20
> @@ -451,7 +455,9 @@ static inline void cpu_feature_keys_init(void) { }
>  	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
>  	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
>  	    CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
> -	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
> +	    CPU_FTR_DAWR | CPU_FTR_DAWR1 | \
> +	    CPU_FTR_DEXCR_SBHE | CPU_FTR_DEXCR_IBRTPD | CPU_FTR_DEXCR_SRAPD | \
> +	    CPU_FTR_DEXCR_NPHIE)
>  #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
>  	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
>  	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/=
asm/processor.h
> index 631802999d59..0a8a793b8b8b 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -446,6 +446,19 @@ int exit_vmx_usercopy(void);
>  int enter_vmx_ops(void);
>  void *exit_vmx_ops(void *dest);
> =20
> +#ifdef CONFIG_PPC_BOOK3S_64
> +
> +unsigned long get_thread_dexcr(struct thread_struct const *t);
> +
> +#else
> +
> +static inline unsigned long get_thread_dexcr(struct thread_struct const =
*t)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_PPC_BOOK3S_64 */
> +
>  #endif /* __KERNEL__ */
>  #endif /* __ASSEMBLY__ */
>  #endif /* _ASM_POWERPC_PROCESSOR_H */
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index 1e8b2e04e626..cdd1f174c399 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -385,6 +385,12 @@
>  #define SPRN_HSRR0	0x13A	/* Hypervisor Save/Restore 0 */
>  #define SPRN_HSRR1	0x13B	/* Hypervisor Save/Restore 1 */
>  #define SPRN_ASDR	0x330	/* Access segment descriptor register */
> +#define SPRN_DEXCR	0x33C	/* Dynamic execution control register */
> +#define   DEXCR_PRO_MASK(aspect)	__MASK(63 - (32 + (aspect)))	/* Aspect =
number to problem state aspect mask */

I think PR is a better shorthand for problem state than PRO. It's just
more commonly used.

We also have PPC_BIT and PPC_BITMASK, _BIT being used for single-bit
mask. So this could be -

#define DEXCR_PR_BIT(aspect) PPC_BIT(32 + (aspect))

Or maybe DEXCR_PR_ASPECT_BIT.

> +#define   DEXCR_PRO_SBHE		DEXCR_PRO_MASK(0)	/* Speculative Branch Hint E=
nable */
> +#define   DEXCR_PRO_IBRTPD		DEXCR_PRO_MASK(3)	/* Indirect Branch Recurre=
nt Target Prediction Disable */
> +#define   DEXCR_PRO_SRAPD		DEXCR_PRO_MASK(4)	/* Subroutine Return Addres=
s Prediction Disable */
> +#define   DEXCR_PRO_NPHIE		DEXCR_PRO_MASK(5)	/* Non-Privileged Hash Inst=
ruction Enable */
>  #define SPRN_IC		0x350	/* Virtual Instruction Count */
>  #define SPRN_VTB	0x351	/* Virtual Time Base */
>  #define SPRN_LDBAR	0x352	/* LD Base Address Register */
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 9b6146056e48..b112315cfdc2 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_VDSO32)		+=3D vdso32_wrapper.o
>  obj-$(CONFIG_PPC_WATCHDOG)	+=3D watchdog.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+=3D hw_breakpoint.o
>  obj-$(CONFIG_PPC_DAWR)		+=3D dawr.o
> +obj-$(CONFIG_PPC_BOOK3S_64)	+=3D dexcr.o
>  obj-$(CONFIG_PPC_BOOK3S_64)	+=3D cpu_setup_ppc970.o cpu_setup_pa6t.o
>  obj-$(CONFIG_PPC_BOOK3S_64)	+=3D cpu_setup_power.o
>  obj-$(CONFIG_PPC_BOOK3S_64)	+=3D mce.o mce_power.o
> diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
> new file mode 100644
> index 000000000000..32a0a69ff638
> --- /dev/null
> +++ b/arch/powerpc/kernel/dexcr.c
> @@ -0,0 +1,25 @@
> +#include <linux/cache.h>
> +#include <linux/init.h>
> +
> +#include <asm/cpu_has_feature.h>
> +#include <asm/cputable.h>
> +#include <asm/processor.h>
> +#include <asm/reg.h>
> +
> +#define DEFAULT_DEXCR	0
> +
> +static int __init dexcr_init(void)
> +{
> +	if (!early_cpu_has_feature(CPU_FTR_ARCH_31))
> +		return 0;
> +
> +	mtspr(SPRN_DEXCR, DEFAULT_DEXCR);
> +
> +	return 0;
> +}
> +early_initcall(dexcr_init);
> +
> +unsigned long get_thread_dexcr(struct thread_struct const *t)
> +{
> +	return DEFAULT_DEXCR;
> +}
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_c=
pu_ftrs.c
> index c3fb9fdf5bd7..896a48211a37 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -661,6 +661,10 @@ static struct dt_cpu_feature_match __initdata
>  	{"prefix-instructions", feat_enable, 0},
>  	{"matrix-multiply-assist", feat_enable_mma, 0},
>  	{"debug-facilities-v31", feat_enable, CPU_FTR_DAWR1},
> +	{"dexcr-speculative-branch-hint-enable", feat_enable, CPU_FTR_DEXCR_SBH=
E},
> +	{"dexcr-indirect-branch-recurrent-target-prediction-disable", feat_enab=
le, CPU_FTR_DEXCR_IBRTPD},
> +	{"dexcr-subroutine-return-address-prediction-disable", feat_enable, CPU=
_FTR_DEXCR_SRAPD},
> +	{"dexcr-non-privileged-hash-instruction-enable", feat_enable, CPU_FTR_D=
EXCR_NPHIE},
>  };
> =20
>  static bool __initdata using_dt_cpu_ftrs;
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.=
c
> index 67da147fe34d..17d26f652b80 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1228,6 +1228,13 @@ static inline void restore_sprs(struct thread_stru=
ct *old_thread,
>  	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
>  	    old_thread->tidr !=3D new_thread->tidr)
>  		mtspr(SPRN_TIDR, new_thread->tidr);
> +
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		unsigned long new_dexcr =3D get_thread_dexcr(new_thread);
> +
> +		if (new_dexcr !=3D get_thread_dexcr(old_thread))
> +			mtspr(SPRN_DEXCR, new_dexcr);
> +	}
>  #endif
> =20
>  }
> @@ -1802,7 +1809,7 @@ int copy_thread(struct task_struct *p, const struct=
 kernel_clone_args *args)
> =20
>  	setup_ksp_vsid(p, sp);
> =20
> -#ifdef CONFIG_PPC64=20
> +#ifdef CONFIG_PPC64
>  	if (cpu_has_feature(CPU_FTR_DSCR)) {
>  		p->thread.dscr_inherit =3D current->thread.dscr_inherit;
>  		p->thread.dscr =3D mfspr(SPRN_DSCR);
> @@ -1939,6 +1946,10 @@ void start_thread(struct pt_regs *regs, unsigned l=
ong start, unsigned long sp)
>  	current->thread.tm_tfiar =3D 0;
>  	current->thread.load_tm =3D 0;
>  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
> +#endif /* CONFIG_PPC_BOOK3S_64 */

You possibly don't need the ifdef here because CPU_FTR_ARCH_31 should
fold away. Some of the others do because they're using open-coded
access to struct members, but if you're using accessor functions to
get and set such things, there may be no need to.

I think my preference is for your style.

Thanks,
Nick

>  }
>  EXPORT_SYMBOL(start_thread);
> =20
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 1eed87d954ba..eff250e1ae9a 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -180,6 +180,10 @@ static struct ibm_feature ibm_pa_features[] __initda=
ta =3D {
>  	  .cpu_user_ftrs2 =3D PPC_FEATURE2_HTM_COMP | PPC_FEATURE2_HTM_NOSC_COM=
P },
> =20
>  	{ .pabyte =3D 64, .pabit =3D 0, .cpu_features =3D CPU_FTR_DAWR1 },
> +	{ .pabyte =3D 68, .pabit =3D 0, .cpu_features =3D CPU_FTR_DEXCR_SBHE },
> +	{ .pabyte =3D 68, .pabit =3D 3, .cpu_features =3D CPU_FTR_DEXCR_IBRTPD =
},
> +	{ .pabyte =3D 68, .pabit =3D 4, .cpu_features =3D CPU_FTR_DEXCR_SRAPD }=
,
> +	{ .pabyte =3D 68, .pabit =3D 5, .cpu_features =3D CPU_FTR_DEXCR_NPHIE }=
,
>  };
> =20
>  /*
> --=20
> 2.38.1

