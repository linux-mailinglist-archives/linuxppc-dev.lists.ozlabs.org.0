Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED683593310
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 18:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M603G5jn7z3cjC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 02:24:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UQzwbZro;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UQzwbZro;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M60263dnzz3bpW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 02:23:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B920BB80EA5;
	Mon, 15 Aug 2022 16:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDF5C433D7;
	Mon, 15 Aug 2022 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660580584;
	bh=YipuA8xpMD2cZk8ply93QvmLbz3xg3Y7+lnuxBQXklI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UQzwbZrooVjpbDPace0kLOhxBm3O3DWQtQW7YGvpCe+OBpnNQI6Uu3D7FCGAFtnQf
	 7VTWS2+uph5eR43mbHEIK8Li/bJGBYONAgjpTJZnMhETjzwrgD9L0fcl58QZQa5Eeo
	 FrSjI2I7BHLaJxOsHOF+qyFOhajKha8bumoQUWoiTjiwi6ZF2khOBv834iXtl6ADKp
	 OmC7lsD1L32zfD8RLhlhv0jHGvtwuumkNqwKB4TNL0CjSqxOCNfHcrsBRYuGrbPs+p
	 yJymnvCQHRo1rlWLCbZhJV4TVpIE2wpCeI7Qy6P25GnQK13VrwLW5gzxRYbSxOUThK
	 RlkaJWCMdPVgw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, tiwai@suse.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz
In-Reply-To: <1659495748-10876-1-git-send-email-shengjiu.wang@nxp.com>
References: <1659495748-10876-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: imx-rpmsg: Support configure sysclk for codec dai
Message-Id: <166058058210.769843.13008464133060260888.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
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

On Wed, 3 Aug 2022 11:02:28 +0800, Shengjiu Wang wrote:
> Some codecs need to configure the sysclk even with slave
> mode, otherwise it may not work properly with some case.
> 
> wm8960 is the one that need sysclk be configured, so add
> late_probe() to call the snd_soc_dai_set_sysclk() of codec
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-rpmsg: Support configure sysclk for codec dai
      commit: 088f115c6ff664c8afe003bd542e1e662a72aaed

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
