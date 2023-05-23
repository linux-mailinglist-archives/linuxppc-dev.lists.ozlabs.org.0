Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5851970E5FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 21:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQlLS3k4gz3f94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 05:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Od6/0Ezq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Od6/0Ezq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQlKY5kL5z3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 05:50:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89B10629C7;
	Tue, 23 May 2023 19:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24A4C433D2;
	Tue, 23 May 2023 19:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684871422;
	bh=UWa2AeMFPzYhFvGJKx4IJB8Xp9f2d2gLz7s4ekBTywI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Od6/0EzqGQz2cgrAkFnoJfDZhlpLvRvrJXUJirKGy8xvBVAKj2KEqQcuNafYW3kFb
	 m8TrWyjlqKWDkdRogJXBpIHnKB3vmhkyCDEfAYpwUkNrvpZmTrACyZKIMqY/eMP4Ci
	 +KdZ41TiIHjbperNgsTXNCzen8sKMMFSmZJ1deK9TIgwE69Z7w1vjHgC7ef4peeUCz
	 UIin1KghHbDjSqjnZ4CTcY7uEZKspGmvRstEWvq2E5IlPkAemPog9AjbqRN+MMS/sp
	 mjqxHLhHbLPe2ICjJYnzuF4gJ2QX+eo1O5IgW1IYYZq/SL42GtXYF6hYFnGisc3VhP
	 ElFhSqCzyntGw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, 
 oder_chiou@realtek.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com, 
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, vkoul@kernel.org, 
 daniel.baluta@nxp.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
 jarkko.nikula@bitmer.com, Claudiu Beznea <claudiu.beznea@microchip.com>
In-Reply-To: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
References: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 0/2] ASoC: do not include runtime_pm.h if not needed
Message-Id: <168487141457.278276.14403684308927400047.b4-ty@kernel.org>
Date: Tue, 23 May 2023 20:50:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 May 2023 12:49:01 +0300, Claudiu Beznea wrote:
> Series removes the pm_runtime.h inclusion in files where
> APIs exported though pm_runtime.h are not used. In case
> of files that make use of pm.h which comes form pm_runtime.h
> added patch 2/2.
> 
> Changes were built with allmodconfig on ARM and x86_64 and checked
> all the changed files were built at least once.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: do not include pm_runtime.h if not used
      commit: 2f3092e77f98fcfc0d653846591401bfe2a5232e
[2/2] ASoC: use pm.h instead of runtime_pm.h
      commit: a9392efae9f5de42673cfc1b81ac6fb88bdb26b2

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

