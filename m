Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9F756F92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 00:01:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QXKgOwmH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4bdr4rB2z3clk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 08:01:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QXKgOwmH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4bbM0R19z3cYr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 07:59:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60120612B4;
	Mon, 17 Jul 2023 21:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28A5C433C8;
	Mon, 17 Jul 2023 21:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689631179;
	bh=L4LNILElwEJuIvZsN9V0NhiSCNz4Ki8cQsqwvuJykvo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QXKgOwmHlEVnNI7mc/TIk7h7m85AZuTRJ2zI7MzW+kUSv8nw7c0nIfPZw3GdADPXM
	 h6mhCp1iMdTp6ujNMJLWw5wicHgBYOvLa8XCqRzRf3ne0F67BCEovoP2CyOxQo74Rf
	 NIKJ8cHBUKFWgD4CTxM9rbPnQvQjZWcDWiXNchnNHdygR5a0fLkLTJENfTpkG/DAuM
	 v9Y9X7zw9FmaRvTGBTmTR0zH/zlVWhn/P/GjoVdxhhK/2198ujTP/u2Mjms92yQf0D
	 OvkNTk/a9dJgWA9Nm/xUqEZXcBvY6FQJK/qJcKZ5eNGEOhjTf1Fz1PWSsJPj0fCLIa
	 GCvfo8sCDBS6w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230714092913.1591195-1-chancel.liu@nxp.com>
References: <20230714092913.1591195-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 0/2] Add support for rpmsg sound card on i.MX93
 platform
Message-Id: <168963117664.522208.15403610708641093351.b4-ty@kernel.org>
Date: Mon, 17 Jul 2023 22:59:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jul 2023 17:29:11 +0800, Chancel Liu wrote:
> Support rpmsg sound card on i.MX93 platform.
> 
> Chancel Liu (2):
>   ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX93
>   ASoC: fsl_rpmsg: Add support for i.MX93 platform
> 
>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
>  sound/soc/fsl/fsl_rpmsg.c                              | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX93
      commit: 143f8c69a27f3fa8ed30c7f6790ea039fff57cfe
[2/2] ASoC: fsl_rpmsg: Add support for i.MX93 platform
      commit: 60f38a592efe08e5ced454e8a05f6814e6e221ec

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

