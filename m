Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0CE157D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 11:14:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yl7L3jlMzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 20:14:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yl580PwNzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 20:12:27 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id o205so16718453oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 02:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9e2tdyJ+jhbraDazF6LVEdNxXM3+pxi8NuZ/Hugb5E=;
 b=KoQYip2/wFfAV5HH3t8mdlFssYEjPnrU+pMVcUdjBhdS11rgWujoVyXkAZvuT9BF1k
 FobJV+4UMpQvXuVNfC3sOeGQpYSvmZyjpLtxYAKXtX6S0o4wKkvRGAt2IDut7+pFZ2YC
 KyKbB/zzb+Z/At05vo9pO4SkYULM5HmJs6kOBbm+JbGpW6qL2a+fOnFDkM9IDScnt5aa
 kj8fUVVGMNGOn2qhaGQGbiX5XxkGl+fDfTQJm+rnwly7anUTFsHEhpo8SlytmEz0z2d0
 3fKEWXEA0evUd55dRfRU0PONK8eQYw8X6VfNIynABU25qHLz2V3sz5VPHHRYYcY6STlV
 fUmg==
X-Gm-Message-State: APjAAAWfJ/127Oa7M+nG7ex2St8Tn7Fy1QyHb0NAIJNdUP+PaEsevcqe
 IreP/VbdHbCFvQzxsyyRrpo/kAYWvWdGstrw+Bk=
X-Google-Smtp-Source: APXvYqzrTSVIDKeg/LSwHPg4nLGUyfseJPmnQLFNA0oSLGOXU5LmtkriLGk3+XW6wYlrIk86X4PP9mA+eeDYjX+jZKw=
X-Received: by 2002:aca:b6c5:: with SMTP id g188mr6925323oif.103.1571821944448; 
 Wed, 23 Oct 2019 02:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191023082423.12569-1-ran.wang_1@nxp.com>
 <20191023082423.12569-3-ran.wang_1@nxp.com>
In-Reply-To: <20191023082423.12569-3-ran.wang_1@nxp.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Oct 2019 11:12:13 +0200
Message-ID: <CAJZ5v0i-gfRTzbDL5SBp_XfOYCkJPENpOjU+Pd3wi5aOjZd1HQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] soc: fsl: add RCPM driver
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
Cc: Mark Rutland <mark.rutland@arm.com>, Li Biwen <biwen.li@nxp.com>,
 Huang Anson <anson.huang@nxp.com>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 10:24 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> The NXP's QorIQ Processors based on ARM Core have RCPM module
> (Run Control and Power Management), which performs system level
> tasks associated with power management such as wakeup source control.
>
> This driver depends on PM wakeup source framework which help to
> collect wake information.
>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v9:
>         - Add kerneldoc for rcpm_pm_prepare().
>         - Use pr_debug() to replace dev_info(), to print message when decide
>           skip current wakeup object, this is mainly for debugging (in order
>           to detect potential improper implementation on device tree which
>           might cause this skip).
>         - Refactor looping implementation in rcpm_pm_prepare(), add more
>           comments to help clarify.
>
> Change in v8:
>         - Adjust related API usage to meet wakeup.c's update in patch 1/3.
>         - Add sanity checking for the case of ws->dev or ws->dev->parent
>           is null.
>
> Change in v7:
>         - Replace 'ws->dev' with 'ws->dev->parent' to get aligned with
>         c8377adfa781 ("PM / wakeup: Show wakeup sources stats in sysfs")
>         - Remove '+obj-y += ftm_alarm.o' since it is wrong.
>         - Cosmetic work.
>
> Change in v6:
>         - Adjust related API usage to meet wakeup.c's update in patch 1/3.
>
> Change in v5:
>         - Fix v4 regression of the return value of wakeup_source_get_next()
>         didn't pass to ws in while loop.
>         - Rename wakeup_source member 'attached_dev' to 'dev'.
>         - Rename property 'fsl,#rcpm-wakeup-cells' to '#fsl,rcpm-wakeup-cells'.
>         please see https://lore.kernel.org/patchwork/patch/1101022/
>
> Change in v4:
>         - Remove extra ',' in author line of rcpm.c
>         - Update usage of wakeup_source_get_next() to be less confusing to the
> reader, code logic remain the same.
>
> Change in v3:
>         - Some whitespace ajdustment.
>
> Change in v2:
>         - Rebase Kconfig and Makefile update to latest mainline.
>
>  drivers/soc/fsl/Kconfig  |   8 +++
>  drivers/soc/fsl/Makefile |   1 +
>  drivers/soc/fsl/rcpm.c   | 148 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 157 insertions(+)
>  create mode 100644 drivers/soc/fsl/rcpm.c
>
> diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
> index f9ad8ad..4918856 100644
> --- a/drivers/soc/fsl/Kconfig
> +++ b/drivers/soc/fsl/Kconfig
> @@ -40,4 +40,12 @@ config DPAA2_CONSOLE
>           /dev/dpaa2_mc_console and /dev/dpaa2_aiop_console,
>           which can be used to dump the Management Complex and AIOP
>           firmware logs.
> +
> +config FSL_RCPM
> +       bool "Freescale RCPM support"
> +       depends on PM_SLEEP
> +       help
> +         The NXP QorIQ Processors based on ARM Core have RCPM module
> +         (Run Control and Power Management), which performs all device-level
> +         tasks associated with power management, such as wakeup source control.
>  endmenu
> diff --git a/drivers/soc/fsl/Makefile b/drivers/soc/fsl/Makefile
> index 71dee8d..906f1cd 100644
> --- a/drivers/soc/fsl/Makefile
> +++ b/drivers/soc/fsl/Makefile
> @@ -6,6 +6,7 @@
>  obj-$(CONFIG_FSL_DPAA)                 += qbman/
>  obj-$(CONFIG_QUICC_ENGINE)             += qe/
>  obj-$(CONFIG_CPM)                      += qe/
> +obj-$(CONFIG_FSL_RCPM)                 += rcpm.o
>  obj-$(CONFIG_FSL_GUTS)                 += guts.o
>  obj-$(CONFIG_FSL_MC_DPIO)              += dpio/
>  obj-$(CONFIG_DPAA2_CONSOLE)            += dpaa2-console.o
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
> new file mode 100644
> index 0000000..9378073
> --- /dev/null
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// rcpm.c - Freescale QorIQ RCPM driver
> +//
> +// Copyright 2019 NXP
> +//
> +// Author: Ran Wang <ran.wang_1@nxp.com>
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/suspend.h>
> +#include <linux/kernel.h>
> +
> +#define RCPM_WAKEUP_CELL_MAX_SIZE      7
> +
> +struct rcpm {
> +       unsigned int    wakeup_cells;
> +       void __iomem    *ippdexpcr_base;
> +       bool            little_endian;
> +};
> +
> +/**
> + * rcpm_pm_prepare - performs device-level tasks associated with power
> + * management, such as programming related to the wakeup source control.
> + * @dev: Device to handle.
> + *
> + */
> +static int rcpm_pm_prepare(struct device *dev)
> +{
> +       int i, ret, idx;
> +       void __iomem *base;
> +       struct wakeup_source    *ws;
> +       struct rcpm             *rcpm;
> +       struct device_node      *np = dev->of_node;
> +       u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
> +
> +       rcpm = dev_get_drvdata(dev);
> +       if (!rcpm)
> +               return -EINVAL;
> +
> +       base = rcpm->ippdexpcr_base;
> +       idx = wakeup_sources_read_lock();
> +
> +       /* Begin with first registered wakeup source */
> +       for_each_wakeup_source(ws) {
> +
> +               /* skip object which is not attached to device */
> +               if (!ws->dev || !ws->dev->parent)
> +                       continue;
> +
> +               ret = device_property_read_u32_array(ws->dev->parent,
> +                               "fsl,rcpm-wakeup", value,
> +                               rcpm->wakeup_cells + 1);
> +
> +               /*  Wakeup source should refer to current rcpm device */
> +               if (ret || (np->phandle != value[0])) {
> +                       pr_debug("%s doesn't refer to this rcpm\n", ws->name);

I'm still quite unsure why it is useful to print this message instead
of printing one when the wakeup source does match (there may be many
wakeup source objects you don't care about in principle), but
whatever.

> +                       continue;
> +               }
> +
> +               /* Property "#fsl,rcpm-wakeup-cells" of rcpm node defines the
> +                * number of IPPDEXPCR register cells, and "fsl,rcpm-wakeup"
> +                * of wakeup source IP contains an integer array: <phandle to
> +                * RCPM node, IPPDEXPCR0 setting, IPPDEXPCR1 setting,
> +                * IPPDEXPCR2 setting, etc>.
> +                *
> +                * So we will go thought them and do programming accordngly.
> +                */
> +               for (i = 0; i < rcpm->wakeup_cells; i++) {
> +                       u32 tmp = value[i + 1];
> +                       void __iomem *address = base + i * 4;
> +
> +                       if (!tmp)
> +                               continue;
> +
> +                       /* We can only OR related bits */
> +                       if (rcpm->little_endian) {
> +                               tmp |= ioread32(address);
> +                               iowrite32(tmp, address);
> +                       } else {
> +                               tmp |= ioread32be(address);
> +                               iowrite32be(tmp, address);
> +                       }
> +               }
> +       }
> +
> +       wakeup_sources_read_unlock(idx);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops rcpm_pm_ops = {
> +       .prepare =  rcpm_pm_prepare,
> +};

For the above:

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
