Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F317F366F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 19:46:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HSACHcHs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZYJ62RSJz3dKG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 05:46:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HSACHcHs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZYHB2jv4z3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 05:45:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1DA361AAD;
	Tue, 21 Nov 2023 18:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DACC433C7;
	Tue, 21 Nov 2023 18:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700592354;
	bh=EO6luDaoUXzK9d1/iYTv3zcFJV469noLg8l0rjIvJ60=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HSACHcHsqFmT/I15b1ugu5nNPev/5uP+Z7IWJBd4FR7SWsVV8y4+sKfyqB0uxEFlc
	 bfx15Z7Xh3V0+Ck9GMq7pzGksECDUE3tiIpl+/TCsoQaLV3ZBIxyVRKnpv2qaVxiNc
	 dAwa8Gz3b1R8VkdC3Bkcvo5nlaCXsVNfgS5zWjfx9d7splSvkdU/lTJUQb16nVtI+u
	 MlQtuVhbqq03mDxdedDyKVK72cZ1nJnQTlPnn65iAewwP3VaFT70jCQb0/udPPsAtv
	 1d3Ss7ZXVxFSJWXQIe98HTwaUFhcMMpnQOJCoslosDGb51wWmeEkcWzSWZs6sv0VYA
	 zYoDS6q8+ERcA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20231121052512.20235-1-chancel.liu@nxp.com>
References: <20231121052512.20235-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: sound-card-common: List
 sound widgets ignoring system suspend
Message-Id: <170059235006.1901021.2131981423033331673.b4-ty@kernel.org>
Date: Tue, 21 Nov 2023 18:45:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Nov 2023 13:25:11 +0800, Chancel Liu wrote:
> Add a property to list audio sound widgets which are marked ignoring
> system suspend. Paths between these endpoints are still active over
> suspend of the main application processor that the current operating
> system is running.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: sound-card-common: List sound widgets ignoring system suspend
      commit: 27c69d7da1084af0b8b3a20ef9ff01e9eda5270c
[2/2] ASoC: imx-rpmsg: Force codec power on in low power audio mode
      commit: 5d9f746ca64c3ebfba3b650dbc4b0de705c83f3b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

