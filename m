Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C367E2698
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 00:50:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z5DT4tnVzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 09:50:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z5BT5JJDzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 09:48:14 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id 83so18920875oii.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 15:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5rO+uc1ILY9OMG2v2SNvpBcmRQmpBzHDB/LO32aNzZk=;
 b=HjpV/GEEgg+qDdaL7cpVSTUm982xtWaVcrwlBtVbBF24DSeEU9oZED259ojPSxt2dt
 vPVmK9+otLR/S6Bq4CLd7sx5jrqx3TWQM1c0JGMgKYVcypfX2Uz/0+PYVqZC9dj4+y5E
 FgKXSxtac0QZlCkRCp52lTtmFpSI+ddVtyuovJGAspf+SNHB2/10KH3SItq0HU7QdDS5
 EkQfB7cUzN/78NdcPgqemUNlqtQ6Y+4P/q3JBuAw3EmIJibXCZUs1u9bRhjMGOT5MUTR
 rPyppR9QW46H3z46JY87hNug6h+zfNUAOtfFo7oytF2Fzzo4jKPR0N5SUMtXm6cdWGrt
 h3Yw==
X-Gm-Message-State: APjAAAV1dMeAIggG127fAajBtUsgau7HNMjziiRYEV2PR8MkGdO9oG9+
 LJu4zwAleL9DcDjlkvJx7JKsAVdRieQ=
X-Google-Smtp-Source: APXvYqxukoYwH3MotRD2Ao58LBpweTZRdabNlWoIHhJu3DKIo35+9xdxWGVcoC0u5c5Yi3cXsILONQ==
X-Received: by 2002:aca:f01:: with SMTP id 1mr649446oip.32.1571870891365;
 Wed, 23 Oct 2019 15:48:11 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
 [209.85.210.44])
 by smtp.gmail.com with ESMTPSA id 8sm6600200oti.41.2019.10.23.15.48.10
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 15:48:10 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id c7so8157308otm.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 15:48:10 -0700 (PDT)
X-Received: by 2002:a05:6830:22d6:: with SMTP id
 q22mr5171244otc.74.1571870889734; 
 Wed, 23 Oct 2019 15:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191023082423.12569-1-ran.wang_1@nxp.com>
 <20191023082423.12569-3-ran.wang_1@nxp.com>
In-Reply-To: <20191023082423.12569-3-ran.wang_1@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 23 Oct 2019 17:47:58 -0500
X-Gmail-Original-Message-ID: <CADRPPNTwzz8M-Gi-371ROmYLrzXUAyxc+2_u6uUp0Fwd1dggLA@mail.gmail.com>
Message-ID: <CADRPPNTwzz8M-Gi-371ROmYLrzXUAyxc+2_u6uUp0Fwd1dggLA@mail.gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 3:24 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> The NXP's QorIQ Processors based on ARM Core have RCPM module

Actually not just ARM based QorIQ processors are having RCPM, PowerPC
based QorIQ SoCs also have RCPM.  Does this driver also work with the
PowerPC SoCs?  Please clarify in the commit message and Kconfig
description.

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

If this is only for ARM, probably add more dependency here?

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

I agree with Rafael that this looks a little bit weird.

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

Can we do read once at the beginning and write once at the end,
instead of doing IO read/write for every wakeup source?

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
> +
> +static int rcpm_probe(struct platform_device *pdev)
> +{
> +       struct device   *dev = &pdev->dev;
> +       struct resource *r;
> +       struct rcpm     *rcpm;
> +       int ret;
> +
> +       rcpm = devm_kzalloc(dev, sizeof(*rcpm), GFP_KERNEL);
> +       if (!rcpm)
> +               return -ENOMEM;
> +
> +       r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!r)
> +               return -ENODEV;
> +
> +       rcpm->ippdexpcr_base = devm_ioremap_resource(&pdev->dev, r);
> +       if (IS_ERR(rcpm->ippdexpcr_base)) {
> +               ret =  PTR_ERR(rcpm->ippdexpcr_base);
> +               return ret;
> +       }
> +
> +       rcpm->little_endian = device_property_read_bool(
> +                       &pdev->dev, "little-endian");
> +
> +       ret = device_property_read_u32(&pdev->dev,
> +                       "#fsl,rcpm-wakeup-cells", &rcpm->wakeup_cells);
> +       if (ret)
> +               return ret;
> +
> +       dev_set_drvdata(&pdev->dev, rcpm);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id rcpm_of_match[] = {
> +       { .compatible = "fsl,qoriq-rcpm-2.1+", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, rcpm_of_match);
> +
> +static struct platform_driver rcpm_driver = {
> +       .driver = {
> +               .name = "rcpm",
> +               .of_match_table = rcpm_of_match,
> +               .pm     = &rcpm_pm_ops,
> +       },
> +       .probe = rcpm_probe,
> +};
> +
> +module_platform_driver(rcpm_driver);
> --
> 2.7.4
>
