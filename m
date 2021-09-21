Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1941362F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 17:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDQKW3YXTz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 01:27:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MohmUdb3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MohmUdb3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDQHk5r7nz2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 01:26:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6D1961215;
 Tue, 21 Sep 2021 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632237969;
 bh=vhLzjTgLnOT8QnJf7y/WSgDwF6yaNzF8AzzcaXhlpgM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MohmUdb3bmGffzzxtnXNhA6agKbH70gjj8JdakpsgSojS9mXK6M55oQLxrvxK/6AK
 oZvoD54oC8f6oMZN/yA19bqE65wOeCobAYp6MLU1BSH2QSenSpFThMI0co3hza5S8K
 /qQnn3yt7CWD5D7Hwfr3FcJN7iUfpd6v29REudwxaZOdkOB9hxgBuztUm8Pa8qrXYS
 XvuNU/NtivjHppwO6nV9FB23KXQUCdZ1nyVZxfEUsYWUBPuUFQT7oPy+oCW90EvdqG
 4ld1bbfG76aZm4u5FdXXTAC8WMz3KXsMSl3yHh6puxgJr3OHQeMC+VCy3mK7VsKbKb
 j2cQ8whYH6Ynw==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, Xiubo.Lee@gmail.com, tiwai@suse.com, perex@perex.cz,
 alsa-devel@alsa-project.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for i.MX8ULP
Date: Tue, 21 Sep 2021 16:25:12 +0100
Message-Id: <163223651318.32236.12273348857072894060.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1631238562-27081-1-git-send-email-shengjiu.wang@nxp.com>
References: <1631238562-27081-1-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, 10 Sep 2021 09:49:22 +0800, Shengjiu Wang wrote:
> On i.MX8ULP the spdif works with EDMA, so add compatible
> string and soc specific data for i.MX8ULP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add support for i.MX8ULP
      commit: a635d66be1642e59af17383a27b2c61409121241

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
