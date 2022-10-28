Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F12436116CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzS6T5TNWz3ccm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 03:04:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QoMxNCkb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QoMxNCkb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzS4d3mXKz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 03:02:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E78CB828F7;
	Fri, 28 Oct 2022 16:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C60C433D7;
	Fri, 28 Oct 2022 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666972973;
	bh=wNXKotwuuxgi6yUVKqYwBdPAK78kh9kgseKN/VlZMsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QoMxNCkbqCrOrhXaqnGoLA1VvcD3H75wwfwDf4OmM04KM6glN09KDgQGZ12VkVQVW
	 DL+lkbzixjKEznebXjDlvZtDbvqWfHPChXvnNfsQokZPKiB/wg9z0EAZ/GcAeWvTE5
	 ySAgSvhMx8cATgMQ3GT/8UMaFY0q3usVtI3roTXE5Un6D21+Ny0cZUDFhLJ3JLP+XU
	 5sc0suRcC57UX4gv45jaHbE1WVkH5UN81F+xxVhy2mTRtU/NwE+FJ/wGTVooHxJnaL
	 Kw1W3b9ac5bff3ZNOX9/KOwbj4mNNVxaufY5KHuEJMgVtjXHPLemjuDMJbhNzR+dZU
	 RMNwt01hsnRLA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 lgirdwood@gmail.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <1666940627-7611-1-git-send-email-shengjiu.wang@nxp.com>
References: <1666940627-7611-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Add Counter registers
Message-Id: <166697297135.717517.11089794085800695281.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 17:02:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Oct 2022 15:03:47 +0800, Shengjiu Wang wrote:
> These counter registers are part of register list,
> add them to complete the register map
> 
> - DMAC counter control registers
> - Data path Timestamp counter register
> - Data path bit counter register
> - Data path bit count timestamp register
> - Data path bit read timestamp register
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Add Counter registers
      commit: 107d170dc46e14cfa575d1b995107ef2f2e51dfe

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
