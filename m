Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10D358F35
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 23:33:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGZJH3SV8z3bqT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 07:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.173;
 helo=mail-oi1-f173.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGZHz0JXmz2xZj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 07:33:16 +1000 (AEST)
Received: by mail-oi1-f173.google.com with SMTP id i81so3691481oif.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 14:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mySPQZAxeKxPZ6g7lCnXPm49GveuRCHUb1NT0KmJXUE=;
 b=TTK98X/PIaWtbFjP+b9nZgtzOzNiIYHbpj7bS3k6Ad9FH0vE4Fq3WZIwxUGA9Hodt9
 mTrysRPNruXgNd0bhVUEoXbmmWS8HM5uQyM63pF5DUJO3m/EFlFHfR6ESIQBEhNgHz3T
 g6bS+EkXmlle5UoYn5BzF0Rxu7icmvtSFppd56VKRAWjOhYEvY8PqRMnCZa/ziLNxtn1
 rjbtSslf/4sQd4Nwg/L9jwMKa59yB0vroYM+ourmXOmNZGsIT3dEEC1lVoJfCqEcBrOH
 uzMEBaQemRUn6Ch+MWuRsotE2rJFwh71FjeL4yHNh5saTfHQVT44BMdAt0og9W8/qDma
 VqLQ==
X-Gm-Message-State: AOAM530gLP/9ydSP318puVk6Oa/ofQJZt5P6Qs68AUk3L4Qqgk9oTDTW
 rV5GFceLl0Koq9FbkS+pBfAgdhKL4KQ=
X-Google-Smtp-Source: ABdhPJxuyyOWbyVo+aotQ4s/G46L9igATiHK6p74e19Ll1TdjSRnIngVa7Fcxs6o3iZ11gvKx9tUgA==
X-Received: by 2002:aca:c349:: with SMTP id t70mr8061553oif.87.1617917594317; 
 Thu, 08 Apr 2021 14:33:14 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180])
 by smtp.gmail.com with ESMTPSA id 38sm139538oth.14.2021.04.08.14.33.13
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 14:33:13 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id c16so3707517oib.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 14:33:13 -0700 (PDT)
X-Received: by 2002:aca:3456:: with SMTP id b83mr7828412oia.51.1617917593399; 
 Thu, 08 Apr 2021 14:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210408030353.37193-1-ran.wang_1@nxp.com>
In-Reply-To: <20210408030353.37193-1-ran.wang_1@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 8 Apr 2021 16:33:02 -0500
X-Gmail-Original-Message-ID: <CADRPPNR4_rmPPrQ2mhVY1zqShTm4vdg_v4iAUt_gxdo7jmOg5Q@mail.gmail.com>
Message-ID: <CADRPPNR4_rmPPrQ2mhVY1zqShTm4vdg_v4iAUt_gxdo7jmOg5Q@mail.gmail.com>
Subject: Re: [PATCH v7] soc: fsl: enable acpi support in RCPM driver
To: Ran Wang <ran.wang_1@nxp.com>
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
Cc: Peng Ma <peng.ma@nxp.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 7, 2021 at 9:58 PM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> From: Peng Ma <peng.ma@nxp.com>
>
> This patch enables ACPI support in RCPM driver.
>
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>

Applied for next.  Thanks.

> ---
> Change in v7:
>  - Update comment for checking RCPM node which refferred to
>
> Change in v6:
>  - Remove copyright udpate to rebase on latest mainline
>
> Change in v5:
>  - Fix panic when dev->of_node is null
>
> Change in v4:
>  - Make commit subject more accurate
>  - Remove unrelated new blank line
>
> Change in v3:
>  - Add #ifdef CONFIG_ACPI for acpi_device_id
>  - Rename rcpm_acpi_imx_ids to rcpm_acpi_ids
>
> Change in v2:
>  - Update acpi_device_id to fix conflict with other driver
>
>  drivers/soc/fsl/rcpm.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
> index 4ace28cab314..90d3f4060b0c 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -13,6 +13,7 @@
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  #include <linux/kernel.h>
> +#include <linux/acpi.h>
>
>  #define RCPM_WAKEUP_CELL_MAX_SIZE      7
>
> @@ -78,10 +79,20 @@ static int rcpm_pm_prepare(struct device *dev)
>                                 "fsl,rcpm-wakeup", value,
>                                 rcpm->wakeup_cells + 1);
>
> -               /*  Wakeup source should refer to current rcpm device */
> -               if (ret || (np->phandle != value[0]))
> +               if (ret)
>                         continue;
>
> +               /*
> +                * For DT mode, would handle devices with "fsl,rcpm-wakeup"
> +                * pointing to the current RCPM node.
> +                *
> +                * For ACPI mode, currently we assume there is only one
> +                * RCPM controller existing.
> +                */
> +               if (is_of_node(dev->fwnode))
> +                       if (np->phandle != value[0])
> +                               continue;
> +
>                 /* Property "#fsl,rcpm-wakeup-cells" of rcpm node defines the
>                  * number of IPPDEXPCR register cells, and "fsl,rcpm-wakeup"
>                  * of wakeup source IP contains an integer array: <phandle to
> @@ -172,10 +183,19 @@ static const struct of_device_id rcpm_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, rcpm_of_match);
>
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id rcpm_acpi_ids[] = {
> +       {"NXP0015",},
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, rcpm_acpi_ids);
> +#endif
> +
>  static struct platform_driver rcpm_driver = {
>         .driver = {
>                 .name = "rcpm",
>                 .of_match_table = rcpm_of_match,
> +               .acpi_match_table = ACPI_PTR(rcpm_acpi_ids),
>                 .pm     = &rcpm_pm_ops,
>         },
>         .probe = rcpm_probe,
> --
> 2.25.1
>
