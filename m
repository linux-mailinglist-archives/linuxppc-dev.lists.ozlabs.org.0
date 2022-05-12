Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C45524FA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 16:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzYgW4FBCz3cM6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 00:14:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jnJCUtKP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jnJCUtKP; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzYdp1R3bz3c8S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 00:13:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70BB2B82832;
 Thu, 12 May 2022 14:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE53CC385B8;
 Thu, 12 May 2022 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364778;
 bh=fS5LIWilDa+hz2Ola1gsUeyqJCEe4vAjSZHbZ6Wyv2I=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=jnJCUtKPLyvpYm1omocXcq4bY8fiwWPyNoHSOf2muv4nzjc4/pCzJXco+WbVrys2B
 nVU67xTgNAzmd+KG0jtvtElGYqRyg4AFF0nh7MbnT8oPfogz3e4wGg2D94E5fDhhHb
 AnwD31Bt8FKC8TtmDIYg1SikcscL4PtqVPqSOzy5PKSWj/T5w/Rxx4Ei3WkJlrgVEq
 hS5foECa1v5ajLahqJFojqngPid8DGO+Dc/9zdpYOEWo/7eQbOMe9RZlrPR43A1WLi
 Ii0tbKzsw8OnyryC5YIB6Qi4o5SEMUVQ2JmMHo4cJz0/uYbJXoT5peO0DKv/vb5Ook
 SznOxKhgvpj5w==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 shawnguo@kernel.org, ye.guojin@zte.com.cn, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-imx@nxp.com, linmq006@gmail.com, Xiubo Li <Xiubo.Lee@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20220511052740.46903-1-linmq006@gmail.com>
References: <20220511052740.46903-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
Message-Id: <165236477462.1016627.3973321279072799571.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:54 +0100
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

On Wed, 11 May 2022 09:27:40 +0400, Miaoqian Lin wrote:
> of_find_device_by_node() takes reference, we should use put_device()
> to release it. when devm_kzalloc() fails, it doesn't have a
> put_device(), it will cause refcount leak.
> Add missing put_device() to fix this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
      commit: ed46731d8e86c8d65f5fc717671e1f1f6c3146d2

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
