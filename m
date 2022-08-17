Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD03A59756B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 19:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7G3w3nlgz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 03:59:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dizlNlSH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dizlNlSH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7G3G5dgbz306m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 03:58:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A5DE61313;
	Wed, 17 Aug 2022 17:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B6DC433C1;
	Wed, 17 Aug 2022 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660759111;
	bh=UpT4SalvdR4WLHrTMa64BzqEXdI87jktLxsOmXVkBLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dizlNlSHnqSb77WBJl/5tPzb7TdvXznK+wgOnFVnPEKrHiWylmVO4lSL433VO4nso
	 31lXFICtbxogVBHaPRBJQ7kjKBJyqVFDsRFhPenJ9YpzaJ62WdCMv4YbEErsMiL2pS
	 76Z1z+Ts9HQzrt/9438UTadj65IkOxztvmt+RH8XxbRcqMDP1yhUiG4indE3SUp00N
	 KpF8luZd87cYiRAvj/F9XOLGyzZsi229+fhZVi7wkLG15FdgZQh5pD9O37fF90YKN8
	 6lNtOWQYa5HuqGx3m110yUG6MUEjzwWOFm4vobuX6nXN98py3CWOYoLGiejJxdtYme
	 digLIlTvqDGJw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, shengjiu.wang@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 festevam@gmail.com, Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, nicoleotsuka@gmail.com
In-Reply-To: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
References: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
Message-Id: <166075910858.598125.7538229649159844439.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 18:58:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
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

On Wed, 17 Aug 2022 13:24:27 +0800, Shengjiu Wang wrote:
> The FIFO reset drops the words in the FIFO, which may cause
> channel swap when SAI module is running, especially when the
> DMA speed is low. So it is not good to do FIFO reset in ISR,
> then remove the operation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
      commit: cb225ac125a9c82889f4796a6092dd0bed39720a

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
