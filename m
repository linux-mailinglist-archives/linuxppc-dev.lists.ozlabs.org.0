Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF6153FBC2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 12:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHRpk01DFz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 20:45:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MZ3Z69Wf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MZ3Z69Wf;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHRp75GGQz3bWm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 20:45:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00C2F6152A;
	Tue,  7 Jun 2022 10:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1BCC34114;
	Tue,  7 Jun 2022 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598715;
	bh=zGH5b/STJj18mrG57UIzzjkiu2m/697Mzp28pW+tLkc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MZ3Z69WfLof8HyNjFb6ggN3qi90rV4dWtA0xnqnYR9cxdAqpIcsEGZ1D0upxLFZC+
	 mEEiZLRBpZTAo6NTanz9ryEo+bVz4lOq3uP5S9sqX+UGqFd7hIh1yW/0zsGcc7gMkD
	 rfAf6flBYGI+1va7+LipURXiddlgspFLkq/eT76ABPXhsra7mSETsBkNTppen93acd
	 Ee4hWPMr41cZrSWMhNS38AY1k2rMwAbRRn0WcygCWmRdIh+Vioc7mgtZJQSFWTMntr
	 4R36jstJG318S9EADa+JoVD1R5r9DSmLHRCwnwSscZB1wVnve9INlpLv/P0nal1ks8
	 lhtovcmPzvdyA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com, shengjiu.wang@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1653015960-15474-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653015960-15474-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: enable dual fifo for ASRC P2P
Message-Id: <165459871277.301808.7959112198574702500.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:12 +0100
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

On Fri, 20 May 2022 11:06:00 +0800, Shengjiu Wang wrote:
> The SSI and SPDIF has dual fifos, enhance P2P for these
> case with using the sdma_peripheral_config struct
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: enable dual fifo for ASRC P2P
      commit: 6398b004cfcce38626f3ba6fa5853177a3501aae

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
