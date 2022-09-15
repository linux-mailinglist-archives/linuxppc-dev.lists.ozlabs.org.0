Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB125B977A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 11:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSsRc13W6z3bsS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 19:32:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sQNuhjeN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sQNuhjeN;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSsQy1Kq5z3052
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 19:31:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4F731CE1ABD;
	Thu, 15 Sep 2022 09:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DB5C433D7;
	Thu, 15 Sep 2022 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663234293;
	bh=+H67WghLWWeD/FzwU6ijZ9dc+DOFpnXlZHulNlDyqh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sQNuhjeNl2CTzNfZv05/FS/3/7tCMlwLsu1ox7CrnSi8oMHe0lWAkJki2OCr3ZYqs
	 Bj/lSUMp4hmQw9Ss8ziYVsB70Tf9LF1lO6/Vqb+IwvisVKk89ZlD0yiiXiprzQ98dj
	 qAuj1rcJEtcAGaiOtarawUZzPBJhSqyHf7xzR86FT+zujbBvxHy0gqy7ajIM09eL09
	 5Z41DQtkGcGhUODCdj7bMMR0l9UEVnpcd5nELOUsYRzTloEY6KXhj9xOpuKV/N9mog
	 mkvFbgAUYVvJ9JNvr6P2dJqFZ8OTF6USPaGobTbr/7zMMrfBNslQ6qgXDji3FmH0Qj
	 TVaRtflOjao/w==
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <753266abafe81722d86c3ddb8bac8ef1cb00fe8c.1660829841.git.christophe.leroy@csgroup.eu>
References: <753266abafe81722d86c3ddb8bac8ef1cb00fe8c.1660829841.git.christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1] spi: fsl_spi: Convert to transfer_one
Message-Id: <166323429229.2397913.17024770218235834185.b4-ty@kernel.org>
Date: Thu, 15 Sep 2022 10:31:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Aug 2022 15:38:37 +0200, Christophe Leroy wrote:
> Let the core handle all the chipselect bakery and replace
> transfer_one_message() by transfer_one() and prepare_message().
> 
> At the time being, there is fsl_spi_cs_control() to handle
> chipselects. That function handles both GPIO and non-GPIO
> chipselects. The GPIO chipselects will now be handled by
> the core directly, so only handle non-GPIO chipselects and
> hook it to ->set_cs
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/1] spi: fsl_spi: Convert to transfer_one
      commit: 64ca1a034f00bf6366701df0af9194a6425d5406

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
