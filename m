Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A6C3AF57B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 20:48:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7z7B0cK9z3c8N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 04:48:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iqNceW4J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iqNceW4J; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7z6J2Sk2z30CX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 04:47:20 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7ED361356;
 Mon, 21 Jun 2021 18:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301237;
 bh=Iubxdx/A0LOWkRzH0XmE/PG82jZyYbybm0iqM02k/K8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iqNceW4JN57jLG5Cs8HM5C2aCBREYT0iAMSkFQ3FxmKkF8VfhFGk7B/IQqRzuxyTm
 bQorA7OJGw9Oss8sHHun5CHwxxMEoL1ZPNYFwhVrJgXuSwIAjyYTxyrBii37TJRKSG
 y2S2Rd+AnA7W9dK1TkGJCHX0qr210qDIaprrGaU7PO4RFJZ+UbwHARmz9EWhE2d3nT
 LbxBjnYiRsHFINZBN9I/s3t3c1YNRzO2H2j2C+LtF3KUsfT1E5/o/AGybp+d2NoL0F
 kWBuO0XOemln3vP0s71JCwyEkMiw6uCKsDM4ubZhtiGESGZht8Vx7ZGPsJsgcg4836
 wSVPkXW9UdXug==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, tiwai@suse.com, nicoleotsuka@gmail.com,
 perex@perex.cz, timur@kernel.org, alsa-devel@alsa-project.org,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_xcvr: disable all interrupts when suspend
 happens
Date: Mon, 21 Jun 2021 19:46:06 +0100
Message-Id: <162430055263.9224.18141192734216884293.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1624019913-3380-1-git-send-email-shengjiu.wang@nxp.com>
References: <1624019913-3380-1-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, 18 Jun 2021 20:38:33 +0800, Shengjiu Wang wrote:
> There is an unhandled interrupt after suspend, which cause endless
> interrupt when system resume, so system may hang.
> 
> Disable all interrupts in runtime suspend callback to avoid above
> issue.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: disable all interrupts when suspend happens
      commit: ea837090b388245744988083313f6e9c7c9b9699

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
