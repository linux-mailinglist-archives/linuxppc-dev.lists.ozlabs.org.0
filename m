Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2AD295D78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 13:37:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH5200YPPzDqsD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 22:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH4zW6NcGzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 22:35:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ao9NFJ37; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CH4zS32sWz9sTL;
 Thu, 22 Oct 2020 22:35:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603366517;
 bh=fLV/hBxweo+5+ydwjYlh3kzBZ5hO8ee2okOeHombnm0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ao9NFJ37HrRHYRZrzPVa28sXhBGgtP5q3bQqoJfL/EaZ8J0jv2CGypjEKt1FyPA4C
 NGSHUv8kdsR6oAIaFKx6bgfs/BH6dwp1Db776qfNScb5OKYiB6JvcnefQv2znDwib+
 BjILb+CZSRX0xZ8UEX8rSCne76lXT7Vlq/plFsPdjAvlNS50/R4HWz3eHU/HzpD6Jr
 Sr3EOM3nRQRNsotfuBSVXlovWn1d46AaHm3yqe/u7ulNKhgeyKWgFU3sG8JZ4Q2tWb
 kEAymD14XhYO9iIQqDWZpqLerQSjDUlp9vl8PocYFR2YEgsVTHl/uLG+TETKcGIzjP
 wTD9m/ZMaExxQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc: Introduce POWER10_DD1 feature
In-Reply-To: <20201020054454.194343-1-ravi.bangoria@linux.ibm.com>
References: <20201020054454.194343-1-ravi.bangoria@linux.ibm.com>
Date: Thu, 22 Oct 2020 22:35:12 +1100
Message-ID: <87ft66xzm7.fsf@mpe.ellerman.id.au>
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@linux.ibm.com,
 jniethe5@gmail.com, npiggin@gmail.com, maddy@linux.ibm.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
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
>  #define CPU_FTR_P9_RADIX_PREFETCH_BUG	LONG_ASM_CONST(0x0002000000000000)
>  #define CPU_FTR_ARCH_31			LONG_ASM_CONST(0x0004000000000000)
>  #define CPU_FTR_DAWR1			LONG_ASM_CONST(0x0008000000000000)
> +#define CPU_FTR_POWER10_DD1		LONG_ASM_CONST(0x0010000000000000)
>  
>  #ifndef __ASSEMBLY__
>  
> @@ -479,6 +480,7 @@ static inline void cpu_feature_keys_init(void) { }
>  	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S | \
>  	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_ARCH_31 | \
>  	    CPU_FTR_DAWR | CPU_FTR_DAWR1)
> +#define CPU_FTRS_POWER10_DD1	(CPU_FTRS_POWER10 | CPU_FTR_POWER10_DD1)
>  #define CPU_FTRS_CELL	(CPU_FTR_LWSYNC | \
>  	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | \
>  	    CPU_FTR_ALTIVEC_COMP | CPU_FTR_MMCRA | CPU_FTR_SMT | \
> @@ -497,14 +499,16 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTRS_POSSIBLE	\
>  	    (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>  	     CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
> -	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
> +	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
> +	     CPU_FTRS_POWER10_DD1)
>  #else
>  #define CPU_FTRS_POSSIBLE	\
>  	    (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>  	     CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>  	     CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>  	     CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
> -	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
> +	     CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
> +	     CPU_FTRS_POWER10_DD1)
>  #endif /* CONFIG_CPU_LITTLE_ENDIAN */
>  #endif
>  #else
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 1098863e17ee..b2327f2967ff 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -811,6 +811,9 @@ static __init void cpufeatures_cpu_quirks(void)
>  	}
>  
>  	update_tlbie_feature_flag(version);
> +
> +	if ((version & 0xffffffff) == 0x00800100)
> +		cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
>  }
>  
>  static void __init cpufeatures_setup_finished(void)
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index c1545f22c077..c778c81284f7 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -305,6 +305,14 @@ static void __init check_cpu_feature_properties(unsigned long node)
>  	}
>  }
>  
> +static void __init fixup_cpu_features(void)
> +{
> +	unsigned long version = mfspr(SPRN_PVR);
> +
> +	if ((version & 0xffffffff) == 0x00800100)
> +		cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
> +}
> +
>  static int __init early_init_dt_scan_cpus(unsigned long node,
>  					  const char *uname, int depth,
>  					  void *data)
> @@ -378,6 +386,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>  
>  		check_cpu_feature_properties(node);
>  		check_cpu_pa_features(node);
> +		fixup_cpu_features();
>  	}

This is not the way we normally do CPU features.

In the past we have always added a raw entry in cputable.c, see eg. the
Power9 DD 2.0, 2.1 entries.

Doing it here is not really safe, if you're running with an architected
PVR (via cpu-version property), you can't set the DD1 feature, because
you might be migrated to a future CPU that doesn't have the DD1 quirks.

cheers
