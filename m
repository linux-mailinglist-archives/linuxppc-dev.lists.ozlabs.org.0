Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EED1234F1C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 21:49:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F90Qn6gNSz3bxg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:49:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gEcNh7zo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gEcNh7zo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F90QL2Cvfz3bqB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 06:49:30 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20875619CF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617133767;
 bh=Ck1XHsPMXKddkO7/YY+lWQc5sW8Ayvngr37xovx4Afg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gEcNh7zo1605nJ8Hjwu4y4qAZxIi22sCNRw5bFtvEBODv+GcaOmodshXmLvXjV/t4
 yDViKbTiOEZs8Xg7AxAUYTWED/fmy1qnnrA6cnzJVkJU5ys2Fm9MoVyedghkW76SwD
 FCOVQBFKbAQQ986t/02MAQqbdli2694er9Ec9kjMM7c5EVZRW8UCgbTQQ2vQMM8dbT
 cimawJ7XvGtVIF9UwsSj9od7XaLHi9WEre1AKUaxPm6rzJc/+RlXz9yJaWBASK3oYK
 OhmRDT63nchAo7rm+sZqwAUBD4bVS10/D/ito1bQGxYshGgyNTN6AZm36Wic4i6V/d
 1lysvtPWpYsDA==
Received: by mail-ej1-f42.google.com with SMTP id ce10so26609245ejb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 12:49:27 -0700 (PDT)
X-Gm-Message-State: AOAM5335hr8BDE+GlPl1QQGA3oQLnGV24st2h5GeOymaD0LopgD/D97H
 pxnUM3eIKhvmNzuyhg/zT06DTvIKw2nCRkrVuA==
X-Google-Smtp-Source: ABdhPJwtsu4GSSCTGvon7NUuoXgbKxlglqptEfp3lbXOUs7+wjr+Z+gLBfdBRTrJqyuy+lFVou3niNRuxiswKCsp+tY=
X-Received: by 2002:a17:906:c405:: with SMTP id
 u5mr35182498ejz.341.1617133765515; 
 Tue, 30 Mar 2021 12:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
In-Reply-To: <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Mar 2021 14:49:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
Message-ID: <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
To: Daniel Walker <danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, Ruslan Ruslichenko <rruslich@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Frank Rowand <frowand.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 12:57 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> It looks like there's some seepage of cmdline stuff into
> the generic device tree code. This conflicts with the
> generic cmdline implementation so I remove it in the case
> when that's enabled.
>
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  drivers/of/fdt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index dcc1dd96911a..d8805cd9717a 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -25,6 +25,7 @@
>  #include <linux/serial_core.h>
>  #include <linux/sysfs.h>
>  #include <linux/random.h>
> +#include <linux/cmdline.h>
>
>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>  #include <asm/page.h>
> @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>
>         /* Retrieve command line */
>         p = of_get_flat_dt_prop(node, "bootargs", &l);
> +
> +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)

Moving in the wrong direction... This code already has too many
#ifdef's. I like Christophe's version as it gets rid of all the code
here.

> +       /*
> +        * The builtin command line will be added here, or it can override
> +        * with the DT bootargs.
> +        */
> +       cmdline_add_builtin(data,
> +                           (l > 0 ? p : NULL), /* This is sanity checking */
> +                           COMMAND_LINE_SIZE);
> +#elif defined(CONFIG_GENERIC_CMDLINE)
> +       strlcpy(data, p, COMMAND_LINE_SIZE);
> +#else
>         if (p != NULL && l > 0)
>                 strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>
> @@ -1070,6 +1083,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>                 strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #endif
>  #endif /* CONFIG_CMDLINE */
> +#endif /* CONFIG_GENERIC_CMDLINE */
>
>         pr_debug("Command line is: %s\n", (char *)data);
>
> --
> 2.25.1
>
