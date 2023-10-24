Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB17D5356
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 15:56:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NxD9Ggy+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFD9Y6FVMz3cT9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 00:56:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NxD9Ggy+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFD8j70M1z30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 00:55:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A30B8B82487;
	Tue, 24 Oct 2023 13:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB6BC433D9;
	Tue, 24 Oct 2023 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698155712;
	bh=ZwRGvdK1vLRyYCBNB8H0GmRZoD2LA6Gw+YOD+d7uvu0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NxD9Ggy+9A7RNU1Bjgd9K1z8hWPbQi879G28Ip41uwiWe84uVlCmqllbF9PsZlh0d
	 G2rydM2Pm8bPxq1DGXAswrBQZaiBbtD2nUQOq/dVx5Pe+M5aMmb3ce+hLcuhcpm99n
	 IBA6YnK4LsJEuNRmBOYuEghoNzNXPErkIBxjHaPUOHv1v7qVBy0MthbcJ1+gwhZ8TN
	 h9yAceinSkCQwzwPw8MHnSgTlhdJXuXwl97QknJRHl8UEhqKYWOP4McA0UZK58HDoH
	 g4kDqFM2pCzLdXK7VuOeMRZCRt9fIJak9Q0FPTgpZp7THk5I2meWR09NCmKYrks+Ee
	 5AhaJ8ROchJgQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Zhang Shurong <zhang_shurong@foxmail.com>
In-Reply-To: <tencent_C0D62E6D89818179A02A04A0C248F0DDC40A@qq.com>
References: <tencent_C0D62E6D89818179A02A04A0C248F0DDC40A@qq.com>
Subject: Re: [PATCH v2] ASoC: fsl: Fix PM disable depth imbalance in
 fsl_easrc_probe
Message-Id: <169815570943.69390.931793622764684694.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 14:55:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Oct 2023 21:03:15 +0800, Zhang Shurong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
      commit: 9e630efb5a4af56fdb15aa10405f5cfd3f5f5b83

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

