Return-Path: <linuxppc-dev+bounces-14502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD6C89E51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 14:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGfqb0yXxz2yvH;
	Thu, 27 Nov 2025 00:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764162171;
	cv=none; b=LYQnl+Q2zpWUqxSADreouzAg1xjzUz/VZ4h4OGSBPHCCfTR5PRb8iGbXIT0S64o2nLSrfAUBJi92KgSAp7GJU4MjG5XfJaj8sbAXENVqKygg3km9uCepZ3Vkh33GGqo9JTEChxCofFG/HknF04Trqsqp9WeIuG+RSQiAIb94Yc3H9ChF0gwvjJRmXq0xXlVTaYrHfwINLoaEXaU2s0nGDBrBdSoo+J3YlNBOKsXYceUGy79vJX9ljaFU4YDKTTfEb4yIUL9xZGg+ILsFCeW5P4SeNShQstOpp0RdkjivGWgOcUvIqzz+PBc8yXvAQxbES18wmRarOSuoOhjI/eXPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764162171; c=relaxed/relaxed;
	bh=eAnVB8itKCFFe8FATBrG68P4F+xIYW6+ornW24yOISo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FpwiDuDWmzZMWXsXDay03qx+yknlvtiT62xcjOG/NVwFsg9GlwCluaqdS+2cYttwL11Uu2QYPlcYHWzXqe770UojF/gyTRM4ETLdDuD/le0p969DIkf9KeVV7j386RUeSeMvBlGLF37Evq2qSjgF6YPIlK6uu34A4AkWDtGWzV0ICrspZXnNSN6yyWqKTRKoDQspZg0b6crrFg8LRDaVuFmNzOOG2A84D8F+XwyfjsDA6uw2EjK/nUihLV/OpN8SxP3lL6yJjgWafH7Ccxs6dLgUjjVIRC3W/4fGBwRzCBctA/5hrzCeD2PjfuWMWnqAdd9T8cYuErgjhK4HvygQHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s7PbJf+E; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s7PbJf+E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGfqZ1XWxz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 00:02:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D341040BF0;
	Wed, 26 Nov 2025 13:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DFFC113D0;
	Wed, 26 Nov 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764162167;
	bh=Pv1DD7DetDKWpXJjUIzZS+kNyekhWzaGdR9V6dQ1lSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s7PbJf+E4SDRC2D0XfPvbIEpYtT0pTSgQ47ofMQhfKk/3YV4kNZMT09vrcGXspfrG
	 lZPKEJl7fRtyLKQ2JQ/Y+3DR3y06ZB5vEjBQWA/xbSenne7PuzNwGhTVFiSSQR8ej0
	 uqIpxSVEuz3NyhYJhK70NceMqY0HKbxM8KQ/3ZcbiQB2BjZhHRnE+P/c/7h3lK8RUA
	 Xl1VLHjg+5S4j6ph/476AJjRRHrKbIkjzU06DXtjjZWVrFCzF2ndDZjCz8s3leX0dS
	 OZ9YI1elsfX4WKXmoBrqymJBMdDQqAu/n4k2kHKUlG+KHdVNT74rhxVFnAXcdp3gSV
	 EdXvaRw6wGMEg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
References: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing
 dev_err() + return
Message-Id: <176416216545.27907.3407998751782960343.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 13:02:45 +0000
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
X-Mailer: b4 0.15-dev-88d78
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 25 Nov 2025 11:13:33 +0100, Alexander Stein wrote:
> Use dev_err_probe() to simplify the code. This also silences -517 errors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return
      commit: 8ae28d04593a5fdddb16d3edcdabb8d1e4330d0b

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


