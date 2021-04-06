Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EE1355E1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 23:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFLgb3PDkz303w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 07:46:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.47; helo=mail-oo1-f47.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFLgG1tbwz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 07:45:45 +1000 (AEST)
Received: by mail-oo1-f47.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so4042388oop.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 14:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qyunIQmpMoQ2hJkQKW9e3iWhuiH99hCwIK89nVDwBeA=;
 b=Tux8AbMUW4m5PLr6p5kSzOdisn99rsPNtt8S46T9nLRg9zNYI7cxBresTo2QDy4qou
 FL5iJQ/L3DisnFIGYTb3EOlEhjtfi8JazOjgJOtIyPoUdg7efYzQr5DuTABDqYs00p9W
 OVLor5io8pNdD/0cD2JyiUhibCsUR/MyQSWx4aETwXtOwRXxmccgQXjMQyxt1kO0jjbW
 M+8JXt8R5hWYhfU/gfE/QRk5uD+nH2z0lX0xOL4kcF3fi+quuRlbm+D1/t8hGW/HRWzJ
 +2iRRaubq/zG9Se3lgBdcFg8bpb6kXM+jJLWvyv0ezglz9bAYw90ptgdxgYKt0thu/lA
 jwBg==
X-Gm-Message-State: AOAM532pO23D2CLhPYkQc7Jv0Jw2pm0SJoxn9ITMB1hkJL62fLqnPm01
 zo7ZGzs4Xi83ms5itCVknsjaDi+C0LQ=
X-Google-Smtp-Source: ABdhPJzjmcsp1y8qpHw04FwP+Ohyaz71wi7nGgNSYSR4OLwjKHzwdJiGHa0IPDzklbf2uFHjBfZUvA==
X-Received: by 2002:a4a:d781:: with SMTP id c1mr275506oou.44.1617745542193;
 Tue, 06 Apr 2021 14:45:42 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
 [209.85.210.50])
 by smtp.gmail.com with ESMTPSA id x2sm5088317ote.47.2021.04.06.14.45.41
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 14:45:41 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so16117081otn.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 14:45:41 -0700 (PDT)
X-Received: by 2002:a05:6830:20da:: with SMTP id
 z26mr153933otq.74.1617745540947; 
 Tue, 06 Apr 2021 14:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210312085822.12136-1-ran.wang_1@nxp.com>
In-Reply-To: <20210312085822.12136-1-ran.wang_1@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 6 Apr 2021 16:45:29 -0500
X-Gmail-Original-Message-ID: <CADRPPNRv_T9o=Kg4dCJ6jFPxOWMY24wgDXCzyTpz3oh_yL+4Tw@mail.gmail.com>
Message-ID: <CADRPPNRv_T9o=Kg4dCJ6jFPxOWMY24wgDXCzyTpz3oh_yL+4Tw@mail.gmail.com>
Subject: Re: [PATCH v6] soc: fsl: enable acpi support in RCPM driver
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

On Fri, Mar 12, 2021 at 2:56 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> From: Peng Ma <peng.ma@nxp.com>
>
> This patch enables ACPI support in RCPM driver.
>
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
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
>  drivers/soc/fsl/rcpm.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
> index 4ace28cab314..7aa997b932d1 100644
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
> @@ -78,10 +79,14 @@ static int rcpm_pm_prepare(struct device *dev)
>                                 "fsl,rcpm-wakeup", value,
>                                 rcpm->wakeup_cells + 1);
>
> -               /*  Wakeup source should refer to current rcpm device */
> -               if (ret || (np->phandle != value[0]))
> +               if (ret)
>                         continue;
>
> +               if (is_of_node(dev->fwnode))
> +                       /*  Should refer to current rcpm device */
> +                       if (np->phandle != value[0])
> +                               continue;

It looks like that we assume that in the ACPI scenario there will only
be one RCPM controller and all devices are controlled by this single
PM controller.  This probably is true for all existing SoCs with a
RCPM.  But since the driver tried to support multiple RCPMs, maybe we
should continue to support multiple RCPM controllers or at least
mention that in the comment.

> +
>                 /* Property "#fsl,rcpm-wakeup-cells" of rcpm node defines the
>                  * number of IPPDEXPCR register cells, and "fsl,rcpm-wakeup"
>                  * of wakeup source IP contains an integer array: <phandle to
> @@ -172,10 +177,19 @@ static const struct of_device_id rcpm_of_match[] = {
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
