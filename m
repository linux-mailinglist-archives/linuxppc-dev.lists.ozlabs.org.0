Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8721274D28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 01:15:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwxwn29PdzDqXs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 09:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwxtm6HDYzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 09:13:18 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id a3so22958165oib.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGTx/Fj2zjNke6CRvCD9QIl8uae51LrS8iKAvA6PRAw=;
 b=oQsSFy1wuJihPipHHXIrDje/ETnSDwsMzpSFmZiDAdMEQFFj691RSYRxb661LuWChg
 o8ZX0sUTMvaJR7ioAyH5fvw5AV2SnQPpA6fuhGsFQfachpASZ8XCU+iI9+KjMfUDtSPQ
 MRdLsNWTZffio2n3zTsk5vU16dzCmc0jnevQyg4UHcDdZdfDHNDT42AuUPMRbUt9sVme
 3ntNlh71UeLN6OqwwvwI+6ly/jmhs9VjkLh2JoVtxllH/r0Be3YQypkQvHlPaQE9fRoJ
 qBa62u8Z6/gX7geM+qfn0kdZP4aIEuTb+xIzVLhEecwL3YonKX3R9tdE4CD+vj0Z4Yi1
 1EHg==
X-Gm-Message-State: AOAM531rye70OmXv7V+QQVJ+lg60h7iizg6lJomfqBhzOxILES7jyCzF
 wOwwQMIBb2YanRN6HM8qFj2V9AjzpH7CUA==
X-Google-Smtp-Source: ABdhPJzNPhuKFBS9r5jYdkJ5aIvuLg9hv6rTO568ISp/GvARQWuMweK2ebe9DV1oSexuMnE2+mgbBA==
X-Received: by 2002:aca:f414:: with SMTP id s20mr3925982oih.42.1600816395798; 
 Tue, 22 Sep 2020 16:13:15 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
 [209.85.167.173])
 by smtp.gmail.com with ESMTPSA id w12sm8444818oow.22.2020.09.22.16.13.14
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 16:13:14 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 185so22892211oie.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:13:14 -0700 (PDT)
X-Received: by 2002:a05:6808:2d7:: with SMTP id
 a23mr3898652oid.51.1600816394656; 
 Tue, 22 Sep 2020 16:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200915110647.846-1-kuldip.dwivedi@puresoftware.com>
 <4e008f0a-69da-d5c2-4dfc-ef8695e17f47@arm.com>
 <AM6PR04MB5413903EAAEDB2EED2E254C6F1210@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <caf01871-1c3d-bdf8-867d-daf7138966a8@arm.com>
In-Reply-To: <caf01871-1c3d-bdf8-867d-daf7138966a8@arm.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 22 Sep 2020 18:13:02 -0500
X-Gmail-Original-Message-ID: <CADRPPNQAqoFTMRBnq6WZ+jqO8LG4n5fPFxEEh4hF4h=k_D+cLQ@mail.gmail.com>
Message-ID: <CADRPPNQAqoFTMRBnq6WZ+jqO8LG4n5fPFxEEh4hF4h=k_D+cLQ@mail.gmail.com>
Subject: Re: [PATCH v1] soc: fsl: rcpm: Add ACPI support
To: Ard Biesheuvel <ard.biesheuvel@arm.com>
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
Cc: Biwen Li <biwen.li@nxp.com>,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Arokia Samy <arokia.samy@nxp.com>, Paul Yang <Paul.Yang@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 Varun Sethi <V.Sethi@nxp.com>, tanveer <tanveer.alam@puresoftware.com>,
 Ran Wang <ran.wang_1@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 1:12 AM Ard Biesheuvel <ard.biesheuvel@arm.com> wrote:
>
> On 9/16/20 3:32 AM, Ran Wang wrote:
> > Hi Ard,
> >
> > On Tuesday, September 15, 2020 7:10 PM, Ard Biesheuvel wrote:
> >> Subject: Re: [PATCH v1] soc: fsl: rcpm: Add ACPI support
> >>
> >> On 9/15/20 1:06 PM, kuldip dwivedi wrote:
> >>> Add ACPI support in fsl RCPM driver. This is required to support ACPI
> >>> S3 state. S3 is the ACPI sleep state that is known as "sleep" or
> >>> "suspend to RAM".
> >>> It essentially turns off most power of the system but keeps memory
> >>> powered.
> >>>
> >>> Signed-off-by: tanveer <tanveer.alam@puresoftware.com>
> >>> Signed-off-by: kuldip dwivedi <kuldip.dwivedi@puresoftware.com>
> >>
> >> Why does the OS need to program this device? Can't this be done by
> >> firmware?
> >
> > This device is use to tell HW which IP (such as USB, SDHC, SATA, etc) should not be
> > clock gated during system enter low power state (to allow that IP work as a
> > wakeup source). And user does this configuration in device tree.
>
> The point of ACPI is *not* to describe a DT topology using a table
> format that is not suited for it. The point of ACPI is to describe a
> machine that is more abstracted from the hardware than is typically
> possible with DT, where the abstractions are implemented by AML code
> that is provided by the firmware, but executed in the context of the OS.
>
> So the idea is *not* finding the shortest possible path to get your
> existing DT driver code running on a system that boots via ACPI.
> Instead, you should carefully think about the abstract ACPI machine that
> you will expose to the OS, and hide everything else in firmware.
>
> In this particular case, it seems like your USB, SDHC and SATA device
> objects may need power state dependent AML methods that program this
> block directly.

The platform PM driver was created to support PM on systems without a
runtime PM firmware.   Even with PSCI firmware on later systems, there
is no standard interface to communicate the wakeup source information
directly from peripheral drivers to the PSCI firmware.  So we still
need this platform power management driver in kernel to deal with this
setup for non-ACPI scenarios.  From the code re-use perspective, I
think it is probably better to keep this generic implementation in
kernel instead of moving it to ACPI byte-code for each platform.

>
>
>
> > So implement
> > this RCPM driver to do it in kernel rather than firmware.
> >
> > Regards,
> > Ran
> >
> >>> ---
> >>>
> >>> Notes:
> >>>       1. Add ACPI match table
> >>>       2. NXP team members are added for confirming HID changes
> >>>       3. There is only one node in ACPI so no need to check for
> >>>          current device explicitly
> >>>       4. These changes are tested on LX2160A and LS1046A platforms
> >>>
> >>>    drivers/soc/fsl/rcpm.c | 22 +++++++++++++++++++---
> >>>    1 file changed, 19 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c index
> >>> a093dbe6d2cb..e75a436fb159 100644
> >>> --- a/drivers/soc/fsl/rcpm.c
> >>> +++ b/drivers/soc/fsl/rcpm.c
> >>> @@ -2,10 +2,12 @@
> >>>    //
> >>>    // rcpm.c - Freescale QorIQ RCPM driver
> >>>    //
> >>> -// Copyright 2019 NXP
> >>> +// Copyright 2019-2020 NXP
> >>> +// Copyright 2020 Puresoftware Ltd.
> >>>    //
> >>>    // Author: Ran Wang <ran.wang_1@nxp.com>
> >>>
> >>> +#include <linux/acpi.h>
> >>>    #include <linux/init.h>
> >>>    #include <linux/module.h>
> >>>    #include <linux/platform_device.h>
> >>> @@ -57,8 +59,13 @@ static int rcpm_pm_prepare(struct device *dev)
> >>>                             rcpm->wakeup_cells + 1);
> >>>
> >>>             /*  Wakeup source should refer to current rcpm device */
> >>> -           if (ret || (np->phandle != value[0]))
> >>> -                   continue;
> >>> +           if (is_acpi_node(dev->fwnode)) {
> >>> +                   if (ret)
> >>> +                           continue;
> >>> +           } else {
> >>> +                   if (ret || (np->phandle != value[0]))
> >>> +                           continue;
> >>> +           }
> >>>
> >>>             /* Property "#fsl,rcpm-wakeup-cells" of rcpm node defines the
> >>>              * number of IPPDEXPCR register cells, and "fsl,rcpm-wakeup"
> >>> @@ -139,10 +146,19 @@ static const struct of_device_id rcpm_of_match[]
> >> = {
> >>>    };
> >>>    MODULE_DEVICE_TABLE(of, rcpm_of_match);
> >>>
> >>> +#ifdef CONFIG_ACPI
> >>> +static const struct acpi_device_id rcpm_acpi_match[] = {
> >>> +   { "NXP0015", },
> >>> +   { }
> >>> +};
> >>> +MODULE_DEVICE_TABLE(acpi, rcpm_acpi_match); #endif
> >>> +
> >>>    static struct platform_driver rcpm_driver = {
> >>>     .driver = {
> >>>             .name = "rcpm",
> >>>             .of_match_table = rcpm_of_match,
> >>> +           .acpi_match_table = ACPI_PTR(rcpm_acpi_match),
> >>>             .pm     = &rcpm_pm_ops,
> >>>     },
> >>>     .probe = rcpm_probe,
> >>>
> >
>
