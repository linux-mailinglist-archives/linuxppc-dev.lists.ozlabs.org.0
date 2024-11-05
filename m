Return-Path: <linuxppc-dev+bounces-2879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2C9BD28B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 17:38:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjYtV1FvVz2yY1;
	Wed,  6 Nov 2024 03:38:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730824706;
	cv=none; b=WMIPn/aVzpS1qaJsULlwGR33vUke7Su1N/j7x0/mIZv3zdYS89DT9mykM1dlTyJS+ucB7MKgPBq4Lxed+TvJ9Gkfaq6LTr1okWvQxBnBKpKDlQfEsr6jhjdoC+8J1WDlD53hgb6c+Mmd9BY75wIkQKeHdjRt6EWOptkoMYNpieeZo418tIa4TRl9VCPrbrmyUIJobmxDlsIaEdp4PtBAn7e6Ooffj83k5osFYBNQ19hso61tyMI2W99h/fLsFI05dEimerxHO6emOGzzVYp3n7naTl5HOrhKhWC6djPcKUQOKUZT07dHjJ1XvEFnUo/soru8yGFZChnJr+iEGE811A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730824706; c=relaxed/relaxed;
	bh=IXzF4/QsZ3wrx4KDU4VDo0lfWE48214ifjzyvpbHVjY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mPalW63kGU/hsyGDI2ezYcITvinGJ3Xk/Spv2jZJDY9bSCaxsDt7JLmNuWBwNrlal+cfYBqKVwO7lt0s63uxvoCo4ZuJRId43GlIK/tWsGhGFqKc1XOvLn5iJdDBwjEySE3WLnPBlq2Zw+nJbRwvrIHz83NGNQ0xvF8vHxntdJ06sMwyCIPeBZhqh1emo4j6x1yHx2JoHItOujzr9TqH1fGwli0E0cfKIXV9epfX5WBK7Q41hXksDmk6D9VsVdD1l2lkiRQagt1fM8qv3kdaKg4vTqJT7I7c1qpWr7fN5lJyegIJ9MzQXFLLz9YrgZkxcP1D54P6VTMpsPZ+SDeNUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fCHoQ3ve; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fCHoQ3ve;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjYtS54j6z2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 03:38:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CB385C3E40;
	Tue,  5 Nov 2024 16:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C536C4CED4;
	Tue,  5 Nov 2024 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730824695;
	bh=WCZhPeJ0cbeNMsYfbhHV+9cWVHtfghsiRz8NqGMWiek=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fCHoQ3veyBOvbg2BXm/m/h8tBo8XlVx9QfEr7MaIADUFBbPVxB4zxtkTOI4mHyTCh
	 FqxwZFsaXZluemS3x0qkOYjBxCmbxakhfAU9D9QMwTbGaOnAP3LO4/uYEEOMuo04PH
	 WJrRxZnbG3hpVglb/WZjEaTleIk40KDioE3kFcj08Fquq0QUbFbRXP3cVAvC00PTLB
	 wVu4SzjTbfiNVsRAb3T4FHRqByBcNTTcCHJQClNDKZC1jHnM6umZDC4K2aUDwuLm0p
	 1xYvSWg73rYlbOz40DCKu5NrNg0g5aExS2V9kNu4qEoiC8oq9byePwV5RquO37zM3o
	 HIqUWhfGd3WpA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20241025062935.1071408-1-shengjiu.wang@nxp.com>
References: <20241025062935.1071408-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_mqs: Support accessing registers by scmi
 interface
Message-Id: <173082469323.77847.1613545045732850065.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:38:13 +0000
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 25 Oct 2024 14:29:35 +0800, Shengjiu Wang wrote:
> On i.MX95, the MQS module in Always-on (AON) domain only can
> be accessed by System Controller Management Interface (SCMI)
> MISC Protocol. So define a specific regmap_config for the case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: Support accessing registers by scmi interface
      commit: 101c9023594ac937b11739aab149a0c14ab901b6

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


