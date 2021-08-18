Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A183F0914
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 18:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqYGK3WJTz3ckH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 02:27:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hj41TU7k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hj41TU7k; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqYFh4Ll7z3bXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 02:27:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B6D610CB;
 Wed, 18 Aug 2021 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629304021;
 bh=6acFwTMZIC6gk0x6yoAGFSCVjV5LISXXZQTTQAHwKxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hj41TU7kRliPxrAO5KkTX+iNLT3ONSLN3tmUyUUwGkQzp/k5Z5RKGT5oJHHkJNvbQ
 DQVOua9uo/QANQZGqFMr5798Mm28kGLlDcOKM4QwwIi0vEjAhFCbuI3uu+U15MuzZa
 462pDek0YTmlB2lI+wWlU9r4y7qB6/8Gyy2GgQo2iU8PZhbvVdni5dBEUjSliipc0o
 RAsDzmwvQSWSV0VIiDpLVcAv5Xi/etOGCw/ow3tzWp65T+m5SjXz8vyEBq8cJsnDlR
 dAxomcM0jWyJCWdYzDaU+YZ+bAJ8nUCri1EMQwHGYp9aZoFAa82N1RzQUJOpKrlCOj
 P6NqyraEZbKCg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, timur@kernel.org, alsa-devel@alsa-project.org,
 perex@perex.cz, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Check -EPROBE_DEFER for getting clocks
Date: Wed, 18 Aug 2021 17:26:32 +0100
Message-Id: <162930349966.11010.7849823203473029819.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1629266614-6942-1-git-send-email-shengjiu.wang@nxp.com>
References: <1629266614-6942-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 Aug 2021 14:03:34 +0800, Shengjiu Wang wrote:
> The devm_clk_get() may return -EPROBE_DEFER, then clocks
> will be assigned to NULL wrongly. As the clocks are
> optional so we can use devm_clk_get_optional() instead of
> devm_clk_get().
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Check -EPROBE_DEFER for getting clocks
      commit: 2fbbcffea5b6adbfe90ffc842a6b3eb2d7e381ed

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
