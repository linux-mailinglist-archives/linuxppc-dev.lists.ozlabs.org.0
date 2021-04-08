Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6B358A4A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 18:56:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGS8D0q5Gz30KH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 02:56:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o6+NQEY1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o6+NQEY1; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGS7m4V00z30HW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 02:55:48 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AAD36115B;
 Thu,  8 Apr 2021 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900944;
 bh=GWpb/4CWrW5dOgeUJNjVwnPmhCH3Tqxz6l+xlJjGsZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6+NQEY10TfULYi/XtxUE45DQd7LGoHX/+xCtDoIam/6qWkrXbsxqumFwCoNt8bwe
 tQyL3mq7+Mp+0i4gjH9ZuoZz9fIhZUs7K0GflIVOmKjTS68Lh6QUNXgQ92QrnZ3NUz
 swg92H8hYpLl7hzxgqYyFHHauARAcljBzSeLgj+Wrlgyr58Qn1RKsTS5hrtALWIqB6
 LBls/auxgyXtr+I9gcmByIyYdOOOi71eok8Mk/fD4YBheay1Yvl/quoiZRAwXSUSVG
 p7AR3On/otsnP4YNOFIZaA3pxGoTGP1nzc0xroUh/byr9K97xvCXjXBowWYx9dpME3
 sAG9D5C+Mrxcw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Muhammad Usama Anjum <musamaanjum@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: sunxi: remove redundant dev_err call
Date: Thu,  8 Apr 2021 17:54:43 +0100
Message-Id: <161790012549.16915.4440454202344762892.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407095634.GA1379642@LEGION>
References: <20210407095634.GA1379642@LEGION>
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
Cc: linqiheng@huawei.com, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Apr 2021 14:56:34 +0500, Muhammad Usama Anjum wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: sunxi: remove redundant dev_err call
      commit: a93799d55fd479f540ed97066e69114aa7709787

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
