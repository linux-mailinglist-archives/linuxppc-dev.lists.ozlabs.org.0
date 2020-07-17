Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18061223311
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:48:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7KtH48XXzDqn1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 15:48:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pbgYazza; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7KpY4KvzzDrJ7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 15:45:25 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id 72so6077088otc.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JHkdyRAcZkv1Vdi/CSUR9aW83f/Brxcwc8MUQ7kmTKI=;
 b=pbgYazzaArA2nnQJoKycAuv1HgDXSO+TAsN+cjtFYjPGNKFEbzIACwyHf+sPwauUCX
 vBMGHv7/ccm4+VDg5tof8NYSFES173qlMMod1wFvM3L38Gyv5PjDjYgkSCj+e7kJdkG8
 eGnTzy2+7dzif4l85l+AFxBkzhyZZW+oL6Ss3Z/McHcZ27aEnyAKBPJ94QEeRRFll7xT
 +IqwXpXL+Q0H6cXnE0wdTvd3RhPjWkIFR/4lYdZI+QMPOwXgiP9oKoKucoJAsCcO9k8c
 EeOTHFmcdRr5WAouYtWnMDFN121P5F/dnD9FrAVV0TFUh9JE8eBdSo1TnjPH0jKCFFV/
 YSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JHkdyRAcZkv1Vdi/CSUR9aW83f/Brxcwc8MUQ7kmTKI=;
 b=ED4RDs7Navp6CHmtDDrQzrrktLE8/737fp6Xyo1cxzS2vBpu487DzL2YRzj4bphEyP
 USKjOug49cI3zBexsO9JDafU5fVTIOOk91K438kkpI62/7VjzrQ6F3BygXtV0YeRv9u/
 8B74xiOSh65zgulSg+zM0//LyiOg/XAgEhhZCUHwmBbJo9ph4HvNVn72pUQlGa8ldk0I
 eZZqygsi6cKVgCecUbI4t4iOf185O5mTR00ORnWg2ur+n1oWGjzEVmtSWjMpZb0nElbK
 Sc0bpA1jmbR0VKxgaxDtOT4cfd+JR5Kq92m43CKTGJpF02JghX31hbmqxZaQyGRqX3nN
 8Vrw==
X-Gm-Message-State: AOAM532RBuMHyifKosuD56+knTcyB9IyUbvNZ2JgmNN0vESuGfrQ64kv
 V17a5dPUXyiP72gn9Y6X2wXE/A1q91pC76xInqY=
X-Google-Smtp-Source: ABdhPJxiyKw7Csu4IqifiSBr4IftmnIMA8UrFJtjTi0CrfVhwfFFjAU7z8vnrsqzKV4EY24AKbZRPrqme1N9Oys2gd8=
X-Received: by 2002:a9d:7f06:: with SMTP id j6mr7355306otq.51.1594964722770;
 Thu, 16 Jul 2020 22:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-6-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20200717040958.70561-6-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 17 Jul 2020 15:44:13 +1000
Message-ID: <CACzsE9oE+OMnWEXvbZZbq35YzpSzCbBHWEJcjtCgkcq-YrABng@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 2:10 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> Add new device-tree feature for 2nd DAWR. If this feature is present,
> 2nd DAWR is supported, otherwise not.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/cputable.h | 7 +++++--
>  arch/powerpc/kernel/dt_cpu_ftrs.c   | 7 +++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index e506d429b1af..3445c86e1f6f 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -214,6 +214,7 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTR_P9_TLBIE_ERAT_BUG      LONG_ASM_CONST(0x0001000000000000)
>  #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
>  #define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
> +#define CPU_FTR_DAWR1                  LONG_ASM_CONST(0x0008000000000000)
>
>  #ifndef __ASSEMBLY__
>
> @@ -497,14 +498,16 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTRS_POSSIBLE      \
>             (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>              CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
> +            CPU_FTR_DAWR1)
>  #else
>  #define CPU_FTRS_POSSIBLE      \
>             (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>              CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>              CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>              CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
> +            CPU_FTR_DAWR1)
Instead of putting CPU_FTR_DAWR1 into CPU_FTRS_POSSIBLE should it go
into CPU_FTRS_POWER10?
Then it will be picked up by CPU_FTRS_POSSIBLE.
>  #endif /* CONFIG_CPU_LITTLE_ENDIAN */
>  #endif
>  #else
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index ac650c233cd9..c78cd3596ec4 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -574,6 +574,12 @@ static int __init feat_enable_mma(struct dt_cpu_feature *f)
>         return 1;
>  }
>
> +static int __init feat_enable_debug_facilities_v31(struct dt_cpu_feature *f)
> +{
> +       cur_cpu_spec->cpu_features |= CPU_FTR_DAWR1;
> +       return 1;
> +}
> +
>  struct dt_cpu_feature_match {
>         const char *name;
>         int (*enable)(struct dt_cpu_feature *f);
> @@ -649,6 +655,7 @@ static struct dt_cpu_feature_match __initdata
>         {"wait-v3", feat_enable, 0},
>         {"prefix-instructions", feat_enable, 0},
>         {"matrix-multiply-assist", feat_enable_mma, 0},
> +       {"debug-facilities-v31", feat_enable_debug_facilities_v31, 0},
Since all feat_enable_debug_facilities_v31() does is set
CPU_FTR_DAWR1, if you just have:
{"debug-facilities-v31", feat_enable, CPU_FTR_DAWR1},
I think cpufeatures_process_feature() should set it in for you at this point:
            if (m->enable(f)) {
                cur_cpu_spec->cpu_features |= m->cpu_ftr_bit_mask;
                break;
            }

>  };
>
>  static bool __initdata using_dt_cpu_ftrs;
> --
> 2.26.2
>
