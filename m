Return-Path: <linuxppc-dev+bounces-16338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG3CHEJ8eWldxQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 04:02:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 426549C747
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 04:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f16Wc2Xnrz2xjK;
	Wed, 28 Jan 2026 14:02:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769569340;
	cv=none; b=PHrsZ8NxecC+SWoF4oE6qPjArAOq7M1/lIk58KcB0sq64ZHg73+u34f7o2CLsSSkuyQLfMuTnMKokcYARntj/+iurI9FyipyJSafrfg7s92VtII/r6iJKaUPfsghIUyQevmnNFjiupgelkh3dOfvvy2u+zOdNGP2mS1S4yIsRvVhawJhRpfCNVIW3CzioXch0OaOo3+Cct13d7QruR+mrI/NdoZEtR6SlCk5lXeMSMPsAqRwaAIanRjRfdiPKiChxc8xUWser5P7wh7JJnmNTHdKNFxPvHrQ00o54XVFgwfAjfWEye3DiIGBJtC2SmG7PHojuTVQ15p6EQ2Vt5WdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769569340; c=relaxed/relaxed;
	bh=11LjQZs7Jg6KN/lPD+EdYnoLZC1e/r9eYLPs7UXOZ/0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f90bd6XKPYvastKLguKX12djCCwRmr1Q+H5spLfL9rG26pA7DYVdMxynpTUGNQorJe9wQSVYp0Lu6bcsnhBIzxcbSjnatTok5MKCYh9wUZiz1H9Qi3YHQUTlnNbMMuMMu7Pa4kHWhHDxz3487mHxSmrGPFqRIayjrfNcd+j7IIxg5EDnsh4J20nrp7aEY7D3IDq/ITXYmSlq6MjSMGsLWBvRvKVB9xSZxrC1Sz6Kn2SFGmDdENt1EBSPTorQ/G8EMtJE9K/SJebIT20krIwffehQc9PwbA1zz3SRxjfFmN/P212pOfoPycjMfF2k71KT7MNEoGBUlYwZmx3JM1hkTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SEK4aTxJ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SEK4aTxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f16Wb2h6Bz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 14:02:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B7EA60007;
	Wed, 28 Jan 2026 03:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E8DC116C6;
	Wed, 28 Jan 2026 03:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569336;
	bh=i0/csCwZU0v5d+zAzQkM4cSs7zUQWkjnC/H7rL+YtSo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SEK4aTxJAdkH8SyjzWKmABDtsz0stSBCdthsCALme8UvCk/GoSLBvbL36/0OFY1dU
	 RF/5q8H70kJBqVapBYJ7W6K4kzPqh2c9TnMd3/EIChExsfU5V4bG5y4AxjrFAqv+W8
	 rIs+e8fVIThjD6m2A2PoTynujyeBIxbICAuzPb/RgME48DfnObUMUOw7woHea9N4++
	 1fc5IT1HkRh9jZom0LP3uUDWp5DzepIX0FhMFZSwT2qvVmsKrLlP6i9A5Rxkv/ae5F
	 0iDTGj7ISTgeaCuguRFJgz/WLZNNYImV/p9Pl2C+WX8z7lOhCn8B2M2PFJTaXXiEFy
	 qjBMQbcj835nw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
References: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 0/4] ASoC: fsl_audmix: Support the i.MX952 platform
Message-Id: <176956933264.1515833.4946244987105746224.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:12 +0000
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
	TAGGED_FROM(0.00)[bounces-16338-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,kernel.org,pengutronix.de,lists.linux.dev,lists.infradead.org,nxp.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiu.wang@nxp.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 426549C747
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 16:24:57 +0800, Shengjiu Wang wrote:
> Enable AUDMIX on i.MX952 platform, update dt binding document and
> driver.
> 
> SAI is connected to AUDMIX, and the AUDMIX can be bypassed, so
> add 'fsl,sai-amix-mode' property in SAI binding document for this
> case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
      commit: 7550d6263b9b2015a806f66bf7ad356b6f25d050
[2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode support on i.MX952
      commit: 4d3b56b8a3504dab98d5f9a91ed9091431749863
[3/4] ASoC: fsl_audmix: Add support for i.MX952 platform
      commit: 291f2f908823832e932582500816ad614631d568
[4/4] ASoC: fsl_sai: Add AUDMIX mode support on i.MX952
      commit: 19b08fd23b20593ebe43708308dbddb02507877d

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


