Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ED4943170
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 15:54:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZhXMBpD2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYtrX5Wqvz3dFy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 23:54:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZhXMBpD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYtq12pMVz3d96
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 23:53:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A42CF6242A;
	Wed, 31 Jul 2024 13:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AB9C116B1;
	Wed, 31 Jul 2024 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722434011;
	bh=2MGuZRFEEO1kB1smAVjl0s8IfGp3OX6tTyo+GBf16NU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZhXMBpD24kmFimLqzac/C2Qh7SIf/ozyB+RInbe8ZcyLRzxirnJ4bLlmC3wTFwceu
	 IlBFqIZmrai4jH5OxOMzoaIW9yMYUghWzG8iEid3B4opPuvztrl8plAEgUcExNuGsd
	 WyssPCFaTyCsGc+u0yyh06zj8X3E84/WmmxdoK6DlISSH1lzrY6azg2GieWCO0K547
	 ibsxXvsJB5tktzUjMoGSJX7fKBPhvYwZrw5BoMbPIWXNB3EiA9ClqjZ1k6NtH1O7Xu
	 KNWl/3bJtqyB5Jcr4zDvE7mDTHiBa4WnO1IGeU/jDVGCz3OWMoQOeAklxHWfGpV/01
	 nYzQGPhPQoyqw==
From: Mark Brown <broonie@kernel.org>
To: jonathan.downing@nautel.com, piotr.wojtaszczyk@timesys.com, 
 vz@mleia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Yue Haibing <yuehaibing@huawei.com>
In-Reply-To: <20240731022949.135016-1-yuehaibing@huawei.com>
References: <20240731022949.135016-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: fsl: lpc3xxx-i2s: Remove set but not used
 variable 'savedbitclkrate'
Message-Id: <172243400901.75630.3817479503151078602.b4-ty@kernel.org>
Date: Wed, 31 Jul 2024 14:53:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-37811
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Jul 2024 10:29:49 +0800, Yue Haibing wrote:
> The variable savedbitclkrate is assigned and never used, so can be removed.
> 
> sound/soc/fsl/lpc3xxx-i2s.c:42:13: warning: variable ‘savedbitclkrate’ set but not used [-Wunused-but-set-variable]
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: lpc3xxx-i2s: Remove set but not used variable 'savedbitclkrate'
      commit: d5742b5d4d7b99531e352ea814506641f9fc8981

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

