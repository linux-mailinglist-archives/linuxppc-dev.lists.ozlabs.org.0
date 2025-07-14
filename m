Return-Path: <linuxppc-dev+bounces-10241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E66B03BF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 12:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgdvh4BvRz3bsT;
	Mon, 14 Jul 2025 20:33:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752489216;
	cv=none; b=n2ivOtOE2FIJ9hcd51Pik8NF79QwaD9XXIoOtKEpX9b/CDb86Arq0sF+50u6jrHv2dnqAgT84g8BOshcnojjCqgdftNKEWHNNOVH72rgUhF+ZLTGW2sURkxl+IOhf20cP5o/pJvPSPb1+2VmmZNjyjO/56A02ULpc8LRCyRuoJoGqbihlMSEgcsalPXP9JHLNM3nTtEMZepwyX1dhYzHz+lGesq1KkdVmgYuUdO50VsUjrXYuacE4IejxY6zqmwWBbiD6K6emHejCCONzliMDCLT1gNeyQ5rVxFyVkABHuFOGlLroZV+eZPXALa9pYyO8fUvhvOth6wvxxA+VB9myQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752489216; c=relaxed/relaxed;
	bh=oTXeI4Yyc2TJHTGkB/fRyPHxZT4VqOakkUkCsPuSu0E=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B13z4JVw8BgfSj7Fh5Mksss2nK7ozeJaCXVE7zA5gx6/Wa9W4vDle8gYoACRIpN7m7xzlRC+59FN/dW1xKWztvprcbAY6YmY5KjNhajE3EOg5M5J5RYC5R8RS8lEPbBuVsnz/vlPueEPmBfCzCK3fqkseBX0Xop6bogLsdgh7rte56hrxd4n/cxNnNilTnAs/xtn/4HGJw8VMWnAX68eppl5qv/BoVenyKKzjL1H/yBLpT3jFjiDaMI9Xx9hlGXNNFWY5scbs8bgcmYSLF0MRSbf6zSGVD2vXQNILYIf1iJIeGPQgfVQtkBUKNcZtTpeEuvRxvZD8oUk9YK8cT5LhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UKQwRRMz; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UKQwRRMz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgdvf67wDz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 20:33:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D678613AB;
	Mon, 14 Jul 2025 10:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B3BC4CEED;
	Mon, 14 Jul 2025 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752489212;
	bh=bMoDE10u69+kJo+CqlUf/1Lk5IoVrtH/MJM88QLo0X8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UKQwRRMzxreim04vlh2nc5bQcynAxieghO6aqhe8IqhE4k9SvCU0yOs0189unXdvY
	 oV1JTpMwRXs3FXgq9NPSl1GSbHjHO1yZkdSrblfIp60SWoRrWyXyLTjDBChq5O+nKe
	 mdgfXtxOFQz6X3rtxz9qhR2JIktwzsGlJlSV/6Li8VuTby7na20b7TUC3qnRK95Tc8
	 ApDsaIpHT6cWzzyxBtUTW3jnpyEvHHAT5hlbWYYbon4IdWkgb+atBSl0kR5eCfJqeT
	 pgLABcRuKfKuaZDFxOwUw1RtzE8fZDI1fpDrenPtXxs42dvyPjcgPCLZ8+9q2JwILs
	 WRsjnqCtMhfRQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250708085318.2563521-1-shengjiu.wang@nxp.com>
References: <20250708085318.2563521-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: add sysclk_ratio for calculate
 sysclk frequency
Message-Id: <175248920998.18169.4788818303967179573.b4-ty@kernel.org>
Date: Mon, 14 Jul 2025 11:33:29 +0100
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 08 Jul 2025 16:53:17 +0800, Shengjiu Wang wrote:
> The sysclk frequency can be calculated from sample rate multiply ratio.
> When sysclk_freq is not configured, but sysclk_ratio is configured, then
> calculate sysclk frequency according to sysclk_ratio.
> 
> Apply this change for wm8524 codec.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: add sysclk_ratio for calculate sysclk frequency
      commit: af241e3fa4d823f8af899c92fd50d020816a1860

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


