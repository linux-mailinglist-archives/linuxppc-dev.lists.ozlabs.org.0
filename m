Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B27912AE820
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 06:27:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWCsj0dXvzDqY4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:27:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=bjorn.andersson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=k0+kPp4Q; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWCqy6hWpzDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 16:25:47 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id n15so1054401otl.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 21:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y2ndxJgHEnHcPZgvTcxab2Vcfl3sIpgvRbePyhc7fWA=;
 b=k0+kPp4QegQ8x48cvtzhFv/+5D9Dzcc/GkW9H2cVvWdsV62FFEeh5SomjgkF6ArEbs
 SALg/lHidLzXzKJDPe75nRCtJMKl+T1DXOhFkqJgHeGSByWcQswiWqNS9RdS1OPCxVY9
 sheWT6Xmes3YqryK1wzNDycXLFQMTTFdw1Q0QOtfv332yhZEihs5rlicmJNnJ4aqKofH
 3PQM44SvKJ1pzUNDJ9DmQTiwaoEuFLpE7r53YAHQgZeAjyY0+vMVtM542WaJkvkneani
 PJVq5THlhQ9375G7mmtdr4YMQ4Nn+5e7cVKti3uV2mwvfz15gwZMliWxEHK9fXeLku9O
 ODyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y2ndxJgHEnHcPZgvTcxab2Vcfl3sIpgvRbePyhc7fWA=;
 b=PJt+BzeeGTzVPIyFHqGqhP9U0i3+0lO0svJJPG5BgefTxMZluEPV1DWTxhfKfxQKqw
 jkfdBj3DWkRenB7F3QV+mPB3SHTK0E4RUkS13cOeKIXOkMROdMhayfvhGSvYF8yRMeQg
 yjMjtUAtCmR6SyoOTHcr0Euti1CsK5F5Fx+D82brZjKZmNuh9jazRBwySvubYrApHOEw
 uGFD2Knne5RVIu54Mv8flTptxtRQflqYfizRct3a+hTesY2wxkpOwBSHl1LmBt18SX8o
 YDjBsH45Ne4W9mivgUlay19VvZ1jxC93MMTnXEXHoN6wLvQg8bAjYcWi/xKPZO8Vu55z
 CabA==
X-Gm-Message-State: AOAM532NkBuEym3Y1EZ5BbCTRcyq1HHfL4pwiTEU5Cu39OPRzHwLcbN1
 h00pOLPWiYsN8lrj7n8+LhfIQw==
X-Google-Smtp-Source: ABdhPJxYlw4HOIVtNlSAXCpvPkLgs0k9q7yaxQqFlvLOOSr3etHIDMddV04BFhc/FMfh+dl4z1o0rw==
X-Received: by 2002:a9d:62c1:: with SMTP id z1mr15982440otk.108.1605072343541; 
 Tue, 10 Nov 2020 21:25:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id h136sm224748oib.19.2020.11.10.21.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 21:25:42 -0800 (PST)
Date: Tue, 10 Nov 2020 23:25:40 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/25] Rid W=1 warnings in SoC
Message-ID: <20201111052540.GH173948@builder.lan>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
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
Cc: Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Roy Pledge <Roy.Pledge@nxp.com>, linux-kernel@vger.kernel.org,
 Scott Wood <scottwood@freescale.com>,
 Thierry Reding <thierry.reding@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 linux-samsung-soc@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 YueHaibing <yuehaibing@huawei.com>, Sandeep Nair <sandeep_n@ti.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, act <dmalek@jlc.net>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Cyril Chemparathy <cyril@ti.com>, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Software, Inc" <source@mvista.com>,
 Dave Gerlach <d-gerlach@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Li Yang <leoyang.li@nxp.com>, Ben Dooks <ben@simtec.co.uk>,
 Mark Brown <broonie@kernel.org>, Dan Malek <dan@embeddedalley.com>,
 Vitaly Bordug <vbordug@ru.mvista.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 03 Nov 09:28 CST 2020, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 

For patches 2, 3, 12, 15, 16, 17, 18, 19, 20, 21, 22 (i.e. the soc/qcom
patches):

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
and applied towards 5.11

Regards,
Bjorn

> Lee Jones (25):
>   soc: bcm: brcmstb: pm: pm-arm: Provide prototype for
>     brcmstb_pm_s3_finish()
>   soc: qcom: qcom_aoss: Remove set but unused variable 'tlen'
>   soc: qcom: qcom_aoss: Add missing description for 'cooling_devs'
>   soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc misdemeanours
>   soc: rockchip: io-domain: Remove incorrect and incomplete comment
>     header
>   soc: ti: knav_qmss_queue: Remove set but unchecked variable 'ret'
>   soc: ti: knav_qmss_queue: Fix a whole host of function documentation
>     issues
>   soc: ti: knav_dma: Fix a kernel function doc formatting issue
>   soc: ti: pm33xx: Remove set but unused variable 'ret'
>   soc: ti: wkup_m3_ipc: Document 'm3_ipc' parameter throughout
>   soc: fsl: qe: qe_common: Fix misnamed function attribute 'addr'
>   soc: qcom: qcom-geni-se: Fix misnamed function parameter 'rx_rfr'
>   soc: tegra: fuse: speedo-tegra124: Remove some set but unused
>     variables
>   soc: samsung: s3c-pm-check: Fix incorrectly named variable 'val'
>   soc: qcom: rpmh: Fix possible doc-rot in rpmh_write()'s header
>   soc: qcom: smem: Fix formatting and missing documentation issues
>   soc: qcom: smsm: Fix some kernel-doc formatting and naming problems
>   soc: qcom: wcnss_ctrl: Demote non-conformant struct header and fix
>     function headers
>   soc: qcom: smp2p: Remove unused struct attribute provide another
>   soc: qcom: llcc-qcom: Fix expected kernel-doc formatting
>   soc: qcom: rpmhpd: Provide some missing struct member descriptions
>   soc: qcom: kryo-l2-accessors: Fix misnaming of 'val'
>   soc: ti: k3-ringacc: Provide documentation for 'k3_ring's 'state'
>   soc: tegra: fuse: speedo-tegra210: Remove a group of set but unused
>     variables
>   soc: fsl: qbman: qman: Remove unused variable 'dequeue_wq'
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
