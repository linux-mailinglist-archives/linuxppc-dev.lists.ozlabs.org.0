Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C03861869
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 17:48:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a/ldrGtS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThGD80bh5z3vfH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 03:48:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a/ldrGtS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThGBf6kZVz3vZs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 03:47:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4BDE63413;
	Fri, 23 Feb 2024 16:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36D1C43390;
	Fri, 23 Feb 2024 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708706824;
	bh=BesFWAtuTprjWylLkXSgMFyYOvsUukjAQwbOy9l/KHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a/ldrGtSSfN/5ylfj5KLaM0svgwwTwG7L3iT1TvCMv+me9j8uswywGNPKVtvDO/pv
	 jvHa9sxagoBw0mc5TWkO3GCU9qxBMj1D5cBTiPNGowEox60TSujga1DTrdunar2KFh
	 6HjqrLlVB/V7tQqQwBFkTnUZiABawY79VDb0j4FFGN8tj5kH+dgST9txDFV5xag2PJ
	 c8Kk/SyrNrcFP5S29sD8T/HzhlALn4tcF+scn0J8bHTQq1B2ycE9HBRRpj9GeGQlwk
	 Rv/BaMwFdAz49QF9s/ys7R2s8i/rPG3mpJfMkNtYfM/qI3iyb5qGtCKPlvrFip0StD
	 QSWEMbQo16JLA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240221123710.690224-1-rf@opensource.cirrus.com>
References: <20240221123710.690224-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-card: Fix missing locking in
 snd_soc_card_get_kcontrol()
Message-Id: <170870682233.2835191.8056467761867046237.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 16:47:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 12:37:10 +0000, Richard Fitzgerald wrote:
> snd_soc_card_get_kcontrol() must be holding a read lock on
> card->controls_rwsem while walking the controls list.
> 
> Compare with snd_ctl_find_numid().
> 
> The existing function is renamed snd_soc_card_get_kcontrol_locked()
> so that it can be called from contexts that are already holding
> card->controls_rwsem (for example, control get/put functions).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-card: Fix missing locking in snd_soc_card_get_kcontrol()
      commit: eba2eb2495f47690400331c722868902784e59de

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

