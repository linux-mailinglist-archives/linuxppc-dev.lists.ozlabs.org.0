Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F036C1FB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 19:32:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgNdd0F0Lz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 05:32:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c7TLvup/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c7TLvup/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgNcg2vyzz3cDc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 05:32:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84DEF6179C;
	Mon, 20 Mar 2023 18:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04AEC433A4;
	Mon, 20 Mar 2023 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337119;
	bh=3r2HtIjH5nWuv0CjX4W1HrwLYTiBFSaOf5Q1w39yq44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c7TLvup/omv6Ed2ppWGMDa/Xmashqq7uQTDrE3JqqHkFhMT2W1lmeq8S553K7QIij
	 hkR/i3F/fh5YHUm1TIe1CnEgo9P1T+Dtwqe1UX8yqWEmNPcnXrO1fNd/N7bCBEbXoT
	 8Ao91gSzJqw4LbfVamA1HC1EmWNpE6ZgpvM4p460+TL3EXZsbkXZLxCPylM5FxD918
	 Ugc2WZNxuhoOv5e5SSVjG/xTNWIV6K6ySTnLxlmojLJJqJZBApMUuN6kcKv3WLu6cP
	 8HeK3ynLsO4TCk8KTgTW+CM2BiWjwTtn8i8Rf91K81M3PGUj4FMGJknAItd91dPYFm
	 rf3TirKYkp04g==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: define a common DRIVER_NAME
Message-Id: <167933711770.198283.14739386513152159335.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:31:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Mar 2023 13:36:10 +0100, Alexander Stein wrote:
> Instead of copying the driver name manually, use a common define.
> No functional change.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl: define a common DRIVER_NAME
      commit: 1d52cba3b99278f178bfadf88e666648a217a813
[2/2] ASoC: fsl: Specify driver name in ASoC card
      commit: 9934844f6b49fb9964f878f12912abe689eaed5d

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

