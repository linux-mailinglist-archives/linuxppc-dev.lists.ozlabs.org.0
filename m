Return-Path: <linuxppc-dev+bounces-6473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B0A44746
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 18:04:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2P896TnZz30W4;
	Wed, 26 Feb 2025 04:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740503033;
	cv=none; b=UFQfKb0OSjPzsc21BnuxVpmhR93fsQNo6IbhjO50h0Jgfx95HXeBQflLqn8gJOMVIZD5JYR/5mxZLC0BHH09oXOZVkZ9EuTDoGnPyZmXeJuI3KUz7dfjk508UfJbjeUJec5RUbN1YglOmaWDpmsRUtqJWPzpOPNMkE6DTQsD5WRbLXKrzyL5Q+M9PFygcndL/tyU1cn4WZAjSQswRJCJaokZ/VQDIez/PHK5KZtvoeB4KCSdaEEl4bzAPGb7xVSB3TMjz6FqdPh8K+qJvJomyXSmeseQe27IJmA1Wr9nVpKCg86il3tAkIwJ36YqAR655d2zBvcJJobaINfse6IY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740503033; c=relaxed/relaxed;
	bh=5qLymUSn2dGzgnqPjS06ZVlX0k4/enNo8NH8C+zF/ro=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gZKYa4d9OdIrd3YFCd9fHBsIA9klspqqOuYqYJC/1BQVA1bPCJQbq3DSg7e6uuDeWLv1SCiL7OVUmlcW2iYfpTvI06oEfhrFosktbDsF0X2PIrtPyXIONiGfuMlZIIKthWUcWBfNfdCt+iPr9GCYDZ/cWW0wRREaMVOEUypgXBV1O4GLE/nCtvo4Z7UYI1kdERYVIROZz8ckVfbWv7zpAxFxquS+nSeaEK0t4B1Ja7zB5Wp1ftiB8opL8eT85I+qEYoXhAa78JHPDgYEwxTMMa5QHYoQnC7nAR1y7qgiqbcrLiHboGA98K94/71VFTu9pkv9HH4YSrKqHeQljj4BCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EMndOmQm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EMndOmQm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2P892C5Hz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 04:03:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED6455C731A;
	Tue, 25 Feb 2025 17:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2A9C4CEE7;
	Tue, 25 Feb 2025 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503030;
	bh=m/Rhl9xk8wb/gA4pl1Wi+ZgfjJHp6A4PuropwF5UbcM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EMndOmQmf/64HxjrnZOJV3XEL66bANshmMnGQu6jQUgnrLdh14x8E6YqA4WNj+JCX
	 UiK16lOpKnn5WZ1CN8qshhMRjYcopfxJl1KZY3okjGR5Z2bS1PT4/+VPqKXaFwB6wx
	 GaKxUVbP0z+pxmCX3KE/Xeg6qUKLu5RXvTO4Gqvb1EUYR3XHEeCfTY+0q4tUEq8XT5
	 ojKPuTCLsVIqfZw9Inz4N+s8AM99yQzm16VWWLXGXQPLymOla2qx0tsVlWnwHIaL0F
	 +fbHN30DytgN3R531Bgva9TbEBaTNp8Y8RIdtziam8mDF0KRgvnCkNXMH44H/9nlvK
	 Eg0XB4AwC7CBw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250217021715.284951-1-shengjiu.wang@nxp.com>
References: <20250217021715.284951-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 0/2] ASoC: imx-card: support playback or capture
 only
Message-Id: <174050302640.104078.14845338578152445669.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 17:03:46 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 17 Feb 2025 10:17:13 +0800, Shengjiu Wang wrote:
> Be similar to audio graph card, support playback or capture only for
> imx-audio-card.
> 
> imx-card can't directly refer to audio-graph-port.yaml, because it is
> not based on 'ports'. Add playback-only and capture-only property
> directly
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: imx-card: Add playback-only and capture-only property
      commit: 8c6ede5cc4226fd841f252d02ab0372cb92ee75c
[2/2] ASoC: imx-card: Add playback_only or capture_only support
      commit: 1877c3e7937fb2b9373ba263a4900448d50917b7

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


