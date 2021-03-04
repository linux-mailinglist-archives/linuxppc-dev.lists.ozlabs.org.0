Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018932D550
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 15:33:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrtdW18Wgz3d35
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 01:33:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SUFTMJXC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SUFTMJXC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drtd53VW9z30NZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 01:32:57 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D571764F36
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614868375;
 bh=tXeyflvi5gXEFLfWrEhyPYpQ9H6G+alEokJ1yiiFZAs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SUFTMJXCghhXPTfTU7DVatK7XQYGDso/6+901ptTAr+6UkFzvVY3LMy1bIBwg4Q82
 isDF6GXrYzW1tsDNFKNmrnfQGi9Pq81iowaq3SFhnU9RUHy15KF384r3EJ495u9xU3
 NCq881YQgUwtaNX3jPN2E0VR267kElrANWeJxmprwDTzSzDN1p8sT8jooPzXarYvDy
 mtBUdM42PWgJcC5evM+Re9wAYHKdY7ascu2Ek0ewIpvA8DtzgZz7SB9ab2syZ5KtWl
 VoNwX5CEdlZXGVJHEGyKYrWFY4mx9bYABQrAxfY4zQG8EPOnKH7l5Y26oldHmtbElN
 VJRGrvRWooQLg==
Received: by mail-ed1-f44.google.com with SMTP id p1so30651639edy.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 06:32:54 -0800 (PST)
X-Gm-Message-State: AOAM533+6PlOy8oVhGy4LEeiL5wH2DCAxCqzk+vm5lLd1U+TZaZ7+Z9a
 nKyZ0Og/RjweP8N7d8Uh9rFiqabjQWrC4SMgTA==
X-Google-Smtp-Source: ABdhPJzabdQJ8ncT4i9Jv5kLvVwXJ4FdjdlgX7bAUmE7phJTm1J2xtfPKQoM5FboSII3Jp66Lb89kLcDHwPLvNaueFU=
X-Received: by 2002:aa7:c403:: with SMTP id j3mr4615939edq.137.1614868373460; 
 Thu, 04 Mar 2021 06:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20210304044803.812204-2-danielwa@cisco.com>
In-Reply-To: <20210304044803.812204-2-danielwa@cisco.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Mar 2021 08:32:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKnAMp0bkXzU-B8b8xx5fPC1R1NdOBn9Kpk=SONJL5paQ@mail.gmail.com>
Message-ID: <CAL_JsqKnAMp0bkXzU-B8b8xx5fPC1R1NdOBn9Kpk=SONJL5paQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
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

On Wed, Mar 3, 2021 at 10:48 PM Daniel Walker <danielwa@cisco.com> wrote:
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
>  drivers/of/fdt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index feb0f2d67fc5..cfe4f8d3c9f5 100644
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
> @@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>
>         early_init_dt_check_for_initrd(node);
>
> +#ifdef CONFIG_GENERIC_CMDLINE

What I like about Christophe's version is it removes the old DT
implementation. Who's going to convert the rest of the DT based
arches? That's arm, arm64, hexagon, microblaze, nios2, openrisc,
riscv, sh, and xtensa. Either separate the common code from the config
like Christophe's version or these all need converting. Though it's
fine to hash out patch 1 with a couple of arches first.

>         /* Retrieve command line */
>         p = of_get_flat_dt_prop(node, "bootargs", &l);

This needs to be outside the ifdef.

> +
> +       /*
> +        * The builtin command line will be added here, or it can override
> +        * with the DT bootargs.
> +        */
> +       cmdline_add_builtin(data,
> +                           ((p != NULL && l > 0) ? p : NULL), /* This is sanity checking */
> +                           COMMAND_LINE_SIZE);
> +#else
>         if (p != NULL && l > 0)
>                 strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>
> @@ -1070,6 +1081,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
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
