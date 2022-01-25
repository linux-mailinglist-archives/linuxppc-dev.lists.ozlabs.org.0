Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D957E49B131
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 11:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjjYW3FdGz3bZy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 21:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E0g1wqBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E0g1wqBL; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjjXr0B54z2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 21:20:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDCC8B81752;
 Tue, 25 Jan 2022 10:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54366C340E5;
 Tue, 25 Jan 2022 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106023;
 bh=bPm0LjPdqkJuh3S4vN12VSn0qh8bPUdA5DbAm6JDSKI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=E0g1wqBLEi1ip7lwDDh6jAKSNrueJIO+J0FOpq62I7AyowojSutWWFQbU8me7o04V
 rsYRAH9ZkB1Ri9RGHM636oiMoGhse+mlfVjQ+X5ue3y/7EIiB4jhYyHBc7vDhxy92a
 f07gXfB7UvO0Gd5Wfu5xUWZmB+GlNVb/ewuAuZ0zlWLVeIfOhI8how56sbrGszcnSj
 ZgqVhR7FLfQ/qNHy3cWz1qYwGZDU+TEkFV+MjW0J1Z//bCqPB34erCS7otnbW7CEek
 nJtv5F3/F3zA8LBmta6Qe03PefruPPgKOq1peyynvmGAlK8ZqGvZS6b+z1WGf2q/4h
 0/AuOhLHqfo0w==
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
Subject: Re: [PATCH v2 0/5] fsl-asoc-card: Add optional dt property for
 setting mclk-id
Message-Id: <164310602006.74844.15557219169532586931.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:20 +0000
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
Cc: kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, tony@atomide.com,
 festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, robh+dt@kernel.org, bcousson@baylibre.com,
 perex@perex.cz, michael@amarulasolutions.com, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Jan 2022 10:21:04 -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchset:
> 
>     [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
> 
> Sound cards may allow using different main clock inputs. In the generic
> fsl-asoc-card driver, these values are hardcoded for each specific card
> configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] dt-bindings: sound: Rename tlv320aic31xx-micbias as tlv320aic31xx
      commit: 85f856f790b5fd427cb31b3f62755713174da0aa
[2/5] dt-bindings: tlv320aic31xx: Define PLL clock inputs
      commit: 6045ffd366283236f0de79c8a0e98ae766e9a8f9
[3/5] ASoC: bindings: fsl-asoc-card: Add mclk-id optional property
      commit: 55915f20ad9ae92015bf7b2c4ac854e5b720d63f
[4/5] ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id
      commit: e6ec5a3936ee0c01f46e1d09dc758bb762e06dd9
[5/5] ASoC: fsl-asoc-card: Remove BCLK default value for tlv320aic31xx card
      commit: d4c4e2861560ab1cbf540bbda5bcdf4c92b17110

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
