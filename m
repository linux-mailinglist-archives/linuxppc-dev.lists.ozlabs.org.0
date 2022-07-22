Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D306857E19B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 14:48:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq8Pw655Gz3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 22:48:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RH7urC7y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RH7urC7y;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq8PG6bNkz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 22:48:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 53F98B828E4;
	Fri, 22 Jul 2022 12:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC56C341C7;
	Fri, 22 Jul 2022 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658494093;
	bh=sr9TSpthQysYY2JifDw21pcWDlAmyQ036571H/CVHyg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RH7urC7yBKGTFFfwLG4KbGtTb+z7BhVtkivw7AssselmbptlC5Yg+lmnfM4eU4+zC
	 e2PusPZfv8iGYtjS3egOVr27kMgOe+ftMkOsI/3r1BiYp8FJtSy7o7A0FoDTHLJapH
	 iNlxuMI6ZN3eOIw0IblRNSLEILqOMF4ZkpiLv1i15dTZA7e5Wh7irWSLB0kgH/lIi5
	 kzc8JGV4OdwyewhQlFatR5hiFldBfLMfZqvcV0hjlkUwhnhY2Ce7cSHh/Zxm6TFD9s
	 esxoKS5/OMxnE4+LfXQ+i4EkpuiVS64Yi/y6aO1x0AoGnVoPC8TY5I2Bd7veZvPLcY
	 ixIRISZTp05mQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com, Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com, perex@perex.cz, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
References: <1658399393-28777-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 -next 0/5] ASoC: fsl: Fix sparse warning
Message-Id: <165849408996.139149.2173688518682124551.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 13:48:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
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

On Thu, 21 Jul 2022 18:29:48 +0800, Shengjiu Wang wrote:
> Fix sparse warning
> 
> changes in v2:
> - use pcm_format_to_bits
> - use u32 asrc_fmt, then convert it to snd_pcm_format_t
> 
> Shengjiu Wang (5):
>   ASoC: fsl_sai: Don't use plain integer as NULL pointer
>   ASoC: fsl_asrc: force cast the asrc_format type
>   ASoC: fsl-asoc-card: force cast the asrc_format type
>   ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
>   ASoC: imx-card: use snd_pcm_format_t type for asrc_format
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: fsl_sai: Don't use plain integer as NULL pointer
      commit: b17079d37fe1570019d7defd9e341d5c18aba8f5
[2/5] ASoC: fsl_asrc: force cast the asrc_format type
      commit: c49932726de24405d45516b3f8ad2735714fdf05
[3/5] ASoC: fsl-asoc-card: force cast the asrc_format type
      commit: 6c7b077dad62178c33f9a3ae17f90d6b0bf6e2e5
[4/5] ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
      commit: de27216cf2d645c2fd14e513707bdcd54e5b1de4
[5/5] ASoC: imx-card: use snd_pcm_format_t type for asrc_format
      commit: 409a8652e909e323c715f3088e6c3133e37c8881

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
