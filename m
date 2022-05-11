Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E59523C83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 20:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz3Rl5KNpz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 04:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qcn39IAK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qcn39IAK; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz3R357p9z3bdY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 04:31:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5567661E10;
 Wed, 11 May 2022 18:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9515DC340EE;
 Wed, 11 May 2022 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652293915;
 bh=kCCerywDBBA4IoO0PQrQlUEkZgZN+MEjD0xdMDToPjE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qcn39IAKfSZ3kVwQqk2Qd7kGZxgL7autk6gImQe2p1Z1BA0+NUzAfqXPQgXEj3iZP
 4hxPiwtWPyhqlq6ntnITR9+UDo0ZMWte7t/bAxiyMPMHgdkkqjhSoJVVGMSq+/l7+n
 3SBYaQvurQbkuz3xETTtxhMBZPAxp5Y+7rb/qTTwFAsHG74d3iGbFCZtQ8FucEDXmd
 77J6QUilwyUZbbkD5Upw4pO8R5YntXB3txq86VCccaUXL6/l2tWMCr/enlFbuGOvjJ
 GFXOe5MVgzocjUnCIeEvjUVGEAKcXxkEuPQED2Du/PD/39a3ZbUulGlNuLu6OmCMTn
 AlOZGeTdq13PA==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, festevam@gmail.com, perex@perex.cz,
 shengjiu.wang@gmail.com, shengjiu.wang@nxp.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1651925654-32060-1-git-send-email-shengjiu.wang@nxp.com>
References: <1651925654-32060-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoc: fsl_micfil: explicitly clear software reset bit
Message-Id: <165229391332.338959.11028062899331313513.b4-ty@kernel.org>
Date: Wed, 11 May 2022 19:31:53 +0100
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

On Sat, 7 May 2022 20:14:13 +0800, Shengjiu Wang wrote:
> SRES is self-cleared bit, but REG_MICFIL_CTRL1 is defined as
> non volatile register, it still remain in regmap cache after set,
> then every update of REG_MICFIL_CTRL1, software reset happens.
> to avoid this, clear it explicitly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoc: fsl_micfil: explicitly clear software reset bit
      commit: 292709b9cf3ba470af94b62c9bb60284cc581b79
[2/2] ASoc: fsl_micfil: explicitly clear CHnF flags
      commit: b776c4a4618ec1b5219d494c423dc142f23c4e8f

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
