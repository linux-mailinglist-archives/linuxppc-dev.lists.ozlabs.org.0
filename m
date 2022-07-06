Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01932568667
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 13:08:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdGxS6hNmz3c4G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 21:08:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XUcji2VE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XUcji2VE;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdGws4ssmz2xss
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 21:07:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 14CDAB81BE5;
	Wed,  6 Jul 2022 11:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C19C341C0;
	Wed,  6 Jul 2022 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657105673;
	bh=RogpuoWy8qfianqaIwi0HDTIG8Zn33CeVTw7+2LWNGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XUcji2VE1GH/yJAccMlqJmGX0h6ZBd5R8LRiC9OaRG0uDwBqxqlhCmqjVlRjhJfAD
	 N0lAZaQtIpe0OP+aLyMsWfD8PaPoSqGhfUP+c4m4qfx30BGvlZTF++GwieR1iETy4m
	 t4GzDXxBcf1Lw6hb+fr/DMboarL5m/W4DMCR/B3onWgwtHZldBLDUXhuD1CMzaBUty
	 5nQhsmK002eNqDee0PNneUgAHm1CfebXbiNclRTam2QUVtlOqcnL9riOBmFRLFsp3S
	 /d9CrVeuUgg5C0ipIp6n8xqTmwKglW6JAPpxGdWCZaaZBia8TEaXqDfoNoW2RJSaC9
	 MSO6RMlS7GiaA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org, festevam@gmail.com, shengjiu.wang@nxp.com, krzk+dt@kernel.org, nicoleotsuka@gmail.com, devicetree@vger.kernel.org, perex@perex.cz, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com
In-Reply-To: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/6] Add support of two Audio PLL source
Message-Id: <165710567079.237380.5026373305183588583.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:07:50 +0100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 1 Jul 2022 17:32:35 +0800, Shengjiu Wang wrote:
> i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
> configured to handle 8kHz and 11kHz series audio rates.
> 
> The patches implement the functionality to select at runtime
> the appropriate AUDIO PLL for root clock, if there is no
> two PLL registered, then no action taken.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: fsl_utils: Add function to handle PLL clock source
      commit: 7bad8125549cda14d9ccf97d7d76f7ef6ac9d206
[2/6] ASoC: fsl_spdif: Add support for PLL switch at runtime.
      commit: 34dcdebecf2f05e1b275e1da8352f8e4c1aab6f6
[3/6] ASoC: fsl_micfil: Add support for PLL switch at runtime
      commit: 93f54100fbdedc22e8d88d037a8a3e32101724eb
[4/6] ASoC: fsl_sai: Add support for PLL switch at runtime
      commit: 7cb7f07d2491a3435578ab97eeeb70fadac6385c
[5/6] ASoC: dt-bindings: fsl_spdif: Add two PLL clock source
      commit: df0835a810c1585bd54ffb10db92b455e922c7ec
[6/6] ASoC: dt-bindings: fsl-sai: Add two PLL clock source
      commit: 6c06ad34eda9e1990313ff80999e1a75a02fa1c0

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
