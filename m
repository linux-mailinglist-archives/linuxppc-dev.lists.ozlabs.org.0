Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0741F8A7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 02:17:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLncW6nKcz3c68
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 10:17:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hIYJ7rVW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hIYJ7rVW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLnbv0VHPz2yK4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 10:17:15 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57C8561A50;
 Sat,  2 Oct 2021 00:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133831;
 bh=kcJKuC0wkvfILqJ9qCwz2Ct/sDna6hfeZwqpy5GIkao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hIYJ7rVWkNABVcCbGiHIsO+b18+sNtUvD/mG8R7uv9KMIdo9ntAw+DW5vJlNBaIBZ
 KZtCyzdd4AQBG9Sa/OHPAnPdZ/wycdqi+XNwgBdvBn4wQG7Bwt9exO5qs52pJd45D1
 1pPYvbmzR6b9R0Y3WAOGq76kFQnIp57D3JZZLEfNcUiEGZSLBxLai3+oCAfWT82OOY
 d5uDt+NQv/SGN2hwSDtzzLMtNJLhhnacxNmGkCh0CkbM74TZ8NDIWNzXtckzE86zSS
 IP7HNe2E7Ox07Sf/MYQbUPKI6LKvaydplKZvRaUhnZX7AVjdCs6BznzLdFqAMaOuAW
 UAY0Chk4DRLTg==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 perex@perex.cz, timur@kernel.org, Xiubo.Lee@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com
Subject: Re: [PATCH] ASoC: fsl_spdif: implement bypass mode from in to out
Date: Sat,  2 Oct 2021 01:16:34 +0100
Message-Id: <163313339132.45396.13488907784155100500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1632649760-1651-1-git-send-email-shengjiu.wang@nxp.com>
References: <1632649760-1651-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Sep 2021 17:49:20 +0800, Shengjiu Wang wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> Implement SPDIF bypass mode. It implies internal SoC
> routing of SPDIF input signal to SPDIF output signal. The
> test bed requires two boards: B1 configured in bypass mode,
> and B2 to feed B1 SPDIF RX port and read B1 SPDIF TX port:
>    B2 TX -> B1 RX,
>    B2 RX <- B1 TX.
> The test procedure:
>  a) Boot both boards
>  b) B2: start "arecord <spdifcard> -r 48kHz | aplay <local DAC>"
>  c) B2: start "aplay <spdifcard> -r 48kHz <2ch 48kHz audio file>"
>  d) B1: enable bypass mode:
> 	amixer -cimxspdif cset numid=8,iface=PCM,name='Bypass Mode' on
>  e) B2: check DAC audio, make sure the same sample rate is used at
> 	steps b) and c), in example above the rate is 48kHz.
>  f) B1: try to run "aplay" or "arecord" on imxspdif card while in
> 	bypass mode - both must fail until bypass mode is disabled
>  g) B1: disable bypass mode:
> 	amixer -cimxspdif cset numid=8,iface=PCM,name='Bypass Mode' off
>  h) B1: check the usual playback and capture on imxspdif card.
> 	During this test try to set bypass mode - must not be allowed
> 	while playback or capture is running.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: implement bypass mode from in to out
      commit: 83bea088f976a289bc2efe4e404af47ab79d6639

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
