Return-Path: <linuxppc-dev+bounces-1697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF7B98AEFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 23:26:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHYzr0CLDz301G;
	Tue,  1 Oct 2024 07:26:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727731607;
	cv=none; b=VQ368cT1RoGm6lWJMb4EHTDbD3bzuL+v17QU84RbDDXILM2LmHEhim+yf+W7Z3Bgmby57vWLVJefVbHilHDXhYJ2w4aegqhFLphDNlNAmd28CslmhjXW+D+JCJyIAtKq3Na9vpkW8ZLyds2qC6dzlJymbnxOEizoZw3GXA/3ZOf45dbOmmu2T9aakJoPK8LumNuQ2mUpU9qL5uCvBCQvZKZPhXmp5hxOtJXQJ0omnGN40ZPUI5CDyJNYSNeJYFc5GYrvhYeqKuSjNJMOJ/UEMG0WiQNCVfvhvDXDVXmqAC2UWTMps/qFtkSB1wm0QzcvuvkV2k4VOWVhEwFpwevE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727731607; c=relaxed/relaxed;
	bh=8U+PR0Olc6pa82L7saTEX3cuvOrpLiqj4a3YfY3UsSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EiXJUuqKgQtC+i/NQDMh2HpOZqp74U60Fwn8B9brZ0vZa7O+lNpFf4hK5H9hv2u1fAPuH6HGcFsY8jK12n/1DQQds/ZIKkUcFi/vSi6E836eWQ6SkF1/EhnZ1jZhGNE05sGjVBFnJ+P+KB6ReBScg/sutNUg7A51h9m8rOwwb0NucbvfOTxeEEvbjJBslJ/wM0EOm8JvB4IV2M2a25pR0h3TR6fswBPjoluJrvykgjd8/QmMGi77i2uX3bKg9MHmHm3y8V85u5OjQJnQ5WPrSplkYJkER/8OWh6M3lBS+1hgr27a/GliRxzuS456F9rw4l9MMHZCMQZl9ZZSCvlzJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qx9+ijmC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qx9+ijmC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHYzq07Tbz300g
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 07:26:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F8FFA416D9;
	Mon, 30 Sep 2024 21:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B21C4CEC7;
	Mon, 30 Sep 2024 21:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731602;
	bh=NkRqiuMzhon0316LV3Kd2sU6eM23gxXjReXGVuES79I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qx9+ijmCV0QWEi1Y3/I0BppzWyFZVGTnGK/kuxt4amCNYMWAAhex2Ojp/1Ipd9w6j
	 Zu1EdY6/lt9gWstfSbToWwF/U0xEqJL5FQNpw9tIQ1btd/ffNA1LphbiwBMaykzNQc
	 5W+JJWj9I/6Jt4IkmgZG2zLhZDJJ+Y8t9B/VyxzY8ied3nAfZqBqQO+k6Ej2I6Nl7Q
	 JZS08jHRK9gfNiigzZrtzKjMgApPH3zvwQwmArLAm+qnO6TjSNS2i9UzYTbDwFFXo1
	 n7DoD4qEZXHUktUmxCMz9EewyNE7yBHCrYyI4CeCzjQULmZxZuRg143ACLMmJdP4aM
	 1hs7qx0qdQn+g==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
References: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: Use maple tree register cache
Message-Id: <172773160047.2197048.13783696550298838000.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:26:40 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 24 Sep 2024 15:58:42 +0200, Mark Brown wrote:
> Several of the NXP drivers use regmaps with a rbtree register cache. Since
> the maple tree cache is uisng a generally more modern data structure which
> makes implementation choices more suitable for modern systems let's convert
> these drivers to it. This should have no practical impact.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Use maple tree register cache
      commit: bbeffdda5f26a56072cb8cf741f4c52bc2174838

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


