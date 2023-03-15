Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CAC6BB463
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 14:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pc9xJ1cvMz308w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 00:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OUirE43Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OUirE43Q;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pc9wM344Jz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 00:19:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 92F2DB81E0B;
	Wed, 15 Mar 2023 13:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911B4C433EF;
	Wed, 15 Mar 2023 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678886365;
	bh=sga3q+scIZvfNK/6EdO/zdT6nG8pr/gf9L75QKEyXLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OUirE43Qzm0pBNiCEdWb7jM+cVNqa603CO3Zzp7vsSbCJCbgLFTl1u5uL7NlQSUcQ
	 OhbHwNlLmMWGEo9vYEZeeSsKOU2X7l8xkhVu5WhAF+llat0rVrwL2rB3el0OWAFebx
	 QT09DZvyQymTRSTzKmZpr2jwXXsVFt98ejUeRMcecOPOJZCZAMxiTKq7fPo00qsGj5
	 AuyAMwi7zgAKYm/MwOyTN6bcOXlWX7vW07Vss6xo+auD1hQf3zABe2DilAK6KLvLCH
	 Otu5p+bPtC973v3j7H8jOjwnsPe9Nn5dqKNF/LhPBAhOvOs5IVMNWmrndwkPuKWSuo
	 X9oySDgyUtEjQ==
From: Mark Brown <broonie@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, 
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20230314082157.137176-1-herve.codina@bootlin.com>
References: <20230314082157.137176-1-herve.codina@bootlin.com>
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Fix test dependency
Message-Id: <167888636330.25434.5728670450975508265.b4-ty@kernel.org>
Date: Wed, 15 Mar 2023 13:19:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Mar 2023 09:21:57 +0100, Herve Codina wrote:
> The QMC depends on (SOC_FSL && COMPILE_TEST). SOC_FSL does not exist.
> 
> Fix the dependency using the correct one: FSL_SOC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] soc: fsl: cpm1: qmc: Fix test dependency
      commit: 6ffa0da5c63f8408101d01075709981005eb66ec

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

