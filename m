Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 436D6414BBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:23:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF0sF0rm7z30Bm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:23:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gMbcjzNu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gMbcjzNu; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF0qy5Db9z2yV6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:22:38 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAEEB611C9;
 Wed, 22 Sep 2021 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632320557;
 bh=LonW076zV+ZmHH0/C7TgTIc7SC65dCJvPzK9G/Gby3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gMbcjzNu4FHJOK0rM+DzjX6Pg+XPTbuTN1x44tvD4+vzQnKBWpak8IugfmZjMIPLz
 HUXREFxvBVVw28NcJUD52DIjkPaTpFgLTkTYAmmHpczWayJoQHwILX7bBSts2AmJsb
 ZDQMGJQXJZ16JSG7LUdWzzycsC70Ys4M1WFkK4VHZHKNJxwbM9z0YF3/GFQrdyUPmR
 ZpcrsFvMZRwYbC0T15YDokawxhlJ+xIKCGnyT+QUgN54mDCf/mUhaudVBjDQZzlSa0
 iNqGl1icVYsd7fTSGp0ntMrV2MhViw2C5OVLS6LDWsKGlRV0HItv16cVRyumChwG0X
 NdrgGLavYh+lw==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH 01/16] ASoC: eureka-tlv320: Update to modern clocking
 terminology
Date: Wed, 22 Sep 2021 15:21:41 +0100
Message-Id: <163232020286.53242.17461329936887711763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Sep 2021 22:10:25 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the eureka-tlv320 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: eureka-tlv320: Update to modern clocking terminology
        commit: 4348be6330a18b123fa82494df9f5a134feecb7f
[02/16] ASoC: fsl-asoc-card: Update to modern clocking terminology
        commit: 8fcfd3493426c229f4f28bc5757dd3359e02cee8
[03/16] ASoC: fsl-audmix: Update to modern clocking terminology
        commit: 2757b340b25dd2cb3afc748d48c1dff6c9689f80
[04/16] ASoC: fsl-esai: Update to modern clocking terminology
        commit: e0b64fa34c7f444908549c32dd68f81ac436299e
[05/16] ASoC: fsl-mqs: Update to modern clocking terminology
        commit: a51da9dc9b3a844460a355cd10d0db4320f4d726
[06/16] ASoC: fsl_sai: Update to modern clocking terminology
        commit: 361284a4eb598eaf28e8458c542f214d3689b134
[07/16] ASoC: fsl_ssi: Update to modern clocking terminology
        commit: 89efbdaaa444d63346bf1bdf3b58dfb421de91f1
[08/16] ASoC: imx-audmix: Update to modern clocking terminology
        commit: bf101022487091032fd8102c835b1157b8283c43
[09/16] ASoC: imx-card: Update to modern clocking terminology
        commit: d689e280121abf1cdf0d37734b0b306098a774ed
[10/16] ASoC: imx-es8328: Update to modern clocking terminology
        commit: 56b69e4e4bc24c732b68ff6df54be83226a3b4e6
[11/16] ASoC: imx-hdmi: Update to modern clocking terminology
        commit: a90f847ad2f1c8575f6a7980e5ee9937d1a5eeb4
[12/16] ASoC: imx-rpmsg: Update to modern clocking terminology
        commit: caa0a6075a6e9239e49690a40a131496398602ab
[13/16] ASoC: imx-sgtl5000: Update to modern clocking terminology
        commit: 419099b4c3318a3c486f9f65b015760e71d53f0a
[14/16] ASoC: mpc8610_hpcd: Update to modern clocking terminology
        commit: 8a7f299b857b81a10566fe19c585fae4d1c1f8ef
[15/16] ASoC: pl1022_ds: Update to modern clocking terminology
        commit: fcd444bf6a29a22e529510de07c72555b7e46224
[16/16] ASoC: pl1022_rdk: Update to modern clocking terminology
        commit: 39e178a4cc7d042cd6353e73f3024d87e79a86ca

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
