Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8096D66C2A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 15:49:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwZgK2pP1z3cGm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 01:49:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C3n8BZx2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C3n8BZx2;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwZfL6ts9z3bY1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 01:48:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B64F7B80E37;
	Mon, 16 Jan 2023 14:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDAFC433EF;
	Mon, 16 Jan 2023 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673880534;
	bh=f2dRy9DEZaZXHnJafqlaDPBfDccF+ACeuVkBazxU81w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C3n8BZx2YcPLI0dyc51vJ14D/jLocX7Q7KwIlZ60SoZh22zWvskc8LF/4e3dALwtD
	 gupGf75oKXTrGXhMDlwj0sJxRywUHcFYeuEyIrHRwUbOvYPbrb+W8FTQ6l+TlW621w
	 GOJBflXeUnv9mdCigsXyVZMRvwKwYjzC4Vcfgb2NmhsYzdIPHXsxZod7xqWWb4yx30
	 5FqUV8IU1K/9R2WcekHPh+zNE1BNgXEVloS58OBcsuzsxMzJGcd7v4//2Avardp+YQ
	 cI0jpipGlhdksXD24uZcmPPded8UOmblkUp3czhzo4RtEYWS9tN8XJMkSCo6py568R
	 cS5iyz5CVvDqw==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1673852874-32200-1-git-send-email-shengjiu.wang@nxp.com>
References: <1673852874-32200-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: initialize is_dsp_mode flag
Message-Id: <167388053087.388539.12925338339363701914.b4-ty@kernel.org>
Date: Mon, 16 Jan 2023 14:48:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Jan 2023 15:07:54 +0800, Shengjiu Wang wrote:
> Initialize is_dsp_mode flag in the beginning of function
> fsl_sai_set_dai_fmt_tr().
> 
> When the DAIFMT is DAIFMT_DSP_B the first time, is_dsp_mode is
> true, then the second time DAIFMT is DAIFMT_I2S, is_dsp_mode
> still true, which is a wrong state. So need to initialize
> is_dsp_mode flag every time.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: initialize is_dsp_mode flag
      commit: a23924b7dd7b748fff8e305e1daf590fed2af21b

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
