Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFBD1D8E6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 06:00:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R2GH3M6TzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 14:00:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hmtKiMaD; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R2Dm0vKqzDqhY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 13:58:47 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id w4so7283433oia.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 20:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HJTiE9dD9ZPWA8sLYg5gXrxoiqubkO0zEeEQ294t5pA=;
 b=hmtKiMaDUMw4jgTtTIEDmSL+h8QMlE7TZMIY7QoxoqylPBS8T+ENPrz8IPJB+DKUYb
 WFQxea3QzIWoNkXXZSlka217uUz/74dnMLGkhnVlGeUPfDrgkRD/Gk+02ep7yI+8ibw9
 dnqUFgyNduReqCNKnlfax1+rH40kGOR1P34GPwDVmCg4cY5nIXGNQfDAfmLUbu66sN+1
 ISia0H0rZBPpTp6W/pDM7XHqRzsLQCNJ5+1NxhEloha9FVA7MW0z5zn16Z4kvkUZ2vIb
 r9FQzTJn1uiquMpMCxyo6FSECUT0xMe9FDC6S9LMwuQw2QD2YYV3N4IBVoS83C9R1R1Q
 ab2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HJTiE9dD9ZPWA8sLYg5gXrxoiqubkO0zEeEQ294t5pA=;
 b=k6XfTD+aKXXGL1QSaWR0YWQqlGP3beMMru3/ueUsYptkmffEBSyIAjes7ehZO8cR5v
 /C/MdOEKVGrnyKmcHNQC4BmYKhaAGSWFb2lpqE8Z/pDr3OL01lqETXUpcNzLtEu2nrpU
 go9Y94rqtEw7b7PBJBUdy9wpb9vKVJN91P9DliGxMGBghilNIgVVzkfddufnxmFPoO7e
 Y6zuo5YexUwpYfGV2669xV0ZkKmMPhFnDBHQOiuIGvFUsIuPz50IHpuAUaxGAcdNWRgs
 nLMDfMgWDUBfAaKqoABYCOifJjUnE7kDmuWCpUgRCCUnkxRiP7sW4Iy1tOF2mmAJ4TJX
 bI2g==
X-Gm-Message-State: AOAM53032Q3839q4xMDuOBWuh9p7GUY/yaFQaybmkOVk0zu7eM1V3W3m
 QWF6yfwx+2zRxngI0PZGY77yr5xbQGFjwv4FeeE=
X-Google-Smtp-Source: ABdhPJzMaQVc2BxC/KcbCxN7zCpE0v5zm+vjE4ZeK5TdkKR9Ywr3evwYqcbrxt+PydrB6nqyrs8+paiHIBjnMlhaejs=
X-Received: by 2002:a05:6808:3d5:: with SMTP id
 o21mr1959177oie.40.1589860725009; 
 Mon, 18 May 2020 20:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-8-alistair@popple.id.au>
In-Reply-To: <20200519003157.31946-8-alistair@popple.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 19 May 2020 13:58:32 +1000
Message-ID: <CACzsE9rquGek_MJ9WFBq-FK1gZ7e7qK85xs3BTEvwK950EDjsg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] powerpc: Add POWER10 architected mode
To: Alistair Popple <alistair@popple.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 10:48 AM Alistair Popple <alistair@popple.id.au> wr=
ote:
>
> PVR value of 0x0F000006 means we are arch v3.1 compliant (i.e. POWER10).
> This is used by phyp and kvm when booting as a pseries guest to detect
> the presence of new P10 features and to enable the appropriate hwcap and
> facility bits.
>
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/cputable.h   | 15 ++++++++++++--
>  arch/powerpc/include/asm/mmu.h        |  1 +
>  arch/powerpc/include/asm/prom.h       |  1 +
>  arch/powerpc/kernel/cpu_setup_power.S | 20 ++++++++++++++++--
>  arch/powerpc/kernel/cputable.c        | 30 +++++++++++++++++++++++++++
>  arch/powerpc/kernel/prom_init.c       | 12 +++++++++--
>  6 files changed, 73 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/a=
sm/cputable.h
> index 36f894dea9e7..10b6d93c9d0b 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -468,6 +468,17 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | =
\
>                                CPU_FTR_P9_TM_HV_ASSIST | \
>                                CPU_FTR_P9_TM_XER_SO_BUG)
> +#define CPU_FTRS_POWER10 (CPU_FTR_LWSYNC | \
> +           CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
> +           CPU_FTR_MMCRA | CPU_FTR_SMT | \
> +           CPU_FTR_COHERENT_ICACHE | \
> +           CPU_FTR_PURR | CPU_FTR_SPURR | CPU_FTR_REAL_LE | \
> +           CPU_FTR_DSCR | CPU_FTR_SAO  | \
> +           CPU_FTR_STCX_CHECKS_ADDRESS | CPU_FTR_POPCNTB | CPU_FTR_POPCN=
TD | \
> +           CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
> +           CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
> +           CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
> +           CPU_FTR_ARCH_31)
>  #define CPU_FTRS_CELL  (CPU_FTR_LWSYNC | \
>             CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
>             CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
> @@ -486,14 +497,14 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTRS_POSSIBLE      \
>             (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>              CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | =
\
> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2)
> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POW=
ER10)
>  #else
>  #define CPU_FTRS_POSSIBLE      \
>             (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>              CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>              CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>              CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | =
\
> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2)
> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POW=
ER10)
>  #endif /* CONFIG_CPU_LITTLE_ENDIAN */
>  #endif
>  #else
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mm=
u.h
> index 0699cfeeb8c9..17b19510f204 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -122,6 +122,7 @@
>  #define MMU_FTRS_POWER7                MMU_FTRS_POWER6
>  #define MMU_FTRS_POWER8                MMU_FTRS_POWER6
>  #define MMU_FTRS_POWER9                MMU_FTRS_POWER6
> +#define MMU_FTRS_POWER10       MMU_FTRS_POWER6
>  #define MMU_FTRS_CELL          MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
>                                 MMU_FTR_CI_LARGE_PAGE
>  #define MMU_FTRS_PA6T          MMU_FTRS_DEFAULT_HPTE_ARCH_V2 | \
> diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/p=
rom.h
> index 94e3fd54f2c8..324a13351749 100644
> --- a/arch/powerpc/include/asm/prom.h
> +++ b/arch/powerpc/include/asm/prom.h
> @@ -117,6 +117,7 @@ extern int of_read_drc_info_cell(struct property **pr=
op,
>  #define OV1_PPC_2_07           0x01    /* set if we support PowerPC 2.07=
 */
>
>  #define OV1_PPC_3_00           0x80    /* set if we support PowerPC 3.00=
 */
> +#define OV1_PPC_3_1                    0x40    /* set if we support Powe=
rPC 3.1 */
>
>  /* Option vector 2: Open Firmware options supported */
>  #define OV2_REAL_MODE          0x20    /* set if we want OF in real mode=
 */
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/=
cpu_setup_power.S
> index a460298c7ddb..f3730cf904fa 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -91,10 +91,15 @@ _GLOBAL(__restore_cpu_power8)
>         mtlr    r11
>         blr
>
> +_GLOBAL(__setup_cpu_power10)
> +       mflr    r11
> +       bl      __init_FSCR_P10
> +       b       1f
> +
>  _GLOBAL(__setup_cpu_power9)
>         mflr    r11
>         bl      __init_FSCR
> -       bl      __init_PMU
> +1:     bl      __init_PMU
>         bl      __init_hvmode_206
>         mtlr    r11
>         beqlr
> @@ -116,10 +121,15 @@ _GLOBAL(__setup_cpu_power9)
>         mtlr    r11
>         blr
>
> +_GLOBAL(__restore_cpu_power10)
> +       mflr    r11
> +       bl      __init_FSCR_P10
> +       b       1f
> +
>  _GLOBAL(__restore_cpu_power9)
>         mflr    r11
>         bl      __init_FSCR
> -       bl      __init_PMU
> +1:     bl      __init_PMU
>         mfmsr   r3
>         rldicl. r0,r3,4,63
>         mtlr    r11
> @@ -182,6 +192,12 @@ __init_LPCR_ISA300:
>         isync
>         blr
>
> +__init_FSCR_P10:
> +       mfspr   r3,SPRN_FSCR
> +       ori     r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB|FSCR_PREFIX
> +       mtspr   SPRN_FSCR,r3
> +       blr
> +
>  __init_FSCR:
>         mfspr   r3,SPRN_FSCR
>         ori     r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputabl=
e.c
> index 13eba2eb46fe..a17eeb311cdb 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -70,6 +70,8 @@ extern void __setup_cpu_power8(unsigned long offset, st=
ruct cpu_spec* spec);
>  extern void __restore_cpu_power8(void);
>  extern void __setup_cpu_power9(unsigned long offset, struct cpu_spec* sp=
ec);
>  extern void __restore_cpu_power9(void);
> +extern void __setup_cpu_power10(unsigned long offset, struct cpu_spec* s=
pec);
> +extern void __restore_cpu_power10(void);
>  extern long __machine_check_early_realmode_p7(struct pt_regs *regs);
>  extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
>  extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
> @@ -119,6 +121,10 @@ extern void __restore_cpu_e6500(void);
>                                  PPC_FEATURE2_ARCH_3_00 | \
>                                  PPC_FEATURE2_HAS_IEEE128 | \
>                                  PPC_FEATURE2_DARN )
> +#define COMMON_USER_POWER10    COMMON_USER_POWER9
> +#define COMMON_USER2_POWER10   (COMMON_USER2_POWER9 | \
> +                                PPC_FEATURE2_ARCH_3_1 | \
> +                                PPC_FEATURE2_MMA)
>
>  #ifdef CONFIG_PPC_BOOK3E_64
>  #define COMMON_USER_BOOKE      (COMMON_USER_PPC64 | PPC_FEATURE_BOOKE)
> @@ -127,6 +133,14 @@ extern void __restore_cpu_e6500(void);
>                                  PPC_FEATURE_BOOKE)
>  #endif
>
> +#ifdef CONFIG_PPC64
> +static void setup_cpu_power10(unsigned long offset, struct cpu_spec* spe=
c)
> +{
> +       __setup_cpu_power10(offset, spec);
> +       current->thread.fscr |=3D FSCR_PREFIX;
> +}
> +#endif
> +
>  static struct cpu_spec __initdata cpu_specs[] =3D {
>  #ifdef CONFIG_PPC_BOOK3S_64
>         {       /* PPC970 */
> @@ -367,6 +381,22 @@ static struct cpu_spec __initdata cpu_specs[] =3D {
>                 .cpu_restore            =3D __restore_cpu_power9,
>                 .platform               =3D "power9",
>         },
> +       {       /* 3.1-compliant processor, i.e. Power10 "architected" mo=
de */
> +               .pvr_mask               =3D 0xffffffff,
> +               .pvr_value              =3D 0x0f000006,
> +               .cpu_name               =3D "POWER10 (architected)",
> +               .cpu_features           =3D CPU_FTRS_POWER10,
> +               .cpu_user_features      =3D COMMON_USER_POWER10,
> +               .cpu_user_features2     =3D COMMON_USER2_POWER10,
> +               .mmu_features           =3D MMU_FTRS_POWER10,
> +               .icache_bsize           =3D 128,
> +               .dcache_bsize           =3D 128,
> +               .oprofile_type          =3D PPC_OPROFILE_INVALID,
> +               .oprofile_cpu_type      =3D "ppc64/ibm-compat-v1",
> +               .cpu_setup              =3D setup_cpu_power10,
> +               .cpu_restore            =3D __restore_cpu_power10,
> +               .platform               =3D "power10",
> +       },
>         {       /* Power7 */
>                 .pvr_mask               =3D 0xffff0000,
>                 .pvr_value              =3D 0x003f0000,
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
> index 806be751c336..1ecadbd7e8b2 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -920,7 +920,7 @@ struct option_vector6 {
>  } __packed;
>
>  struct ibm_arch_vec {
> -       struct { u32 mask, val; } pvrs[12];
> +       struct { u32 mask, val; } pvrs[14];
>
>         u8 num_vectors;
>
> @@ -973,6 +973,14 @@ static const struct ibm_arch_vec ibm_architecture_ve=
c_template __initconst =3D {
>                         .mask =3D cpu_to_be32(0xffff0000), /* POWER9 */
>                         .val  =3D cpu_to_be32(0x004e0000),
>                 },
> +               {
> +                       .mask =3D cpu_to_be32(0xffff0000), /* POWER10 */
> +                       .val  =3D cpu_to_be32(0x00800000),
Should there be a POWER10 (raw) entry added to cpu_specs[] for this?
> +               },
> +               {
> +                       .mask =3D cpu_to_be32(0xffffffff), /* all 3.1-com=
pliant */
> +                       .val  =3D cpu_to_be32(0x0f000006),
> +               },
>                 {
>                         .mask =3D cpu_to_be32(0xffffffff), /* all 3.00-co=
mpliant */
>                         .val  =3D cpu_to_be32(0x0f000005),
> @@ -1002,7 +1010,7 @@ static const struct ibm_arch_vec ibm_architecture_v=
ec_template __initconst =3D {
>                 .byte1 =3D 0,
>                 .arch_versions =3D OV1_PPC_2_00 | OV1_PPC_2_01 | OV1_PPC_=
2_02 | OV1_PPC_2_03 |
>                                  OV1_PPC_2_04 | OV1_PPC_2_05 | OV1_PPC_2_=
06 | OV1_PPC_2_07,
> -               .arch_versions3 =3D OV1_PPC_3_00,
> +               .arch_versions3 =3D OV1_PPC_3_00 | OV1_PPC_3_1,
>         },
>
>         .vec2_len =3D VECTOR_LENGTH(sizeof(struct option_vector2)),
> --
> 2.20.1
>
