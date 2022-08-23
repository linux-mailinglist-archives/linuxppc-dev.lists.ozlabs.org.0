Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B053A59E752
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:32:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBvsK4cCqz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 02:32:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/Q9NnLh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/Q9NnLh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBvrg0pc9z2x9p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 02:32:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9E46616C0;
	Tue, 23 Aug 2022 16:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4849C433C1;
	Tue, 23 Aug 2022 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661272318;
	bh=0OW8QTWj8leOwIvSI2jUOoZZICwcZkui2kQIaQN1eUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r/Q9NnLhKgHnZDH15hdmsXxlREi3PAhN4fMAUd7WvnrzkcYkX0zZ4uMJ1N7QPvUoK
	 BP6jdW/tqF0Eoe42IWCReMYN9fkT0arN4kvio/mi41D3Zwaca4m9aqnBDwGZP5tNkB
	 Or3PaFCUSQ33r252+rbjKuaJwA1a90YazOnbR9277a3SjC4Mxob2FMllIS9LQZAa2r
	 661EHm9mg0PsD4A/GGbcpY/US7uxtrtHwQLyxHJ7MI9yWP5I4ySqs9uhFj2OYGwLsm
	 419O1yEeYEZph+Dgzjuer6YrdFb5YppGRwGziZJ0KFIqeEdMxS2OqAI79WPWz21X0C
	 ALxVEPWnym87Q==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com
In-Reply-To: <1661247308-2650-1-git-send-email-shengjiu.wang@nxp.com>
References: <1661247308-2650-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: Fix supported clock DAI format
Message-Id: <166127231558.397935.4810940436556797260.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 17:31:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Aug 2022 17:35:08 +0800, Shengjiu Wang wrote:
> The MQS works as codec DAI, not cpu DAI. It is
> clock consumer, not clock privider.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: Fix supported clock DAI format
      commit: 1faa6f8274e2b08a38c0cca74113dfb26c6ad7b7

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
