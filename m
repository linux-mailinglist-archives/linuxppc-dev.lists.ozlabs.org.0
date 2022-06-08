Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7A543DB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 22:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJK5z2qfvz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 06:47:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CyRadPHN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CyRadPHN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJK5P2M8kz30Dp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 06:46:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81A2A61CDB;
	Wed,  8 Jun 2022 20:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC211C34116;
	Wed,  8 Jun 2022 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654721190;
	bh=VRhhu9ajunTB2Jx0vvHFFqmQHOkemsXwtxpkKIgAyvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CyRadPHNy9qJDKi909xbwJHRtHy9LOPH1UB/XMc4YIkIoxj5GPLO4+jXZ5k0GDyPG
	 jUTR5qxBF/ixGEDHDMCIfF1yM5KllXhXse9Zktz0nHDxheMS1cIpEyfxX9yj0+ZaeO
	 kc8oWsL74MoSdJcqY+chAg2Jkg3qE1BPYXQnD5rRWERQsMK75RjFl9Wv0m4VQSOcso
	 MJ6xIKSE0+tQJz79yqrs7jIPqIIdT/OY9shzL3ClwkV/6Uxa4u5oABW0+otiDPpagu
	 a0sce2j99mYvQCVNBgbsbsTFPs/ezvJ1el/zguUqdeR24bfEO8lspctJNhhhY5RNr6
	 Bb7ygD5dmSniw==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, shengjiu.wang@nxp.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
Message-Id: <165472118853.3018072.13972119584766008524.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 21:46:28 +0100
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

On Thu, 19 May 2022 20:36:48 +0800, Shengjiu Wang wrote:
> On i.MX8MM, the MCTL_MCLK_EN bit it is not only the gate
> for MCLK output to PAD, but also the gate bit between
> root clock and SAI module, So it is need to be enabled
> for master mode, otherwise there is no bclk generated.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
      commit: ff87d619ac180444db297f043962a5c325ded47b

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
