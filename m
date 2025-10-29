Return-Path: <linuxppc-dev+bounces-13490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0833DC18BCE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 08:43:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxK4T3PWPz3bfN;
	Wed, 29 Oct 2025 18:43:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761723833;
	cv=none; b=T6se1DngRnXuxQLY3BE79zhP5ruGPaD4/NtgbuSgi/oYjBQ9be5yj2CWYOJN4F1C9y7V/4xFoF3Q3HguRcupt/HJPEm/8GtL6JFU9eXxi3pRM0ClIYHOV91d246UVU4mZvYAmKIPTwK7EsAw0cxUh0/KaktCOsiqbBeae+Hdk5YxUWjSkLu5JwwpbWBW+AuDe2N5moEjoN2sl4mPh5YW6pWE7Ig77MmrBa1R0QQDcSvE+m+CFE03YxYAM4n0Mf+eA3nitVivHsCwipq8wpBioKbZJoScBO0jUUAqddpbyh4oCqkAwovvO/46e1MYxH2oDIZARu3UVdhO4iFO/oNEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761723833; c=relaxed/relaxed;
	bh=2QJdsB3CjdVCbfqrBmJ9+o0taTFoapIJ6xy+pwiqQzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2VOmYv4oZ2IsUmpJn2ge8tY+waIpzKC2lRSAVQD0abHzaKaK0KpsdevwD1vhOVHxe0W86IbtdZ/TyAYLPfKV8viw57uoC9jybWyNNGWDKCW9XvYn3xn22ietxo/WYqRm6O5k3ugWMx+tsi7DqFAaibLyflGBum8WJWENLG+kCuazPG6MdiOADvDKvZa1h2cHtLh1pGjveqF2gv9yIWD0yjpLlt6T1s9E8aFo04WzO44tAYsRaaOqRpBN8exWi74paVvIkD9RjbUGlXOzasJISNO2ID8CpYPAn0WarFN9FevhjlF/dmkWiSQK4qSjZCIOQGn2fqVuLwupKkXKVneWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kDLcXcKU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kDLcXcKU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxK4S0LZPz30hP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 18:43:50 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso1209599a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723826; x=1762328626; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2QJdsB3CjdVCbfqrBmJ9+o0taTFoapIJ6xy+pwiqQzo=;
        b=kDLcXcKU0xTc/KDYDQl5pMspCV+VOrqCTU/k+b4+E6IPE3tnAgpOwxMmliV6j98Urc
         BavWQs1Kd0qvJPufifxdvaJTnbq3kJsoCaE9+R0iQ1RjZUzKc7lpEA4MTrycS4aLQO9G
         L2fGenJreBfuRoQQdkl/Jtlz8QieE43ibtpJtNcaaOBmK/qzKZw7TKPMK5tcKtngoFo6
         1FaXaPOb5kqOxu8cJqDcwJ5GvYd9z1qUbjcssxxzqT2ngJBPk8nAAeWGpCYNzbH3NkVr
         FbMhXLCNtezo7krqvK+NPXPyVaWItQe16dQdHQZEjAg2wQkS2Fi/ruAka0dEKz7ia2IR
         F3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723826; x=1762328626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QJdsB3CjdVCbfqrBmJ9+o0taTFoapIJ6xy+pwiqQzo=;
        b=DWQ9+Zm31L2t9i88OUh6VabOzatR8WkuvhCorEF2LavlkWfLI4itZfUeFMotLH+iKD
         /7AH+9SxrkUiYgBy6hcH9Z+heqioo1eSYnXy1vj5DZGek2WfDAakPlGg2dkGMpzLpsf4
         iur/2WCGrxSnpSvf/6dOTeb7RuJvaowtC072Vb/yunWyj+IAAkBiDqzuZjAYwBqgPP/u
         C8rGsa7H6sRF/9DpXo6kN2V1gJSae7pJdTe6raW39FvHpo6EdIZHCk0bUfmOvtTMFNp/
         RrYdTNR4FmdLVioz6WcK10IE1SnJHNMgL55AHn68tgvagAPRCKcZvKbpM6suxnYd/mtN
         5vYg==
X-Forwarded-Encrypted: i=1; AJvYcCXBjS5Jx82X96AR1dDordulxODR7Au+x52ZCmGNJPX18SPSBKLC3zW8rZU2wmCkEHbQi3VQj3eIoayNv2M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyu7fea3udqZSlQZu9UsG1fpkoHKpI0+xAGzF7v/2//wEXs6m+u
	bvE0/n5zCLzsvsEo2OhcJ+vGmwP7B46uNgmTPXUZTPHKhfmURkmh9LVKeSAKOzptQRj18u1eall
	TT+Eh/lhCgG+FzfZ0+CJhAhYsiZunQFr+/FXbvYYKZg==
X-Gm-Gg: ASbGncssrhXc+HZ5SmnA3ocrRnFNQ5GwFQ89eb1GotFHH+K/z2MYSUpOwswFE/P2+P3
	hX+QmLPjKb2i8boJtwC/QVse6GqR+YVoum2tchpbty1KN/SWOR/AMe7gnXGNrJK+kpUwiTSatg7
	S+7kWJgqSwS+WLDw1CINmEl5S6BmJEIIxRSpoueCy8IRlVJP29BG6M8Uy8EPpJbNPRMNpM9qN49
	tnbyeEY7mO/WSsMxo8tYOXviHspPpLNPhJ5rBrRYdOWTFluK/CH58qfQj/BgFR79lwL5b0rzDgH
	wnqLi7QrONWDHg==
X-Google-Smtp-Source: AGHT+IGwa7kxpUV7cbF3Gyr4ts2tbnj1GVUS4cjO7t5XPX0Dwt2qV9vPpavgEaPmQhBv+TC5JU0symBxgYRwUmmqHWY=
X-Received: by 2002:a05:6402:34d1:b0:61a:7385:29e3 with SMTP id
 4fb4d7f45d1cf-64043331cd2mr1603470a12.18.1761723825601; Wed, 29 Oct 2025
 00:43:45 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251029060757.2007601-1-srikar@linux.ibm.com> <20251029060757.2007601-2-srikar@linux.ibm.com>
In-Reply-To: <20251029060757.2007601-2-srikar@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 29 Oct 2025 08:43:34 +0100
X-Gm-Features: AWmQ_blZ2yqBcrOpuaElvS05llD7_qQHEAblunp_kpRtAliljejhoeSfrPPCPYM
Message-ID: <CAKfTPtDW9rApEm+4qSrEpRDMA+68BnVOgegKUZUa5S-gKnR--A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/smp: Disable steal from updating CPU capacity
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ben Segall <bsegall@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Srikar,

On Wed, 29 Oct 2025 at 07:09, Srikar Dronamraju <srikar@linux.ibm.com> wrote:
>
> In a shared LPAR with SMT enabled, it has been observed that when a CPU
> experiences steal time, it can trigger task migrations between sibling
> CPUs. The idle CPU pulls a runnable task from its sibling that is
> impacted by steal, making the previously busy CPU go idle. This reversal

IIUC, the migration is triggered by the reduced capacity case when
there is 1 task on the CPU

> can repeat continuously, resulting in ping-pong behavior between SMT
> siblings.

Does it mean that the vCPU generates its own steal time or is it
because other vcpus are already running on the other CPU and they
starts to steal time on the sibling vCPU

>
> To avoid migrations solely triggered by steal time, disable steal from
> updating CPU capacity when running in shared processor mode.

You are disabling the steal time accounting only for your arch. Does
it mean that only powerpc are impacted by this effect ?

>
> lparstat
> System Configuration
> type=Shared mode=Uncapped smt=8 lcpu=72 mem=2139693696 kB cpus=64 ent=24.00
>
> Noise case: (Ebizzy on 2 LPARs with similar configuration as above)
> nr-ebizzy-threads  baseline  std-deviation  +patch    std-deviation
> 36                 1         (0.0345589)    1.01073   (0.0411082)
> 72                 1         (0.0387066)    1.12867   (0.029486)
> 96                 1         (0.013317)     1.05755   (0.0118292)
> 128                1         (0.028087)     1.04193   (0.027159)
> 144                1         (0.0103478)    1.07522   (0.0265476)
> 192                1         (0.0164666)    1.02177   (0.0164088)
> 256                1         (0.0241208)    0.977572  (0.0310648)
> 288                1         (0.0121516)    0.97529   (0.0263536)
> 384                1         (0.0128001)    0.967025  (0.0207603)
> 512                1         (0.0113173)    1.00975   (0.00753263)
> 576                1         (0.0126021)    1.01087   (0.0054196)
> 864                1         (0.0109194)    1.00369   (0.00987092)
> 1024               1         (0.0121474)    1.00338   (0.0122591)
> 1152               1         (0.013801)     1.0097    (0.0150391)
>
> scaled perf stats for 72 thread case.
> event         baseline  +patch
> cycles        1         1.16993
> instructions  1         1.14435
> cs            1         0.913554
> migrations    1         0.110884
> faults        1         1.0005
> cache-misses  1         1.68619
>
> Observations:
> - We see a drop in context-switches and migrations resulting in an
> improvement in the records per second.
>
> No-noise case: (Ebizzy on 1 LPARs with other LPAR being idle)
> nr-ebizzy-threads  baseline  std-deviation  +patch    std-deviation
> 36                 1         (0.0451482)    1.01243   (0.0434088)
> 72                 1         (0.0308503)    1.06175   (0.0373877)
> 96                 1         (0.0500514)    1.13143   (0.0718754)
> 128                1         (0.0602872)    1.09909   (0.0375227)
> 144                1         (0.0843502)    1.07494   (0.0240824)
> 192                1         (0.0255402)    0.992734  (0.0615166)
> 256                1         (0.00653372)   0.982841  (0.00751558)
> 288                1         (0.00318369)   0.99093   (0.00960287)
> 384                1         (0.00272681)   0.974312  (0.0112133)
> 512                1         (0.00528486)   0.981207  (0.0125443)
> 576                1         (0.00491385)   0.992027  (0.0104948)
> 864                1         (0.0087057)    0.994927  (0.0143434)
> 1024               1         (0.010002)     0.992463  (0.00429322)
> 1152               1         (0.00720965)   1.00393   (0.012553)
>
> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> ---
> Changelog v1->v2:
> v1: https://lkml.kernel.org/r/20251028104255.1892485-2-srikar@linux.ibm.com
> Peter suggested to use static branch instead of sched feat
>
>  arch/powerpc/kernel/smp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5ac7084eebc0..0f7fae0b4420 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1694,8 +1694,11 @@ static void __init build_sched_topology(void)
>  {
>         int i = 0;
>
> -       if (is_shared_processor() && has_big_cores)
> -               static_branch_enable(&splpar_asym_pack);
> +       if (is_shared_processor()) {
> +               if (has_big_cores)
> +                       static_branch_enable(&splpar_asym_pack);
> +               sched_disable_steal_acct();
> +       }
>
>  #ifdef CONFIG_SCHED_SMT
>         if (has_big_cores) {
> --
> 2.47.3
>

