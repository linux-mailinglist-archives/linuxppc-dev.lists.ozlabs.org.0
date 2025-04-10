Return-Path: <linuxppc-dev+bounces-7568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60EA84544
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Apr 2025 15:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYLhq1FlFz3bmS;
	Thu, 10 Apr 2025 23:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744292827;
	cv=none; b=l6IKNZ1R2nshXRndOWcYFrtCbnjfY4++N4yOPjtWmfv58WhIaAsdgLn2bLcs2IdwF5FkM/nzcOJQsT+VQoakop7HGI94ryC+sleda27OhbDTLdkmYUuuh97TPVbJwh3elWMoonNWSVPLQ6YR4/ZQ7p9B/rhvbgKS8yIiX77NW5dGMocz7YqRxqyn0LlotTZoOuhqTNTJx9nX2lqIex3MHL/RXoUYz1zKCnUlphhm1Lc8YJJuMC4LanvR38kzjhIlR6dLh60uzwzXuvaJ6YAkqij20P+696xlFz76if+GOQqF55CiJnaf9iAc8sszR+KMPsSSg6Z701JXsByU4Ez1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744292827; c=relaxed/relaxed;
	bh=zKhVPyUbeYD+BdhWdfCAeproafIpUzl7ODcM+fXexOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ayw5/VcawsfYkyhPaVpsCyrHOzTHVyE+VR1JwyUeAdxuLUOZgP/TP+tVtVVWuWrSviGptM2l/KEddTZ8cdxt8C/hxH4HFM/mhzK53ccouLuzPT0oRbqXM426kFevCBKytFP6h4/gf+LxKpIr1nmb9bro/nOrf6CEUbr1ccrETfp2GVlIBYjiIv4hD5uY/AlULtNXlveTdLZ4ba/1b9vxF8nATw4ilsHXjtg77vcug/AXHmcJJQTAf862uNqKTEWPHTY4fu9o7k60mF/L01cfqv7eT0p9I/wqGgm22usjhP4wX2hhL1FAONjBc+jSsI4a3ykvDg92qCD9b9TNAbPjJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZPTVGwYG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZPTVGwYG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYLhp1Rp4z3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 23:47:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96DA85C5879;
	Thu, 10 Apr 2025 13:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB4AC4CEE9;
	Thu, 10 Apr 2025 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744292823;
	bh=bl5IUQgJObOrUKEy2OIJfXeF4HSKpBmDsKV7Ih3rpQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZPTVGwYG3XvOQ8nkIrvVJsPmoAliY7pas/LyV6SFdvmPSeXLoG2xlmySlCdlryFNC
	 wx1CXVOUTMydJJV4eklx3eabEo3ngJ9ES+iBW4K/4uKMASzI29I85jK2KrmIccUt2W
	 AwsC6xBeOhzXaJY4E2kRmlR2k+NKX8exrbUwA9fnNFCxcNDBryxFt9iWQ/1suDvmgr
	 xaMvEyWxIvnRP2IVVunf7NRiXsClIqwAto+yPWMnyA6iTWNJYudrUT6YnF5m+sanxK
	 287Xr7KJd5CAI8a5t+V07oFTIwotf9dlI6Z7r67yU+MN4cs3X0nx8pwUomTx9Exz46
	 z91FkNGPhW9TA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Herve Codina <herve.codina@bootlin.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
In-Reply-To: <20250410091643.535627-1-herve.codina@bootlin.com>
References: <20250410091643.535627-1-herve.codina@bootlin.com>
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on
 TRIGGER_START event
Message-Id: <174429282080.80887.6648935549042489213.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 14:47:00 +0100
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
X-Mailer: b4 0.15-dev-c25d1
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 10 Apr 2025 11:16:43 +0200, Herve Codina wrote:
> On SNDRV_PCM_TRIGGER_START event, audio data pointers are not reset.
> 
> This leads to wrong data buffer usage when multiple TRIGGER_START are
> received and ends to incorrect buffer usage between the user-space and
> the driver. Indeed, the driver can read data that are not already set by
> the user-space or the user-space and the driver are writing and reading
> the same area.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START event
      commit: 9aa33d5b4a53a1945dd2aee45c09282248d3c98b

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


