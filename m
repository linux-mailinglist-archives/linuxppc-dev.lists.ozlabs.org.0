Return-Path: <linuxppc-dev+bounces-4335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B8D9F6AD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 17:17:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCzN24zRhz30Qb;
	Thu, 19 Dec 2024 03:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734538626;
	cv=none; b=Y1gP+M3329bYJnIQX+vSPXCQ4AuY3OIkg2WryH2CCOaTl+KqteUIQoihHfEJupeDuMuHsQhzlHEYtSykUrqb0E/jepBT/uUPcVS0Xjbn3GJRAx1VGHww0x17P8SUyfrwG9y2hnYSIhiZl+h9foERHpOWhVxvlmQ2vBwzCz6dCySa18TiP1aR35+c2d+0bW0elqA8GGnJ+qq4RzHuKx62JEX366o8WiuN0OdJ0ZmzdQWtCp59ER7lRfvAkiBoQvnZd+MqsR5mOm3BhCoY32CaeN2CUAXxIoQvqrcRkEG5EVudNtZ6VoZEpwVYI2YSAqRJr/wT8SBTWBEuvfHUXzamsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734538626; c=relaxed/relaxed;
	bh=OV0M/LSeiVby+NuDp42TEavGnxgft/RabhvVGuux0dk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gjOfVyZpjkVFheEH70+BoPdGrmk3VxJ93Qp07+TA3k95JH2a8hRrwTdLVhjnZZi0e65ZnhKcgPrP5RxQ+/f70N8DcgSWo4XtD/ngJK7V0rsMGKQLw34F1+xBmVIexH4F8kJwZ8Kk2lG2ZzfmoE3WHXhScLc4vxSEb5TvFcBxabetxhm6FMXtvIClQ8RbETGyR7vMLRO89ig/cTaaTAiUJGSMVfUjXWjsgACfl9/7Kzy91Vaxqre+x4B2dDk+vAEI+7JJJfE4UEHKHRdCNSgJ3CuuVvVg1UIxe78R73bwizb2/w0Bd3YuoqVLC6Ve7o8CejmRMzjVSYJtMBWjLM4LtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hxsiXzBo; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hxsiXzBo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCzN144LXz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 03:17:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE41AA40C2F;
	Wed, 18 Dec 2024 16:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4D1C4CECD;
	Wed, 18 Dec 2024 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734538622;
	bh=BSjJenF+XRqlaTBDLIJWNQGcwPgU2a+Lsli8go+Sy1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=hxsiXzBoUKC3DY9rzKpOp64KhPSZTIwcTfOPG3glHM8Fv060Yl5Vu0Ch55GKlm0A+
	 6S6Jd5y4AZW7R0JJKF7b3d1ziXpJL11D/FEjChIuDHLmH+FTsrUoZmaHxDhMob/vXD
	 tSHUxAHMg50i6O8F3xwHpSXaQszPksfdak1XLF2Nzekvio/msKc0s8j57OHYp4cM95
	 +r8dbJAfZnd8s+X76uc16pLP17efDB03ofmezBwTk4lHG+XQ4DiwYVTy0vzzZK7UDa
	 NKU6loZUkt6M2XQZ3J0DYuOI9DO5awNt98Fmheu+/M/TWnhN39fDtwSflA4TgOztUV
	 tM3kqtY89NcTw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
References: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t
 type
Message-Id: <173453861976.133517.16034496659333958470.b4-ty@kernel.org>
Date: Wed, 18 Dec 2024 16:16:59 +0000
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

On Wed, 18 Dec 2024 10:43:58 +0800, Shengjiu Wang wrote:
> Fix sparse warnings:
> 
> fsl_asrc_m2m.c:360:45: sparse: warning: incorrect type in argument 1 (different base types)
> fsl_asrc_m2m.c:360:45: sparse:    expected restricted snd_pcm_format_t [usertype] pcm_forma
> fsl_asrc_m2m.c:360:45: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:361:41: sparse: warning: incorrect type in assignment (different base types)
> fsl_asrc_m2m.c:361:41: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:361:41: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:365:45: sparse: warning: incorrect type in argument 1 (different base types)
> fsl_asrc_m2m.c:365:45: sparse:    expected restricted snd_pcm_format_t [usertype] pcm_forma
> fsl_asrc_m2m.c:365:45: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:366:42: sparse: warning: incorrect type in assignment (different base types)
> fsl_asrc_m2m.c:366:42: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:366:42: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:595:54: sparse: warning: incorrect type in assignment (different base types)
> fsl_asrc_m2m.c:595:54: sparse:    expected unsigned int [usertype] formats
> fsl_asrc_m2m.c:595:54: sparse:    got restricted snd_pcm_format_t [assigned] [usertype] k
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
      commit: cf126261d5d3b8767fd9c838ffe7213144d05147

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


