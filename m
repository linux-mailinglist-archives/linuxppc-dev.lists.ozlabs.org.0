Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E063216E9C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:20:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Pjm1S0LzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 00:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1Wek/USV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Pds5rDLzDqML
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 00:17:21 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 102E9206E2;
 Tue,  7 Jul 2020 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594131439;
 bh=zLDKUUlf41eWXCK1+gWKFdhUhVl9kP8CIgS7oLy2LgQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1Wek/USVv1i9/Nl1ZMFAk2avBAKGHTALhNkHzitHtYxwzH8Hcz7fBE7hExire+9ie
 fmqnV+aK0o+I2VaPduFIO4qT36rbdl2OPHzemUXIuGeqEHHOqhjk35+6L6BJK1QaWb
 B1TLufBEBcHc6Xf75wrhuMbg1ooEs9CeHynR1YXY=
Date: Tue, 07 Jul 2020 15:17:15 +0100
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, Yi Wang <wang.yi59@zte.com.cn>
In-Reply-To: <1594122467-11615-1-git-send-email-wang.yi59@zte.com.cn>
References: <1594122467-11615-1-git-send-email-wang.yi59@zte.com.cn>
Subject: Re: [PATCH] ASoC: fsl: mpc8610_hpcd: Add missing of_node_put()
Message-Id: <159413142467.34737.7662746319065846773.b4-ty@kernel.org>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, wang.liang82@zte.com.cn,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com,
 xue.zhihong@zte.com.cn, festevam@gmail.com,
 Liao Pingfang <liao.pingfang@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 7 Jul 2020 19:47:47 +0800, Yi Wang wrote:
> After finishing using device node got from of_find_compatible_node(),
> of_node_put() needs to be called.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: mpc8610_hpcd: Add missing of_node_put()
      commit: a5911ac5790acaf98c929b826b3f7b4a438f9759

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
