Return-Path: <linuxppc-dev+bounces-1192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B3972413
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 23:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2fQs0w4Jz2yNt;
	Tue, 10 Sep 2024 07:01:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725915717;
	cv=none; b=EVuqGV2MwM+ibeAaeu07aSr37kDy8GiQPsosJvh3kpcZCkcaotxuy8AJGKqbCgZeqsY5YYmBeW9ZL31agjSbIIw5QdxK5GjLzlfV3Du1/HF9wmnoAFoB7vavj8tDL6kcQDRdEwoBA+89/6HDP+KWPpIaL1tDSFhnm/QffMekFSf3oQRLnFiN/2CF9O19w5m36Te+kVLVt/Vf8dHtO9kyin6cnR+hIBOdz/9QPgblaxTDyUfl8L5DFv90uU884V7BECJp+DhFjf5HqmgwZbptf5dKQpflyDku9apwIIp8YTVCD2ZJUDLw/Wlfxm1cjVOuFhbKA+gvytZQ0k4tUvM8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725915717; c=relaxed/relaxed;
	bh=3/Sl1MGA9kpMY4Sl1K0fTxOWoAkDxhLsEVqpseVUXFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ef3cmaTVMhrCsEA2L5yf2N7jMvwge++NGSwORj68O36UqUE8kI1mmd6pHMekO/02ONGdTyn8FZKqTIKoT0eH31UhiTN8YHwtSLVt54u2v+WZBm96hr5LL2x49cUklas5ge3w9qAqNvIUGb3nkgSLqfDQ57yT44l+zjw3QhIVxjlbc7Mxs0na1G7HeYaY4M2lFWni8j/Ec9Fvtul0Riys8GetP7v5ByjGZvSPa3RKMqLP9f+F92oqPwRSH+qeV+caECXA6ecKcbFaatKG8lE5Czm5PhXAxokLz70BxIZMpYJUsMr4rdWjpuMbE6PflYaKJB6T+qXXwfEBUmhL531ZZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U83w8q4v; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U83w8q4v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2fQr4rmlz2yNR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 07:01:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4484A419D0;
	Mon,  9 Sep 2024 21:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DBDC4CEC5;
	Mon,  9 Sep 2024 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915712;
	bh=fk1O36vP6EYATpW7zFnE0wBAJf09Xs8FlL14jwq2K04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U83w8q4vmWuUNWWa8wp6WXXICFHNrWHnRAOLoFaJwf+YGIhqaA4++V14XBYpETLmz
	 Rrd3E+kOLKplgGDfpABUQym08RyIiH3l4jAbmyk5bBAK0s0gOBxgw2KpqYkk67k29Q
	 bB2annXHCrM4S5XPhPdfW+/6Ff0w15aInu8EqGFqDTaWc6XH5oDKdHJJFazQNbDIc4
	 p3AukalcGRDrdrFRfFF1YtRIBR9v1CMyNI+juVxM1lxCtHvdKIJ/p3GvzmaDqMOg0z
	 e01KB1mHz9lEzQnWY0Dh6JJLHfYFid95AQrKjY5TyB7IUFJ0wwiByyCgketuPB89UX
	 ftt0aAFvxLWog==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, sound-open-firmware@alsa-project.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
References: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: Switch back to struct platform_driver::remove()
Message-Id: <172591570834.136248.17412626468486255591.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:01:48 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 09 Sep 2024 17:12:30 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all drivers below sound/soc to use .remove(), with the eventual
> goal to drop struct platform_driver::remove_new(). As .remove() and
> .remove_new() have the same prototypes, conversion is done by just
> changing the structure member name in the driver initializer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Switch back to struct platform_driver::remove()
      commit: 130af75b5c05eef4ecd8593371f3e924bcd41241

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


