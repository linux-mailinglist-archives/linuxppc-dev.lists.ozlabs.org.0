Return-Path: <linuxppc-dev+bounces-2120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5F99A514
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 15:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ6wB5gXgz3byt;
	Sat, 12 Oct 2024 00:31:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728653482;
	cv=none; b=kwJ7sI/oi4/9QhfMH80Jrcn8AusrOWGLvWKqEby5oAUrWB1jn6CUld+S4l9gtGs5a/CZ/R58xnHVUeEOJcBCKBXlvgMeaDAZgDU/lkqwYakprbofgyAOri9x8o/TAFDlljmy/YMp1QD29nNwOaBNSt5/US5yadyS8vb/mLdJrh9U2smq67scFm5sSgz09bC1SURYonqMYzK42dk3ZcCtZvwlPF+ZQZmwEbsdHCydoAw62YwP/JqPaF9KfkJPuL0VBZz8kI3hFbVtAyHxGBQrquGW2SrmKFxlKe2xW1DBOeFEvfZMM47GuPFMZFwmffPKfdcDrilDwMFDVseKvdV11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728653482; c=relaxed/relaxed;
	bh=jSyarUnAXGu7WB8S+MDOZov7DlT9utAtAGuMyY07Rdc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y+U+Fgm8hgbj829YWEjo2X+yH/qFGEHMZOFnreXlANu95ihMsG6W0Yty6f7WcQOlWdsHwvxNSyK4rHIg0YT4zb2s04S0i1Fz2o7E5rp7eMj3pxfx0gnp2pEudzDq5MNZFgVuieZmN8MkBHQHQ4CWURkaNKATi1ypQvRYvh1B0pkb9zCGwo4kyAwIVrZFa0b32KGw1RTKHcT02RzzMsJYPELr9zH9AaQZXUDNWFZsJlhYByI6PdppiSauytlPI7qJHGNA45qiBKQjifDvM86j8s+bEkkx9XzEFmytGy8s/uGb2824WyeoZhhPEuwW7BGlXPXH6/AiXAN9neS6ScLnCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NPqs1Bpc; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NPqs1Bpc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ6w96sspz3bww
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 00:31:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8671F5C5E83;
	Fri, 11 Oct 2024 13:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4B3C4CEC3;
	Fri, 11 Oct 2024 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728653479;
	bh=axgDJJd0Yci/0Oz/SEuK3Q+Z9vXkPa5HPiC8NPVOvCE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=NPqs1BpcLzfSPkyANaoRtIQtuBTavtjxHEfX1aKGu3aJEs05CTp/25tDozWGoyMAC
	 n0Qp0O24/CJFN7fX8wEZGEj1HABa5mQ8ZBbXm1nfSz+Y5CDY3kgeQ2jIuxTPq9fdNa
	 sYOYq/ESC+2XNiHopx4g0+wnvaTq3djNI1eXa9NIANAOQJBNoZth+QLEyqsBeTon1N
	 WFbefM+N9QzMTbwfdzr8PfXekEqffkdZmFtn+qF2sIiPYOBjFxOrNIcpayvCprmIgf
	 8kHNnoN8fFT34wXBHHWbq3pkhHazo6eZ6TWPS7Mu1PaJ/Xn/9SAGuSBR1p4mpyT2uJ
	 X0kNpm9IxqBLw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: change dev_warn to dev_dbg in irq
 handler
Message-Id: <172865347670.3898502.17710275321530341071.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 14:31:16 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 11 Oct 2024 12:53:53 +0800, Shengjiu Wang wrote:
> Irq handler need to be executed as fast as possible, so
> the log in irq handler is better to use dev_dbg which needs
> to be enabled when debugging.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
      commit: 54c805c1eb264c839fa3027d0073bb7f323b0722

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


