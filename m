Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B465E81B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 20:22:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZ0qn6cTNz3cd3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 04:22:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y7dXJdug;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y7dXJdug;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZ0qD3MRCz3cB1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 04:22:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 441F9B82150;
	Fri, 23 Sep 2022 18:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6EDC433D6;
	Fri, 23 Sep 2022 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663957314;
	bh=nHs2AfrvtEk1XxvpH+aLNwlJHpGH5OeAB5BjgaRdNn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y7dXJdughMertrvwxRUGuz8LzjWUTBvV5X48hlDNnHdB1j7npK5z+KTRictpFfUrL
	 84VLE38m3G0bW06zvrH4NKm8KuscGbXgmkvR834NV/RuvG9XWmmGj26gWdnmdXYrFr
	 a775kFaLzRN+IiXdgDSL3iU2Q03MRLvU93oadp6SNz+iUiL/HaDa23sNB/daKo+ka7
	 R01XG81lq9Bhp4sllixfmqsKK/M2/GZrcduG2bzmo4O2tHSI1rxoqOgHxaVOtBmH+T
	 cJY3/yEG/SRyqzJ/w/vksueuKOy4TNZbcAi7m12zQ7aL5tPc0eUJIfnSNo7LvhtP9/
	 UzP1anJQ9lcBw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 nicoleotsuka@gmail.com, festevam@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz, lgirdwood@gmail.com
In-Reply-To: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
References: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl_audmix: make clock and output src write only"
Message-Id: <166395731156.751793.9528112393184864154.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 19:21:51 +0100
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

On Tue, 6 Sep 2022 14:49:21 +0800, Shengjiu Wang wrote:
> This reverts commit 944c517b8c838832a166f1c89afbf8724f4a6b49.
> 
> There is error after making clock and output src write only
> 
> $amixer -c imxaudmix cset numid=1 1
> amixer: Cannot read the given element from control sysdefault:3
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: fsl_audmix: make clock and output src write only"
      commit: 086ceada2107b482df437d76f581062b547eb7f2

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
