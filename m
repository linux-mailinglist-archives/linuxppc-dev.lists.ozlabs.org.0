Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6759EB65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 20:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBywS3Vh1z3bXy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XxThZNV7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XxThZNV7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MByvt56Wtz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 04:50:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78EEEB82024;
	Tue, 23 Aug 2022 18:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE5BC433D6;
	Tue, 23 Aug 2022 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661280597;
	bh=v2a8Ab0aNwJGMtkb8CZSGaqdXiDRPqmdyQ81ECzRFqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XxThZNV7CNxQQ4gy14LjOHq7t/s/iALnFiqL9xctkg98k2uPtKgE7Bkz2spzwGOfq
	 S19z/tm3liyJ9yhuGi2av3SccJ72F64Kch/fH12LmS1YKB2tkjZ/6bDJsWFL7OOqU8
	 5eu9ToycKziVe08GHd5bI305SVDUte5nuvtmIWAuMG4j1LRXfag5vstTspsbIY2rxi
	 KhaXhNKTPOie0omIGFDtDPx+y/M9WwUcd9EH0y/uoYJFYkcWqpTVKHlhkf5t4+aVC9
	 QVu/9D1GR9yLqblpBXq+rX9hODHQMLLWvNltXbOKRjnVU8xZpxG/WFPIu9bPcbZux6
	 QVjyvdoHQ5AxQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, shengjiu.wang@gmail.com, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com, festevam@gmail.com
In-Reply-To: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
References: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add support multi fifo sdma script
Message-Id: <166128059487.1031684.18152206941376913913.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:49:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
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

On Mon, 15 Aug 2022 17:25:46 +0800, Shengjiu Wang wrote:
> With disabling combine mode, the multiple successive
> FIFO registers or non successive FIFO registers of SAI module
> can work with the sdma multi fifo script.
> 
> This patch is to configure the necessary information to
> the SDMA engine driver for support multi fifo script.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add support multi fifo sdma script
      commit: 88630575406fdf2a7853545a884484bd55dab8a0

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
