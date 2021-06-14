Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52CE3A6F95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 21:55:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3hyj2z49z3c44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:55:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QYOp/m5n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QYOp/m5n; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3hxz72bgz3btF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 05:55:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3273E6128A;
 Mon, 14 Jun 2021 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700516;
 bh=JVtF7puJ1shUATjeFrsP6yt4dbeRT4TfQ9U1qhmr9XI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QYOp/m5nxHRC4+bYA1QhNmN6LilNQyXoZGj0ljlVLpHAOlIFcJ5CY9m8kAnquMeRC
 M/L9VxR8gq85iwomsDoO3IAbWt0/max/UCMgls/JrD/A/61JQfAiQ9HYGxCMvWa6Du
 XC0awlcK5lceUwBxOEAdv64W6rmRXsB5RaqG6YkcN8hwpYyA9dMYAeseMIpueKGuH5
 B9KSBKX2arje8GCXfUjfuKyTTMSy1H106mYMJN7AYpRGBDDHOEZjnGthAseXWAfGeJ
 Dty8OynM3u6yf73tAVQzOOt29gRZ6pUnB33rpYPmY038/ldId8m5OhrfHGxe0/8WO1
 tbyc8JGOeu2Lg==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, tiwai@suse.com, Zhongjun Tan <hbut_tan@163.com>,
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, lgirdwood@gmail.com,
 festevam@gmail.com, perex@perex.cz, Xiubo.Lee@gmail.com
Subject: Re: [PATCH] ASoC:fsl_easrc:Remove superfluous error message around
 platform_get_irq()
Date: Mon, 14 Jun 2021 20:53:51 +0100
Message-Id: <162369994009.34524.4963839891327399167.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210610125052.1280-1-hbut_tan@163.com>
References: <20210610125052.1280-1-hbut_tan@163.com>
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
 linuxppc-dev@lists.ozlabs.org, Tan Zhongjun <tanzhongjun@yulong.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Jun 2021 20:50:52 +0800, Zhongjun Tan wrote:
> Clean up the check for irq.dev_err is superfluous as platform_get_irq()
> already prints an error.Remove curly braces to confirm to styling
> requirements.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC:fsl_easrc:Remove superfluous error message around platform_get_irq()
      commit: 4d5f3a096f3d9e7067c7c2e730d989668e06d552

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
