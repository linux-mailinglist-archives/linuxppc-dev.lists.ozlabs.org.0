Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6F313DC6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 19:41:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZFGb04JLzDvYF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 05:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ce9O3Y4e; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZFDR11PlzDvW1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 05:39:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D49964E6B;
 Mon,  8 Feb 2021 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809556;
 bh=xgfXFXjxKi9MNGtKtz9Ymxo6K71+ooCHg7rZVVUShK8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ce9O3Y4eN/3AFIMoDMSQNp5IJmirdGXjxOzxsX8HI2R2EEuFZZwh4EYeudaHrOt5J
 tgLvLfbYs9wjnsiO3hAqCEp2tnc4U2Q5/DlgQjPigUSo4KUOr0VU4TMqGWXaDJi4sj
 26THtsD/Qh/paOPbYPAEfXyETlzac6jt/8YicP84D35XRiBODs/Wqa7ms7l3npNnMH
 a6DD9fAbtSeaFybrCGb3UW1Ql/dt9dZf250MFOXqIZHo3UjPmpSl7pNxOnfJSwZqQB
 e9Reqimn24mtQ+DVIqsS3JPB9R8nlVvryK5ZRwR9bLJfkbP9JThCcW8JoXsVn7/1D+
 gOkG1WyhyP+Lw==
From: Mark Brown <broonie@kernel.org>
To: Timur Tabi <timur@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
References: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: constify static snd_soc_dai_ops structs
Message-Id: <161280948304.10741.2031202191928010331.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
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
Cc: alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 6 Feb 2021 23:58:49 +0100, Rikard Falkeborn wrote:
> The only usage of these is to assign their address to the 'ops' field in
> the snd_soc_dai_driver struct, which is a pointer to const. Make them
> const to allow the compiler to put them in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: constify static snd_soc_dai_ops structs
      commit: 38d89a564847048c0f6fe53a829d15edb4f21da3

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
