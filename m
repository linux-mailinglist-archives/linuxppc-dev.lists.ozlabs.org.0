Return-Path: <linuxppc-dev+bounces-6472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1852A44741
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 18:03:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2P8627n6z2yN3;
	Wed, 26 Feb 2025 04:03:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740503030;
	cv=none; b=N8tGsn7cOiTY7yVSNDbjkthUdoo4C3sfmBvFPsLajRbXfbsPlxDIQAwarFSOgqitByJxWJ52pIwIvEefhp3YvSvk6CFv0pIGYRclc0EDSGFO2fGBHB7px6gGnFImLnHY27HGLWIy39tyLEe8z1OGqQS8Lvw3y0Og33owTojJUxz+ekb5a+rzrDfHCMpCupBldZNOJQtK0DfxY3yUlg0N1fR5LFybhOn5ADQaw8Q6XEIuSM+PRNPfKZyQhuzSJ59VWPQd4ETjmOqAidVIU/hiA5i/VKj6lrMjkmUtuKsUI1ia8m/xOqAfRjh+ELQfBolLvs4pfaqnCsV5vkubiuZJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740503030; c=relaxed/relaxed;
	bh=8k7MxGDGXdaouFHEvPH75JVb3S1twpfAXVhSuWav9UE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RcRSkhW0UzfOymO54LndwXueN2KQugQe+EJlo9xWw0HxT8kIqKhVbrWZFqo2xKjO9SRLP8a+lDf+dw5Hf+lkTer9/iE8PagF7RpexiWX4KkgXmUvDXS5vILY2KAP6o4HJiWRiDkEgfwM+jAwFoL9tvpScDouX+eQc/Me9LM48aqkAFZz6BtYyerfbMmZFIttJgdhymCy4nvco1KIVAVEVXDPx/i1JZYTz7CD9QYZvTfifw+X57OKx/65+X14aEHry/jypW0HWOJRR7avSt0HQywbB6bcl6xieoPUqoXeXXd7074PwualHOgvz1MwfGyAp7sYgIPPZqoKl9WR/2f9pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IrjWj1lq; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IrjWj1lq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2P853Snzz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 04:03:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A24D55C7316;
	Tue, 25 Feb 2025 17:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBA1C4CEE2;
	Tue, 25 Feb 2025 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503026;
	bh=QjKx6PnEreTmGevRICTv66dbF9KM4R8MO1GuCfDDlD8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IrjWj1lqai1dG0x8uiajXo5PpZ/zYHo5eXSqcXl9oLB7JfeQQTLUWEuqnK6I75Y7P
	 rmAFAOp4o6QtQxuhGuqBozC2ASpOASgneHHO9tUc6FdbckibMhVCb8+QI7qrXpLMdw
	 zsbQNhcRkwYA5BVYYA+bf6siRUzWL1GlxFQa9cIrwrXfKfML8QgV8vFbGQovPCy35X
	 rC4qFPjZleOIP3NDvk5XoA5X5lob+AqoQDq4Bg9ojP342e7usFCVJ4m3lUmAZIoS8z
	 qa8PgXzUR0HGrkpjZvJvDYJQoPSnG/jXkhHECm2b8coLdECTfUDGpV6PQ1Cr7oEUJT
	 rX0Cz226bssxA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: support playback or capture only
Message-Id: <174050302203.104078.14585047916828539805.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 17:03:42 +0000
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
X-Mailer: b4 0.15-dev-1b0d6
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 11 Feb 2025 11:57:35 +0800, Shengjiu Wang wrote:
> Be similar to audio graph card, support playback or capture only
> for imx-audio-card.
> 
> Shengjiu Wang (2):
>   ASoC: dt-bindings: imx-card: Add playback-only and capture-only
>     property
>   ASoC: imx-card: Add playback_only or capture_only support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: imx-card: Add playback-only and capture-only property
      commit: 8c6ede5cc4226fd841f252d02ab0372cb92ee75c
[2/2] ASoC: imx-card: Add playback_only or capture_only support
      commit: 1877c3e7937fb2b9373ba263a4900448d50917b7

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


