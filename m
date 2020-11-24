Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 079BE2C1A31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 01:46:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg51z5lNwzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 11:46:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg5024gdyzDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 11:44:59 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id k26so21894686oiw.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 16:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gI7zhBhIP0+6Xsp8/COOViVeUh5gtUo2CsgJ6HRlj/M=;
 b=TpZdq/mURW3tML2hjHMfO/NClixmr0/w/5E+ZxjvTCZcnPqSPoXV5gDOkuLwHtPD+O
 J3tyslNWMuZ81AcSMTA6LIa1tQkLAsS8K1RRPvfrq2xYLft/MeyV0bhZMTVHtL/ShjHD
 65Cwt+Q8EllzNUeKZ9YhpdYly+WV+Sz2sfvqD1VPgCBsZtRvC+OG+Vj4G2XtxgCn+c4/
 0eesibzb3WDZNx/dmvjxQQybO5v8v9cmInigz3T+96lhCOue9uQlj1GChcGeMB64mBRW
 2kUJdoVOWpCux9WzTwUMXkjUYn3LgwsBYL6AmbNtl77BL16xU/zzXntB5HOp8X56fhb2
 O+kw==
X-Gm-Message-State: AOAM5325efffjzm3l6acmLRHNY5dgeHGjmH9WGV3p/KOjDPoK4z81t2m
 zRjNJYqQstp7k28o0WTYMZ12jG5jvcQ=
X-Google-Smtp-Source: ABdhPJyRF459LqG+YTih8BnHX5ANjcS4OtKSiOuIyc3i96MWYNYwHChfWaELGjI6yNmZkMovBCKkyQ==
X-Received: by 2002:a05:6808:3d6:: with SMTP id
 o22mr1115249oie.145.1606178696510; 
 Mon, 23 Nov 2020 16:44:56 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171])
 by smtp.gmail.com with ESMTPSA id u66sm7602822otb.48.2020.11.23.16.44.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 16:44:56 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id c80so21868098oib.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 16:44:55 -0800 (PST)
X-Received: by 2002:aca:4cf:: with SMTP id 198mr1036440oie.175.1606178695336; 
 Mon, 23 Nov 2020 16:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20201103152838.1290217-1-lee.jones@linaro.org>
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 23 Nov 2020 18:44:43 -0600
X-Gmail-Original-Message-ID: <CADRPPNQx2=f46EQOvYLZUMbL+4qyDXUyvzjsKqFLC-iuQFRAQQ@mail.gmail.com>
Message-ID: <CADRPPNQx2=f46EQOvYLZUMbL+4qyDXUyvzjsKqFLC-iuQFRAQQ@mail.gmail.com>
Subject: Re: [PATCH 00/25] Rid W=1 warnings in SoC
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Roy Pledge <Roy.Pledge@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Scott Wood <scottwood@freescale.com>,
 Thierry Reding <thierry.reding@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 linux-samsung-soc@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 YueHaibing <yuehaibing@huawei.com>, Sandeep Nair <sandeep_n@ti.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, act <dmalek@jlc.net>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Cyril Chemparathy <cyril@ti.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "Software, Inc" <source@mvista.com>,
 Dave Gerlach <d-gerlach@ti.com>, Doug Anderson <dianders@chromium.org>,
 lkml <linux-kernel@vger.kernel.org>, Ben Dooks <ben@simtec.co.uk>,
 Mark Brown <broonie@kernel.org>, Dan Malek <dan@embeddedalley.com>,
 Vitaly Bordug <vbordug@ru.mvista.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 3, 2020 at 9:29 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>
> Lee Jones (25):

>   soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc misdemeanours
>   soc: fsl: qe: qe_common: Fix misnamed function attribute 'addr'
>   soc: fsl: qbman: qman: Remove unused variable 'dequeue_wq'

The above are applied for next.  Thanks.

Regards,
Leo
>
>  drivers/soc/bcm/brcmstb/pm/pm-arm.c      |  2 +
>  drivers/soc/fsl/dpio/qbman-portal.c      | 18 +++++--
>  drivers/soc/fsl/qbman/qman.c             |  8 +--
>  drivers/soc/fsl/qe/qe_common.c           |  2 +-
>  drivers/soc/qcom/kryo-l2-accessors.c     |  2 +-
>  drivers/soc/qcom/llcc-qcom.c             |  2 +-
>  drivers/soc/qcom/qcom-geni-se.c          |  5 +-
>  drivers/soc/qcom/qcom_aoss.c             |  4 +-
>  drivers/soc/qcom/rpmh.c                  |  2 +-
>  drivers/soc/qcom/rpmhpd.c                |  3 ++
>  drivers/soc/qcom/smem.c                  |  3 +-
>  drivers/soc/qcom/smp2p.c                 |  3 +-
>  drivers/soc/qcom/smsm.c                  |  4 +-
>  drivers/soc/qcom/wcnss_ctrl.c            |  8 +--
>  drivers/soc/rockchip/io-domain.c         |  3 --
>  drivers/soc/samsung/s3c-pm-check.c       |  2 +-
>  drivers/soc/tegra/fuse/speedo-tegra124.c |  7 ++-
>  drivers/soc/tegra/fuse/speedo-tegra210.c |  8 +--
>  drivers/soc/ti/k3-ringacc.c              |  1 +
>  drivers/soc/ti/knav_dma.c                |  2 +-
>  drivers/soc/ti/knav_qmss_queue.c         | 62 ++++++++++++------------
>  drivers/soc/ti/pm33xx.c                  |  4 +-
>  drivers/soc/ti/wkup_m3_ipc.c             |  8 ++-
>  23 files changed, 86 insertions(+), 77 deletions(-)
>
> Cc: act <dmalek@jlc.net>
> Cc: Andy Gross <agross@kernel.org>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Ben Dooks <ben@simtec.co.uk>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Cyril Chemparathy <cyril@ti.com>
> Cc: Dan Malek <dan@embeddedalley.com>
> Cc: Dave Gerlach <d-gerlach@ti.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: Roy Pledge <Roy.Pledge@nxp.com>
> Cc: Sandeep Nair <sandeep_n@ti.com>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Scott Wood <scottwood@freescale.com>
> Cc: "Software, Inc" <source@mvista.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Vitaly Bordug <vbordug@ru.mvista.com>
> Cc: YueHaibing <yuehaibing@huawei.com>
>
> --
> 2.25.1
>
