Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128A720828
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 19:10:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXqJq0VHpz3dyQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 03:10:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=coreVa5A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=coreVa5A;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXqHw3wZ8z3dtX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jun 2023 03:10:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACE9661789;
	Fri,  2 Jun 2023 17:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACDAC433D2;
	Fri,  2 Jun 2023 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685725801;
	bh=FFfbYJAeWVlemuy55YRw4ykuDglzPT/JaLEPqPbT6qQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=coreVa5AwxkjU4f992ggWjolW7fV/ntma+BDJMVAnLt8XKsXaJ/Jre5aYaA0WaLRW
	 TVIv5LKzC5y518KFJ7VFxI+x7SP5HLfSY72ToqC3eFc/C3do0nIHGd4QWedjB4ad1G
	 wjtlzoZImKq9iaIWLMUt5gXBaIYWGX8d9w3rthF0ItGy+Nng8LCNpjNBPHop8B6VEM
	 ACSTKSuj/7L1kNkbW3zdwet6isLENysj+NEZtLjvSUxcLhNjpZQOQgRAKPeqZm7h00
	 5DFhGs/D1TGuvezU2/a+OWvJTRP2EtoqsySXgPV8RcozZQAlX7QZz68Z/y0wIlsPjD
	 JCGdgWaERJ1Bg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230530103012.3448838-1-chancel.liu@nxp.com>
References: <20230530103012.3448838-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable BCI bit if SAI works on
 synchronous mode with BYP asserted
Message-Id: <168572579859.93025.4040527745876774020.b4-ty@kernel.org>
Date: Fri, 02 Jun 2023 18:09:58 +0100
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

On Tue, 30 May 2023 18:30:12 +0800, Chancel Liu wrote:
> There's an issue on SAI synchronous mode that TX/RX side can't get BCLK
> from RX/TX it sync with if BYP bit is asserted. It's a workaround to
> fix it that enable SION of IOMUX pad control and assert BCI.
> 
> For example if TX sync with RX which means both TX and RX are using clk
> form RX and BYP=1. TX can get BCLK only if the following two conditions
> are valid:
> 1. SION of RX BCLK IOMUX pad is set to 1
> 2. BCI of TX is set to 1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Enable BCI bit if SAI works on synchronous mode with BYP asserted
      commit: 32cf0046a652116d6a216d575f3049a9ff9dd80d

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

