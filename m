Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E914F2077BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 17:40:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sS696zHNzDqbp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 01:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=SjlcCYhb; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sS3j1lDjzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 01:38:40 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 738D7206FA;
 Wed, 24 Jun 2020 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593013118;
 bh=k66UnNbdyPj+LwX7I2nsf9Uvi/hIVtOAiKbZmkacQPs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=SjlcCYhbgYzIzfrM1ot62LZQoDUuGcOKV41ckwqgbdgvZsFRh3GPT84jLdJBra0lb
 zJlkt6b1uDO+GHMVO8rziQOOOcvfX5UDYws3hVF+hkjIEBtu7pamSSr8uFwNBFX1Gi
 5OrmjQYl8pc+GTzBPfWWL1Ul1ZEboAmIwOX7ZrCc=
Date: Wed, 24 Jun 2020 16:38:35 +0100
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, festevam@gmail.com, linuxppc-dev@lists.ozlabs.org,
 alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 timur@kernel.org, tiwai@suse.com, perex@perex.cz,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org
In-Reply-To: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
References: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: Add WM8524 support
Message-Id: <159301311578.33465.8345204179048045259.b4-ty@kernel.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jun 2020 14:52:46 +0800, Shengjiu Wang wrote:
> WM8524 only supports playback mode, and only works at
> slave mode.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl-asoc-card: Add WM8524 support
      commit: 3cd990267401fc7d0b222fc81f637e75e46967e0
[2/2] ASoC: bindings: fsl-asoc-card: Add compatible string for wm8524
      commit: 3b3372fa65bab619f99bcfe272e92fb6faa07219

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
