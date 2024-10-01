Return-Path: <linuxppc-dev+bounces-1717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E498C4D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 19:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ5CJ2gQjz2yLB;
	Wed,  2 Oct 2024 03:53:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727805210;
	cv=none; b=Va95ekWyQ77HWAzxylP6XUnEIfvj5vfQ3kfRau+/nosLWe9PlHSAAuGXNmg1R8/8a0d70CwkxoGesI0AVRZftEcrdhMYHIgT+rLJ4bH4PnuXQfHx/vl+80WB4wgiyjj5JTh/S9qIbJexZR44fK9bJySMUKOsb07Ozqj43vM6OdgeijuN0RUYxpIat4agHhyq/KKNjArTAKWrwbECRqvGR5C14WiVmbSXVmDoWIGvHKOS/jdwGvE6tHG+aBeA8j2nyaHkJn8j3Tv6TTexcBaBYFBSyFlGMflFu7OmDs2AwDsd/yTYpIgFWDYz7fsmJWcElRQKWs6ru+oM3nQpobgbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727805210; c=relaxed/relaxed;
	bh=ijOjawPTh24oC8zd5Tk/+mhfJ9b5AKsXuZ2hsq2PRC8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZKQdpzbh70OBwHYrqAgjblGkFie8nW6BY2YrCWYWDGcSp+pdlEzeXBk2qSJ2JnEFODVM0psuNYUjUnCXi+O3/zqsiSpYHikoGkXtnpQMDK4HaGXX+tHJP0M8Ao0HFnUo6QQlts04etri0eLc+1EclBvW0FODNsd80RlKgsYDb0dyVJu6x6vM57nXQSa/4iBBnEzT0QkQDf5L+zeBQHJVLKanEINnmGWl5iLcttFDfg0de2/YhSxBLl9QcWVcxMjGASpBRW8TB7KWbpSsuCMy6zDZddS19iJmoaFcpcEl2K7a9MexPC6etpyvX0W5azLycY78yy9n5aMm8lKY9TBzbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BtTa7fc5; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BtTa7fc5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ5CG4yr6z2yGd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 03:53:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B6D3A41879;
	Tue,  1 Oct 2024 17:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249B9C4CECD;
	Tue,  1 Oct 2024 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805207;
	bh=zFUAfX1xGLKWPqysQ2DsF4JQETrYOAYztxgnX54f+SU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BtTa7fc5dYV7KmtWiwKcr/Gn5pqBlFp2RlGzO/sBQcWTRxSwnOL/1nFaQPu0bGQYa
	 fRyrtywXMXiY32M9yj5/ZJamVKXInQm3iPrSUPkzjDltkBUaxMkkG/jSesFL1c8Qqb
	 Au3Y9+9vqxi/1NkBe5jqUSmtJKKxUrs7pVsUCPAr5L6nGdgP5G0VQh7QUdu1dF/mQW
	 +KFOJhXVYWU5Am/F2QZSTwgh2goWTcLYZXJaq8BuPQCCwV9b5n7lQjLACvknMYEdJu
	 CO/9ssjkRPPcp09yrwntnriRrEcAymTysK0Ef3zqUnvLjs7jOZx6gpDoBpXWicNkjD
	 ejNW3L3AfbqaA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/3] ASoC: fsl_micfil: fix and improvement
Message-Id: <172780520382.2298697.5976871562900019910.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:23 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 27 Sep 2024 16:00:28 +0800, Shengjiu Wang wrote:
> Fix the usage of regmap_write_bits().
> Move mclk clock enablement to late stage.
> Enable the micfil error interrupt.
> 
> Shengjiu Wang (3):
>   ASoC: fsl_micfil: fix regmap_write_bits usage
>   ASoC: fsl_micfil: Add mclk enable flag
>   ASoC: fsl_micfil: Enable micfil error interrupt
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_micfil: fix regmap_write_bits usage
      commit: 06df673d20230afb0e383e39235a4fa8b9a62464
[2/3] ASoC: fsl_micfil: Add mclk enable flag
      commit: b47024dc624bcffb89d238f4a5b490363cea2a1e
[3/3] ASoC: fsl_micfil: Enable micfil error interrupt
      commit: cc3ae21f360bfa375fc3539e24e7adb0e643a9d4

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


