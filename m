Return-Path: <linuxppc-dev+bounces-13331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F592C0D930
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 13:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwCgk67kkz3btg;
	Mon, 27 Oct 2025 23:37:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761568626;
	cv=none; b=TL9tjjqSPzDebwqsezZpzN+tIvw+Wd6Bzh0TFzU6DBVoHHFURtsLL2jGISsKW8xNVTERyTB3qWEGKnK4SvAw7J7h6XtIQ8/tYnx9t+b5roN4q5NORUsaLkkYSQ2bOVwT3wJYXKvZVlyuvRn46xx4ut3SrY2wz4Ib89Cw5FRrrpz+nH002kyz77W73S3qlbVQZmH9f0wixK5gqRokC6prBk7PfH6PUNno0bthEhAHMjXu7LzSdeULS6z2+wKkk6Yh03At9/d2b90Bsz3WovX7vdmCbNQT4m4rMAQltslAbYWmKDfd24Viao8+B3ZmGtYS8R0qoi8J+DuXDSN5A/OtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761568626; c=relaxed/relaxed;
	bh=JYI3jxVBALCam/VwnQQkCSIc7uxwxLS5e2AelNoiu0E=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HWMmXohSKHHgeFGGnHcLy1pA5ZO5v++2Aq4i4uWyTMbgaSPmg25Z7sj6KofIqNZ3mUco2mMSOb3bfMi3PlOjTTfCvHc3Y06A/yzGFznfF878n5sTO7mWDOQlENZVlpqdwM/EctyDKChhM6yg2zh/SZn8V0QmoUHQ6rrrcUqUlfxNUB6SfVt3GANR0xIyx2QefRXqOEdovhRxsMaL6yXkt55cpot2mmG0WVLfWc4HwnEM4u89B/FPTCZCAB65LL3WCWvRQ2gYnbPJV6ClTdxgvl3EzrvY1uVM9Zo5jXfDPWXRFxCWh9sUW4xv0as+UGIRTHBeaynZzhkB5gl1osyCsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiGe9bio; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiGe9bio;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwCgk1Gfwz2yrq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 23:37:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF2884092E;
	Mon, 27 Oct 2025 12:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45DAC4CEF1;
	Mon, 27 Oct 2025 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761568623;
	bh=redh+vh8l4GMLQmHYsINwMcHjcch2Bk0h1hWDsj/HHc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kiGe9bio/BCXg1Mz24lBo+4pYFrQzTCfydQGdSfCxckn8Ix03lFLFb0GoxxgTOXsD
	 NifB3Erz440S0iRhzyKdg7zeQIXzPGE75SnEg0fX1uqDeksklPJzTdhvgw8SpmNSn1
	 aZroYI2BaRy7CI9ZQS4q2FH0qfRg7OTNc7ZL9+rmwet6pi43ORSSrK/9gxc5kDstlK
	 uJ7VGJy7Orx01z9y1mwo9keT7xRnqhkqT7UIlD0Z5BmPHSm/Wz595Bg0fwpjJloO2g
	 gdgThxiHdKR7OHWSlAlK1zxEM9RthfrufIyiIFFF8tT8DsK3IwzIowoLLWJM1Rju47
	 /m7VWp59VEqGg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251023064538.368850-1-shengjiu.wang@nxp.com>
References: <20251023064538.368850-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: correct the bit order issue for DSD
Message-Id: <176156862139.24382.1000390767821381636.b4-ty@kernel.org>
Date: Mon, 27 Oct 2025 12:37:01 +0000
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
X-Mailer: b4 0.15-dev-88d78
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 23 Oct 2025 14:45:36 +0800, Shengjiu Wang wrote:
> The DSD little endian format requires the msb first, the previous
> understanding is not correct. The issue is found by testing with
> pipewire.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_sai: fix bit order for DSD format
>   ASoC: fsl_micfil: correct the endian format for DSD
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_sai: fix bit order for DSD format
      commit: d9fbe5b0bf7e2d1e20d53e4e2274f9f61bdcca98
[2/2] ASoC: fsl_micfil: correct the endian format for DSD
      commit: ba3a5e1aeaa01ea67067d725710a839114214fc6

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


