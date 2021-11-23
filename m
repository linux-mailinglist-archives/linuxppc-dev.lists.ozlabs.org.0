Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299694598C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 01:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hykn96rxvz30Hj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:01:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uSFoNUzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uSFoNUzh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HykmS1N4Dz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 11:00:24 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35FC461004;
 Tue, 23 Nov 2021 00:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637625621;
 bh=LZaLYcPH4q5eCeBbmf9LnY8K3MrFIUVPYiAoLfcs24c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uSFoNUzhyTgV+0ccFNEtv0nP2ui6SlO9oicdu2kybFHg9UGPXWOREN4uoyShkPmv8
 9DY6Qj5kAX5JE4aidI744xHlNeJ++drOOr4eq3HjpCbzWOmSr2c+cpli5qxIWDIFq0
 +EZ/U5gwIYKkxEtl7+7JZsjmdwUip7jPaob/2j56g8w12XL6Ap2/oEvYTxLgHiIgsy
 KSUCrFcfRy7uzjq7vBiwk447vk+WeNFBei6fxb0jfio3pY+jXmf1J+3LP6dCduoVQ+
 BPYVVcbeBRqWrRJr2iEVJUkwVM3iV72zH4WD2ovxry4OFBXL0F2qBv5jaQsHudtcYR
 HCMFzwrUag8BA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
Subject: Re: [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
Message-Id: <163762561675.2471742.16439171676950432106.b4-ty@kernel.org>
Date: Tue, 23 Nov 2021 00:00:16 +0000
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
Cc: bkylerussell@gmail.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Nov 2021 12:32:43 -0300, Ariel D'Alessandro wrote:
> The tlv320aic31xx codec allows using BCLK as the input clock for PLL,
> deriving all the frequencies through a set of divisors.
> 
> In this case, codec sysclk is determined by the hwparams sample
> rate/format. So its frequency must be updated from the codec itself when
> these are changed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: tlv320aic31xx: Fix typo in BCLK clock name
      commit: 7016fd940adf2f4d86032339b546c6ecd737062f
[2/5] ASoC: tlv320aic31xx: Add support for pll_r coefficient
      commit: 2664b24a8c51c21b24c2b37b7f10d6485c35b7c1
[3/5] ASoC: tlv320aic31xx: Add divs for bclk as clk_in
      commit: 6e6752a9c78738e27bde6da5cefa393b589276bb
[4/5] ASoC: tlv320aic31xx: Handle BCLK set as PLL input configuration
      commit: c5d22d5e12e776fee4e346dc098fe51d00c2f983
[5/5] ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec
      commit: 8c9b9cfb7724685ce705f511b882f30597596536

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
