Return-Path: <linuxppc-dev+bounces-4119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1B9F14E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 19:27:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8yVF041rz3bV6;
	Sat, 14 Dec 2024 05:27:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734114420;
	cv=none; b=BUdBTQRn1ULLpvO1E+gIorbUw9g0Xq3CU6VIw7ibb2NHb4DPC0+dT0YLMcb44ipJyvHqjt7AwsrH/QDVvifSPtXzm/zJl9qAKniLIiv19ysGDgcOo46UdxFBrn8XvubnNqvhkja1+Jges6/T2971FZRyDcX6CL1C+WoyHq26XfiyFUEL30vEQxUeorQxQOeM62ZiK9FwZLRmKDxzl+RfLbe1jQJsyBHp7hiuF5atJV3qGAVHWVHiTSkqGohf+bKAOwB4fwZYpnSKYtQS3fvEd569Y95D5BUC3eujaIMOaoTP3W/yxvGba/mziJOnXSJ6zMwvB1io6IPw2WPwfBTzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734114420; c=relaxed/relaxed;
	bh=GEraIQBGb6qf5JUSbroIBWaTTVbX7x5BAAI9YorjYpk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MxCpZpExsNq6eKJKyaPEU/H6L/KDck0R53NM0uWHjwKrge0NQoTzOkQQaizidfUrGUhiX1YLLOjPWOjDRfP8f9QcyxaUSUKLCiW1bxnDMLH4qhk3vAqB2iHb+Frj1R2U2b3Uclejp7MnJ2l5H8u/DasSk0AajtjJXiKeFR2FNTAD/oh0EOPEEUNpd7YV8USIGwKh7dUatwbjwwKhI4c+uJnxwFzuSHIKx0hfOS4qeRdk54LbRZk3Vqnul+B2EDp1OFGDD17Iy1AjBhHUOXR74Ra0LvGOhhBks9ucDrco/xlrHWUPqx9I9IKKjXuJMv7Vkk9OOlgFZVtP1bQuyQGohw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GW/hkW/w; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GW/hkW/w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8yVC5nTCz3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 05:26:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DD705C42B6;
	Fri, 13 Dec 2024 18:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FE7C4CED0;
	Fri, 13 Dec 2024 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734114416;
	bh=P3tmUV808PlrjWsZVtbrocOn94r84aBEve7EkJbB0EE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GW/hkW/w4LfVW7vmvSCzUowi3MeqRbp9dbVmP0o3wRkp4JtMwCZCG79+FVhf/j0Of
	 MnuSBxmfqlo0KPGBS++3BysSzndZu1Hdaxe3EHoLA15X40DFXT3JyWki5wO0dryuc2
	 dWP6k9/leMI6l4gjoUqdSuNsVuv31O8woGU5dOvKz5fj5uCtpnp9936Nvp+Hx07I4O
	 3d5tjoefGu5tMRn52ndgRX7MGveg2KkBFs33XqJViKu5p8o/DLiCP29uGNU/7zZZyT
	 ZhPnTSn1Su9rQx0DKB8J6eAGu42NiGQSxPQqQtCmKw827xdcG0Mxhn9cVBs/Xmn5eH
	 GMq//v75OxzOA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, 
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 0/6] ASoC: fsl: add memory to memory function for
 ASRC
Message-Id: <173411441355.280424.14935284209276568628.b4-ty@kernel.org>
Date: Fri, 13 Dec 2024 18:26:53 +0000
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
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 11 Dec 2024 11:08:43 +0800, Shengjiu Wang wrote:
> This function is base on the accelerator implementation
> for compress API:
> 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
> 
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ALSA: compress: Add output rate and output format support
      commit: f4425e3ab2f796d442a44f31262eade9b6427ff7
[2/6] ASoC: fsl_asrc: define functions for memory to memory usage
      commit: 8ea7d04a4e9e30876c9d8184b4b8e4cab33e0372
[3/6] ASoC: fsl_easrc: define functions for memory to memory usage
      commit: 27147695aaf7ccb0edc3f21454b5405c9037b4ba
[4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
      commit: 24a01710f6271ec32b629d714e6a64a69665128b
[5/6] ASoC: fsl_asrc: register m2m platform device
      commit: 286d658477a43284f7be2539b059ecc90ba109c2
[6/6] ASoC: fsl_easrc: register m2m platform device
      commit: b62eaff0650dc6dc2a4bf0f50714f2357a23fc71

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


