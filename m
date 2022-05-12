Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6261524F9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 16:13:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzYfB4mYNz3cJD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 00:13:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a+r+E+To;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a+r+E+To; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzYdY4JN2z2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 00:12:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E14FCB8284F;
 Thu, 12 May 2022 14:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC6FC34114;
 Thu, 12 May 2022 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364763;
 bh=UIXcV2KLWijXWL19jQLq1vEhgqxz6qEWy8qt2aKyHXE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=a+r+E+ToFiNe9Q7bFQULMTHx1L1w/qPqi22IiPMWuBdhHM2PMyik/wtrfUatP3Qwu
 f/ymLloRnIPL9gHtXw8KX1zJpXeCsNNNDvaH1XbsPUkrKJSYy6yaa46/QrqqvBA45K
 dLouZyUfxUxr1YRmmWGcRSDN1+AQL5tYeAqEbhxqk236jNDgSiejU3wcugptP9q0Uo
 otnhI8wtvttwXf8huK8VHoDKu4xsvCq4/vcQ+z6ByhxcY41Nr5NtxJ76o0VPgGe/qd
 l9+7DqfbVcaauw+IjIpsjDbd0OKcVgYPDNs0t7Nilmfyyl3i8GXeZac0ijp0e7YC8S
 rMHxvAAY8lZiQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 tiwai@suse.com, shengjiu.wang@nxp.com, nicoleotsuka@gmail.com,
 shengjiu.wang@gmail.com, festevam@gmail.com, perex@perex.cz
In-Reply-To: <1652183808-3745-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652183808-3745-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_ssi: Add support multi fifo script
Message-Id: <165236476117.1016627.2134369167163504091.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:41 +0100
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

On Tue, 10 May 2022 19:56:48 +0800, Shengjiu Wang wrote:
> With dual fifo enabled, the case that recording mono sound
> in the background, playback mono sound twice in parallal,
> at second time playback sound may distort, the possible
> reason is using dual fifo to playback mono sound is not
> recommended.
> 
> This patch is to provide a option to use multi fifo script,
> which can be dynamically configured as one fifo or two fifo
> mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_ssi: Add support multi fifo script
      commit: 7aded7003a4e949b3bf73f060771f9db018a6d96

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
