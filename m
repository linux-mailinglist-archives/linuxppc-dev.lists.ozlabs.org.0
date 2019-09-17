Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 764DDB46E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 07:34:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XWxj6pcYzF24p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 15:34:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UTCVmhSh"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XWrs5KSWzF43b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 15:29:49 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id d17so4493929ios.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 22:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ab1BIaOVRlo45shl5hYF8+8KUoncf0raBSYUdPucCFE=;
 b=UTCVmhShBUCgw0+mGYlRpWkBbi/cAEzgrbyaQGBpqHPGsiNgWHNVo0uWL4pbK8b1q9
 6EC+qTXt6he4zPYgD1O84oajwgx9tfNLUdNNP/qwO1sanzYWVUWK5HrtlP7agot8J3kt
 Rk2YY5d+JWJ9xqc9bThxoG9BkVISMWD8GneOGj918cPTtUq1pX2pnmXH5Og1dBv4kmye
 JfN3IfqBzLQ+LtHTl1XneDH0xH2NO/nF7FGmyHJ7yyz2ZURz/FgIeLW5xl6sU8AOaL9x
 SycjOvNYWyZgIAN3seQnD5JZzOVjIAHyXMCNmGyN2aPV9hbmzUy9D27H8lmoElXpVlxB
 8iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ab1BIaOVRlo45shl5hYF8+8KUoncf0raBSYUdPucCFE=;
 b=EPXohY0p00CVvOPfNb9hjZrtfcYwSbBUquieBasl859ibROJvdmwA9XSeip0STmr4A
 d+BaxasIey6LoI4dx9A1bhAkXalEkTeyyzzOidMeaIMi7oBwyuDBTgVgmztMYqiUJ1BA
 fErgUTAimNELipGXfgOhxth5L9NQEIyeV+ljGVDI1tUmCF16lMu/NJSIIDpd1geJQK3e
 W9XIGMeRn6JExoKobMbayDFnfDsgsDMU6sjPFL2A5BPUOzxUgv6YiCDAQsLJBwTjcSj7
 DHYAo0ghOeT29XJ7rwcRAfqsTM5R5/+Jmvz4zXP6UKraVkF4LoZ3c4Upk1QNFPUt0Xaw
 l2EQ==
X-Gm-Message-State: APjAAAUpTwXRSKoHf/HYw6UJHKDg/1EW0bidmdryB1CVNKIQyFbS5CP0
 vaEYtz9z9b/BqGDwCPuPw4c1IaF4k2BKUT1K8KtI
X-Google-Smtp-Source: APXvYqx6YyFP5lJ+JMKr/Nnwgdip0Lb8u+tQMxSdq0bqQTfdWp4cM3ZDBkMx7Ph6VW/mTl+Sb8E+jpK4K74RAu95/+Y=
X-Received: by 2002:a02:65cd:: with SMTP id u196mr2198982jab.3.1568698187076; 
 Mon, 16 Sep 2019 22:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <1568256617-14030-1-git-send-email-kernelfans@gmail.com>
In-Reply-To: <1568256617-14030-1-git-send-email-kernelfans@gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Tue, 17 Sep 2019 13:29:35 +0800
Message-ID: <CAFgQCTvKpPEP1UywcGcC2Mo4mzzZR+ff7M3L9QN_U+hfk31ijQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/crashkernel: take mem option into account
To: linuxppc-dev@lists.ozlabs.org
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
Cc: Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc Kexec list. And keep the original content.

On Thu, Sep 12, 2019 at 10:50 AM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> 'mem=" option is an easy way to put high pressure on memory during some
> test. Hence in stead of total mem, the effective usable memory size should
> be considered when reserving mem for crashkernel. Otherwise the boot up may
> experience oom issue.
>
> E.g passing
> crashkernel="2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G", and
> mem=5G on a 256G machine.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> To: linuxppc-dev@lists.ozlabs.org
> ---
> v1 -> v2: fix the printk info about the total mem
>  arch/powerpc/kernel/machine_kexec.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
> index c4ed328..eec96dc 100644
> --- a/arch/powerpc/kernel/machine_kexec.c
> +++ b/arch/powerpc/kernel/machine_kexec.c
> @@ -114,11 +114,12 @@ void machine_kexec(struct kimage *image)
>
>  void __init reserve_crashkernel(void)
>  {
> -       unsigned long long crash_size, crash_base;
> +       unsigned long long crash_size, crash_base, total_mem_sz;
>         int ret;
>
> +       total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
>         /* use common parsing */
> -       ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> +       ret = parse_crashkernel(boot_command_line, total_mem_sz,
>                         &crash_size, &crash_base);
>         if (ret == 0 && crash_size > 0) {
>                 crashk_res.start = crash_base;
> @@ -185,7 +186,7 @@ void __init reserve_crashkernel(void)
>                         "for crashkernel (System RAM: %ldMB)\n",
>                         (unsigned long)(crash_size >> 20),
>                         (unsigned long)(crashk_res.start >> 20),
> -                       (unsigned long)(memblock_phys_mem_size() >> 20));
> +                       (unsigned long)(total_mem_sz >> 20));
>
>         if (!memblock_is_region_memory(crashk_res.start, crash_size) ||
>             memblock_reserve(crashk_res.start, crash_size)) {
> --
> 2.7.5
>
