Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4130A54AE3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 12:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMl2N1PfNz3cLZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 20:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGbRvEEx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DGbRvEEx;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMl1j3FsZz2yyQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 20:25:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE201B8184D;
	Tue, 14 Jun 2022 10:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D11C3411B;
	Tue, 14 Jun 2022 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655202307;
	bh=qA9xWVn3AUOfZxfhOprMPBGdr1XvmWBCUKQPSallH0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DGbRvEExBH84aRP3LsVoe88rb3sKrQrDJjoxsjJUxG+m6/s4Zp1yT0QXwou0ZZVuK
	 57N8LOHwEwXf6uz0O6ZrgPYZ4CPv1Sld/mUjt4GiUELMyBk7E/CTgnfpByvHA2w5UD
	 TUgtNdMlbDKO0UxlVPSD1oqwSHrKk8JP/n5xsaTzJRowVJB6RmK4fZYVIILpyYhGcZ
	 +hJ7KFui/7hcXr6XyVRtoGWsLlyJFNNN1/AVXvVH+koYyKq6TyrXaIkaw5q6Oyd68o
	 KbrIQja2neTtQpk1folFoQbvO3D/ZX0abdGoU57kNE6UE4lxmo9QjNiQ8FhXsQaypE
	 IWVx6FLZPRDRw==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, shengjiu.wang@nxp.com, tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, shengjiu.wang@gmail.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz, festevam@gmail.com, krzk+dt@kernel.org, lgirdwood@gmail.com
In-Reply-To: <1654840042-7069-1-git-send-email-shengjiu.wang@nxp.com>
References: <1654840042-7069-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX93 platform
Message-Id: <165520230461.3607327.1182225062255156973.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:04 +0100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 13:47:21 +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx93-mqs" for i.MX93 platform
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX93 platform
      commit: 81ae0635df7de58496def18b0b9333992630b9af
[2/2] ASoC: fsl_mqs: Add support for i.MX93 platform
      commit: 047c69a3a9b19f29e021c77a7e9ce79230a342ed

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
