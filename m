Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C453FBE9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 12:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHRsP27lkz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 20:48:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZR9M1HA5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZR9M1HA5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHRqJ1RSNz3c87
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 20:46:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7435361532;
	Tue,  7 Jun 2022 10:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D4CC34114;
	Tue,  7 Jun 2022 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598778;
	bh=yC8T59/BRz/X+JQAGI6Qd3OPd0knEKaMRtnGwawWGZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZR9M1HA576G0+38VjdH59zkBtS7IVBu0+sGDgE+T0hGBANC9CdwjgIzCtFCWFpqqS
	 i7UVNw+QSu8iIaL3zH8F2/V6QGgQLB8hqJbw2i+3dF+pARUuMd+MWTXj7LMivPV0lV
	 T0iWWl0GBhI8hicugm5FwMQQK5HwYyjhJH7txhg2fh0OoVHSXEB7zSCvOUnXTJsCcq
	 qvaiNO9iNuW1/FUXE+r7F6HrsHSNGZEGmbUq9UeItxUMRiwR5GGyhDdtiP2ENhat+H
	 Ohx+86yp++tUCljsC25Pcnt0HuQIr5UW5hpPOwCKD74MRQuZ4WovsgRwD0hj7PzK19
	 08NimK5PxNlAw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com, shengjiu.wang@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1653966123-28217-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653966123-28217-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add support for i.MX8MN
Message-Id: <165459877588.301808.14404334130275114401.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:15 +0100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 May 2022 11:02:03 +0800, Shengjiu Wang wrote:
> The SAI module on i.MX8MN is almost same as i.MX8MP,
> So reuse same soc data as i.MX8MP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add support for i.MX8MN
      commit: 9688073ee98cb2894d5434fe91dd256383727089

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
