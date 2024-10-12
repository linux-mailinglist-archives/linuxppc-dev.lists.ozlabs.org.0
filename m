Return-Path: <linuxppc-dev+bounces-2154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2D99B4F5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 14:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQjyy3QtLz2yVZ;
	Sat, 12 Oct 2024 23:50:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728737450;
	cv=none; b=VFgA2afCXltwhq0VuILNjtlISacGAshXQiEroB256vEvHUUt5pnX3aTCTsg0wjRKIoB6X42Ks3ZtY3TA93ZT/WJUIw0Xu/0ZnNlSvVoghfPoRdGGjOQTt98PwSJkUIjJsdJkJyepADCTaeqCNz6LH/KBtP5f5Jag0mK4+fzxF71emmEg/HVWxyttsBQNE9grPUeUUJNKRoLe6GsFEx6J8TtO6Y/pI2lUx8YdmhlWXt1C+r5o6fZrqlB+y05kea8cEMh2SdSDvnQTY3/5BfACTdVnx9AGaeoOQ5Ib6EqtWERM4lrpLEd1zyGAo6C3GHQjtPvqru2yywX5I3FOiXjuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728737450; c=relaxed/relaxed;
	bh=7Z/3XCgpk5X4886EqbCkyONm1hFk+6Ok7ax8FrTOXZM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hH2KpX4PtiizbyhlkShZ7YwJ+rq2gz856zHnE4RxJe7RAmPWpB3EJL2bvck0NISkrCNHc4VaVDIHj993sn9Djrmz4yysy7bMlFWEpf20GdpmEU8g3UEKIxo5k7xI+BQwbBaPDZVQvJKSjdzkoE1nYB1Y/77+LT0OK2v6wHi8GinWZ1aW1D3pGz0AUSGbDGuKSWH/UN4Y6M/G6AiKC+cuKeFd4Y+YtW8rON6Tvsy0AcbLoSSyvWKvgbAE//K9jhCh3RWk2H4c0ARzu5uW77qaDFSNPcipQOJjqdJFHWem+R6mpET0H/cGQQdARqIaSVusElN/o9+mm2DC9EdY9iKumA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EIptPkVk; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EIptPkVk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQjyw3Fyxz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 23:50:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DB93A4017D;
	Sat, 12 Oct 2024 12:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E4AC4CEC6;
	Sat, 12 Oct 2024 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728737444;
	bh=v8NCU068r9dRn1DQIRAWChXlgs5/3w1Xkzg3alhshIk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EIptPkVkRSmm/GUI3d9hQ5wMrt2rbjdH63dw8268TGBhzLxitDTkOFy5aHDLDY5pk
	 Dn1ZOlGIRRf+S55RhnHmr9W+YDDuUmaiWnSOAnHp6NyYVAiCfk8jJ4UJTupIx08RKM
	 vbwiZolNs2DVrbm8UmElREWMuIH4quCjSEGpuGg62URhot6Sxp4iKMcMkvj6xHOUCR
	 5Nw3IrtffKh3gAm0/BtXW3Lz2rt01ZGBtJnjgGOKFWyrnXi9CCmdCgms9wFeUM4yac
	 RdBrjqb4sUcXSr4en4tI+OdMK+nLb3iB5YxnyGD9e8HWn3oOFMIIBQQBdUSQmh7nLO
	 TL5AxSfxFoW3Q==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chancel.liu@nxp.com, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: add cs42888 codec support
Message-Id: <172873744192.3950734.11628347626617222095.b4-ty@kernel.org>
Date: Sat, 12 Oct 2024 13:50:41 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 09 Oct 2024 15:46:42 +0800, Shengjiu Wang wrote:
> add cs42888 codec support
> 
> Chancel Liu (2):
>   ASoC: imx-card: Set mclk for codec
>   ASoC: imx-card: Add CS42888 support
> 
> sound/soc/fsl/imx-card.c | 59 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 7 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: imx-card: Set mclk for codec
      commit: 892373e4de626c61e91816e3d3970d82beb50c4b
[2/2] ASoC: imx-card: Add CS42888 support
      commit: b39eec95b84d5dc326c3d7c89e4e08b898dbc73c

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


