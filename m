Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D7056A98B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 19:26:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lf3Gg2P1jz3fDc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 03:26:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EICthTyf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EICthTyf;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lf3Dn521kz3f5X
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 03:24:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA9EEB822AC;
	Thu,  7 Jul 2022 17:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72576C3411E;
	Thu,  7 Jul 2022 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657214660;
	bh=PJWosiBSr/Jo2n5fQ5/FKsus3qGeZ8zXjOaJiRvPKhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EICthTyfj4eOlgLgxPHvd8oUs+GkQRoBCa7JqXrRG+Y52cMsA8M1I0RlZY4n13f4K
	 TOlIirKsI34gIbYOHZw36vEcOyQbLCIj8QuV4iu+rX3qlQ8dQN+TnNGi6zfKM+n/WD
	 4rYPjXHVQGZfUAIZJlgqwGdqbtYcvPVM5t5ztF8JNVhIOTjAjBpOrWXUrMbdaiYnqo
	 fiQVEWxEzcmHOSXlVp9361dZRoKM2jM8C6RPg0xLpGrDKDfzP7udtFKORnpepx7BnF
	 ONawH5UnjQhARG/1l0UB6iwpQlYM7rvwEDmRRSFMkjzQZpVHdRgaHss6rYgLuTTrOk
	 r6tQcIve+hnRg==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, perex@perex.cz, festevam@gmail.com, tiwai@suse.com, shengjiu.wang@nxp.com, shengjiu.wang@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1657192806-10569-1-git-send-email-shengjiu.wang@nxp.com>
References: <1657192806-10569-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_utils: Don't use plain integer as NULL pointer
Message-Id: <165721465817.2940958.17759682147989552170.b4-ty@kernel.org>
Date: Thu, 07 Jul 2022 18:24:18 +0100
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

On Thu, 7 Jul 2022 19:20:06 +0800, Shengjiu Wang wrote:
> Fix sparse warning:
> sound/soc/fsl/fsl_utils.c:125:31: sparse: warning: Using plain integer as NULL pointer
> sound/soc/fsl/fsl_utils.c:125:42: sparse: warning: Using plain integer as NULL pointer
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_utils: Don't use plain integer as NULL pointer
      commit: 050237e6b0bea0fafbf7d3d57e717c6fa1e4e819

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
