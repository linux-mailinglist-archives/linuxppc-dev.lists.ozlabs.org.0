Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077489462F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 20:21:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WYgLr98n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbDgc70Jdz3fSm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 04:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WYgLr98n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbDfw4JqSz3cXk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 04:21:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B72B62B15;
	Fri,  2 Aug 2024 18:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4490CC32782;
	Fri,  2 Aug 2024 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722622867;
	bh=G7JBKRrOhMKLRs3Q0JQ80dT2AI5Js5oqFIMYQMzMrO4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WYgLr98nhqiJFVNGCB1MZMWgG4GkCmgKRbVTkOmG0lBdFgdX0MsWcKTzOXvjlAvCe
	 bWSE9XgSayIl6Ucd8yI+YnAPO77jvLOPcdTnYOAhsf6KZ2/cu0Ewc091xADQIWJDrl
	 PAicMD4Y3/qOHXSI9oWPY8sMwZrnA4b931YXg2QjcTroB4TM011XR772JlvSi8MQXD
	 eSbyBNEq56uH/7ReEU2apiraTDAhw7tq7JQrwmfJQwEPZY2rm8+u8yzVDsAuCQ8ltU
	 VCaTecLrBFC/Ph6JHZM2/a0ovN/7EFq/fKpNnh2/kwk4GH0u4cCfBJwlvAg4sO+mgF
	 ZxleD+1KV8MUA==
From: Mark Brown <broonie@kernel.org>
To: jonathan.downing@nautel.com, piotr.wojtaszczyk@timesys.com, 
 vz@mleia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Yue Haibing <yuehaibing@huawei.com>
In-Reply-To: <20240802101044.3302251-1-yuehaibing@huawei.com>
References: <20240802101044.3302251-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: fsl: lpc3xxx: Make some symbols static
Message-Id: <172262286392.83468.2866189640414967072.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 19:21:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 02 Aug 2024 18:10:44 +0800, Yue Haibing wrote:
> These symbols are not used outside of the files, make them static to fix
> sparse warnings:
> 
> sound/soc/fsl/lpc3xxx-i2s.c:261:30: warning: symbol 'lpc3xxx_i2s_dai_ops' was not declared. Should it be static?
> sound/soc/fsl/lpc3xxx-i2s.c:271:27: warning: symbol 'lpc3xxx_i2s_dai_driver' was not declared. Should it be static?
> sound/soc/fsl/lpc3xxx-pcm.c:55:39: warning: symbol 'lpc3xxx_soc_platform_driver' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: lpc3xxx: Make some symbols static
      commit: a1c2716738b7ba9e912e04872639dd39c72baa35

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

