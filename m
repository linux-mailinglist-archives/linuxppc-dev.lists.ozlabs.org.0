Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C038B8CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:08:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmMmQ4Yl8z3bvs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:08:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EbMNMGWo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EbMNMGWo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmMlx6rq3z2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 07:08:29 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 865D561353;
 Thu, 20 May 2021 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621544907;
 bh=LG9V/TQafsoAsE88DwTNEoOzd9py69hLE9jxEkJQCPU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EbMNMGWokIwMGVWGnzQ6B+yMcpTNPUl9VU02RDoGJAUjKWfdRVyoIus65bfiMQnbL
 L1micb+F1YUSYQHmtXAt84+JpWWAT8CmSMPTIw4YdENcJ9zrsL2t0s0w7wzHWP/o70
 7KwKB+7x1U4vOs/vG5TpIuoFRxXWQmihTEnUFAk2gQd8nvU5VA7Z/iFoBJSy9OnxTa
 Ez6fNGw1yupI+1xIpvwgYzUbkIM8b+E10bDeOW6ucfcXROjM0IhsL8lPQyBi5kj58T
 PvncV6jUEBkpvh2Yi9TbRV6Hr8XAbSOnKrjLqzkRvDz9/ozc6UiQBSMisTnlNNOFfg
 ZMdvDdS0F5v2w==
From: Mark Brown <broonie@kernel.org>
To: linux-imx@nxp.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org,
 nicoleotsuka@gmail.com, festevam@gmail.com, shawnguo@kernel.org,
 Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, timur@kernel.org,
 s.hauer@pengutronix.de, Shengjiu Wang <shengjiu.wang@nxp.com>,
 robh+dt@kernel.org, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: imx-card: Add binding doc for
 imx sound card
Date: Thu, 20 May 2021 22:08:06 +0100
Message-Id: <162154465460.5161.5323165215525240615.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
References: <1621247488-21412-1-git-send-email-shengjiu.wang@nxp.com>
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

On Mon, 17 May 2021 18:31:27 +0800, Shengjiu Wang wrote:
> Imx-card is a new added machine driver for supporting
> ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms. But these
> DAC/ADCs are not only supported codecs. This machine driver is
> designed to be a more common machine driver for i.MX platform,
> it can support widely cpu dai interface and codec dai interface.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: imx-card: Add binding doc for imx sound card
      commit: 623cd9cfcac522647e3624e48bf0661a39e8502a
[2/2] ASoC: imx-card: Add imx-card machine driver
      commit: aa736700f42fa0813e286ca2f9274ffaa25163b9

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
