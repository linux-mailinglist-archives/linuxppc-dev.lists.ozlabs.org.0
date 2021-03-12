Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED723399DF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:02:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dy1YP4vk4z3dHv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 10:02:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOmoNrl7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UOmoNrl7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dy1Y10swPz30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Mar 2021 10:02:12 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6CC164F4D;
 Fri, 12 Mar 2021 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615590127;
 bh=YjpH46E5wsNV0V6as8mJ95+AjvUcvV/u/mVOZl8KRBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UOmoNrl7OW/V8jOFswOIRyhAM8sQ5o9vYGhD/fmFRK5WLqZCmJ68tjNsEaiUsVnmw
 vHxZmeX9O/idptY5NwkhF47YUIHbVKEylfzHlb5ahKME1hlazi2HkXY2RVDOC0Q5DS
 orkVU42K+1JZsL9jOZwGF8qtyc1M0Vr6FArGZchcWZ+XwV7/Q6xNcV12rSd28oQeMk
 EiPje11w5WGeR0E0jx1mG61xBtTTEq5UYhAYpyhifuCC7GXw2ui+tTCsY7GUxI2CP6
 niSgG9YfFmSG6kFkZnXm4cneZv+2f4V8qN7aHM20rJWIdDY+8QI19EENcknga49RNi
 jvKhV3r8FwnRg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Xiubo.Lee@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 timur@kernel.org, alsa-devel@alsa-project.org, nicoleotsuka@gmail.com,
 festevam@gmail.com, tiwai@suse.com
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: request dma channel from specific
 controller
Date: Fri, 12 Mar 2021 23:00:49 +0000
Message-Id: <161558981190.31753.12828472795254829304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614935977-21638-1-git-send-email-shengjiu.wang@nxp.com>
References: <1614935977-21638-1-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, 5 Mar 2021 17:19:37 +0800, Shengjiu Wang wrote:
> Request dma channel from specific dma controller instead of generic
> dma controller list, otherwise, may get the wrong dma controller
> if there are multi dma controllers such as i.MX8MP.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: request dma channel from specific controller
      commit: ee427ea4f12672e5d7874abaa634ddee0ff2bb97

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
