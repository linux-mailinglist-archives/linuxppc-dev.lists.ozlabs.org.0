Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5C53153A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 19:26:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6PQ04jBlz3bqv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 03:26:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNB/lAD3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SNB/lAD3; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6PPN23k9z2ynL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 03:26:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3395611D1;
 Mon, 23 May 2022 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7D2C34116;
 Mon, 23 May 2022 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653326756;
 bh=dh+fAnKS8WI2flC692OoPZ+G9PyKzBI6qdryJjOK4yQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SNB/lAD3U3bfcbSAR6YCwn69/9c7U6PhIVPDgyDiIAomqxgdDZGAYA56IR3NfTHAp
 yV/d4aKVwc/vf6shLn0B4YQNS34p4LRUoNosg7+m38wgYO2RIxHBkc1e6KUUui6Xlx
 eXCwXGyaAZrC8pu9HCIJnzId3g+TG+blUKS2akJCBWwG9OsfW5U6Vc8QLJZnr50ymh
 UKNFnOwuPsv3oivbZ53kX6e+Emhih1XL5sKKjTi9zuyXX7mB6yiuzzQddjKQ5vKpSq
 NsRN9J7/WUPxrZDY4jqXgg5+XtqsPC31S6DiTTNvacHFJWujiH9yQk+d5zDwEewg8b
 BmGPTe+Yg7SNw==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, tiwai@suse.com, shengjiu.wang@nxp.com
In-Reply-To: <1653284661-18964-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653284661-18964-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition
Message-Id: <165332675410.2124944.12107532437710717569.b4-ty@kernel.org>
Date: Mon, 23 May 2022 18:25:54 +0100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 May 2022 13:44:21 +0800, Shengjiu Wang wrote:
> There are multiple xDR and xFR registers, the index is
> from 0 to 7. FSL_SAI_xDR and FSL_SAI_xFR is abandoned,
> replace them with FSL_SAI_xDR0 and FSL_SAI_xFR0.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition
      commit: e4dd748dc87cf431af7b3954963be0d9f6150217

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
