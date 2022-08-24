Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB559F870
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 13:13:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCNkD3P1Bz3c63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 21:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R89AQjm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R89AQjm5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCNjb2JPmz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 21:12:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5403B8238B;
	Wed, 24 Aug 2022 11:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6E5C433D6;
	Wed, 24 Aug 2022 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661339548;
	bh=OGlg8pv6kHT4dTZmIiN7JaN/Td1DIt3ykmROSVhjXKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R89AQjm5QIFEy1m4KLw/y3y2fnUtsahYYAiDRrKZ7ZVutepzYsjI3j649BIhmpVt6
	 BIWFJ24zWf8uKJTwO1LANI064i3Q62jQ+yYvw/u/dnBJKdhi5e9QydoifyCwe/MjHM
	 0ZVAG30iOKEHOZovM7etDo7b/5+D6FUkhYJ6YFS+7ltBW9GEgC7dxVTEOxHr6NBk5l
	 EVmUTe5SOqjkkKpguYiDGPkIu3jt7uEhMNl09oAVmExm700bo6jZGgahl7SyVHDnNW
	 +J3qiIHFrMv7UBLBAOjdyFF6h+h2kufzi4Qm5U2kc1FrbqERx9edy/uS/1BORps4Ju
	 WAy5d2T1nRQfw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, perex@perex.cz, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, festevam@gmail.com, tiwai@suse.com
In-Reply-To: <1659681926-13493-1-git-send-email-shengjiu.wang@nxp.com>
References: <1659681926-13493-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Update slots number according to bclk_ratio
Message-Id: <166133954610.17904.8655688757494279362.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 12:12:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
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

On Fri, 5 Aug 2022 14:45:26 +0800, Shengjiu Wang wrote:
> The bclk_ratio is set by .set_bclk_ratio API.
> bclk_ratio = slots * slot_width
> So if slots is not set by .set_tdm_slot, then it can be calculated
> by bclk_ratio.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Update slots number according to bclk_ratio
      commit: 837b40293de66a5b96f883f540512ec5c3867610

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
