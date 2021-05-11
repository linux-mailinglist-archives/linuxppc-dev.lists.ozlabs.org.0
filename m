Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F637A1F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 10:29:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfWKl0SSgz3c1w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 18:28:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jx9WYSj+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jx9WYSj+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfWK52DWcz3073
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 18:28:25 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44C106147E;
 Tue, 11 May 2021 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721702;
 bh=eEtBAlCzd+59ejK63RAyKXFMKRoDf6dGtGXy/1g8kRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jx9WYSj+aqHv7LtdfiOExF0K/TdQ/I+e5BrrKTQbtJZeYpncvauQDkrsf6YfoMxks
 gNin9AYrwHcDgOXkq4q6BcwVF7W4xrlhP6xAVXt2lAab1hru8I70I1bW1LYNo+1nBe
 ZoV7XzgWdKR4Vi+ciafH+07YkcO4muwwqkoAd2k+Z8+NWyIiDLYCSF5qd41t42ubmK
 XInSi8hlyAwIztw14M6E9wdJT7HWww/4tKcYdefTv488eKAgjORdvMhRsyMtw8KADH
 5pLq93pOn+WiAZggdo3dKl1J/dSSxjpTawK4mebWQSZVUhl0RrGU3BRRJh7zaYLrU2
 M9CnEg48YiISA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Remove unneeded semicolon
Date: Tue, 11 May 2021 09:26:03 +0100
Message-Id: <162072058169.33157.16301306834523283874.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210506022452.5762-1-wanjiabing@vivo.com>
References: <20210506022452.5762-1-wanjiabing@vivo.com>
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
Cc: kael_w@yeah.net, Mark Brown <broonie@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 May 2021 10:24:52 +0800, Wan Jiabing wrote:
> Fix the following coccicheck warning:
> 
> ./sound/soc/fsl/fsl_xcvr.c:739:2-3: Unneeded semicolon

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Remove unneeded semicolon
      commit: 223875a6fb8e26bbde3de675552d27b62e3ed0de

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
