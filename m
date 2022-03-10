Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC94D45C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 12:35:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDn7c4dlpz3bVM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 22:35:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SjxVeEe3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SjxVeEe3; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDn7050hNz2xKR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 22:35:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3D1C61585;
 Thu, 10 Mar 2022 11:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DF3C340E8;
 Thu, 10 Mar 2022 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912120;
 bh=TWvMPTJzJ27GVP5gpFDJ0b1Mu0lLmlwPszikGKU7gBE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SjxVeEe3tindzUNM1tmZ9KNYMK0v6ASZA/EP3CEWuJevKVaibwyTz/JylOfKN49Ch
 vajwUmReDfpo9oUzy9cmeuD+ZjDuZxo7PIms1b7lgKWNYjMVIZmjqmnE7VUoTpHJH4
 bV1dVMg0luDW1Z0EetyLJUBmzsmxbeZROjO60vCEY7MOedZWPk2SfmdYMR4AVVkty6
 2h3faUwC0+5+bX2jWGgq8KqNwANm25FAu6kpFp88VEzrCPXvaJZfx+onlYqDkdC2WB
 b0bogAhhXetSurArqeFqRRSR3pm/ygoB8LYRyke36XtQFUX5h/brgWkwt50zcSMfi/
 ezbFSUgwrivRw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicoleotsuka@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, festevam@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1646822293-26965-1-git-send-email-shengjiu.wang@nxp.com>
References: <1646822293-26965-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Remove SET_SYSTEM_SLEEP_PM_OPS callback
Message-Id: <164691211764.13798.1783261167562942909.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:17 +0000
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

On Wed, 9 Mar 2022 18:38:13 +0800, Shengjiu Wang wrote:
> For sound need to be continuously output at suspend with rpmsg
> sound card, so need to keep the clock always on at suspend,
> then suspend & resume callback is not needed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Remove SET_SYSTEM_SLEEP_PM_OPS callback
      commit: 8b1d3b733f3e6acaab6c6bc9968ee0e058900a7e

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
