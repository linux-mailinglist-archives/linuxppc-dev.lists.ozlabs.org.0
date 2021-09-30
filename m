Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990C041DCE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 17:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKxJ740L2z30Pj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 01:00:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OFFtJpMc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OFFtJpMc; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKxHR5Kz5z3036
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 01:00:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0067F619E2;
 Thu, 30 Sep 2021 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633014000;
 bh=Myi37bbes7ETlK+tTGsWiTVP6FIl//3fgtuWHuTBhDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OFFtJpMcjNsnftt04Ivbz2T2tRgic6D9Un4vw/o86TzAuw9aJ/aVTnxLUIiw6q8S1
 5N1Wli7R4d/+eV/aLakuxtvB58TpqKU5Ksx7n0Oe+fzVohhFpe9gQLq0wHbjcixAMy
 S64RJCx92qqJyp8NDpP7rivlmJXDq/lVgkeFUoUs/+W30FXMngGBLg8U0nE6sAELcK
 RSeIEBODMRHyFDhb/X5LHRZyWM/seesrrLlaA9/PAT6ozZUZ4nuLbUAjIhxBNn5xCN
 q5zBnzFViNN+x2qr7L+ibzDa6BiJIybpr5EqAzNeEFB9uNFugRxEJ6G2QQeAA8GExu
 lY+F4mWsgq/wg==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 nicoleotsuka@gmail.com, perex@perex.cz, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Add rpmsg audio support for i.MX8ULP
Date: Thu, 30 Sep 2021 15:58:53 +0100
Message-Id: <163301248179.43045.2909499493214533743.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1632972413-22130-1-git-send-email-shengjiu.wang@nxp.com>
References: <1632972413-22130-1-git-send-email-shengjiu.wang@nxp.com>
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

On Thu, 30 Sep 2021 11:26:53 +0800, Shengjiu Wang wrote:
> On i.MX8ULP the audio interface and codec are controlled
> by Cortex-M domain, Cortex-M core provides audio service
> over rpmsg.
> 
> The rpmsg audio function is almost same as i.MX7ULP
> platform, so share same configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Add rpmsg audio support for i.MX8ULP
      commit: 2cbf90a6d52d52fc017f3caf36f7b516f689150e

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
