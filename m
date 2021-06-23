Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E935F3B1E5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 18:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G97XX54jJz3c0p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 02:10:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tuy8HJNy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tuy8HJNy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G97Wj061Qz3bs5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 02:09:52 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71A8F61220;
 Wed, 23 Jun 2021 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464590;
 bh=ONPWfjtURvhSrw51Nfjaq7MyuJNDRja8KI0zy6NKIig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tuy8HJNyLwOvuhheZZZNZlu3TYaZLVWjosEREFOvWrn2wcCWQsaz/tJqvJAOq/5B3
 gRnZ59Cn4mKN/M6IgRdJUcx9dbkQnLmA7etZzp/nqRQoRMbMeFBotqdtkSf1ksgzAq
 WFjTFeZWpBVm+ysv3CQJBWJBWS2ct3TsByZ2RQ0OLac5NlQ0+bCaaMT5+ajabMuAuE
 jKsu6s4SGrI+APgz+VVGv/yGsYypli2pTMCa2e6ZjOkK4SI7bxm2XYmtPqHhyzofNG
 m7pvRsxG7q+q1LOBVy7/Q9UkmxKs2SX0HPkLMhfgnSt1NuzIAkg4drdDvcsQsoYvef
 YMGe43aNYy4eA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Shawn Guo <shawnguo@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH 1/1] ASoC: fsl: remove unnecessary oom message
Date: Wed, 23 Jun 2021 17:08:59 +0100
Message-Id: <162446397756.55213.5590608323919673701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617103141.1765-1-thunder.leizhen@huawei.com>
References: <20210617103141.1765-1-thunder.leizhen@huawei.com>
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
Cc: Mark Brown <broonie@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Jun 2021 18:31:41 +0800, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: remove unnecessary oom message
      commit: 723ca2f89412abe47b7cbb276f683ddb292c172c

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
