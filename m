Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92D5B429B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 00:46:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPWM22s3vz3c3Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 08:46:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TQrhTw/W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TQrhTw/W;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPWLN435dz2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 08:46:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3484B82660;
	Fri,  9 Sep 2022 22:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376EDC433D7;
	Fri,  9 Sep 2022 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662763557;
	bh=TycSWmIMYfOSFcfvx1izVknLB7zi2sU9zxghk1psAn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TQrhTw/WTISdbvOky6upC7pi3MCfxDIBq6BubhPfF3Ya4IjiAx64xIX2TyXUaStAB
	 w/P4uIF6cQbg4UCSSHJ50w/jj264AVy/+cJ084DOOjmgRa7G5f/v2sHe2YaDQDw+xC
	 hmmWgS99WHTKvpPaDN/SQuCNXN6wW3Bv2Q6jldrz/6Dtyiwitdg9b7hqNVn3JVDurj
	 5LGCL8U0dACQ6kFWIyYXjCukCxWpGHB+azWZBdZO4+RBp9Ug6sbf8W1RJLqobm3cES
	 paEwbB8ldUexsyqBQxGfMQ87uwzpvNqz2vvusIG5Z1Qh5y2voQyrbESLoi0xzEMjHS
	 Tgcdm8DU3C9dg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz, festevam@gmail.com
In-Reply-To: <1662695098-24602-1-git-send-email-shengjiu.wang@nxp.com>
References: <1662695098-24602-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl_asrc: Add initialization finishing check in runtime resume
Message-Id: <166276355495.332114.11561275882220746760.b4-ty@kernel.org>
Date: Fri, 09 Sep 2022 23:45:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Fri, 9 Sep 2022 11:44:58 +0800, Shengjiu Wang wrote:
> If the initialization is not finished, then filling input data to
> the FIFO may fail. So it is better to add initialization finishing
> check in the runtime resume for suspend & resume case.
> 
> And consider the case of three instances working in parallel,
> increase the retry times to 50 for more initialization time.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: Add initialization finishing check in runtime resume
      commit: d2de3f5ead84e230f4651cddf7658ab74ce1a70c

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
