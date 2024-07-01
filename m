Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BFA91E3A4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 17:15:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/bhFd5x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCV3J5q1yz3dJs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 01:15:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/bhFd5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCV2f0Nwxz30WC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 01:14:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A6E7CE175F;
	Mon,  1 Jul 2024 15:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F46C32781;
	Mon,  1 Jul 2024 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846887;
	bh=D+dqZWEYQrj6N5dhh+KIXd+1VWrn8ph2xtTWAgXfdLc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=M/bhFd5xZ5iddEfYtFWXKCJHnYnW7vRiv1kIhHLhM8S2P1F2ALEZp3TK71Zx8eQsr
	 WCWLE2IT1rjREDCaT/b1TNMTMU5nJP7yzvcHVFnitjXVdvBvPKx75yA4Kfh0veEoeO
	 tX9Vru9TZU0n8lw36uI5wtCXLn7qC2oVRffPCDFEOJrGW91egpXUT6eIMSMYxQwIei
	 F4haOj2bPDs3FkW5pe1VsNA3jI/DkUqVATz+lGOVcLURgR2yO91W4jUMLfhyRvWV7k
	 Ge2SlJvy4AHT0ABeM1fN6PKVC91IOkaPfSj9EsM/bO4BE6myEHI0joz2G/K5WpaA3b
	 NNOZz8SlYEh1g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 devicetree@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20240626071202.7149-1-chancel.liu@nxp.com>
References: <20240626071202.7149-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible
 string for i.MX95
Message-Id: <171984688438.72817.17478121699254917987.b4-ty@kernel.org>
Date: Mon, 01 Jul 2024 16:14:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
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

On Wed, 26 Jun 2024 16:12:01 +0900, Chancel Liu wrote:
> Add compatible string for i.MX95 platform which supports audio
> function through rpmsg channel between Cortex-A and Cortex-M core.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX95
      commit: 8e5c11963c5ca4af90b36147cabb4835e59990aa
[2/2] ASoC: fsl_rpmsg: Add support for i.MX95 platform
      commit: 19dec6650e3fd02de8752c4e0ab1c4894ce7fcb7

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

