Return-Path: <linuxppc-dev+bounces-16713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKheAmz+iGkY0QQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Feb 2026 22:21:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE210A2F2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Feb 2026 22:21:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8LP15GmFz2xMQ;
	Mon, 09 Feb 2026 08:21:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770585701;
	cv=none; b=E9mb1hXKtaHAzXg0w9U6zV77umnQXNprVEPt17Nl37UY7O7AXS6yqTAAIDl5tBGIUk7LthVGUpBv52S1Cvtz4hcBGLe/4iT3K4Ug9ULjC9rrGYgXplyyHHI5LSm0ZydnjiRS0pTZfAlrErwi28muFz4ay2roK97F/++C2FAFr1gx6Fd/ay844CJLfxnPms93X1mLiVqjP4esuA5aTpvXX57Q5E70h5Dl0JHBhVlVvyaTI2VJvkcZxpOsB4j8TB0+HVpNVOM1uRfnB30DZLWB87+KRfK3NZGo1YsWaSamzvi2LLro+zEX65iMcEbvo56Ejxs6AygIeJkYv/Uo1JgQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770585701; c=relaxed/relaxed;
	bh=3BrKi9yIdPU93oR5n7QCpvPkIx8nOF7iBBagrv0ShfY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fcvusXB/XpcwT6ZOLqgLjFSkgxga4eUJCPX3UimjpY6uQyi4cx0ZqGB4B2sonwp2Ud9cdjOv+CkwmdJd8gUmRIrEnl4yNTzrVnO8EXnZBCYUq2fbm52mro9l9OE1BWnYl5xinlzVmsqpVu6YInAEjU40FQLy9XAc1Bo+8Mt2/fUlIJnt5ddIaEKuqtryU1FiWmpdfAMVH406hpbmGOisnm4ozXlqxQKKCPwxgWOG9HdX40NDIO3ude1HU+5NQF3rWKnNFKz85u9FyD4ToPmFwxN3uwelaSdpjDRj6SUqZ5wQuuDZEekYwl+cKcLg4i/gtKJzhLjuHGhlig8bOBcEpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OL0cmPMG; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OL0cmPMG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8LP04G05z2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 08:21:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA8F4440B4;
	Sun,  8 Feb 2026 21:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A8BC4CEF7;
	Sun,  8 Feb 2026 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585692;
	bh=WniId9rylPyWCg6DYb8OFQ8yG1Mf1fld/+NjW0lsf8k=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OL0cmPMGq5hb4ML2UnBGJ7XL+Cd2QuvbF2LHCwzNxbt2D5NdVfL1HUi1K2BJFm7qe
	 FO6ErvhzO/VPNdM00QJdKkXJThRqPgNp7pgtPAQo/is0wG00tWKu3YsT/8AmKsB/1W
	 Zi1lF6Y52pNAoJeqjcGO58ozFPqmmkB78ZPpN5gF7Rm4ov7vZt63BXQhH90d9GhH+x
	 H91figU7ZpSIpGrvLTiHduM/rwS4K7YyONIs7mDupxe+jsBe89IhoDPyt9tfHYoH1B
	 st2sf9XgeYYZK0mZpaXpkvQ6oZ9d6j8K+a05oJGBzVFy/Pwc3s2M24i/5M6I0M6eHX
	 rdhZtuE3oXrrg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 0/4] ASoC: fsl_asrc: support the i.MX952 platform
Message-Id: <177058568882.654564.1085917355716546232.b4-ty@kernel.org>
Date: Sun, 08 Feb 2026 21:21:28 +0000
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16713-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org,nxp.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:shengjiu.wang@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 66DE210A2F2
X-Rspamd-Action: no action

On Fri, 06 Feb 2026 09:48:01 +0800, Shengjiu Wang wrote:
> Update dt binding document and update driver to suppot ASRC on i.MX952.
> 
> Changes in v4:
> - add Reviewed-by from Daniel in patch 2/4, 3/4
> - add Reviewed-by from Frank in patch 4/4
> - update the commit message for patch 4/4
> - remove 'retry' in patch 2/4, reduce the threshold for timeout.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
      commit: 37bb773b4a5a5107b92beda3447a7c6c0cfc1237
[2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
      commit: 83447a38ba9abac52bc110566d3e117753899f69
[3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
      commit: 6a8c6f5587337eceb387812b6f47bc16c125b883
[4/4] ASoC: fsl_asrc_dma: allocate memory from dma device
      commit: b010c782341b79edbeb80706360b772db908daa6

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


