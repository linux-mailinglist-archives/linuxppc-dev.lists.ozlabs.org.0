Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC06FBF5E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 08:39:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFpRb4Ybcz3fKj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 16:39:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SzwPwe1q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SzwPwe1q;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFpQl5BL7z306l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 16:38:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8EF161011;
	Tue,  9 May 2023 06:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F92CC433EF;
	Tue,  9 May 2023 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614332;
	bh=5qWLa6CWjjjsCeBM3UJ2nY7uwlPNtQ93pmOVp0ZbX4c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SzwPwe1qcAbipOpmCte6/VE8rNsE8VnJhMbfS9uMyH5J9y4y5J7l7HNbCr0pTgsLw
	 zhH7ffANAOD9Opco+cPYl2Q9nigpqg+tvjHsOeZK7/ukw0I8cKiGalwJOA6WGQcI+G
	 6Dv7gnwqD3zbbpL+oMLkfZNLf6CvkIiB2e3v5G2SuUDY+rWd/1BuBW2m/dWjT+o/Ui
	 oWyanyN6r0ryyJdtOKVkqHFfrU9nztyoWCcolsXELR2de1U7KKzaQjN4Zltm7wm3wQ
	 f2UBEZ0hhcP5jdEGHT76Z/oi1d03h5Wgn6mHqypyHC5jYtx3ciXrkiQNrHgX1oKUIM
	 bvgnF81NP4Byg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1683273322-2525-1-git-send-email-shengjiu.wang@nxp.com>
References: <1683273322-2525-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: MCLK bind with TX/RX enable bit
Message-Id: <168361432593.303059.2652847583267849734.b4-ty@kernel.org>
Date: Tue, 09 May 2023 15:38:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
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

On Fri, 05 May 2023 15:55:22 +0800, Shengjiu Wang wrote:
> On i.MX8MP, the sai MCLK is bound with TX/RX enable bit,
> which means the TX/RE enable bit need to be enabled then
> MCLK can be output on PAD.
> 
> Some codec (for example: WM8962) needs the MCLK output
> earlier, otherwise there will be issue for codec
> configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: MCLK bind with TX/RX enable bit
      commit: 3e4a826129980fed0e3e746a7822f2f204dfc24a

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

