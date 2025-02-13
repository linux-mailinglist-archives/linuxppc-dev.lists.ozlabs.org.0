Return-Path: <linuxppc-dev+bounces-6153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D7A34156
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 15:08:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ytxq70Xx7z2ysv;
	Fri, 14 Feb 2025 01:08:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739455698;
	cv=none; b=MqxSGyFMxb1lS7WVjIrqOuNewuhvvYZ9T5frA6Bz3cW/rRHZsueoIJOkH3tRmJIFHbT32IPVWBYbbB/DzZ0dsTwPz5iHX+5XN/M9iREZzo4Vmo2QWNM9ryMzzo7keol9So9q1hpbfAND6kbdzPl4a/GECnNb+z3gNiYOL2K7SwTIKQD6SyskMMRLYtwEqDj2Am2Vf18CX3rhhX4OCYe0JK2HVvJs1Zx8FWn2TBReoJgL2Iciv3LzyYvB5CDrRmW5ZUBsyOdvbfUKgFZuva4SmNVO+q+IMuk0tOzvAPaQYwTjsUWy4mYHyTJIKkMoo7v6rYx/zGEPaMyQGFpLA/9t1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739455698; c=relaxed/relaxed;
	bh=Ky9z3i//HxNN1rEzzLrAmwgawhY5/VW5Jt3EB1uhQY4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lGPin8DbDwtGTfU3uEhGUzikhuwVeZI+u0PCurYZ+0yABx3B/kGzVfSEPzv5JCRskuuSW3YMhd5RwiVHe6cGDfpuZkUBpqVkVq+Dmpkt8kyG8tOaP62J/HcpGLP4uHzrCbgq5FXWhLsuI5XMO9iDRiqgf7nfcxDGa6eHyStnoUTFBAl0ZxsuYDF8VcG3s0aKEIb/1QknZWBuqtKXIncCNsCAssLPG9zx/A89WDjvDFWqG4QlMB0vHWqTFtdvT4MF2Z/5GgPqO1Jqcd+ijSnrMU1S++WtyXh1FRWPH20ZOVB6mrQHNjBluq8G30SQGY7HWk06o3nLUGd4uWLOLIK1Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CPoSaAu2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CPoSaAu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ytxq54qfvz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 01:08:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16D30A42549;
	Thu, 13 Feb 2025 14:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EC5C4CED1;
	Thu, 13 Feb 2025 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739455694;
	bh=r1KafGyCz1KTAkGpi3NYt3q72aE3wU997ChKRQT9+AM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CPoSaAu2vf1OgUPzJOdAsLcl1QV6xnbgFfDsgeYR/nVzw6lK70tufn0ArfjSwWQh0
	 E+DtLhuP7n5LfrKtUkbw5zA2tef1lxMfN9NAtY5/GYGauvnPdgv+NZzQ8cymp8j9BA
	 HWqSOE6fdiHqroFWvZuOadrHwPTveSBpDQR1t3oMl3HOdrPNvCfcLqMDCGIJ0Y7y6z
	 rp7X2VZAvY0iRqZlBxBFfYyQ1D2YAHWtUrKnusP7XNWkrkFk/DCRUDkhFNdxp7DYcg
	 QCP2DRmsNnRSvabsRXlSaFaS5bY7TZj5pmis+4qBN2sQCTSqft3KINoejkMAUqDGwO
	 bPEST9AkKQaVw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250213070518.547375-1-shengjiu.wang@nxp.com>
References: <20250213070518.547375-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: imx-audmix: remove cpu_mclk which is from cpu
 dai device
Message-Id: <173945569179.146917.8081621260856817199.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 14:08:11 +0000
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 13 Feb 2025 15:05:18 +0800, Shengjiu Wang wrote:
> When defer probe happens, there may be below error:
> 
> platform 59820000.sai: Resources present before probing
> 
> The cpu_mclk clock is from the cpu dai device, if it is not released,
> then the cpu dai device probe will fail for the second time.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device
      commit: 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4

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


