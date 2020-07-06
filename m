Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA4215121
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 04:17:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0TjK5lgXzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 12:17:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=NAcTsUad; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0T512YLRzDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:49:09 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u185so14281656pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jeFUjj8Lz5Vbd73o5uE0bUamoXVXSeGnU5NTkDgrvVM=;
 b=NAcTsUadNayhrUOrlrre1Y4A0k9qTeOsHqBFPwG8pVf/YqeGpGlGNimvWfVRYHA+UL
 Xxm0fkUR6dqPn1LDXHk55lu1nmhB0anfC6EYqu6Ch/OrKfPcsBVtRaWaY4TUblYn8VpR
 kKQFiW9JM5JAZS0G8XyCA87yh4eG4SL1saZjrnX9SnFt3BNIxMNr3AcVS2XDycmYhkkR
 NBFOr5unqloKcgn17VxuKBqUFARnVoBFOgtVY3akhe4P/65ZIvquQJdJsbKy/Js8aeqw
 rB5iY9+xUftNYfxGsCmawAKWG4F0YoUf8SRldRBizkfUkfLpPuJK8DgJTOenvLmpslKk
 TqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jeFUjj8Lz5Vbd73o5uE0bUamoXVXSeGnU5NTkDgrvVM=;
 b=lH/w4wXMcPockf3r0IXsmpoG5mNRYo/5HpPzWZES9yJWaeEivjy65rZT5efCSPXMv8
 +xMDdvcwV531ywetAYNJR+LRGyroUZsx159SZgKTYQwmQHM/YynXmHq0dLHQvE7uLcAs
 3oeTQga7BLh/0JlkpKck3aFtg823PdqfaAVPaptF73hC1YO+JPTe12lMb6JHCf9GguPl
 556Ln8Ikkt0MQ/yoDmkuvMz+hsN+Yyg+TeFNyA2si+Y5Feu/xYU7zPA3wJaH06OBBBil
 q8XWlMjuUUl80ESKSt8DrVJoKfRpi9bMVdz4DZuJpUkF0OteB2GbXIznBNSbBz7LkzFJ
 gnNw==
X-Gm-Message-State: AOAM531n1uZQCptNdi+6lTp4Okh0lWtFSy/HiZL3zDaZCuXjfnssxKDa
 4H7ywbsXwWZNkZYrMtnYWlByLw==
X-Google-Smtp-Source: ABdhPJwmcqy2TZZpX/9e0dGxoEAclTu16WKOkWbe12fDjwVGsjUr/zlEVAGy4yr5CbHl0OfiwgOVSA==
X-Received: by 2002:a63:b255:: with SMTP id t21mr28880320pgo.78.1594000145309; 
 Sun, 05 Jul 2020 18:49:05 -0700 (PDT)
Received: from localhost ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id i125sm17346773pgd.21.2020.07.05.18.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:49:04 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/3] powerpc/mm: Enable radix GTSE only if supported.
In-Reply-To: <20200703053608.12884-2-bharata@linux.ibm.com>
References: <20200703053608.12884-1-bharata@linux.ibm.com>
 <20200703053608.12884-2-bharata@linux.ibm.com>
Date: Mon, 06 Jul 2020 07:19:02 +0530
Message-ID: <87v9j14dm9.fsf@santosiv.in.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Bharata,

Bharata B Rao <bharata@linux.ibm.com> writes:

> Make GTSE an MMU feature and enable it by default for radix.
> However for guest, conditionally enable it if hypervisor supports
> it via OV5 vector. Let prom_init ask for radix GTSE only if the
> support exists.
>
> Having GTSE as an MMU feature will make it easy to enable radix
> without GTSE. Currently radix assumes GTSE is enabled by default.
>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/mmu.h    |  4 ++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c |  1 +
>  arch/powerpc/kernel/prom_init.c   | 13 ++++++++-----
>  arch/powerpc/mm/init_64.c         |  5 ++++-
>  4 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index f4ac25d4df05..884d51995934 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -28,6 +28,9 @@
>   * Individual features below.
>   */
>  
> +/* Guest Translation Shootdown Enable */
> +#define MMU_FTR_GTSE			ASM_CONST(0x00001000)
> +
>  /*
>   * Support for 68 bit VA space. We added that from ISA 2.05
>   */
> @@ -173,6 +176,7 @@ enum {
>  #endif
>  #ifdef CONFIG_PPC_RADIX_MMU
>  		MMU_FTR_TYPE_RADIX |
> +		MMU_FTR_GTSE |
>  #ifdef CONFIG_PPC_KUAP
>  		MMU_FTR_RADIX_KUAP |
>  #endif /* CONFIG_PPC_KUAP */
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index a0edeb391e3e..ac650c233cd9 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -336,6 +336,7 @@ static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
>  #ifdef CONFIG_PPC_RADIX_MMU
>  	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
>  	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
> +	cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
>  	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
>  
>  	return 1;
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 90c604d00b7d..cbc605cfdec0 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1336,12 +1336,15 @@ static void __init prom_check_platform_support(void)
>  		}
>  	}
>  
> -	if (supported.radix_mmu && supported.radix_gtse &&
> -	    IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
> -		/* Radix preferred - but we require GTSE for now */
> -		prom_debug("Asking for radix with GTSE\n");
> +	if (supported.radix_mmu && IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
> +		/* Radix preferred - Check if GTSE is also supported */
> +		prom_debug("Asking for radix\n");
>  		ibm_architecture_vec.vec5.mmu = OV5_FEAT(OV5_MMU_RADIX);
> -		ibm_architecture_vec.vec5.radix_ext = OV5_FEAT(OV5_RADIX_GTSE);
> +		if (supported.radix_gtse)
> +			ibm_architecture_vec.vec5.radix_ext =
> +					OV5_FEAT(OV5_RADIX_GTSE);
> +		else
> +			prom_debug("Radix GTSE isn't supported\n");
>  	} else if (supported.hash_mmu) {
>  		/* Default to hash mmu (if we can) */
>  		prom_debug("Asking for hash\n");
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index bc73abf0bc25..152aa0200cef 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -407,12 +407,15 @@ static void __init early_check_vec5(void)
>  		if (!(vec5[OV5_INDX(OV5_RADIX_GTSE)] &
>  						OV5_FEAT(OV5_RADIX_GTSE))) {
>  			pr_warn("WARNING: Hypervisor doesn't support RADIX with GTSE\n");
> -		}
> +			cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
> +		} else
> +			cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;

The GTSE flag is set by default in feat_enable_mmu_radix(), should it
be set again here?

Thanks,
Santosh
>  		/* Do radix anyway - the hypervisor said we had to */
>  		cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
>  	} else if (mmu_supported == OV5_FEAT(OV5_MMU_HASH)) {
>  		/* Hypervisor only supports hash - disable radix */
>  		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
> +		cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
>  	}
>  }
>  
> -- 
> 2.21.3
