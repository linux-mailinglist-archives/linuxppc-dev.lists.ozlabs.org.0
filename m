Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495D234B60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 20:57:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJGk019z6zDqfb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 04:57:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=14qsg1bv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJGgQ3DbpzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Aug 2020 04:55:14 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A4852076B;
 Fri, 31 Jul 2020 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596221711;
 bh=PCVI7it4La+iAm7gLF858FWk5mugOv7XiT+zX461Eec=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=14qsg1bvHyQrGBtkg+IFfouvo5V7ZnNYZYqAPL7/NgB1WEf71l+lp6A63xGiutdYx
 3UBXiqEQULvrO5duCdpKGMiBKoIq9/v4GjgR/CD+wrnXOwX3T8hsq08IQ+O2I3j7df
 GA6cIqt96HhvB6GzGwM4vR6XDpOC86ue0WmstkFM=
Date: Fri, 31 Jul 2020 19:54:51 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 linux-kernel@vger.kernel.org, festevam@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, perex@perex.cz, timur@kernel.org
In-Reply-To: <1596176895-28724-1-git-send-email-shengjiu.wang@nxp.com>
References: <1596176895-28724-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK
Message-Id: <159622167150.22822.11843570099946716811.b4-ty@kernel.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 31 Jul 2020 14:28:15 +0800, Shengjiu Wang wrote:
> The fifo_depth is 64 on i.MX8QM/i.MX8QXP, 128 on i.MX8MQ, 16 on
> i.MX7ULP.
> 
> Original FSL_SAI_CR1_RFW_MASK value 0x1F is not suitable for
> these platform, the FIFO watermark mask should be updated
> according to the fifo_depth.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK
      commit: 5aef1ff2397d021f93d874b57dff032fdfac73de

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
