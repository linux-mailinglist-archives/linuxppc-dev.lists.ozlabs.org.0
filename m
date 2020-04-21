Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A36C21B2F13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 20:27:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Bql6qNSzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 04:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=eK2EvRMq; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496BkM1YMdzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 04:22:35 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56F05206D9;
 Tue, 21 Apr 2020 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493351;
 bh=FwcHGUYdMnDibj/tRCqmioRk8NJPli42GayBPx027Pw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eK2EvRMqCoy5KAlgM/CatYGa7aZv9+O9BbdwG0SYk1b29oAlt7ThQMoKL3REtyXkO
 rpz4apg98lYR4E9JXQTCCofMqT6leAp9UCThGk2rPKjkEJOa2eZovD9dUgaFdZUniE
 2orodMJywuJiOar76mwN+At/k9AiGOztnVPpN56Q=
Date: Tue, 21 Apr 2020 19:22:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 perex@perex.cz, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, festevam@gmail.com, tiwai@suse.com
In-Reply-To: <cover.1587038908.git.shengjiu.wang@nxp.com>
References: <cover.1587038908.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v9 0/7] ASoC: Add new module driver for new ASRC
Message-Id: <158749333764.13706.16975370508037163881.b4-ty@kernel.org>
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

On Thu, 16 Apr 2020 20:25:30 +0800, Shengjiu Wang wrote:
> Add new module driver for new ASRC in i.MX8MN, several commits
> are added for new property fsl,asrc-format
> 
> Shengjiu Wang (7):
>   ASoC: fsl_asrc: rename asrc_priv to asrc
>   ASoC: dt-bindings: fsl_asrc: Add new property fsl,asrc-format
>   ASoC: fsl-asoc-card: Support new property fsl,asrc-format
>   ASoC: fsl_asrc: Support new property fsl,asrc-format
>   ASoC: fsl_asrc: Move common definition to fsl_asrc_common
>   ASoC: dt-bindings: fsl_easrc: Add document for EASRC
>   ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/7] ASoC: fsl_asrc: rename asrc_priv to asrc
      commit: 7470704d8b425c4c7045884690f92cf015563aac
[2/7] ASoC: dt-bindings: fsl_asrc: Add new property fsl, asrc-format
      commit: b84b4c9a688d803b0e7cf91fec9a5d8b3ba47768
[3/7] ASoC: fsl-asoc-card: Support new property fsl, asrc-format
      commit: 859e364302c510cfdd9abda13a3c4c1d1bc68c57
[4/7] ASoC: fsl_asrc: Support new property fsl,asrc-format
      commit: 4520af41fd21863d026d53c7e1eb987509cb3c24
[5/7] ASoC: fsl_asrc: Move common definition to fsl_asrc_common
      commit: be7bd03f0201b5a513ced98c08444a140eab92ea
[6/7] ASoC: dt-bindings: fsl_easrc: Add document for EASRC
      commit: a960de4da241d409a73e318ab19e6b5fdcd95a83
[7/7] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
      commit: 955ac624058f91172b3b8820280556e699e1e0ff

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
