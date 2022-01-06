Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB05486B27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 21:28:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVHxc55yrz3bTQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 07:28:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYXzcPsd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dYXzcPsd; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVHwy4L5Sz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 07:28:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 179AB61E21;
 Thu,  6 Jan 2022 20:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3B5C36AED;
 Thu,  6 Jan 2022 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500894;
 bh=BGqh5w32AtbQBoQuseqpX+P4H5soTGDf7+fuVcRonE0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dYXzcPsdPgpX4KDM3EK5x+hbwj6AXsuXwNTu6T8A7o40nVnVxTp0DUmqPMXwW69X5
 SB9pN7XIF8rVr2iomTtzBbZ28X4b+bqMpGtuCLP71H8dKA+HiO1tS3uxdrRw05YyWF
 h+5Wbw/fPsKNOXfjWB4Agj6ZDqO5yj7SM5KSPoJ/ASnXwZydNzkUgMkjvdFc9K4YPL
 cQTBYmWEhZi5xR6SrKx5TyfBZdoi45nDng+FUrgLAycY9d2OvZ44zZ2c2bV/kb2Eb2
 YT6G1/WPAQOgZGe3ajonlC0OrwCDl8Td9JOPmp9/aaCVp2L0NoBegqnG7vzxWBlmcR
 H0fogSQz5UgWQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, festevam@gmail.com,
 nicoleotsuka@gmail.com, timur@kernel.org, lgirdwood@gmail.com
In-Reply-To: <1641380883-20709-1-git-send-email-shengjiu.wang@nxp.com>
References: <1641380883-20709-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: refine the check of available clock
 divider
Message-Id: <164150089249.2243486.14713961651621458604.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:12 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 5 Jan 2022 19:08:03 +0800, Shengjiu Wang wrote:
> According to RM, the clock divider range is from 1 to 8, clock
> prescaling ratio may be any power of 2 from 1 to 128.
> So the supported divider is not all the value between
> 1 and 1024, just limited value in that range.
> 
> Create table for the supported divder and add function to
> check the clock divider is available by comparing with
> the table.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: refine the check of available clock divider
      commit: 320386343451ab6a3577e0ee200dac56a6182944

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
