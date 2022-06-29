Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7295601DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY3D65Kbvz3dny
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 00:06:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f+tSxA9f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f+tSxA9f;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY3CT4m9Rz3by1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 00:05:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C209D61EAD;
	Wed, 29 Jun 2022 14:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D25C341C8;
	Wed, 29 Jun 2022 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656511554;
	bh=UXDs+9EDFfkEqRLNHkEcBDaysFo8turPy2dmuBxmfJ4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=f+tSxA9fD18Ch8FstmtZaJmIY64RcpJ1qwT8gvuEvfD9XOQlOEEGGRY27sIUxA0B/
	 y3KojJCRSOzB0gfpVG/CJik0zla6JTYj8hcMPW0BstI3Q+LLttSt7zno5q5M7ysXqw
	 6Y/GVEQPFeFjr9sSj708R7U26awNgFs8eIzcerhnds5Pj/+8irzxEj1WNLVc7gpgMo
	 tw8zn45LNdLIAJixJ6nkppLw84sfSlp6E0v6N4RaqQ/qOyQ745tA211doMFzNF1w3F
	 jsnFzIH2YrDYRlUad5jqq51N/1uE9RfnH94XcZXCf4r9FIAA9eJ6ALt7Ipm1AS3j9S
	 D6RBELTngJLyA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, alsa-devel@alsa-project.org, shengjiu.wang@gmail.com, lgirdwood@gmail.com, shengjiu.wang@nxp.com, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, festevam@gmail.com, linux-kernel@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com
In-Reply-To: <1656405589-29850-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656405589-29850-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: change micfil default settings
Message-Id: <165651155180.1437597.12670748028235515625.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 15:05:51 +0100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 16:39:49 +0800, Shengjiu Wang wrote:
> Previous default settings resulted in loose dynamic
> range and low sound level.
> New default configuration changes:
> - outgain = 2
> - quality mode = VLOW0
> - dc remover = bypass
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: change micfil default settings
      commit: 3b13b1437dcce4469db575c60d1da4fa9ff80694

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
