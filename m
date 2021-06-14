Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB23A6F93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 21:55:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3hxp6fx6z306w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:55:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XXHHa4xq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XXHHa4xq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3hxJ6kZsz2ysw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 05:54:44 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B0DB611CA;
 Mon, 14 Jun 2021 19:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700480;
 bh=OFqLWt9YcU2q5M/HjfpqEhWhcGqRS3yWcy7sAyaGMeE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XXHHa4xq/Isu9+95fpnbyi2ZUuVcWVETqOU2y5lYYjop2Z0KMVbhP99crM0rdDsD0
 MmwcnZuz6xNJx8gLnUL3pkCyU4tHYbxoF2AP57ivb7ZUTvaKnJJXfkOtWKM8+gbnVc
 z9vnoM8eg9dpGInpzCPv0moeAhHkdqNPEfK7zZER93LoN5HgFN67rx9M9WKqq8Umfa
 D9QyOkL1yrYAk8h0i2owJypIHiSZ7qPegPaURJ3hYaLaMDtKbiTgoLV35d6zln1GRP
 Sfyk/nM9dKthDNMD0AmoOLGy4NsMvkl6C+RgK/L/ORbju9cSDjO2rGYFu+4hzAMsEr
 89swlSD9TdVSg==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, tiwai@suse.com, Zhongjun Tan <hbut_tan@163.com>,
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, lgirdwood@gmail.com,
 festevam@gmail.com, perex@perex.cz, Xiubo.Lee@gmail.com
Subject: Re: [PATCH] ASoC:fsl_spdif:Remove superfluous error message around
 platform_get_irq()
Date: Mon, 14 Jun 2021 20:53:39 +0100
Message-Id: <162369994008.34524.18042209109927514476.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210610040037.1064-1-hbut_tan@163.com>
References: <20210610040037.1064-1-hbut_tan@163.com>
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tan Zhongjun <tanzhongjun@yulong.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Jun 2021 12:00:37 +0800, Zhongjun Tan wrote:
> The platform_get_irq() prints error message telling that interrupt is
> missing, hence there is no need to duplicated that message.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC:fsl_spdif:Remove superfluous error message around platform_get_irq()
      commit: 2e8a8adb96a335a04f1697dd4314f5569521328f

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
