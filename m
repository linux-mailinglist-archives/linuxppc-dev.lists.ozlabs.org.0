Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEB30D1B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:40:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmBv6R2czDwn5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:40:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Laas/WDE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVX0B58dnzDqrc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 04:30:50 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01DE564ECE;
 Tue,  2 Feb 2021 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612287047;
 bh=MsYWS5fR84takhXK5ZPtutS06RculY3MNRJAjqjwzAo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Laas/WDEqIz1PIDtsTH4GdAnfy1yrBNddu0b36XRjEio7LT1P7BhfX4gvVnb9wPPc
 A+lGtedCxIzhaWtltzzzWVon4e3FD/SIWXyJq0Rw6xZ3kKrzqVjIxsr82f2fMVN2vP
 0SwFYEVtn2at8vnfhT4onKoZ6ZO2vubtrB1kLyexgSbxO9ffLe4nNRTUOooWYlD4jd
 q/eKGMpT/urUV8NAwaZjo68CvH1/Z5KKivObsx/E37G0vqSdCXLWTChBiwMJL36F4x
 Nd9UlIO5Zj3+LVHT6ZlXR/c3c+8IZQa4mXfGmh3GkDZ4wyzyr99gmX4WnuyXXZUmRt
 rdRIspXmhkQNA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, timur@kernel.org,
 Tang Bin <tangbin@cmss.chinamobile.com>, Xiubo.Lee@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20210128112714.16324-1-tangbin@cmss.chinamobile.com>
References: <20210128112714.16324-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Utilize the defined parameter to clear
 code
Message-Id: <161228699993.35075.10104623503101493059.b4-ty@kernel.org>
Date: Tue, 02 Feb 2021 17:29:59 +0000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Jan 2021 19:27:14 +0800, Tang Bin wrote:
> Utilize the defined parameter 'dev' to make the code cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Utilize the defined parameter to clear code
      commit: 68be8ed6a4622d4eb6cf7632bc7cb78464c83c78

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
