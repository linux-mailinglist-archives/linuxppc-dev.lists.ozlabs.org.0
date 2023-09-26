Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A577C7AED81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 15:00:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b+Ypagne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw0Fr3hnVz3cLn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 23:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b+Ypagne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw0Dv6wMkz3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 22:59:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED792CE1391;
	Tue, 26 Sep 2023 12:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC51C433C8;
	Tue, 26 Sep 2023 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695733147;
	bh=PU0fWrPi2wnyXnpIwY9YIk3MU1KBxKDqXRUb7dlII4M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=b+YpagnepcbUHx80T7k3ml7KCb3JhFC31t8LW9vdMVJk/kcJ5IWDTxpS9u61qoXzE
	 2kXBApS+UwtcgzL4CeoYqjXb0atf/X2582EqKA7bZbuaXzptBxPVdqG2LmTiJRmJLt
	 dEtD099OPi6qilVxVuJ+dlS+9D/2Nh8j+78QtRi9DabSCTCVXqbA5vUoJKNg93hjWm
	 RmmF1zjt3dEybUn1HgY8zR4LwekJgQcq2yexzKaoYuVJv3V4tPW2xJcDHSJ6EL5dz1
	 NY3Wba5i5N7PlxOGWGzplO+FDF2m78r/BZ2MsjCmyZMpc6N3uNXnay5fWP5ebW5Thc
	 YTihssY+1phMg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1695202992-24864-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695202992-24864-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: use integer type for fll_id and
 pll_id
Message-Id: <169573314495.2623437.8401087365242286082.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 14:59:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Sep 2023 17:43:12 +0800, Shengjiu Wang wrote:
> As the pll_id and pll_id can be zero (WM8960_SYSCLK_AUTO)
> with the commit 2bbc2df46e67 ("ASoC: wm8960: Make automatic the
> default clocking mode")
> 
> Then the machine driver will skip to call set_sysclk() and set_pll()
> for codec, when the sysclk rate is different with what wm8960 read
> at probe, the output sound frequency is wrong.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: use integer type for fll_id and pll_id
      commit: 2b21207afd06714986a3d22442ed4860ba4f9ced

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

