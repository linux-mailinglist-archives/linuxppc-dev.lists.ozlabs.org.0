Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91465814B28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 16:06:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J82Ykm4F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsCGQ1qtXz3dTC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 02:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J82Ykm4F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsCFd267tz3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 02:05:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 98EE6B828F0;
	Fri, 15 Dec 2023 15:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B90C433C7;
	Fri, 15 Dec 2023 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702652722;
	bh=XOILv9Fmwwz3Rta+62IPEge55zNcBrrWIBM03rU+5UE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J82Ykm4F3QSyWLSqa7ED/v/ozXselGaYeoF/WX6M4v0Tws+q+L/NnlN+b+c5XyPJJ
	 0oRLZ1Qo+ulD5PbpBqh8sBrlVEHI0/D9M7Sh0xCi9jYHXO66xjFcBJZKYgtmZ6hCF5
	 YtCmKKZEfvO3tFE2NNHZJtcU9fUBaQf2feOG0ItjoUlncJIO0R3SvVH+V2y51EGoBU
	 lMcDrDTQv/jaLvD1vE4E1sYXJxQ+MUFRPhWyE2Zh4pmyAUjkIwhLZSHxhBf1MGN9BW
	 mswU/V4Rey357AU7dMhKfKRj2NxsxEJ0GxL2k+SHZfq6Me39WaErEvLy1vhyrKq7nv
	 0MceiqvqXxTNg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Wang Jinchao <wangjinchao@xfusion.com>
In-Reply-To: <202312151713+0800-wangjinchao@xfusion.com>
References: <202312151713+0800-wangjinchao@xfusion.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: remove duplicated including
Message-Id: <170265271919.82974.8640827688447166639.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 15:05:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
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
Cc: stone.xulei@xfusion.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Dec 2023 17:13:51 +0800, Wang Jinchao wrote:
> rm the second \#include <linux/of.h>
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: remove duplicated including
      commit: e7a4a2fd9a4116286a1523ea1a5cbabd2c36f5b9

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

