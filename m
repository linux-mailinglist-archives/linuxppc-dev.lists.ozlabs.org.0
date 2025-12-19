Return-Path: <linuxppc-dev+bounces-14905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4850CD0359
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 15:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXqD14gY8z2yFY;
	Sat, 20 Dec 2025 01:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766153377;
	cv=none; b=NXx40RZ4NLGqNp7qDBRJ2296gyQMrUwjVSkWNPyp8bUaMe07esCbduJ+pgyQV7Tln3CN5odQ57X780elkSMXtBaBfCR/Lt0AGawSpHIFKJpFj4s8slPMPnX3JEEJnKDaXo4GZmMXRXgH9BPRMmqjJicLjhTIhYVTPTwQLSLMZnUd3k+aTZuYZJZPcxA6eDNf1kDmCZ8k2tYvl2TJ7i4EIWs6JxwAaQxwFH1UThSTBgjyhZEMFLePjVZndjjIcRupGaQ5uDZhatF2zIS3fcs+CpguPCtc4emPAq6i+UbBEO0/SZRJJIris1lWU97DEmGLN2kAeGBuuiCZgRc+KJ9zlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766153377; c=relaxed/relaxed;
	bh=TGvMFwaye/qrCdfYtERLLGnleeGiVRQY42LR8cFOmLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CNekBazQuLAlP3/n2+0hNiWaflNxN+gj3D5d1iT+DZfpFyn+Sm5PgeGNcOeXduBTKyWOQWP9iSzfMmcsXh2yA5Xt08zrzQ0hEgEGlw9yHoqe9otyZjM54+9wiLHRQrNK3WUqfW8sJKm3KMpVSQAeM40FvZVjP9k+3xvJUDn1PPmQMyv1uuASbExjfV9vr3DHLs6Xwybv7VBbNMbebKPizDxm0aAWmowfhj5enHlbpKdqFvO2KbgLMCy2z6k/G/50JYxoPru2hKLj67D1NsSv/u5SZbbGVZqUg6ad6XYc/2vTvt44MH+/F8mgWDOLKVD0x7ja9Nf2zqgkuN2RN8bg3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X9QefJJN; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X9QefJJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXqD02tWgz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 01:09:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12C5C60150;
	Fri, 19 Dec 2025 14:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A68C113D0;
	Fri, 19 Dec 2025 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766153373;
	bh=C39rTcxAkIHv99X3RPljuO/4e4VbRRgUEip2DvPO0g4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X9QefJJNU2LOIz01mwiA3qKSM6jtH2/vmKMJL/J6f5D0MzVCYhDdbZQam8a74LjOL
	 wfyUjk5TGqbophYe+c3HaULoOfnQx9YsbqnA211YU37zoti7tmFIWpD5X9LDmxaaet
	 y7tZdMRTI30e5hH1gu1BpsdvIcTAl++fRedeEdwYUjuyJnsg0Hscjyg+hMApUFRMBP
	 lX7jUcwmtW39Km7gJOU3cJ0Mt7H+KNC5fi2ApUvGW1g5RtsYy/+rhfbsM8040vyLNZ
	 oIkWTZ45heqm0n927TgW+EQ3otn/+Oi3Fr+J05XcKBRY69IDgCZF5N3/wGiKgWHC0a
	 fZAaU0XLpXdPQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
References: <20251216094045.623184-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_easrc: Fix duplicate debufs entries
Message-Id: <176615337149.412520.18004973037532955036.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:09:31 +0000
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

On Tue, 16 Dec 2025 10:40:41 +0100, Alexander Stein wrote:
> this series fixes the error regarding duplicate debugfs directory creation on
> TQMa8MPxL (imx8mp) when easrc is enabled:
>   debugfs: '30c90000.easrc' already exists in 'tqm-tlv320aic32'
> 
> This is caused because fsl_easrc adds two components which use the device name
> as component name. Debugfs directories for each component is created, resulting
> on name conflict. Fix this by adding the debugfs_prefix for both component
> drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_easrc: fix duplicate debugfs directory error
      commit: 9f5f3583ba423e6eed0a96e4d4b7d808d618f3aa
[2/2] ASoC: fsl_asrc_dma: fix duplicate debugfs directory error
      commit: 4de6cea0d8e10c9e3f38ccff7edd45891976e67a

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


