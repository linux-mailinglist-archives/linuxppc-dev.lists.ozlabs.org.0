Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD01521CFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 16:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyLYc524zz3cGH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 00:50:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hIU0MLSy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hIU0MLSy; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyLY11xMkz3cB6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 00:49:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2A920CE1F2B;
 Tue, 10 May 2022 14:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BFFC385C9;
 Tue, 10 May 2022 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652194177;
 bh=Te2sD/cDnoun0AwDA9vgLsTlUYlmrjjvVc6ECCVxxpU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hIU0MLSy0U+hyR4yUULyOPI3PieQ6tkGZURG/I4Dz+y3wN7FQMcaIjyArGXSlH501
 i4OI+tJXfFqeHf+KdssFjQadGcCfVK4Hz8qRXku6q2hrQARzijqwkZOX1HxcDXriCS
 MK17vqz9geYAtwDWTZJJnhMh+lq0G2kBjoVzZJz9yt7UodOZEAjDxPl9cwSvW6JASA
 OUymGcyaf3i8CuAShTtf+yD2elx0XdAHUX6K+29C+SHNqhk7TOYyv8GdARoHhVgGNT
 Gn1WPVdEzE34Ma+a8+yt/nXgSziTHn1SMqjrDIcq3csEopB/qWro43E3uw3G7ZkI9E
 pbekd+u8gNhsA==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, perex@perex.cz,
 krzk+dt@kernel.org, shengjiu.wang@nxp.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com, devicetree@vger.kernel.org,
 shengjiu.wang@gmail.com, robh+dt@kernel.org, tiwai@suse.com
In-Reply-To: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
Message-Id: <165219417472.388769.13970240077661005048.b4-ty@kernel.org>
Date: Tue, 10 May 2022 15:49:34 +0100
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

On Mon, 9 May 2022 17:14:22 +0800, Shengjiu Wang wrote:
> On i.MX8Plus there are two updates for micfil module.
> 
> One is that the output format is S32_LE, only the 24 more
> significative bits have information, the other bits are always
> zero. Add 'formats' variable in soc data to distinguish the
> format on different platform.
> Another is that the fifo depth is 32 entries.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
      commit: cb05dac1bc34ad701972503ca1a75b51ae4478ff
[2/2] ASoC: dt-bindings: fsl,micfil: Add compatible string for imx8mp
      commit: 7b46eb1bf9534a75ff072a01e774b79e6a17cfdd

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
