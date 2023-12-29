Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61B8200A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 17:59:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbs7vhMY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1s6Q6xGYz3cTn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Dec 2023 03:59:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbs7vhMY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1s5b64Tqz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Dec 2023 03:58:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D56A0611B0;
	Fri, 29 Dec 2023 16:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B1FC433C7;
	Fri, 29 Dec 2023 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703869101;
	bh=b4JkRx9IW/2Mqis6Wxs8UBnV3+psqONjdD8/WLplL4o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qbs7vhMYcMb4ICsZXu39XriMqUaLOaVs4Lk/yGM4iXMzitHergVz/QOBScC8ykPv8
	 j9yb2b8Re7LqgxUgcSCdzPm2fR9HO87QOB6LuPXRMbOmcocqJH4sfwM6KvjKsexTmP
	 S0LqOlAtTh1USnt0kCcyzCka/EnFb/jhes7tXkPXftd8ruQtaPj1dxU6ND346Dnu1C
	 kp58fT/d63Xk6D/owpnFxB78dV/8y76W/+6qTs/6KCkqQbiPIHCNh1EfHBYrhHwhZ9
	 P29VMADrlu9B3W6t4/ONRs0aoTlrtMguEz1IZHeNzK8P/+apm71kiy85Xwmux2zxiz
	 cZrBO7XNHHNCQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20231225080608.967953-1-chancel.liu@nxp.com>
References: <20231225080608.967953-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Fix error handler with
 pm_runtime_enable
Message-Id: <170386909836.3001741.632329944524813915.b4-ty@kernel.org>
Date: Fri, 29 Dec 2023 16:58:18 +0000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Dec 2023 17:06:08 +0900, Chancel Liu wrote:
> There is error message when defer probe happens:
> 
> fsl_rpmsg rpmsg_audio: Unbalanced pm_runtime_enable!
> 
> Fix the error handler with pm_runtime_enable.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
      commit: f9d378fc68c43fd41b35133edec9cd902ec334ec

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

