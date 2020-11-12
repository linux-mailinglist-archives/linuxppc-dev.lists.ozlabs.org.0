Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 278E82B0462
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 12:53:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX0Nf5n8mzDqsm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 22:53:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=temperror (SPF Temporary Error: DNS The DNS
 operation timed out after 21.11820387840271 seconds) smtp.mailfrom=sntech.de
 (client-ip=185.11.138.130; helo=gloria.sntech.de;
 envelope-from=heiko@sntech.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sntech.de
X-Greylist: delayed 1402 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Nov 2020 22:40:11 AEDT
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX05R4JghzDqP4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 22:39:49 +1100 (AEDT)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1kdAaB-0000QA-9Q; Thu, 12 Nov 2020 12:16:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/25] Rid W=1 warnings in SoC
Date: Thu, 12 Nov 2020 12:16:00 +0100
Message-Id: <160517975455.81506.16289432612279089945.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, "Software, Inc" <source@mvista.com>,
 Dave Gerlach <d-gerlach@ti.com>, Doug Anderson <dianders@chromium.org>,
 Li Yang <leoyang.li@nxp.com>, Ben Dooks <ben@simtec.co.uk>,
 Mark Brown <broonie@kernel.org>, Dan Malek <dan@embeddedalley.com>,
 Vitaly Bordug <vbordug@ru.mvista.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Nov 2020 15:28:13 +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
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
> [...]

Applied, thanks!

[1/1] soc: rockchip: io-domain: Remove incorrect and incomplete comment header
      commit: a6a3a24c129d229a0eb26b329ab617e2a04245dd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
