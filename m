Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5891171E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 02:06:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HneLpggF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4yMg6hJwz3cY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 10:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HneLpggF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4yLy2MSxz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 10:06:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFF75CE288F;
	Fri, 21 Jun 2024 00:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A7C2BD10;
	Fri, 21 Jun 2024 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718928375;
	bh=VNSCHiO08SIk0htqWDW6NDFuvYyhidq/ovhyfUV5Kwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HneLpggF5aKAge/YLzIW5cLkwl1JRmjRPAHCL9AVCFqQnPr25XKP9Z/YFuOrHFRQM
	 Z8WthZPFSd05AbkIJE7UTae1fx3IHUq3s75yr3U83zQfEU7QtJmzJG4jZ8kmRpLC7g
	 GnaeNLH2rHkUxgRcg5o5IBMpWKQ/TttntERYGpR3LDYgcAM/3dsaPM6l7wBTgQGhA/
	 neiEPwmWUsUSVCSmbh9khUQsFK/ciT5j9FvzPL9Bf9Mf7fJu9oYg+fsrARZuPkG5Mc
	 9+IhU4KVKb2ttRGmnF0TsxJugRTTvceAmV7z+zF4iyxnLV1CDS4yio89WNd6nDyYyV
	 k6sIw0QXHXRaA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, 
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
Subject: Re: (subset) [PATCHv5 0/9] ASoC: fsl-asoc-card: add S/PDIF
 controller
Message-Id: <171892836830.273016.4379202325839599426.b4-ty@kernel.org>
Date: Fri, 21 Jun 2024 01:06:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jun 2024 15:25:02 +0200, Elinor Montmasson wrote:
> This is the v5 of the series of patches aiming to make the machine
> driver `fsl-asoc-card` compatible with S/PDIF controllers on imx boards.
> The main goal is to allow the use of S/PDIF controllers with ASRC
> modules.
> 
> The `imx-spdif` machine driver already has specific support for S/PDIF
> controllers but doesn't support using an ASRC with it. However, the
> `fsl-asoc-card` machine driver has the necessary code to create a sound
> card which can use an ASRC module.
> It is then possible to extend the support for S/PDIF audio cards by
> merging the `imx-spdif` driver into `fsl-asoc-card`.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: fsl-asoc-card: set priv->pdev before using it
      commit: 90f3feb24172185f1832636264943e8b5e289245

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

