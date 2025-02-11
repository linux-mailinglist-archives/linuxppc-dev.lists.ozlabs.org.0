Return-Path: <linuxppc-dev+bounces-6103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2748A314B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 20:13:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsrhV6GkKz2xy7;
	Wed, 12 Feb 2025 06:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739301226;
	cv=none; b=LU3CtKlHv2w75wZMaGhi7+s+6k4bsHNFtRCt3aXU/NNBH92FgFkz2MENkLYZkydNp8vf3Rq1xD9LPOweeYm3hG/dUZ2FgawczYx+oAH8Pgio4JhrsMahp03SNieAGEqA59Qxx2FEfA+Jxo9pqLtzbkAoxZmAWqMRda9OWtSNGfmGKRYEqwe8JzMC6KVXNc3IKd/muXWGgU9RUpWjqY5g+SSyxboUu7Csc1GEifFJYXe5/yKQcSbOhswWKdYalMIqHXfMHxI4+uf6Cr1H6Z9ur9WWQimum9zUvj/05czdtjgP/y+uQM/VyHmdBSx9mV84+wyEgcWuo5cr86FJJwGNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739301226; c=relaxed/relaxed;
	bh=2z4ePH2Igq7wQw6ipomX3ChuFJDqszkn4JpehuenHhg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C3xUYnqbx4fyeK2nnN0FaKnKT/xg1X6whVtVDKWUYx23m5wTEfWS1wmVcOeXVjXR0xjM1NYkniy1TQS3pKQtYCoXi8INHAhJNHcd46iVhb0pk013eEIqTWKWkYvABt/1KFp0doh5wg9A4J2LFeTzP7Wr6F98mhNd7uekfVRCy3iF8kMinTVOzwe3KId+SD0ego5Fhzv9KQ3dfCO5ga46NdhqD3f+c+Kz5WgWGbb+hk9DpkHSfcj0ZVishg+78oGpeKCOixYNcUvl1k4PICBAMV77NeV+hVgn3M4fq86mE9BBb9yBsTvrVazgUXWhdO7RIe2InOgSqb1zmqAVLV8kDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MR8LWm71; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MR8LWm71;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsrhV17s5z2x9g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 06:13:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EFBC8A4091C;
	Tue, 11 Feb 2025 19:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F98C4CEDD;
	Tue, 11 Feb 2025 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739301222;
	bh=3PDDp8ifF0Apm4orO4R4ylNAPPuO7AKr/wvsrkvct7s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MR8LWm71t9vDzVO/YFenVtUNd6F0lpCdtNjfEHb6TZKRtWbkgLeNTmqiks1HTGrBy
	 P+bYORp3p//w0V2nWItrdTvWAzK1X+U/ThL2dRyOGyhyrX8Dv5nuOEJ0ktaxndg5bm
	 uy66EmMHQmmHMOA4V6TrDtHJ4GGXqXChVGMRYlOto9epIN+lpWWp9YejXOLsPfpxOM
	 NYeGxxZhZc1D6J8urQSkDMGgVXB2ucLcH3AuRtDkUS/G7im3elrQ007XxVmtsZumNH
	 HBGGAjfVDtg/zbggyh4OMJY41rtr4Bi5XH3iT5GPKJxPv0NBrC3cBjE30HOuNP155B
	 h2c6Sjgr1csQQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250206030306.2618620-1-shengjiu.wang@nxp.com>
References: <20250206030306.2618620-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add decimation filter bypass mode
 support
Message-Id: <173930121994.78288.4188692766936165316.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 19:13:39 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 06 Feb 2025 11:03:06 +0800, Shengjiu Wang wrote:
> When decimation filter bypass mode is enabled, PDM data can be
> written into FIFO directly without any processing.
> 
> The interface of this mode is DSD big endian format, when
> user needs this format, then this mode is enabled.
> 
> This mode is only for the i.MX943 platform currently.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Add decimation filter bypass mode support
      commit: 21aa330fec31bb530a4ef6c9555fb157d0711112

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


