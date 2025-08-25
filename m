Return-Path: <linuxppc-dev+bounces-11266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E7B34B69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 22:04:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9hbH3Nx8z3clb;
	Tue, 26 Aug 2025 06:04:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756152283;
	cv=none; b=k04fMWE55WC92Y7Qw4skqu7mkfIxaGLw1eq5SVAMJbRuK9hdPQhuQVleVeeHiz8DhdD0WBUsSWeI+7uIPiPafAK86q+czfvfZM4xvvmMiFLx1vwBSNEZJeMMIX1UxLv4lLccJSxQFvCZnSVe3qTudPS0q2o141s7VJzgkHGnq0k6tQWcBgN30t3oWrGTUzWJbOYuWvS1CCAZP5GA+KyWIlg5newvsY8J8/prabpsvXHSMemWG1kS32weVH9co0DqvavvHXZqtAhzsJzFSOgzERsj0Zq0iOhBzpxw6PcjuTfscyT2QZm4PbO9bKeNPF7ugohOxRwSlwDgFiGkp01MwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756152283; c=relaxed/relaxed;
	bh=ggxBvHPp/Lej+KwZ4e6C7IZ6zx7TGdeeH5L6jFbsQiI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OuYOHZzH0dB+uW+H2/1xUyAMXyfUeB/IB9M1SYx76nFbGTNr4WDzdSlszzimq3RiprzSqA2+DxdSCcYZjzs0ewRZ9c84HYDbIktud4kkN7F6C865QQdSWWLDeyqk+eNsxQh7boWCop45JL5rcb/JRudtJa2MRVMZ30R2Oti2ybjIjri3jsko1f17fOjGLy63qtuQsCdoNTMme7TWdimjE8VAc2NHAgeninZnrZLU/WLQs4VHNEbf3lloCeCRQw4gK8dCucmEbm/L5i2kuAjVDESURpIza21YI1yl3Qcq39sDXMU5Q3A0OjQhFJpjq2DmaRRvT0oAtNxNErN0mHHf3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UYIb/7F6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UYIb/7F6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9hbG5S1Nz3cl0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 06:04:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B40740346;
	Mon, 25 Aug 2025 20:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D1BC113D0;
	Mon, 25 Aug 2025 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756152280;
	bh=zfoEC0qVaIxne+Ih7GOFCCmslaPPL3pdBZesCwuWO18=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UYIb/7F6z/p/GP+mdnt7Qx6lRuw0WvsBXI59wavEe3ebR/bxsPORopOj2TBtdkrO3
	 1x5T+pNYfTV7UoELqXsNXLibUw79tmZp1JXZaU6KsedmkosfIeKceywPs0oVL6voR/
	 viiCgSO5Bzv8k4xGWc4y5Z6Pl2t3vpRH+saJmQvB208Dy3ZHzng0Zx7296ldDhbYfI
	 X/eplYSnaj7E41O8x3oj8XRJ8JmcmpI6L3rzNeOTYzGzd09XmXeIOQY1ZQWpz0mi21
	 TM2nRNgx56k1T3a79aMuEpP0RhsM5WXibX5PQJkdd4XSSKqs3FK1waqkPLVLRWeWcN
	 cXkWhCa1T2paw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250820031641.2158261-1-shengjiu.wang@nxp.com>
References: <20250820031641.2158261-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: remove cpu_pdev related code
Message-Id: <175615227355.226187.1520162312481432148.b4-ty@kernel.org>
Date: Mon, 25 Aug 2025 21:04:33 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 20 Aug 2025 11:16:41 +0800, Shengjiu Wang wrote:
> If a defer probe happens for the cpu device, the return value for
> cpu_pdev "ret = -EINVAL" breaks defer probe. As the cpus->dai_name
> can be replaced by cpus->of_node, to simplify the code, remove related
> code for cpu_pdev.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: remove cpu_pdev related code
      commit: bc017f28b1c6c3d44c3631f8f6d152b7e703e990

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


