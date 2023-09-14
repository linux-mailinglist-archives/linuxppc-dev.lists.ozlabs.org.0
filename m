Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056C7A076D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 16:35:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DstQJ4b9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmfx46wcQz3cnP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 00:35:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DstQJ4b9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmfw85DSzz3cGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 00:34:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2243BCE2703;
	Thu, 14 Sep 2023 14:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3CCC433C7;
	Thu, 14 Sep 2023 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702051;
	bh=9S7VIQV7YxfxsrOKvFr7Zd7ehjJmNmiY2E7KkfD5TvE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DstQJ4b9OBCNoWWvU0xCDU0aEnvcxyudZYIHGCRUJJqqLg9y5HoR9sxwszcOI1gT1
	 /O7mQOKgCgZ5xjBIENcYxyK3jGoeG3+lNsLRRgWEcHn3n2cHtcazZe/y3O3PTQxIDp
	 LRn5qXgvuSq5+gMhkYzbdyqrekN2kAbfakpk4z837Y+S6aWXrexkLndqe0v6zbIxc9
	 TaGkX3OwtCobkBWY1L4Ex0n5YAeAJvQONPlAPOTXpzp1YKSDZuYVQsMfVuMXtzCxM4
	 L16OaTA/vFhMyMYFYOgofXD+3xncI3VZSTTvuuEjfQ9SIcoG3wdXG/PexvJG1m/+ju
	 eKmfkqGAgvP/g==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230913102656.2966757-1-chancel.liu@nxp.com>
References: <20230913102656.2966757-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2] ASoC: imx-rpmsg: Set ignore_pmdown_time for
 dai_link
Message-Id: <169470204840.386807.4356692554775825839.b4-ty@kernel.org>
Date: Thu, 14 Sep 2023 15:34:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Sep 2023 18:26:56 +0800, Chancel Liu wrote:
> i.MX rpmsg sound cards work on codec slave mode. MCLK will be disabled
> by CPU DAI driver in hw_free(). Some codec requires MCLK present at
> power up/down sequence. So need to set ignore_pmdown_time to power down
> codec immediately before MCLK is turned off.
> 
> Take WM8962 as an example, if MCLK is disabled before DAPM power down
> playback stream, FIFO error will arise in WM8962 which will have bad
> impact on playback next.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
      commit: fac58baf8fcfcd7481e8f6d60206ce2a47c1476c

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

