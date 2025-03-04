Return-Path: <linuxppc-dev+bounces-6713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3132CA4ED28
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 20:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6lsJ62bFz3064;
	Wed,  5 Mar 2025 06:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741116068;
	cv=none; b=VQc7Wfc/AElO6xjnpbVT6t8OOk5o3PAPaOGlRFaRUrr5UNPVVGIZzKnXdieOAMeO6b9bPhGkVGkMes3mYJoEw7bS1lsFcz9rJjdYRMBfTLDs/tTpwIyCcB1kUieWV1GNWhV0e+v/tYS/RoDnMwnY0VoYLwf15KctNJYeCXtX6M4zQwATo406SOxaIJwTv7IV8ggrBmJL6RHqYQDeZisFCQM3ouiHywuxg8FlH13rrmBSjqHonhlYCELnOLEwNeGDNQyM7c18ZUqV1Lrb3k5C/e2ncULKXM4OEpb1Dl8QSo//sjhRzDN0TteLycndIlvP1JiIxInYs1PouUynr5IJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741116068; c=relaxed/relaxed;
	bh=EOUe41nNaraed/bS3CQ2oKxUIWxkxK9Qof0n7Sjen4I=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pp6KIdmGQq/H26dV5IgXkCEfB79YDFlT86mlL7gZQMVOz/J/zfc5MHxs81Tx+D7XOqUDTsmckXV/kwRx3B0/d+YkffBvAnqOsK1rtmhkYOpD2E1juwAin2EMA3XPsCooWvZ8ERAx6a+bPxJIf34WqflRRI+97/+/M9UzxRAk0SEy3vlp/gwfHPFI11ABDMGpWFPunYKBuY5JOehydv5nOrOGCTXU1Okda5cNXbRQTCsUdDCA8wLa5P+VLpqlBsExOk6Y61HOS5IJoUxZtRb6rp5Nls7QU5k0ZC6lNqutb5dCngfTJr43x4+xnu01lptOJPzrCoTtRl3RkebMnS1tyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IViO4f30; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IViO4f30;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6lsG4CxGz302c
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 06:21:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58E2BA459FC;
	Tue,  4 Mar 2025 19:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13915C4CEE5;
	Tue,  4 Mar 2025 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741116063;
	bh=6MnWChvdZA4s+8fxB0dv8vXGdMG4i5FgUOx+TUcX3rE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IViO4f30mVkst2x3qHPFh8izeOtVaw7uz++VewyC1C4wRjjXNjkPpsvdbCKPh5a7p
	 LqeXcwXMOBn+5V4SsCSDB4zkQJ/L06PEH92xc657CrC1OKTP0fjMViud/W7PWug3Xt
	 yPOn3BPv2+hsD5y6O5mAh1cC1VOX6ZQIyvHn4ZXfS6Y8NQDAnYA5VViId/1CcZpwmk
	 KMW67znwGXnZVSH7YKBEcvgHahVyteVyEVvjBoYk73cF2M5BlW/FWFAhYsheUY2uyD
	 pM4hhX+5F+r32BkLurL55YngI2/BkcGNpQ0ySuBcL2f2C3OvYIZP5suiuVfTftmCRz
	 6WUb34kNPuMlQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
References: <20250226100508.2352568-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_audmix: support audio graph card for
 audmix
Message-Id: <174111606081.246439.10804205280595861731.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 19:21:00 +0000
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 26 Feb 2025 18:05:04 +0800, Shengjiu Wang wrote:
> Change 'dais' property to be optional, that fsl_audmix device can be
> linked with SAI device by audio graph card.
> 
> Shengjiu Wang (4):
>   ASoC: dt-bindings: fsl,sai: Document audio graph port
>   ASoC: dt-bindings: fsl,audmix: Document audio graph port
>   ASoC: dt-bindings: fsl,audmix: make 'dais' property to be optional
>   ASoC: fsl_audmix: register card device depends on 'dais' property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: fsl,sai: Document audio graph port
      commit: abcb9a1fd89144536f3ef604f700e94424867366
[2/4] ASoC: dt-bindings: fsl,audmix: Document audio graph port
      commit: 5fee78e517ce0765def9387659fc56a1d5532c60
[3/4] ASoC: dt-bindings: fsl,audmix: make 'dais' property to be optional
      commit: 597acf1a04bede55e3ad8a7922bba286c11112d3
[4/4] ASoC: fsl_audmix: register card device depends on 'dais' property
      commit: 294a60e5e9830045c161181286d44ce669f88833

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


