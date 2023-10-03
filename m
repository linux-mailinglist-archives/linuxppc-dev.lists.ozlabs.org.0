Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 986807B5E75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 03:06:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qjo96mCW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S005l3ttMz3dC5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 12:06:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qjo96mCW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S004s4NYQz2ydW;
	Tue,  3 Oct 2023 12:06:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9053FB80D70;
	Tue,  3 Oct 2023 01:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EB4C433C8;
	Tue,  3 Oct 2023 01:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696295161;
	bh=F4f0krFznweIk4taQ98VjdjNBbxdo6qbxD3mNrr0nSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qjo96mCWqTKW7xGjcbugvTHPxzMEDCajwcw1va4Y2FbcHxO3ZcGKJhTfC83106ARL
	 tU6n9aOW7ZWhDLjnQiboRRQ82EVD3td822hvni2XK2g9yNk3HSm2Ur7Z555ck5rG+o
	 12dhoHDmpsg6GbUi7vFsQpePSjmL7y7isIq5rL6cYanqyxddTPGOhvh9UX6i8cVIA7
	 ZNczfsHMS606tgeAt9grrKxT2FqCR0UULw6bIjRTIClFh9JhkLAVjJWQ9lZKETlzhR
	 YTYWmLkKqRpNbxBQIivk0G2e/6Y+0MGkQudKU03TMbdV9ij8lvPLibuVE8O1+k6oVB
	 UoMFwMLszD8rA==
From: Bjorn Andersson <andersson@kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	Li Yang <leoyang.li@nxp.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Huisong Li <lihuisong@huawei.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Shang XiaoJing <shangxiaojing@huawei.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH 00/40] soc: Convert to platform remove callback returning void
Date: Mon,  2 Oct 2023 18:10:02 -0700
Message-ID: <169629539848.1944895.16954663145011378401.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Zev Weiss <zev@bewilderbeest.net>, Alim Akhtar <alim.akhtar@samsung.com>, linux-riscv@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Ruan Jinjie <ruanjinjie@huawei.com>, linux-rockchip@lists.infradead.org, Yang Yingliang <yangyingliang@huawei.com>, Nick Alcock <nick.alcock@oracle.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, linux-mediatek@lists.infradead.org, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, kernel@pengutronix.de, zhang songyi <zhang.songyi@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Mon, 25 Sep 2023 11:54:51 +0200, Uwe Kleine-König wrote:
> this series converts all platform drivers below drivers/soc to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> [...]

Applied, thanks!

[18/40] soc/qcom: icc-bwmon: Convert to platform remove callback returning void
        commit: dd714c568ed4e6f79017be45077de71e9908af03
[19/40] soc/qcom: llcc-qcom: Convert to platform remove callback returning void
        commit: d85a9d18a58156fc8b5ab185e00e078adaaeefde
[20/40] soc/qcom: ocmem: Convert to platform remove callback returning void
        commit: 0b742c498bcd7d215501b10fe9df72a16237735a
[21/40] soc/qcom: pmic_glink: Convert to platform remove callback returning void
        commit: 4b3373e42dc2caa34394ac090c8c70bed49badd6
[22/40] soc/qcom: qcom_aoss: Convert to platform remove callback returning void
        commit: ffbe84a514f863a46a85c1e47b2b6d930b1b463e
[23/40] soc/qcom: qcom_gsbi: Convert to platform remove callback returning void
        commit: 57b31729bd2c72b00d400106e18db91e9d95d3c3
[24/40] soc/qcom: qcom_stats: Convert to platform remove callback returning void
        commit: a47ff90bf2f93ce4ca99858948a74a0c10a2bc45
[25/40] soc/qcom: rmtfs_mem: Convert to platform remove callback returning void
        commit: 7c93da5b8b69d4e4e7270c33ba3206af43930e1d
[26/40] soc/qcom: smem: Convert to platform remove callback returning void
        commit: 4b8dee9a34d51a61f60add996fae6a7140a20ae5
[27/40] soc/qcom: smp2p: Convert to platform remove callback returning void
        commit: 1cd966c2dc19654ed08c843e5c933db8c1349636
[28/40] soc/qcom: smsm: Convert to platform remove callback returning void
        commit: bdd7cc62cf69fe989557445d65d6c8cb2f956518
[29/40] soc/qcom: socinfo: Convert to platform remove callback returning void
        commit: c0989f7d1264b2b1885345a28a32fd5e1e61f9c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
