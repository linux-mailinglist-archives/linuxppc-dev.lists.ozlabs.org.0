Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F441837440
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 21:45:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWvoqp4K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJj05753fz3cTM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 07:45:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWvoqp4K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJhzL60fTz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 07:44:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBB5E61A8A;
	Mon, 22 Jan 2024 20:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF45C43390;
	Mon, 22 Jan 2024 20:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705956262;
	bh=jHahJBNOqmpxsRa3jIC+1XUQhYkCmY2XrppesnzXsns=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PWvoqp4K/BSNf38aC031IAIAGvnawluui5ppROC72eOoP60pdyF1a1GwutIp0XJun
	 QhmRWGJjkX7a0NYQQL8DLh+Ia5f5+X8L8ctO9WaZ8uIG215wxpE27CvYw4EilCUN3L
	 E9H+xcKGmq32P79671o0+eXHdOm3vVIi5pIenMcYURyq0Q4soYwq5Hjuw43lRjz0Rw
	 EjR3S5UQr9grqDMROnI3/eegu7gSW3xG5eqL1XGUnbbAyOYK6wOdiUfCEhCcdaybKt
	 IDqTL3GZe4+rY7rbVlbXEJ3VTQenQ12EPtMjRjav90PSAkruylijxR3Epy0W2AxU3H
	 tV+SWwIVLeu7g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20240112054331.3244104-1-chancel.liu@nxp.com>
References: <20240112054331.3244104-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: Support SAI and MICFIL on i.MX95 platform
Message-Id: <170595625937.145475.18065779265515755326.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 20:44:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
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

On Fri, 12 Jan 2024 14:43:28 +0900, Chancel Liu wrote:
> Support SAI and MICFIL on i.MX95 platform
> 
> changes in v2
> - Remove unnecessary "item" in fsl,micfil.yaml
> - Don't change alphabetical order in fsl,sai.yaml
> 
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
>   ASoC: fsl_sai: Add support for i.MX95 platform
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95
>     platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
      commit: 52523f70fdf9b2cb0bfd1999eba4aa3a30b04fa6
[2/3] ASoC: fsl_sai: Add support for i.MX95 platform
      commit: 2f2d78e2c29347a96268f6f34092538b307ed056
[3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95 platform
      commit: 20d2719937cf439602566a8f041d3208274abc01

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

