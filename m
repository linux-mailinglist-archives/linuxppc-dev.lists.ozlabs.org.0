Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 070AC486B2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 21:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVHyK6jTMz3bcp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 07:29:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F+qwbyGH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F+qwbyGH; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVHx11h0Jz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 07:28:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D836B823F8;
 Thu,  6 Jan 2022 20:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B656C36AE3;
 Thu,  6 Jan 2022 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500897;
 bh=21uqmI0sF0iqFXzWvfwSr8yWzQwcFoXEvQOSpJlA73Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=F+qwbyGHuzSd59HvZAdcWL05m/1dwoHw0g/OWlN9NjtsNLYA9CjiZ2ElVAOi8ifoU
 nwjK6pBaLzl9SFkc64aiFm9xXA/60dEPD5gfqwFNH9Ja1YK+GMSCdk5QV54Gm3K5Lq
 x9wN2hC7VsVxD8mKZpexdSqzLaCZoixn7AOiYc1YrO1/PSpONTvYJtNOCNe76RdbWL
 00LAaDGFeYt1WoPPpAmE0J8p5+xuLVnLB7jyIwYoJydwywAweOIBdZ5DmzezjNWGTV
 6/WHdrxYrWqndNnjrbAlWzgPj4yMz7CWcbQyHCiYvRGKunDcR+7p3bQmPPBO9u/ZM2
 SBTXbdFyaBxBg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, Xiubo.Lee@gmail.com,
 alsa-devel@alsa-project.org, festevam@gmail.com, nicoleotsuka@gmail.com,
 timur@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
References: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/3] ASoC: imx-card: several improvement and fixes
Message-Id: <164150089509.2243486.810361187856950551.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:15 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jan 2022 18:40:32 +0800, Shengjiu Wang wrote:
> Several improvement and fixes for AK codecs supported on i.MX platfroms
> 
> Shengjiu Wang (3):
>   ASoC: imx-card: Need special setting for ak4497 on i.MX8MQ
>   ASoC: imx-card: Fix mclk calculation issue for akcodec
>   ASoC: imx-card: improve the sound quality for low rate
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: imx-card: Need special setting for ak4497 on i.MX8MQ
      commit: 3349b3d0c63b8b6fcca58156d72407f0b2e101ac
[2/3] ASoC: imx-card: Fix mclk calculation issue for akcodec
      commit: f331ae5fa59fbfb748317b290648fc3f1a50d932
[3/3] ASoC: imx-card: improve the sound quality for low rate
      commit: 3969341813eb56d2dfc39bb64229359a6ae3c195

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
