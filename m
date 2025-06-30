Return-Path: <linuxppc-dev+bounces-9878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F4AEDB54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 13:40:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW4383h8nz2y06;
	Mon, 30 Jun 2025 21:40:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751283620;
	cv=none; b=EqgGjQBY9z1+5Fv1ktJzxuVyK6Fbn7/hiIhRUTmWHz8b/ZYPfNirwRg8edQJ/Si7Hy34e5uNJDGdPbHw/IgD/nBqHMswqPM7z4Cwcv2M3wjHFalVV9SMZgpIwaJCudqllLlsy40bVZFu71sLbScD9pT2wDNsZ4lKv/OwIhLGGHxCssvvMt5v/VhqREVTiOErwfEtx6Tam0pGYUkCSY8S303X1HgDxybbjtNdR3Atzfxeo3eGIV+yjYGkk1Pf5LbdbNOsPfn0S8zHDKDF2gPMhBuCU52ZoYlyh+sljruI8+pXk/CcXZukPFPzOnxBitlEkmQfAgL9TFa4ussWiS0hPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751283620; c=relaxed/relaxed;
	bh=Xnhe16BodUgjYRAdOO2hMGMLW+d9zODEJm05ZXt6bIs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lokBqk/0E6c83xAO9ozNPszyGpAGvfPGhWwNZy9DEIibCbiZs42Poj0rrGsdn57t5SlOGZ1Lev9wpoETEStYh83kMK8Ldo/c0yqrmmExPTI373tjBo+iGjYOug8qn6CfLBXVUpo82nuF4Rr83JEe796XXRYEoZDvkKW2iHAac7QyVzH8TIMlxJeojrO0lIKsxlHxK2AMCkUmB1+DVQ76xUiyfgHSTFCPidgy1s+aSDj4PqccaP2S5wTQE0XV96i7q7qlW5rWGVXP1PiSkAUWV5tAr3s7kjFZy/Z5LrSdGTo89k7bd+/KxAPyyZ6boOt8+4JxZmvG76nJO8sMAJdhwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jAo0Y5cq; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jAo0Y5cq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW4370NPKz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 21:40:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C2A25C5D37;
	Mon, 30 Jun 2025 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AD6C4CEEF;
	Mon, 30 Jun 2025 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283615;
	bh=LKlH+AYR76n8DFV4IF91R80s3PE0sUN7OOb+h3R9KXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jAo0Y5cqO51tfTQigwo/NJEQq0+QcIu5+mlpcu0SMFAZZ2yGxDbGbaZIFrUtIDPMJ
	 hFc66SForMUorqbW7VZnUx/qAfQQ9GId2+gvcywLPsbvbTl5TFaCRBA3pJKI8qC0kO
	 x5fP/1sUfiCTGj7xUQBSbF8FN828Qd8Mpy4skxpShSR1l4CNP7ekmRUJ2dhdVJ3chY
	 worfYae5O+OWwC3+6UO2Uvzm0HKJiQu2s+cKz3Hz2Iwc2O9bPdL/ruIEkSby3PxnF4
	 cj/2720wx/4l1dT4bv62fHmRRwcAcdiDHYy2XL14kHRszO7JvFm/jy30I+zcCLhUmS
	 5fgVjHT9YMVNg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Arun Raghavan <arun@arunraghavan.net>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pieterjan Camerlynck <p.camerlynck@televic.com>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Arun Raghavan <arun@asymptotic.io>, 
 stable@vger.kernel.org
In-Reply-To: <20250626130858.163825-1-arun@arunraghavan.net>
References: <20250626130858.163825-1-arun@arunraghavan.net>
Subject: Re: [PATCH v4] ASoC: fsl_sai: Force a software reset when starting
 in consumer mode
Message-Id: <175128361295.28563.443890248287811390.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:12 +0100
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
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 26 Jun 2025 09:08:25 -0400, Arun Raghavan wrote:
> On an imx8mm platform with an external clock provider, when running the
> receiver (arecord) and triggering an xrun with xrun_injection, we see a
> channel swap/offset. This happens sometimes when running only the
> receiver, but occurs reliably if a transmitter (aplay) is also
> concurrently running.
> 
> It seems that the SAI loses track of frame sync during the trigger stop
> -> trigger start cycle that occurs during an xrun. Doing just a FIFO
> reset in this case does not suffice, and only a software reset seems to
> get it back on track.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Force a software reset when starting in consumer mode
      commit: dc78f7e59169d3f0e6c3c95d23dc8e55e95741e2

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


