Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6B8A68A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 12:39:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZVPLla6S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJgXN5h9pz3vZg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 20:39:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZVPLla6S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJgWd2xLdz3d24
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 20:39:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4CDC6119D;
	Tue, 16 Apr 2024 10:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09477C2BD10;
	Tue, 16 Apr 2024 10:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713263944;
	bh=hNctvS/WLFpY8f2jueQ+vJMsiRhGdgQTThlnjXrGA70=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZVPLla6S9+Tm1Fb+FVhWPDVKcuu+6k0rW8chZ8aT2kCKbVqG5LrvJTt9RKRoTRWhe
	 v6i9WRn8wbd2K+AwPMonuYOfSG/rReMCZD0Z++Yx3f34NkGPAqRyiFZvZ4tOq6XKpF
	 h9x+cEYVU9e9C0UWqfnE+CFL3rYOLabGy5JMr3Q2Wjg/4zfK6IIxFXprG3VUuxAaGC
	 SDnxyILS5AHGbqwUC7iC8948jrTjpaIXw1Mv5m2pADi6d7+aysqrdufqU0LP+m81RA
	 rmZm7QR+lO1q3BXqo6/hr++Mnt8qpZJSoW/noANqQAz+QRVtdl3ZBp8aig/sEtAopa
	 IlrBn1zWSHrXQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 shengjiu.wang@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
References: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl-asoc-card: add wm8904 codec support
Message-Id: <171326394076.1668526.17357841814427298563.b4-ty@kernel.org>
Date: Tue, 16 Apr 2024 19:39:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
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

On Mon, 15 Apr 2024 15:17:34 +0800, Shengjiu Wang wrote:
> add wm8904 codec support in fsl-asoc-card.
> 
> Shengjiu Wang (2):
>   ASoC: fsl-asoc-card: add wm8904 codec support
>   ASoC: dt-bindings: fsl-asoc-card: Add compatbile string for wm8904
>     codec
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl-asoc-card: add wm8904 codec support
      commit: 51f67862ea6ea83f9fa4cda2e59d7bfd4387f63b
[2/2] ASoC: dt-bindings: fsl-asoc-card: Add compatbile string for wm8904 codec
      commit: 62c48dd33b4f2e037554d1322ae4f9f60e9461ef

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

