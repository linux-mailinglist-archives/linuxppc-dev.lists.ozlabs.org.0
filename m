Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88F299BFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 00:55:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKsCb4nLszDqMH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 10:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=k0yy62xy; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKs0l4kl7zDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 10:45:59 +1100 (AEDT)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74BDD20874;
 Mon, 26 Oct 2020 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755955;
 bh=5T4AL1BqRu1ARMLqlPYicJ4G84AujjuS4vWXEtGsgds=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=k0yy62xyK6pARRGeQH/8tZh7EQvK+Pk4WiCSWb1+LFc5QFneQ0G327u4wby7WIl3D
 Yf6pruWjkRFbttJ/itSDa5AXhtf/n//zacPvMvI0H4IggveE4OYc/TlSMWuFcFFV6J
 bIyT+yGjcFDcaBVkg9p6wOPf1CabCQbD6f5jj9Jc=
Date: Mon, 26 Oct 2020 23:45:50 +0000
From: Mark Brown <broonie@kernel.org>
To: linuxppc-dev@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
References: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v4 0/2] DAI driver for new XCVR IP
Message-Id: <160375592347.31132.18055383544502605577.b4-ty@kernel.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Oct 2020 15:17:31 +0300, Viorel Suman (OSS) wrote:
> DAI driver for new XCVR IP found in i.MX8MP.
> 
> Viorel Suman (2):
>   ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
>   ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
> 
> Changes since v1:
>  - improved 6- and 12-ch layout comment
>  - used regmap polling function, improved
>    clocks handling in runtime_resume
>  - added FW size check in FW load function,
>    improved IRQ handler, removed dummy IRQ handlers
>  - fixed yaml file
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
      commit: 28564486866fa889b78264360022c94836fa8072
[2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
      commit: 0afb88d5a602488f877380ad1ec37cc20c927c68

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
