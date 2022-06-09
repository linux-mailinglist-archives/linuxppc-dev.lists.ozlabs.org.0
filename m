Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3493544DE9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 15:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJldK5vxqz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 23:42:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j6NCY82a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j6NCY82a;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJlck70Pdz3bmX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 23:41:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 642A0B82DE6;
	Thu,  9 Jun 2022 13:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8304C34114;
	Thu,  9 Jun 2022 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654782099;
	bh=YfwemhhRNfHkDcE7hmvHDoWfd3apl8aK4u9+a87TYAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j6NCY82atJdRW+KDfnW10DrMSfLqY+EmOIQyNSG4Tfr3eoio+yE9T2rPOp1IeO1E+
	 PGqCi7NT+bUklMuWQinSASg0FxPEAW31dDfB6AErks7p6O43T12oUgPkfCzuP53h2p
	 O4bporKziDJnDVZ/9Z5AUn2PCu6JNev8RDpud/cbmgpyRDlN7MdIU/OToaqCtFiknN
	 +xMaYj7UO9+y+X6z4JVWNAbNmH36Sar2yz5w5oRbcAv8Hy5MNAhVHEkuP6TcfApGsd
	 Yj5N3r9FLXNbmjD+IcFuVY7X/St6Us9AvlKDNAlD97hMtGVXaX4H91wL22A67T0UMb
	 gNdr6wJFeQGjQ==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, shengjiu.wang@gmail.com
In-Reply-To: <20220606033705.291048-1-chi.minghao@zte.com.cn>
References: <20220606033705.291048-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH V2] ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare/clk_prepare_enable
Message-Id: <165478209647.1066808.13320829803906102569.b4-ty@kernel.org>
Date: Thu, 09 Jun 2022 14:41:36 +0100
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, zealci@zte.com.cn, lgirdwood@gmail.com, chi.minghao@zte.com.cn, perex@perex.cz, nicoleotsuka@gmail.com, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jun 2022 03:37:05 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Because clk_disable_unprepare/clk_prepare_enable already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare/clk_prepare_enable
      commit: 142d456204cf4dabe18be59e043d806440f609d4

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
