Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F220BACE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 22:57:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tq2w1flzzDqP5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 06:57:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=mopsfelder@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZeA7cAyZ; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tq0Y6xVHzDr0V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 06:55:39 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id c139so10028676qkg.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 13:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6V/8vcci/nVPA/EuCklZ3OJDmNJKHN6SRm7VyBhOyp0=;
 b=ZeA7cAyZdCB5B4KH+9EOkTjj8aumffznSYKOLsXJMUNm0IQnfewMQyF7dYqhp3UtgS
 1D6i8YitslXrfN8QeQbNvqSzgfhjrWWmvnzTBzeS2HEJUH6echu8BjhG3wiE+9UueDH9
 YrKX9ZNacIx2XdwFEgU7dGkXbs8owqAWJ4Wx4MCtxLoqCJ3E3HgAA/G1lWzT5SKurcM5
 r4DNSqwFOd3080VQeP9LFURo097B/aiORmx55iVQM+JdyK+9Zf/qxCBf87PNEFVGynkQ
 1jiSDhu3U5QkOJB0BJgUcxXYHhq1UMF3yaoMLminMgwZKO/7lJv9isB55P7QIFbA6NVL
 +q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6V/8vcci/nVPA/EuCklZ3OJDmNJKHN6SRm7VyBhOyp0=;
 b=peQssf7aCDHPMiFhZqIXbrbLBeJGfGzUDWHTG8+aELQP4CHTMuB+5Id/auacH61otK
 FdrLB6h+3N0U5i2dxp/HLj7iaede0mOTY4s70ee+wPXMwGx4LqUgZXB0hah1Mkncl2ju
 QwM1Rks9PDIUbbvc+yR+3y3GAvs4T3wZ/dLTZHctsnqNLn3yxeDnMHcpzceEqcILHAwo
 rDnFgSbROiGLQsVzB6weUfT45SqtY1axtaWTgf7HDS+O2uUoi0Z8ZrIAubjRRadPcc8/
 LjQmprAM+xwXPxqopTMyjamwPeYOsiT9rvIqHUUiMSRQ1TNYxCIW7e/3rQsyhcKnVTJb
 zMhg==
X-Gm-Message-State: AOAM532VY+yfFVyYc6cPGKdQb70dBzpTLhWDyWCdn/NvoZtcdl+7IvYs
 bTHs95vBOwhks+eSO+Og9Z0=
X-Google-Smtp-Source: ABdhPJwFxEA5+mCo5gcgeGaUg4aJI1K2M0FtkE57rkR9AR/OeSnNWVNAEmUUpMC6sdCaW39glNF9fg==
X-Received: by 2002:a37:b56:: with SMTP id 83mr4502966qkl.362.1593204934567;
 Fri, 26 Jun 2020 13:55:34 -0700 (PDT)
Received: from localhost ([2804:431:f724:6132:f7ad:3e5e:aea2:fd6e])
 by smtp.gmail.com with ESMTPSA id r2sm9359478qtn.27.2020.06.26.13.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 13:55:33 -0700 (PDT)
Date: Fri, 26 Jun 2020 17:55:30 -0300
From: Murilo Opsfelder =?iso-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/mm: Enable radix GTSE only if supported.
Message-ID: <20200626205530.GA23269@kermit.br.ibm.com>
References: <20200626131000.5207-1-bharata@linux.ibm.com>
 <20200626131000.5207-2-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626131000.5207-2-bharata@linux.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Bharata.

On Fri, Jun 26, 2020 at 06:39:58PM +0530, Bharata B Rao wrote:
> Make GTSE an MMU feature and enable it by default for radix.
> However for guest, conditionally enable it if hypervisor supports
> it via OV5 vector. Let prom_init ask for radix GTSE only if the
> support exists.
>
> Having GTSE as an MMU feature will make it easy to enable radix
> without GTSE. Currently radix assumes GTSE is enabled by default.
>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
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
>  		/* Do radix anyway - the hypervisor said we had to */
>  		cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
>  	} else if (mmu_supported == OV5_FEAT(OV5_MMU_HASH)) {
>  		/* Hypervisor only supports hash - disable radix */
>  		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
> +		cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
>  	}
>  }

Is this a part of the code where mmu_clear_feature() cannot be used?

I'm just curious to understand the difference of clearing
cur_cpu_spec->mmu_features bits like above versus using
mmu_clear_feature() function.

--
Murilo
