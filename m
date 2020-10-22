Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C82957B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 07:13:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGwW72Lq7zDqCK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 16:13:39 +1100 (AEDT)
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
 header.s=20161025 header.b=C94vMxYa; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGwT95ww6zDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 16:11:56 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id w141so481261oia.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 22:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z4Zqf681VKO5sjug4U8sIywKeQCBPnc5TqWqazFZUxA=;
 b=C94vMxYaxrWzOUdT8dpDEoMFyogGQZRJ+jP3sUS/H4WyR6uV2C3XYrgHODoRBTQxNf
 v+fAIQuknpMhsqIUmiA18qVfLFqdo0UyoX8ZH8knHVv0o3AhQw/zO23qe14pQA1P9LGK
 qboibMdbRCC2cEOCIH4cmn5P2Iqz9IezoeJNG5L7Mc5r3jRtEbduCz814M94ojFH0FB5
 A07vn7W16V2rTHiTKs3saxfbvMlme6Hg9JRZb8xZleRISCAhA96Yd/WZF3I0xFw887Z3
 7i64eNRDz/IOeHR+jkChLVnAsW5h2mu/PSt7OOYilu4ScYNnRRb1C8MutUOKukEknsme
 bYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z4Zqf681VKO5sjug4U8sIywKeQCBPnc5TqWqazFZUxA=;
 b=FtItgjTh14zArMDliLklxh1RKCkXAgBSDy9fXKwFJUpXS3HPK0uC2+3TQNnIg5ei8h
 AIra6E98Q8ojX9Y/6aUo8g0mOFjeOAJBgTQHo3XvAOMgBws/S/nAPMB4Sl9Yly3i71gA
 VOEDXvnlRkmeTWre/7US/Miu9Pa1hnrc6xO662jGXsPSYUygj8uKnIOospEzMEK4HW8Y
 m4uhadhv5KokF+IUQjLaYa/9UhMDzBy8u2ureOnmJAGIOUBuQEm5Qy/rAbqwH9x7vo8z
 ZBEj+sjjDjV5RvJM13ixS92K9CRxieEdFOXSAXalNlCTwYJ65iitfTL2f2wOoN++8gdp
 pnYw==
X-Gm-Message-State: AOAM530KYl9QtzFEODVR5SBLDDBAoGnYAG/IWUk3lJam0LwZikTSK54E
 xYzPttYUmiEWFLV8Cc6k0BVpAs04g7EoR/HJqMw=
X-Google-Smtp-Source: ABdhPJyvu9af8xZKaVSJ7DVc1HZY5+loZGLFoubeOoIzaItDzNOrAkwi4sUm+nfKDl4rN9sPyHxZqNuq44KVfC+Ok3Q=
X-Received: by 2002:aca:32d5:: with SMTP id y204mr396622oiy.126.1603343512878; 
 Wed, 21 Oct 2020 22:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201022034039.330365-1-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20201022034039.330365-1-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 22 Oct 2020 16:11:41 +1100
Message-ID: <CACzsE9q2nYN88bupu5Ce4Eb6r5c-_8wRciWx6qZg2RdF3Ar8Yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc: Introduce POWER10_DD1 feature
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Neuling <mikey@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 maddy@linux.ibm.com, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 2:40 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> POWER10_DD1 feature flag will be needed while adding
> conditional code that applies only for Power10 DD1.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/cputable.h | 8 ++++++--
>  arch/powerpc/kernel/dt_cpu_ftrs.c   | 3 +++
>  arch/powerpc/kernel/prom.c          | 9 +++++++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index 93bc70d4c9a1..d486f56c0d33 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -216,6 +216,7 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
>  #define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
>  #define CPU_FTR_DAWR1                  LONG_ASM_CONST(0x0008000000000000)
> +#define CPU_FTR_POWER10_DD1            LONG_ASM_CONST(0x0010000000000000)
>
>  #ifndef __ASSEMBLY__
>
> @@ -479,6 +480,7 @@ static inline void cpu_feature_keys_init(void) { }
>             CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
>             CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
>             CPU_FTR_DAWR | CPU_FTR_DAWR1)
> +#define CPU_FTRS_POWER10_DD1   (CPU_FTRS_POWER10 | CPU_FTR_POWER10_DD1)
>  #define CPU_FTRS_CELL  (CPU_FTR_LWSYNC | \
>             CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
>             CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
> @@ -497,14 +499,16 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTRS_POSSIBLE      \
>             (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>              CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
> +            CPU_FTRS_POWER10_DD1)
>  #else
>  #define CPU_FTRS_POSSIBLE      \
>             (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>              CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>              CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>              CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
> +            CPU_FTRS_POWER10_DD1)
>  #endif /* CONFIG_CPU_LITTLE_ENDIAN */
>  #endif
>  #else
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 1098863e17ee..b2327f2967ff 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -811,6 +811,9 @@ static __init void cpufeatures_cpu_quirks(void)
>         }
>
>         update_tlbie_feature_flag(version);
> +
> +       if ((version & 0xffffffff) == 0x00800100)
> +               cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
>  }
>
>  static void __init cpufeatures_setup_finished(void)
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index c1545f22c077..c778c81284f7 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -305,6 +305,14 @@ static void __init check_cpu_feature_properties(unsigned long node)
>         }
>  }
>
> +static void __init fixup_cpu_features(void)
> +{
> +       unsigned long version = mfspr(SPRN_PVR);
> +
> +       if ((version & 0xffffffff) == 0x00800100)
> +               cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
> +}
> +
I am just wondering why this is needed here, but the same thing is not
done for, say, CPU_FTR_POWER9_DD2_1?
And should we get a /* Power10 DD 1 */ added to cpu_specs[]?

>  static int __init early_init_dt_scan_cpus(unsigned long node,
>                                           const char *uname, int depth,
>                                           void *data)
> @@ -378,6 +386,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>
>                 check_cpu_feature_properties(node);
>                 check_cpu_pa_features(node);
> +               fixup_cpu_features();
>         }
>
>         identical_pvr_fixup(node);
> --
> 2.25.1
>
