Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E611B545D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 07:47:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4975tW21rZzDqxh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 15:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=rashmica.g@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X+DOSQAb; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4975rS1HCmzDqjy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 15:45:56 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id a31so150520pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 22:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=E309FqN5zWta2HvbbGoHwOpc3NXNhePJtkYF1BraM0Q=;
 b=X+DOSQAbcuKXRFjeK31W3xaHleXyprYsF7iAo/WK18ZAYplI5zS1Eo0/aqWc0H7IjE
 Pt4rOHQ57/wMDwZ1PGjJAOOJeAEicjwSxJweS7aNyrTvaF7OHyuMnJpYDdYvefjPjVk7
 5NFKs7QdL2grUtZLiCltf3Fktg/vH5jPPmjyPODeL5V8ZEFJalZdbRnDCpNvL4nnvScC
 NA8mHC3qqy4GgzLzQItfbCho9FbFuA243phDDH7CZLKiVPdVpoAtOCn3uYDJoCgCokpX
 2nx7b1c2yZdnpmMDNsWcWfBCjHpKTu4WKH9mSbehVu4OxRsXJWTPNUMqGLcaDXpwIATR
 URcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=E309FqN5zWta2HvbbGoHwOpc3NXNhePJtkYF1BraM0Q=;
 b=bdVYSovTydwqoMJ3y07HAS0NSkmguQjZ3XHZWlvuyVAgehjTby+PsCzFkchaaNq5to
 zSq2gnRzAYSDUbvg2hF+TKfcYUuq0Hl5U5mLJrJBvxIJ/G0ZJGiFuCOJM+z0GESoDHg9
 hKW1QeZO6WeXIRHqUJRkZmhCh0A3CwxCQfcgzEL0VSiCQFKRkrL7doMkP8ACJagWpT9p
 fkbwJtgqsf2VnGV6abnY1FETbtwoBn4GQsUjUTKCoXRJr2EET+6AtHfWjWRJb1t77dAY
 WWP25Yk4t2oPCtDr+sUNNJr7W4yn5UDlT7PiNbi3f2L5k1bXCNnlqea8GrMfPl1ZD/Ty
 qB8A==
X-Gm-Message-State: AGi0PuajcWeZ2x3a08Cr8WMxqUQ8MCoIk6w6WPiHoIWXVzSwaxubOZoQ
 kDH+vabHcifY7IzMC5KjcZs=
X-Google-Smtp-Source: APiQypLsxiKaqSpY6eDiFOIA+ez2nm4v9Lj1PsGSH9QG3lz6sAy7jJxxBBvw7lBIY6ZkDRqWCcK8kw==
X-Received: by 2002:a17:90a:fc8c:: with SMTP id
 ci12mr2534478pjb.104.1587620754260; 
 Wed, 22 Apr 2020 22:45:54 -0700 (PDT)
Received: from rashmica (150.24.220.111.sta.wbroadband.net.au.
 [111.220.24.150])
 by smtp.googlemail.com with ESMTPSA id 14sm1374015pfj.90.2020.04.22.22.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 22:45:53 -0700 (PDT)
Message-ID: <dee9deba9a67c7f00063eb7d4abb6c6c003b69b6.camel@gmail.com>
Subject: Re: [PATCH, RESEND, 1/3] selftests/powerpc: Use write_pmc instead
 of count_pmc to reset PMCs on ebb tests
From: Rashmica Gupta <rashmica.g@gmail.com>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org
Date: Thu, 23 Apr 2020 15:45:47 +1000
In-Reply-To: <20200408223543.21168-2-desnesn@linux.ibm.com>
References: <20200408223543.21168-1-desnesn@linux.ibm.com>
 <20200408223543.21168-2-desnesn@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: shuah@kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-08 at 19:35 -0300, Desnes A. Nunes do Rosario wrote:
> By using count_pmc() to reset PMCs instead of write_pmc(), an extra
> count
> is performed on ebb_state.stats.pmc_count[PMC_INDEX(pmc)]. This extra
> pmc_count can occasionally invalidate results, such as the ones from
> cycles_test shown hereafter. The ebb_check_count() failed with an
> above
> the upper limit error due to the extra ebb_state.stats.pmc_count.
> 
> Furthermore, this extra count is also indicated by extra PMC1
> trace_log on
> the output of the cycle test (as well as on pmc56_overflow_test):
> 
> ==========
>    ...
>    [21]: counter = 8
>    [22]: register SPRN_MMCR0 = 0x0000000080000080
>    [23]: register SPRN_PMC1  = 0x0000000080000004
>    [24]: counter = 9
>    [25]: register SPRN_MMCR0 = 0x0000000080000080
>    [26]: register SPRN_PMC1  = 0x0000000080000004
>    [27]: counter = 10
>    [28]: register SPRN_MMCR0 = 0x0000000080000080
>    [29]: register SPRN_PMC1  = 0x0000000080000004
> > > [30]: register SPRN_PMC1  = 0x000000004000051e
> PMC1 count (0x280000546) above upper limit 0x2800003e8 (+0x15e)
> [FAIL] Test FAILED on line 52
> failure: cycles
> ==========
> 
> [desnesn: reflow of original comment]
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>

Reviewed and Tested-by: Rashmica Gupta <rashmica.g@gmail.com>

> ---
>  .../powerpc/pmu/ebb/back_to_back_ebbs_test.c         |  2 +-
>  .../testing/selftests/powerpc/pmu/ebb/cycles_test.c  |  2 +-
>  .../powerpc/pmu/ebb/cycles_with_freeze_test.c        |  2 +-
>  .../powerpc/pmu/ebb/cycles_with_mmcr2_test.c         |  2 +-
>  tools/testing/selftests/powerpc/pmu/ebb/ebb.c        |  2 +-
>  .../powerpc/pmu/ebb/ebb_on_willing_child_test.c      |  2 +-
>  .../selftests/powerpc/pmu/ebb/lost_exception_test.c  |  2 +-
>  .../selftests/powerpc/pmu/ebb/multi_counter_test.c   | 12 ++++++--
> ----
>  .../selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c |  2 +-
>  .../selftests/powerpc/pmu/ebb/pmae_handling_test.c   |  2 +-
>  .../selftests/powerpc/pmu/ebb/pmc56_overflow_test.c  |  2 +-
>  11 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
> index a2d7b0e3dca9..f133ab425f10 100644
> ---
> a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
> +++
> b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
> @@ -91,7 +91,7 @@ int back_to_back_ebbs(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
> index bc893813483e..14a399a64729 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
> @@ -42,7 +42,7 @@ int cycles(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> index dcd351d20328..0f2089f6f82c 100644
> ---
> a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> +++
> b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> @@ -99,7 +99,7 @@ int cycles_with_freeze(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
> index 94c99c12c0f2..a8f3bee04cd8 100644
> ---
> a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
> +++
> b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
> @@ -71,7 +71,7 @@ int cycles_with_mmcr2(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> index dfbc5c3ad52d..bf6f25dfcf7b 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> @@ -396,7 +396,7 @@ int ebb_child(union pipe read_pipe, union pipe
> write_pipe)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
> index ca2f7d729155..513812cdcca1 100644
> ---
> a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
> +++
> b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
> @@ -38,7 +38,7 @@ static int victim_child(union pipe read_pipe, union
> pipe write_pipe)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
> index ac3e6e182614..5979606c41dc 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
> @@ -75,7 +75,7 @@ static int test_body(void)
>  	ebb_freeze_pmcs();
>  	ebb_global_disable();
>  
> -	count_pmc(4, sample_period);
> +	write_pmc(4, pmc_sample_period(sample_period));
>  	mtspr(SPRN_PMC4, 0xdead);
>  
>  	dump_summary_ebb_state();
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
> index b8242e9d97d2..227827b665d5 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
> @@ -70,12 +70,12 @@ int multi_counter(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> -	count_pmc(2, sample_period);
> -	count_pmc(3, sample_period);
> -	count_pmc(4, sample_period);
> -	count_pmc(5, sample_period);
> -	count_pmc(6, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
> +	write_pmc(2, pmc_sample_period(sample_period));
> +	write_pmc(3, pmc_sample_period(sample_period));
> +	write_pmc(4, pmc_sample_period(sample_period));
> +	write_pmc(5, pmc_sample_period(sample_period));
> +	write_pmc(6, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
> index a05c0e18ded6..ade70bed0499 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
> @@ -61,7 +61,7 @@ static int cycles_child(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_summary_ebb_state();
>  
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
> index 153ebc92234f..7b4bf4ed12cb 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
> @@ -82,7 +82,7 @@ static int test_body(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(1, sample_period);
> +	write_pmc(1, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
> index eadad75ed7e6..bb55af71404d 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
> @@ -76,7 +76,7 @@ int pmc56_overflow(void)
>  	ebb_global_disable();
>  	ebb_freeze_pmcs();
>  
> -	count_pmc(2, sample_period);
> +	write_pmc(2, pmc_sample_period(sample_period));
>  
>  	dump_ebb_state();
>  

