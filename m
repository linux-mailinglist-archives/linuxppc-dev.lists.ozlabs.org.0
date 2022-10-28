Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA5610B8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 09:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzF793tqYz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:49:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=oqmNgqsz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=oqmNgqsz;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzF6C3xp4z2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 18:48:33 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id bs21so5877643wrb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U0U3J+Q69fu7o/YQz3q/fMO7g+tmuXGKvEK6KG9JDGA=;
        b=oqmNgqsztuMpLAhNQorP3820L6EJNnJRDoXEb4RgzXZQMfNQDcyVCHVYlvSTb+cksH
         CwJ2aeLsuRGbAg4oUeweMw9W7RVPie8fbQhXZCKgnIXewPhBCQ2D8qNqXYiXfhT76dW6
         xJX6KJ6QR8kf1VFJxGUsMl5/+ENJJ5Wxii90WkOuwZT7HNIb6lID8pp/UFcfXmak4LFL
         jTzzJYzhej1Kn237Slz8BJcwQbdSqVXWEQpinfJlNcbgrjQ4bsMdqNEumXt3CMYlYdSi
         LO4ALfufKLzxVKs824kdxmBew78rDuLIWHvjPbK+3tKTM3XpkrSx4Zr/NWhajts4BWCr
         /L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0U3J+Q69fu7o/YQz3q/fMO7g+tmuXGKvEK6KG9JDGA=;
        b=wmRC4AeiMSZ7oTL7b4yvtglajhwXO+F0kGkflgObvjlu89A5qd0qI3XmuVebuBIJ2B
         PWvlPXDoq2uHc/o6T96nwtkwxQ+3yepzOzp976oxiSUUtHXXsUGBgIqFP/okZxMdSsJ/
         otgfy9X1zq6DbqnH17laz1oE5yO/hYYF58rhB6OEeLyV+pVibDhLeS1DMqlaKCw08Z3w
         rHzzHoIhb9MHB9X4vPD+Oivcs78CTjuvWItzrZUawwEteLlxpj7dI9Jf5bv4FxPi7Tlr
         BEx+jBeXiZIyNY+S2kPDNC1zEcx2+COZG7pw29m6TjvEUvbSsbrhQzS2IXHGMOY5xBVU
         klDA==
X-Gm-Message-State: ACrzQf15qsXaj2Q/fvOdycJnNSAm+SCXmuPosxxEifyspnXhB3mKpV8g
	NQypar3sn2rxzHedPG+bKub/lg==
X-Google-Smtp-Source: AMsMyM6VIrVFAYX3MFdpAr2A3aolwkCyi7gytgwNOdq5lcvzoSJ4ww9Dhq1bl3mK11pqR8Em7mdPlA==
X-Received: by 2002:adf:ef4e:0:b0:236:6608:f6ce with SMTP id c14-20020adfef4e000000b002366608f6cemr18585925wrp.85.1666943309562;
        Fri, 28 Oct 2022 00:48:29 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d4301000000b0022efc4322a9sm2989820wrq.10.2022.10.28.00.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:48:29 -0700 (PDT)
Date: Fri, 28 Oct 2022 09:48:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221028074828.b66uuqqfbrnjdtab@kamzik>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014155845.1986223-3-ajones@ventanamicro.com>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 05:58:45PM +0200, Andrew Jones wrote:
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
> 
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
> 
> which will issue the warning when reading /proc/cpuinfo. Ensure no
> warning is generated by validating the cpu index before calling
> cpumask_next().
> 
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/cpu/proc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> index 099b6f0d96bd..de3f93ac6e49 100644
> --- a/arch/x86/kernel/cpu/proc.c
> +++ b/arch/x86/kernel/cpu/proc.c
> @@ -153,6 +153,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> +	if (*pos == nr_cpu_ids)
> +		return NULL;
> +
>  	*pos = cpumask_next(*pos - 1, cpu_online_mask);
>  	if ((*pos) < nr_cpu_ids)
>  		return &cpu_data(*pos);
> -- 
> 2.37.3
>

Hi x86 maintainers,

I realize 78e5a3399421 has now been reverted, so this fix is no longer
urgent. I don't believe it's wrong, though, so if it's still of interest,
then please consider this a friendly ping.

Thanks,
drew
