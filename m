Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAF696C35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGTZR08MYz3cM1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 05:02:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OmWRfV2d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OmWRfV2d;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGTYT14QDz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 05:01:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 653E0B81EA1;
	Tue, 14 Feb 2023 18:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3351C433D2;
	Tue, 14 Feb 2023 18:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676397703;
	bh=awND0EjP9fvq4Q94FyZHVMCMXE5R653wqzWUUQcPrvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OmWRfV2dbTxL/dWS2cmyjsmPHj85akQ8rTAJ7SkqXLf7ZYH/S23CTmCjuExwRGVTj
	 fIbl8QKEB6hJBE75qfnwe7mND/XRVLhVn98hvlloz5+HVbJIzGoc9LG7UlsXJdqDU1
	 0LDtlE7g6Apa8YiD6ZbEAT8PC7vnv+39ZuRBzmb6umIqwQ6MbqZ1ikjsIv/lnMg/ej
	 dbgVRB12k9eLYev4SgJOVZW9IUrG8svEVdKoBGKvGvM50sS9gzP6nx7czG+5FaOTOs
	 8aqe2itpUl56SAzbXhdGM6jDuvAu1ViOVk2dImmQX467vN90o4BiB/TApC4tlribmV
	 PTKIasa2v/tow==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP Linux Team <linux-imx@nxp.com>, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
In-Reply-To: <Y+p9r5y9DPSJkPVf@ubun2204.myguest.virtualbox.org>
References: <Y+p9r5y9DPSJkPVf@ubun2204.myguest.virtualbox.org>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Remove unused variable
Message-Id: <167639769854.3067697.826075385352580657.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 18:01:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Feb 2023 23:43:03 +0530, Deepak R Varma wrote:
> Variable ret is initialed but is never modified or used except for
> returning the initial value 0. The value can be directly returned
> instead and the variable definition can be dropped.
> Issue identified using returnvar.cocci Coccinelle semantic patch.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-pcm-rpmsg: Remove unused variable
      commit: 88541443497d47313ec4de1ecc1946288ae0ed16

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

