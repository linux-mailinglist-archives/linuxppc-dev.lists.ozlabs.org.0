Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F291E845
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:07:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rChvuHha;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCbCb0B1qz3fS5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 05:07:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rChvuHha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCbBv3Mjvz3fQv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 05:07:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4898261508;
	Mon,  1 Jul 2024 19:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDC4C116B1;
	Mon,  1 Jul 2024 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719860837;
	bh=MOxxmRlmg/SZh0P5F1EfQwqNwAEyA+LTm2j/JaqyIPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rChvuHhaHG3NIc3ImXLO/wxd7Tmuj2m0n2q/Jqx8hJxthew4FGw4jDS8hLlESPcSS
	 +1G5A5hWFyqpSmWEWRWleCItygEbW8UgkNELU6EE+OhPFwb5kumXnJqWwJ2OYIlIOS
	 Kh8wLkBklQCNh+drgAUqCAKIKJkxd2OQb7c5hsVJHxC4RybggVFRlZlUEnY0HiWvl0
	 bCbOB7OmA6PnMU9LAuOCFUutGVKKgzMQO3CV6v2t9OPMV9MYWCw5hkqs1vr9HpvUKM
	 /O+vmbUh53T8KIuvZ/pgKltLWc3l+NBD4mS1owDGl7VOgFkSNfokJmRaSlUNX7IIT8
	 aVp0s4pTNqAlQ==
From: Mark Brown <broonie@kernel.org>
To: "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20240701-lpc32xx-asoc-fix-uninitialized-ret-v1-1-985d86189739@kernel.org>
References: <20240701-lpc32xx-asoc-fix-uninitialized-ret-v1-1-985d86189739@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: lpc3xxx-i2s: Avoid using ret uninitialized
 in lpc32xx_i2s_probe()
Message-Id: <171986083478.121161.16800838408013522320.b4-ty@kernel.org>
Date: Mon, 01 Jul 2024 20:07:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
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
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, patches@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Jul 2024 09:24:16 -0700, Nathan Chancellor wrote:
> clang points out that ret may be used uninitialized in
> lpc32xx_i2s_probe() in an error pointer path (which becomes fatal with
> CONFIG_WERROR):
> 
>   sound/soc/fsl/lpc3xxx-i2s.c:326:47: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>     326 |                                      "failed to init register map: %d\n", ret);
>         |                                                                           ^~~
>   sound/soc/fsl/lpc3xxx-i2s.c:310:9: note: initialize the variable 'ret' to silence this warning
>     310 |         int ret;
>         |                ^
>         |                 = 0
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: lpc3xxx-i2s: Avoid using ret uninitialized in lpc32xx_i2s_probe()
      commit: f4662e6d51ffc0826f975429d3c1b6d1f1a295f1

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

