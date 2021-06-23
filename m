Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F863B1E5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 18:10:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G97X354Pmz3bwL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 02:10:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y6+OULoo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y6+OULoo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G97WZ2mPSz304C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 02:09:46 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8DEA611CB;
 Wed, 23 Jun 2021 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464582;
 bh=XycGzb/Or5rXgqXxq5Pfdilk0APC+bbYpOpd9WsN+44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y6+OULooCZkRCYLOck+FarGNR1whZWAjnNUqxQP+vHnmdm9fIh8d320I+xsj5N7R9
 B94VqkbW6XVZRajonlkGv2gaOJT8p/mFoMKw0UM1+nD8531vDy5t/AfsKWaAQievpK
 bbrrlwuL5/nzDJpjMeOBJyGoEng62Brx74mqbVxtsWbmXshGc8KpN69HQJMK3usTbo
 Zm0+HCgd9a7RzYPhWA/6/prSSUxjFi8xWVuiTLgZpGwoFIltvsMIzqPDoPclGZAza2
 MwQPtefUA28lMu9KE4QlL6FuY10IqCifknf6HM6fFcFzSC04WfjTNwoMQ+MSB72/qy
 5X7yZnzfXkHcA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, festevam@gmail.com,
 tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org,
 Xiubo.Lee@gmail.com, perex@perex.cz
Subject: Re: [PATCH] ASoC: fsl_spdif: Fix unexpected interrupt after suspend
Date: Wed, 23 Jun 2021 17:08:56 +0100
Message-Id: <162446397756.55213.7915054235058479880.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
References: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Jun 2021 20:31:24 +0800, Shengjiu Wang wrote:
> When system enter suspend, the machine driver suspend callback
> function will be called, then the cpu driver trigger callback
> (SNDRV_PCM_TRIGGER_SUSPEND) be called, it would disable the
> interrupt.
> 
> But the machine driver suspend and cpu dai driver suspend order
> maybe changed, the cpu dai driver's suspend callback is called before
> machine driver's suppend callback, then the interrupt is not cleared
> successfully in trigger callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Fix unexpected interrupt after suspend
      commit: a7a0a2feb957e446b2bcf732f245ba04fc8b6314

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
