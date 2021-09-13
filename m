Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4240898B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 12:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7NgB6Nvzz2ynr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 20:55:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fp4DepS+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fp4DepS+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7NfZ3DY5z2xY9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 20:55:02 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E35EF610A6;
 Mon, 13 Sep 2021 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530499;
 bh=oRmb9RFSDD9BpTeblLtC7yBA1uU7R97XAGDSNw6NsME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fp4DepS+BORdOAJho0LvkruiFnEiCugLdI/LYht8Y+gr/8fyunbRswMMhfsuDTNul
 uXFi/uY4ue8nBKZUHpfPDpIQXBbj5e1FhdsZJYBa5ldTHPT5QIYAKbPcqAg1NVeGri
 rpWgm0SxiTGVNGwRpX7m2Gf7f7Lc1bP9g9nJ0+7KQYmwXw7Vk1Jqjo0840wLGK/slg
 2lLHxJDeqXQwcRFya7pUV7OZfEfk5eIuAePaiMUzwasYnfY9kw5p1v+mVd8ZS6wRuI
 knlfaYiZWNgT8vC17H/h+QDEFQ36zjOptAT9BLdDNDm32MKMO2ZYEas65ekyvMwPGV
 7Ih8Dq/BKII3Q==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, nicoleotsuka@gmail.com, festevam@gmail.com,
 alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, timur@kernel.org
Subject: Re: [PATCH v2] ASoC: fsl_rpmsg: add soc specific data structure
Date: Mon, 13 Sep 2021 11:53:22 +0100
Message-Id: <163152996584.45703.10310868616819481458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630044038-19036-1-git-send-email-shengjiu.wang@nxp.com>
References: <1630044038-19036-1-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, 27 Aug 2021 14:00:38 +0800, Shengjiu Wang wrote:
> Each platform has different supported rates and
> formats, so add soc specific data for each platform.
> This soc specific data is attached with compatible string.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: add soc specific data structure
      commit: b7bbbf01362720a8066e3f6d880cae6d63fc92f6

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
