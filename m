Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D91037A1EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 10:28:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfWKJ13kXz3bwV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 18:28:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZMLazoSV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZMLazoSV; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfWJp6919z3091
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 18:28:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD14061944;
 Tue, 11 May 2021 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721688;
 bh=7C4N6xhr3iLJ06IpEWXsW6Mhbp8fwEkNVFfMBYJL4Hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZMLazoSVLczu9/tZp9358cwQQx7is/gIgfqItfeNED0/l9vyz3WWiixEcRLyRyGF+
 T4dJGl3TC6MYR0nu5j4D/brT9QowFo6as1cswCpldxk3DsNAWPR2VmE05OgVwTKB9p
 X9CZmjiEEJF2GTSwGj5M+oGbi4ZTNc0O3Cri0SKGObbNPelFgH8ed6etG1vDHArN5u
 6OIwtvBnQl2zTW9b9vUDnRjiD98mTgG7mf/QuDFCqMUhApoRJgY9t5UPL4KCZWQX+V
 KnnIFZuSpqdjLZa0gnX6EVlDWrkE1yUoo+DQ3C2Y0cz7lgwLy2frgqj23OuDiuC8Af
 ozX8P82HpQMJg==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz,
 nicoleotsuka@gmail.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 tiwai@suse.com
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Fix warning of incorrect type in
 assignment
Date: Tue, 11 May 2021 09:25:58 +0100
Message-Id: <162072058169.33157.6496454869060714703.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1620268240-1005-1-git-send-email-shengjiu.wang@nxp.com>
References: <1620268240-1005-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 May 2021 10:30:40 +0800, Shengjiu Wang wrote:
> The format in rpmsg is defained as unsigned char, there is warning
> when convert snd_pcm_format_t to it.
> 
> sound/soc/fsl/imx-pcm-rpmsg.c:164:43: sparse: warning: incorrect type in assignment (different base types)
> sound/soc/fsl/imx-pcm-rpmsg.c:164:43: sparse:    expected unsigned char format
> sound/soc/fsl/imx-pcm-rpmsg.c:164:43: sparse:    got restricted snd_pcm_format_t [usertype]
> sound/soc/fsl/imx-pcm-rpmsg.c:167:43: sparse: warning: incorrect type in assignment (different base types)
> sound/soc/fsl/imx-pcm-rpmsg.c:167:43: sparse:    expected unsigned char format
> sound/soc/fsl/imx-pcm-rpmsg.c:167:43: sparse:    got restricted snd_pcm_format_t [usertype]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-pcm-rpmsg: Fix warning of incorrect type in assignment
      commit: a387040ab401cc114d0b1a7a86431c5ae34b163b

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
