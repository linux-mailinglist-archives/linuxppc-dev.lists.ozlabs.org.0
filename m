Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D303AF571
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 20:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7z6G0BL8z3bts
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 04:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p85Y09DR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p85Y09DR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7z5q2rZpz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 04:46:55 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D0B6611BD;
 Mon, 21 Jun 2021 18:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301212;
 bh=MOO73DEGhW1d22CxLcZCw47NDPO4vbpIGcI1cX5HFcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p85Y09DRjTpOKNpxLV7F1BPWX8xocpqQenD28wxTPBBOjK+BxoTRsvsqRv9Ur/FQp
 9PFv4jbBoD74kyXzAiZd/topDWCILOFCGTo1CsoNkts3uRJC/hLWWTnV8NrwrmYryn
 O48brFyvao0wDxU1xv75GSso3ZX+f16OcHgroNyQkQetb/28YTFJbT4UvyO0fb1rWZ
 wZK1aigwlRQt8GfMd+9ERz9ysz9tkcXgVmfmHCa5ku4l67XCaVfU/DQ/1iQEnAYTMw
 G9N0Z+p09K1dTuF9uTYPyY2auUDp2XsNT3bV5DgNwXxxusOsJojtpbk6w6Heq1pj5L
 VVXllDbZhQLMw==
From: Mark Brown <broonie@kernel.org>
To: linuxppc-dev@lists.ozlabs.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH -next v2 0/9] ASoC: fsl: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 21 Jun 2021 19:45:57 +0100
Message-Id: <162430055263.9224.2887926675781712898.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615013922.784296-1-yangyingliang@huawei.com>
References: <20210615013922.784296-1-yangyingliang@huawei.com>
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
Cc: Mark Brown <broonie@kernel.org>, timur@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Jun 2021 09:39:13 +0800, Yang Yingliang wrote:
> patch #1 ~ #8:
>   Use devm_platform_get_and_ioremap_resource()
> 
> patch #9
>   check return value of platform_get_resource_byname()
> 
> v2:
>   change error message in patch #9
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: fsl_asrc: Use devm_platform_get_and_ioremap_resource()
      commit: c66d7621737fb07e660b3d6eef40636ef4e9103a
[2/9] ASoC: fsl_aud2htx: Use devm_platform_get_and_ioremap_resource()
      commit: 41e90cbbc50085487b4633f08c86dd71b0f18d7f
[3/9] ASoC: fsl_easrc: Use devm_platform_get_and_ioremap_resource()
      commit: 2cd16cf0d6bbb47adddc633c60ca405f672e64f4
[4/9] ASoC: fsl_esai: Use devm_platform_get_and_ioremap_resource()
      commit: f25bb69e6f04a3d45effbe1c571f5f3ac10253bb
[5/9] ASoC: fsl_micfil: Use devm_platform_get_and_ioremap_resource()
      commit: d9bf1e791ae61d606b0da0003ad19dbe7f252fe8
[6/9] ASoC: fsl_sai: Use devm_platform_get_and_ioremap_resource()
      commit: 664107f63888bdd8a5e1d38c8246b9508a1dc46a
[7/9] ASoC: fsl_spdif: Use devm_platform_get_and_ioremap_resource()
      commit: cbb7ea0aebf0c07061be615cab97ac9cab8a48a0
[8/9] ASoC: fsl_ssi: Use devm_platform_get_and_ioremap_resource()
      commit: 67798860e6d0114149562e6897cf07ba4bebc1d6
[9/9] ASoC: fsl_xcvr: check return value after calling platform_get_resource_byname()
      commit: a2f6ed4a44721d3a9fdf4da7e0743cb13866bf61

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
