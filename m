Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BF2A49EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:33:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQYhn3KcNzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 02:33:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cX7YnHDv; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQYbv6sq3zDqFF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 02:29:15 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id y12so18995996wrp.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 07:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cinjSse47w4OyBjCwL2P/oafcagxHnLlboUEJDujNWw=;
 b=cX7YnHDv9m5+T7PbYX1ejAYBuULrQQ+M0omEMTQnojpGH8v/C5HKpdzGwPJOa5ab2J
 hWvr65vepL8wyiP+0aMOixJkRcMW5S6eaXcMWPrYmd/7G58lnJBRA7mZOEsNleDYa0yr
 SKIlBUDn2JHHV9/9oFL2tnLHsBG8k26M+lqdFa2vY0c/HN4q7AYGC48aRoGa/vyC4lH/
 my/WLOeYp1lwX1+QNh/x7yP9dEPhbwuo7fSZHgNeLSf8FfpoUnTAFo5BL3I2Y+E4p++O
 Hbne+HYaqgTlebyKrpkPS6jDswYcHoysUa1ZTvtvRAVDOBwaryaj9SVgIWvC0yOjixW6
 hI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cinjSse47w4OyBjCwL2P/oafcagxHnLlboUEJDujNWw=;
 b=WxMrrFJk5BpMu898/Yh1cOEdKJEpC3O7OHaiq3xHtFImonszIOtvalSJlpapQ/P2QZ
 XSVdqB4bQrCJCMVGCgnDHWTNF1FuVXTNHtddjUCCecg2lrsNepeZzh8TCsk2s3GlHyCl
 zbnrVMMdkuXhLiMtfw/+Oi4pFRzraV8a+SaEqKfs6Vhn/5AyTX8cO+z5cZvWLOLmPmYn
 AodB4sxZKlX/AP2DQbNCbpeZ0dvCPvZkbnBy64DsKHpS9e9uHG7N4uVdXaGraZB2/wqS
 vwymH8aHiP/eUAPdKA+DZXDejRyoT9vbGlH4wWFcuQPQFTpXCLgJdxLJNXDZ6QBjtpB0
 XI3w==
X-Gm-Message-State: AOAM533C/dlPXRWdIF1ZFZAVWi5C5Cy+1ctvlaX/i8uka4WPDaetxlsb
 2NGMUxcgeKXf1A1/su7Woewa5A==
X-Google-Smtp-Source: ABdhPJyzlV0HXdTidCRBprYLkp0uWjD8RuYpiqDZS7BW//F1Q+dvuU4dB6/3Ff6PqbhKnABb0CWqEw==
X-Received: by 2002:adf:c803:: with SMTP id d3mr11847040wrh.108.1604417350540; 
 Tue, 03 Nov 2020 07:29:10 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 07:29:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/25] Rid W=1 warnings in SoC
Date: Tue,  3 Nov 2020 15:28:13 +0000
Message-Id: <20201103152838.1290217-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Thierry Reding <thierry.reding@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, linux-samsung-soc@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 YueHaibing <yuehaibing@huawei.com>, Sandeep Nair <sandeep_n@ti.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, act <dmalek@jlc.net>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Cyril Chemparathy <cyril@ti.com>, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, "Software, Inc" <source@mvista.com>,
 Dave Gerlach <d-gerlach@ti.com>, Doug Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Mark Brown <broonie@kernel.org>, Dan Malek <dan@embeddedalley.com>,
 Vitaly Bordug <vbordug@ru.mvista.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (25):
  soc: bcm: brcmstb: pm: pm-arm: Provide prototype for
    brcmstb_pm_s3_finish()
  soc: qcom: qcom_aoss: Remove set but unused variable 'tlen'
  soc: qcom: qcom_aoss: Add missing description for 'cooling_devs'
  soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc misdemeanours
  soc: rockchip: io-domain: Remove incorrect and incomplete comment
    header
  soc: ti: knav_qmss_queue: Remove set but unchecked variable 'ret'
  soc: ti: knav_qmss_queue: Fix a whole host of function documentation
    issues
  soc: ti: knav_dma: Fix a kernel function doc formatting issue
  soc: ti: pm33xx: Remove set but unused variable 'ret'
  soc: ti: wkup_m3_ipc: Document 'm3_ipc' parameter throughout
  soc: fsl: qe: qe_common: Fix misnamed function attribute 'addr'
  soc: qcom: qcom-geni-se: Fix misnamed function parameter 'rx_rfr'
  soc: tegra: fuse: speedo-tegra124: Remove some set but unused
    variables
  soc: samsung: s3c-pm-check: Fix incorrectly named variable 'val'
  soc: qcom: rpmh: Fix possible doc-rot in rpmh_write()'s header
  soc: qcom: smem: Fix formatting and missing documentation issues
  soc: qcom: smsm: Fix some kernel-doc formatting and naming problems
  soc: qcom: wcnss_ctrl: Demote non-conformant struct header and fix
    function headers
  soc: qcom: smp2p: Remove unused struct attribute provide another
  soc: qcom: llcc-qcom: Fix expected kernel-doc formatting
  soc: qcom: rpmhpd: Provide some missing struct member descriptions
  soc: qcom: kryo-l2-accessors: Fix misnaming of 'val'
  soc: ti: k3-ringacc: Provide documentation for 'k3_ring's 'state'
  soc: tegra: fuse: speedo-tegra210: Remove a group of set but unused
    variables
  soc: fsl: qbman: qman: Remove unused variable 'dequeue_wq'

 drivers/soc/bcm/brcmstb/pm/pm-arm.c      |  2 +
 drivers/soc/fsl/dpio/qbman-portal.c      | 18 +++++--
 drivers/soc/fsl/qbman/qman.c             |  8 +--
 drivers/soc/fsl/qe/qe_common.c           |  2 +-
 drivers/soc/qcom/kryo-l2-accessors.c     |  2 +-
 drivers/soc/qcom/llcc-qcom.c             |  2 +-
 drivers/soc/qcom/qcom-geni-se.c          |  5 +-
 drivers/soc/qcom/qcom_aoss.c             |  4 +-
 drivers/soc/qcom/rpmh.c                  |  2 +-
 drivers/soc/qcom/rpmhpd.c                |  3 ++
 drivers/soc/qcom/smem.c                  |  3 +-
 drivers/soc/qcom/smp2p.c                 |  3 +-
 drivers/soc/qcom/smsm.c                  |  4 +-
 drivers/soc/qcom/wcnss_ctrl.c            |  8 +--
 drivers/soc/rockchip/io-domain.c         |  3 --
 drivers/soc/samsung/s3c-pm-check.c       |  2 +-
 drivers/soc/tegra/fuse/speedo-tegra124.c |  7 ++-
 drivers/soc/tegra/fuse/speedo-tegra210.c |  8 +--
 drivers/soc/ti/k3-ringacc.c              |  1 +
 drivers/soc/ti/knav_dma.c                |  2 +-
 drivers/soc/ti/knav_qmss_queue.c         | 62 ++++++++++++------------
 drivers/soc/ti/pm33xx.c                  |  4 +-
 drivers/soc/ti/wkup_m3_ipc.c             |  8 ++-
 23 files changed, 86 insertions(+), 77 deletions(-)

Cc: act <dmalek@jlc.net>
Cc: Andy Gross <agross@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Cyril Chemparathy <cyril@ti.com>
Cc: Dan Malek <dan@embeddedalley.com>
Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Roy Pledge <Roy.Pledge@nxp.com>
Cc: Sandeep Nair <sandeep_n@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Scott Wood <scottwood@freescale.com>
Cc: "Software, Inc" <source@mvista.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Vitaly Bordug <vbordug@ru.mvista.com>
Cc: YueHaibing <yuehaibing@huawei.com>

-- 
2.25.1

