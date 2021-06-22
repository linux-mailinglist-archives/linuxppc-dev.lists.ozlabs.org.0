Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3D3B0876
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 17:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8VMH3NLpz3btC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 01:15:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iTKCpOUK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iTKCpOUK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8VLf3ybtz303H
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 01:14:50 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80D4A61289;
 Tue, 22 Jun 2021 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624374887;
 bh=K/joDXOjMWjSrHEyHcJiXlslAz8UC17B9j+5gcEpRBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iTKCpOUKN8tfhrT6IoLLxIAmmzpcW53nvFpOrGjauIYAfwUpvE4zGyBXUbw64nSvd
 3adt1jaUXyE2/zsqHYok4SO5LUARxt1GFjgRhqK7Bcj1g3ZspMjTmtOxgkMcBjqjIs
 VQuP5rN6DOa5CISEfMOvR7mL8tYj04Qwn3PoGnask0PRQqT7P+jlEFQ9ABE4xnZ6rN
 EQNWLWWaAa8+IxCm3O5BRnArv/x8KbsFSSzko/1qbhm0YaCwNYBLwtk2GquC6nmaDf
 c0bUbFo3ZXD5pHoZJ3DSn85R0jhpVxp1Cyo0sQFil4o+81noYGGiyDzK3WynvWRNos
 J28yFaOCvprYg==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com
Subject: Re: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer
 probe
Date: Tue, 22 Jun 2021 16:14:07 +0100
Message-Id: <162437355277.1773.16436234060629231949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
References: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
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

On Wed, 2 Jun 2021 14:42:12 +0800, Shengjiu Wang wrote:
> Don't need to print error message for defer probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer probe
      commit: 4b1d51715d1cf78a1527fe426fc0278dcfea1959

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
