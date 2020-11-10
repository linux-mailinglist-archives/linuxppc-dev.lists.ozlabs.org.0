Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D62AE1EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 22:40:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CW1Vv6lVkzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 08:40:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=To+hjNxU; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CW1Sl71MXzDqG6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 08:38:31 +1100 (AEDT)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CBBB207D3;
 Tue, 10 Nov 2020 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605044309;
 bh=1wv/W+FAA2wLDi6r6O9opaiMCeNvIC1rPgcrn0Rooxs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=To+hjNxUK2OWbg0OfzQHC3Q4eCQLWyaXcTYcslaAt6K6bqa7nEVjItClnhIdqOAVJ
 y5p0CBYi8rvAnkxFj+S7OW+XEmMZ+o3a+zzJ5CPzo0WEl7lCPymSFDkxARdAzaEvJF
 5V73vnqwQnMV0raNC+VO6a80HFbJSjQ56Hy/EpvU=
Date: Tue, 10 Nov 2020 21:38:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Xiubo Li <Xiubo.Lee@gmail.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20201102161810.902464-1-viorel.suman@oss.nxp.com>
References: <20201102161810.902464-1-viorel.suman@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix break condition
Message-Id: <160504428419.41991.13993731328162565714.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Viorel Suman <viorel.suman@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2 Nov 2020 18:18:10 +0200, Viorel Suman (OSS) wrote:
> The break condition copied by mistake as same
> as loop condition in the previous version, but must
> be the opposite. So fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: fix break condition
      commit: 048751de568816de52dedf0fa967cceada7885f1

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
