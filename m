Return-Path: <linuxppc-dev+bounces-5186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38903A0C128
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 20:16:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX27D4tKkz3cft;
	Tue, 14 Jan 2025 06:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736795800;
	cv=none; b=fpqT+nsmCFHG1r4DOWfBqyjng3xOVsJbSNbAw+Eyu3GG6eyHPTtlI4XBLHvE7LdKsJByWnq31AN5emB65c3zVVwqqgJ54vdi6rItMrGiFr1zMUkAfkTvUZ4KE87OjXr6BBFe+Wtu3wzpQtlNySP5Kl12gU+JU8myW5/5KMWhpKGvpXO47TU4zYm5wLbd5YVspMfKuraIU/i3V+4TBybs2KbJaBXJ7lntBBPrc7myAPWXwvETgffw+Nc5bcB4Qhzf/8QlJUUsrZJJb1h99LAQ+kx+Fppvk/4NBRSQ+jwWuComEW+PpYs+2lnt4vmqGnWt0+rApsLP0C+CeSfcWuSFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736795800; c=relaxed/relaxed;
	bh=iRKafZnhe318xPPGla9O42esnhv1lpAH91Mj4XicyVI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L9Td25xemFLN5VlFGDkfoD+UqOkUP5b+CQF8lFzLzxUbQyRwbG2EzH9Ezl6bdIfScGlP3vGYrDtdITDntqDgbKz1t48k9hifXX72RVMmk7FTHI2VZfXETAfXNsrapfctBCo3tVVrjpEvxrTtNO3TPrO2LcgJQLccrVu3wgO4wVU4UKtpkiN0lmbZ65i/1eifKBakoagSlmpj0l1NxgA4hUb+OyeNVEJZn1Dxk+rlJu96xR7Aj0hUbc6Zc7pueuHJ1UnTAY+sMUpRRkqcdEovmlg6uet4FDRqGBgsxjM/HV3cOA6FbFzxBu8O4g9tjAJ8UOahnw4ZXgQbkhNjqUQL2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HPyVretU; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HPyVretU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX27C4910z30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 06:16:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C8BF5C5657;
	Mon, 13 Jan 2025 19:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD19C4CED6;
	Mon, 13 Jan 2025 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736795796;
	bh=9jUMB+ykRgFU94wAQYrBu1ygWssAQiefWbH8uqqCTcY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HPyVretUH6T6pORpFo+WF3jZ0aru5Z1UculBcYZhOOk3xOmksXxdsir/i6IdfuV5j
	 b18Y+4XlAw0GlBhSRTZlJbc7rBxsVO5w3Ks8tJThdbUVx123N8+fBWO921z8cP71ff
	 W+t5N825p+lyZ77WBE5U4lY6Uu0ZIfsks9aVLs4uK2hnF0p7V0vGfGKGevvVJO3eaM
	 1mh9s0h/cL4b0Wt39ruAct5GL1Uqa/jALLtBKnsfCvhMbAiDclUCZsjOXDDmbReDcP
	 vXPxODH1VClQQrVa7OBqiBGAml9my6vODfdHeI200GNdtyCIoVfrwN8zUPSyKIovMm
	 9RUhFOQlLR+yQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
References: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl: Support MQS on i.MX943
Message-Id: <173679579298.112994.9434417929541495183.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 19:16:32 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 17:03:19 +0800, Shengjiu Wang wrote:
> There are two MQS instances on the i.MX943 platform.
> The definition of bit positions in the control register are
> different. In order to support these MQS modules, define
> two compatible strings to distinguish them.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_mqs: Add i.MX943 platform support
>   ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_mqs: Add i.MX943 platform support
      commit: 6f490e6b2c34792e363685bacb48a759e7e40cd1
[2/2] ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform
      commit: a1a771e5f1e31e4764d9a225c02e93969d3f5389

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


