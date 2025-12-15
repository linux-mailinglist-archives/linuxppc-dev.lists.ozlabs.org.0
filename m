Return-Path: <linuxppc-dev+bounces-14759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0BCBE288
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 14:58:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVM9P2nj2z2xrk;
	Tue, 16 Dec 2025 00:58:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765807129;
	cv=none; b=JNZVq0gfCa5MOVAxv39Qggtr5Rd8pPY1ExBskp1ZqR30cJEsVaAdPBr4rQTYBAVAFKArATzurL/bj30DVFxgi4TFOICobwSBRZNhhbarR1aECxSmR4B6ipE65YNwm0LC6pR99UNDrk8Swd6LI5rWyYpvc4ufd5H/MOpbafxH3f8sIUV1LegwjNbaaviKibRzxcajQJYnRuRg8eyYW/pxeKL/qK2C3pnX/VbUtPd3r8UUHY3Is4fI/JrtUQ/9v1oHc/oGJJtvu8WHb59vKqBhKHunFZvRxb8pvDxGOZT7kORYj4ipjbaC0fFyTYA3C0fNRmet3xloWrcOzwJ8ma2ZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765807129; c=relaxed/relaxed;
	bh=nWUzdtd/I08hd6zaHr41BUlOuBKYCKIvlPWKVHEeNJg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cPBuWoAN95Dw/Hvg/bCovpHr8rGpAb34uaCYe7pfFlh/ISvbe1KFccXnQu8n68vrtcVXRiG0yXqVXazn/w7a2iKhdGURK++dc/FlRqng+s+09cBF9eGFw4B/i6zZvS6X8eqPPa+c+MySMrGpPRYrekkaGm6Tll/R/ihDnxT3zYTDOXG5lEDjNHSLpgfp3mSrG51V0qn2CknREQ9o4/1xHhcKu8qH5ROHzr8DHlZwVu1G8MvEFGZDrwxXndGi0cp+C8AMxIHRyYK/XuyO0YxQL15R+7f8HnvSPINCjxl2zrdy05gdP5FkzLGgmFHtb4XG8VcRmxJEqPPTXKkov0Viwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g7GH20J5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g7GH20J5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVM9N1bXvz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 00:58:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7890160258;
	Mon, 15 Dec 2025 13:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A0AC4AF09;
	Mon, 15 Dec 2025 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807125;
	bh=ObcPYFjOgd+e74qo34+MtvWuVotkWlvOL3RKKEDTZmI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=g7GH20J54u0rCVGE8EBGLyIZGH8Hj7ZtySsDL4mUMySysSiFIH27khZ9Ohk/E6D/e
	 1PJqD9lrM68sZ3n9/Q1Og/upbwmdWu5gYKNM6Buwi3TVYgybxMkdkivkvZ2yCeoWBP
	 ClXE6lY9OERau/GW4JEHn94juCiK3mICNC5lpb58GCaEVtdME7Mep9+BQutIwyJ21P
	 s7prlYkwj/c9zfBY9tErNEWmERc/1pgSHJznAudsBHukGwBmQLeo3Jqvedng8IlIMb
	 PkvRaPQjQFXPfQqUvp4C8mMCe1zVcygOjIvukrA4Fvtv7w1CuBuiUVX5dRJiDwPL6a
	 ZhkOlT3ksRFag==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20251210062109.2577735-1-chancel.liu@nxp.com>
References: <20251210062109.2577735-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Constrain sample rates from audio PLLs
 only in master mode
Message-Id: <176580712207.161056.14407929260579507141.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:42 +0900
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
X-Mailer: b4 0.15-dev-47773
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 10 Dec 2025 15:21:09 +0900, Chancel Liu wrote:
> If SAI works in master mode it will generate clocks for external codec
> from audio PLLs. Thus sample rates should be constrained according to
> audio PLL clocks. While SAI works in slave mode which means clocks are
> generated externally then constraints are independent of audio PLLs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Constrain sample rates from audio PLLs only in master mode
      commit: 9f4d0899efd9892fc7514c9488270e1bb7dedd2b

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


