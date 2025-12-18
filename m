Return-Path: <linuxppc-dev+bounces-14884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD7CCD206
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 19:18:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXJn14t7Yz2xrM;
	Fri, 19 Dec 2025 05:17:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766081877;
	cv=none; b=cOdjFrUkpB5o2mR/SqZTtnNx4iA442GNDOmTDdpRRT6AJ9O76fPoDoaEXijaI/8tuYkcXN5ghFoj/0VUz51uhp0y5lE2Y2dH6lEd9WbZWTg93iKCdh+4N7Thgd10cNcNTYiwdY7FRhi78dWAoWqHdQqZuGEfiJLD3T9If6ifDFDfeJAguYFPSTACIgdgNyhAYIzcX0T3t0KZ11VIGnsUWM3dubkTfqf0U/Nw090O4ZFjrW01kAaQZKagk/2NkS2NT2S2EDxMBDtoGgLj0eJBVKU4DBbqQsnC+tG4+lSAktCOAS2ATdTMm4EFuFNHAGv7XiWTfV4FfNk7Q8LVP2RIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766081877; c=relaxed/relaxed;
	bh=GoLyAJlfktJTPlVx+cm3+yUImKSS1AgqMjdUwytcb0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IUytD08gYHKLiSuoVTxnoh6s/w+tG3UwsTK/V6wxwNgVOlL38Q7IV/MAPK6jzuVKrDiUoFOl3lU2felYj+Hv7B43645IylBfHfLBQNeSkT/+HhVVyqD6Hqpg+i2j+40Ol7BAHKqBbwhQAfhgueB/c5zft55THhWpspaqNHhrnPcGfjC5QqKFl026jSW7YK9IeTMPtCqnCUA1tLJPdVUs1FVuo9rU06PG/GMum+7Uegtgdo3IjsG0QMPkbVYL50LFKEKXrHuRNW6vQwYXZ2FCLpksPYW7mlPTO2B+oMZpBt9hyrCu6JnTQzDaNiEDJP7z45I5UVMcjXNRjXRCRkJDJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AXQE+XN/; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AXQE+XN/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXJn05N3Yz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 05:17:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A0116014C;
	Thu, 18 Dec 2025 18:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A035C113D0;
	Thu, 18 Dec 2025 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081874;
	bh=cEwdoM3ekZYqXJrp6cwcmWe0ftdZUDQjOKNB8LOz2Kk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AXQE+XN/C7Bf0mkX0F+xCRIS4rW7h8xcA4eTuBhC3LDfUXnpkk1AhBZcgCLjTLn3a
	 Ybsz7iBnlH7LZc+rHN58Epw67fDP+mHmWeoY7Ks7+y+1OUWgSa59s7IUWEw8NyCqRQ
	 1Y2gtJ6HCD/koJSJ84VCF+Ni6kGfBWGVMtJEopq7wHdpdVfB2fng+muC1cvRaxqUSg
	 FR5nOmXD0Vjw1ujTsqeRkXJyOI8sJrif5jZiVEwBDYQ4I13bRev29xHq7dssDt8Fwl
	 B9loKxoYKPERFcan62Q58nh02GGujUoKmGopoylKVoxC5pmeqBB9Cy0rtZ3MAwihEA
	 vpv1rHsyzpt0w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
References: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: provide regmap names
Message-Id: <176608187210.237766.15885878211073292970.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:52 +0000
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

On Tue, 16 Dec 2025 09:49:30 +0100, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '30cc0000.xcvr' already exists in 'regmap'
> Fix this by adding a name for the non-core regmap configurations.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: provide regmap names
      commit: 08fd332eeb88515af4f1892d91f6ef4ea7558b71

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


