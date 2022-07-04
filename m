Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43A565A81
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 17:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc9T520lYz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 01:58:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2xnvGJr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2xnvGJr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc9SS3qCfz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 01:58:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7B8B5B8115F;
	Mon,  4 Jul 2022 15:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED676C3411E;
	Mon,  4 Jul 2022 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656950275;
	bh=1E1E7hQgiteHL2Gs8XLqTIBhCoUZep/DLAZWhET/WuI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N2xnvGJr8PmDQcW+8VqQwBy0czRaBGH237+6xYUWZKLxtcpOEyy/1bapz+Z/EoNoU
	 Rk0Jca/ijfd/bHAGvrTpC6bTzigkl6zkbqF3vgen9XmldWlFwD9HxfL+OVY9YoMhvc
	 QAymAMWrJW0EDclvAQJ/PoBbmA5z34d+ZKJKWAQDhCnhMUmo6C/VaT1r0tDxmXMpGR
	 0HUKxb14RYB7XQpMl6Cu3xg23WBeL7l4bKsYmOv6509pNZj0jZach/2w+nAEBClpPZ
	 aMtEiChH/gqqhdth7VhGMNhAbxEwQz0tSsYS+9xQMESVuOfJKAMxYB04rKwWV1UDRh
	 j940EY8OqsFEA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, alsa-devel@alsa-project.org, shengjiu.wang@nxp.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com
In-Reply-To: <1656899417-4775-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656899417-4775-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_micfil: Add legacy_dai_naming flag
Message-Id: <165695027267.481068.6982856158106721474.b4-ty@kernel.org>
Date: Mon, 04 Jul 2022 16:57:52 +0100
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

On Mon, 4 Jul 2022 09:50:16 +0800, Shengjiu Wang wrote:
> Need to add legacy_dai_naming flag otherwise there
> will be issue when registerring component, that cause
> the probe failure.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Add legacy_dai_naming flag
      commit: 978bd27c9aed13d7d739bdcdcf98cbca9106b0ec
[2/2] ASoC: fsl_asrc_dma: Add legacy_dai_naming flag
      commit: 446499743b26958a58891a8f9a061deb5cce7c82

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
