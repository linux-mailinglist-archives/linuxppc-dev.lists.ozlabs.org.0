Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6C222F9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 02:02:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7BBL5xh9zDqdb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:02:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cJnwPT3X; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7B5K3TfqzDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 09:57:41 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 704F4207BC;
 Thu, 16 Jul 2020 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943858;
 bh=5mhLBJ7h6ElkX/0AxOdJ2+cHlZaRzaXjArcjaCDUEQE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cJnwPT3X2FH6FCM6jcYgB3hpoARd40Qv3iu7c0nfDjwEDgBgGe61Qip+68Yb39Ud5
 YhIohsWJYKHLJZ26Fig4h4IZt3QJz133+eMrfsNUkVF90NfgYQUGvBAxgBGWdn19iC
 9bmF8yHwcBnlFBpcKg6MmnhQ9mWee+6E0CN+OAt8=
Date: Fri, 17 Jul 2020 00:57:28 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, robh+dt@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, festevam@gmail.com, timur@kernel.org,
 nicoleotsuka@gmail.com, devicetree@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com
In-Reply-To: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: fsl-asoc-card: Support hp and mic detection
Message-Id: <159494380522.42174.2922411454169889285.b4-ty@kernel.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020 22:09:36 +0800, Shengjiu Wang wrote:
> Support hp and mic detection.
> Add a parameter for asoc_simple_init_jack.
> 
> Shengjiu Wang (3):
>   ASoC: simple-card-utils: Support configure pin_name for
>     asoc_simple_init_jack
>   ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
>   ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: simple-card-utils: Support configure pin_name for asoc_simple_init_jack
      commit: 764aafdb985b182bce0c91503e9233cb97a2f0d7
[2/3] ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
      commit: c3c058aba4032a0f88a2f203472d7b5076a926b4
[3/3] ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection
      commit: 3b171194493c5f7b2aa9b76deb402a8e98ab510f

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
