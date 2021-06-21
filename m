Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2D3AF579
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 20:47:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7z6j3TXfz3c3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 04:47:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lD6c1pBH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lD6c1pBH; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7z631m6cz3099
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 04:47:06 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FA4D61351;
 Mon, 21 Jun 2021 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301224;
 bh=7yUZDZlOIzDIa47OFbFJ/39Qwhe/+XOMMOCaPdtaBwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lD6c1pBHZwqs5eiQs8buzuuA9BfkqJolhjZ6EDv4VF4us1aV1CC0LUyTsb6VhIGp2
 E/becPsixhGwp4yQaCduiuDSkM/u6NQKgTxxGB+Gb+5l1ACSAQo9z+SUbO6AHK5wU8
 X35Wg2dinDz5gYfjdhPQPAcn+0z5czmkVkny/B828TD9H3VvA47bg9OSPoqp9nQuQI
 coxMZ68+/EyAh4aDiT0zJ68a6InuiFLM4sRM5KzBoYyeVu8s0vqXaciwdbVsUcTxNH
 gEgCasF2SK3G82tGxTq/RjJ854+IlLq7yVQYrjOCUJ9SPpaiBG7JDOM6U0YW5Nx5Wo
 2C7AKlzucp/Cg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, timur@kernel.org, alsa-devel@alsa-project.org,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: disable all interrupts when suspend
 happens
Date: Mon, 21 Jun 2021 19:46:01 +0100
Message-Id: <162430055262.9224.10660705196927221469.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1624009876-3076-1-git-send-email-shengjiu.wang@nxp.com>
References: <1624009876-3076-1-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, 18 Jun 2021 17:51:16 +0800, Shengjiu Wang wrote:
> There is an unhandled interrupt after suspend, which cause endless
> interrupt when system resume, so system may hang.
> 
> Disable all interrupts in runtime suspend callback to avoid above
> issue.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: disable all interrupts when suspend happens
      commit: ea837090b388245744988083313f6e9c7c9b9699

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
