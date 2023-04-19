Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 569BA6E7C81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 16:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1jk62G4Bz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 00:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q0wHmR5y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q0wHmR5y;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1jgw44n9z3cV7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 00:23:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61174614FB;
	Wed, 19 Apr 2023 14:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C06C4339B;
	Wed, 19 Apr 2023 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914200;
	bh=hGLCHDWc9KqI/KLynLW2oZ7LkA2U31ZnlMwgjeHw/Us=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Q0wHmR5yZdj/zYEEC8ZE4V6Qb6n5jVpwDX7AwU5J+NOLsHXJAX3YhVihZKyLsqoRB
	 1JxE+bqsb3Flzua2d7hHGI0vs6YeFlbRWkcZZmc4OugkxKW5RfMMzrjzl6l1XzugLd
	 R2rcq+0ZAdbPumKZp2nHhlFer0HBFb6UoaW7dSsn4fvTYlI+JfhKEiGj0txSPEyY39
	 6MV1FCdYZ6+DfDS9dEbLjET5YpiZhuimFU/9qI7nldcJOyB4dey95U43CtZEYtQptZ
	 sJApFjBuxs7l3c6Yg4cW4vSWmiCiQ9R9eVbneFgcaGu0Zyq9HFZXv4aQgjGd+Er9v3
	 FrWiF2mG11BDw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230418094259.4150771-1-chancel.liu@nxp.com>
References: <20230418094259.4150771-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
Message-Id: <168191419838.83860.13145358537748043922.b4-ty@kernel.org>
Date: Wed, 19 Apr 2023 15:23:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Apr 2023 17:42:59 +0800, Chancel Liu wrote:
> SAI on i.MX8QM platform supports the data lines up to 4. So the pins
> setting should be corrected to 4.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
      commit: 238787157d83969e5149c8e99787d5d90e85fbe5

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

