Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A9B5B6E6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 15:32:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRkt16sxvz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 23:32:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RVeOTrx7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RVeOTrx7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRksL3JgHz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 23:32:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7A5F6147A;
	Tue, 13 Sep 2022 13:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4674C433D6;
	Tue, 13 Sep 2022 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663075921;
	bh=F0cqZytYnDM1UyPSUoRFaYeWA37WWne+bdR5WeTUuDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RVeOTrx70ClhJ+u3/hFZKiE4NdznV8itDQ54ZlvRZTayU0imDhgxDux0kiR3LYGkF
	 SExpFFn+xFNKoMKeI0Yc+DP46uBLCyIUGN+05lYIL6wUdhkzMBjrH5JfKccH5bAKq6
	 xCIjiA6gM6/yBkocCWnJYU072SRbShqmumLKnKK0eOkimaTic3PiK4DS27vpV4FPff
	 HcEA3HSuxw79hZbO9wEJdyR6AN6TAhEYJ4wHQlnNbQQd7d1ws/adm5KFSeEMRm/0/Q
	 MVCjEIWykRyQV1ySASIObu5T+peSkd/VnK8LtviFdAfQhuM5KVkCly4ADv7TeSmall
	 lVggVdBoHkLRQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org, tiwai@suse.com,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, festevam@gmail.com
In-Reply-To: <1663059601-29259-1-git-send-email-shengjiu.wang@nxp.com>
References: <1663059601-29259-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-card: Fix refcount issue with of_node_put
Message-Id: <166307591852.124960.4909394552213550357.b4-ty@kernel.org>
Date: Tue, 13 Sep 2022 14:31:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-95855
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Sep 2022 17:00:01 +0800, Shengjiu Wang wrote:
> imx_card_parse_of will search all the node with loop,
> if there is defer probe happen in the middle of loop,
> the previous released codec node will be released
> twice, then cause refcount issue.
> 
> Here assign NULL to pointer of released nodes to fix
> the issue.
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: imx-card: Fix refcount issue with of_node_put
      commit: d56ba9a04d7548d4149c46ec86a0e3cc41a70f4a

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
