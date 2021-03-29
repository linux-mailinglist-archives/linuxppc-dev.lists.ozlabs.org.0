Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82C34D8AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 21:59:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8Ngl5245z30Jj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:58:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dMhvtU4d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dMhvtU4d; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8NgL3BC9z2yxm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 06:58:38 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD2D261981;
 Mon, 29 Mar 2021 19:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617047914;
 bh=u6ACrZWGumDoalB5NQX3JFz6rDEZMDWEtoyXeuanOmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dMhvtU4diIdI8b8gBUkD+8PCCTgY6vZ97c3QBXsIEdnnv/A4/uNxAoLd6oOgEX7MV
 j5oqCBD7lkkl2Bj7f4c7PO/MReDZro7S1LsRn2a/9L8aNftkn2L9bJoqK2qPyzYBs4
 z6ZOJdN3cuaRK4QPcsE68s/1Mlwy3x5fL1I1JZTmy31Ac3m2ZKJ/Bxe66RHyenNWQP
 76tWUplbD8gnBwAf/5tcrBlx9c22D3NECZaJCPEa4DxB3zLeuVw2VBabmEQxR5lqhn
 oMre4fFGPjavQRzMiwgCvaOdY+WUDZ1nr4uGwd4ZcqKC66FkUgKf7UywGipfZkXDI9
 mz5bcvH6bY4FQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, festevam@gmail.com, nicoleotsuka@gmail.com,
 tiwai@suse.com, perex@perex.cz, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: fsl_rpmsg: initialise pointers to NULL
Date: Mon, 29 Mar 2021 20:58:10 +0100
Message-Id: <161704724765.10039.8726528619377342527.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616988868-971-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616988868-971-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: Mark Brown <broonie@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Mar 2021 11:34:28 +0800, Shengjiu Wang wrote:
> This fixes the following sparse warnings:
> 
> sound/soc/fsl/fsl_rpmsg.c:45:45: sparse: sparse: Using plain integer as NULL pointer
> sound/soc/fsl/fsl_rpmsg.c:45:56: sparse: sparse: Using plain integer as NULL pointer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: initialise pointers to NULL
      commit: 502e5321d89214a34a7b8bda697fc98d14b51cae

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
