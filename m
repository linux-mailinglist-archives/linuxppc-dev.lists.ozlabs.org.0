Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B445953FBCE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 12:46:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHRqS441wz3bx5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 20:46:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rUsdBeGH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rUsdBeGH;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHRpQ6Yyvz3bnd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 20:45:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1F9B1B81F02;
	Tue,  7 Jun 2022 10:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6013C385A5;
	Tue,  7 Jun 2022 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598729;
	bh=R+CU8uOFsboE67tcWswALzxrVxNJ9/fwY9T7Z6JoQQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rUsdBeGHRSqPeYVORNrw4+DZQJhvpktD8/FMpQPXWUdW1GHK3ThE6OvHGqjGRwEPa
	 w/1RwMkLUUkuiLJEo8q5bMIf7VxGC916INr9ZaGnV8to+xQMWXUSMwYo8QYi1RmyvO
	 bnEvSqpbIEEdnjzHOWaXB/TyE5Nl5eOJG2s0ahFBZew0rCQBZLwrnikPHwoSPaBCvz
	 Ol+2/rfIm0lQfpVrlfRZ9oFtr/m3bE7vLNTrCKEwWuysevAXy/MvMTCFRrTqbfCu3a
	 TX3bpcHZJhnNrsqPhQwKTfrA0WG1uGIP2DZeQVTItULpdBY+fA1nmm1r6vfDeJjePg
	 li9XmSsSkZ+Rw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com, shengjiu.wang@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1653456221-21613-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653456221-21613-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: simplify the code with adding fsl_mqs_soc_data
Message-Id: <165459872746.301808.3491254402471419212.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:27 +0100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 May 2022 13:23:41 +0800, Shengjiu Wang wrote:
> Add soc specific data struct fsl_mqs_soc_data, move the
> definition of control register, each function bits to it,
> then the code can be simplified.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: simplify the code with adding fsl_mqs_soc_data
      commit: 063c915502b914a5a621458c763dfc28286f7606

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
