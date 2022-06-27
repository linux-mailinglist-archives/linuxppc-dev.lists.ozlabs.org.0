Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AAE55BBFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 22:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWzvy2cLKz3cgW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 06:33:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FqX5yoDL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FqX5yoDL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWzvK1ZkBz3bll
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 06:33:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7ACF61780
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 20:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0A4C341CC;
	Mon, 27 Jun 2022 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656361992;
	bh=PpGb9nzERWRd0fU4h3E+hTdsSoxXS9SYCNSRtsuUbto=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FqX5yoDLM7sKVevDtlWXafjla7YHDufIDLPwILIga11TsCX441Iywq8rSWSXOFiK6
	 88+/ZFvdvKxF/ruP4+NqCbJlSymWw2Ppa3kzD3TXBMKdvVcGeLfNhIxnBisGclLMLg
	 8jSiznA5Y3djbos/UTTNYJV4Z5MYkDDjU+Vezufarj7keUttKiPHStnOYNJeLW2KW7
	 MGGn7ruzlaARAABC7e4Uf93lUbBChGrbNPS6E67NDmo6cYuzOLZWHgNbqVtBEv/+xp
	 z16A4oimU6yDu00QP9vSfNBTLd+FZPz10AcAmiN9VmBpuDT84EGLipdWDtwtm9ROld
	 uUd48taxwhBag==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220613121946.136193-1-broonie@kernel.org>
References: <20220613121946.136193-1-broonie@kernel.org>
Subject: Re: [PATCH] spi: mpc52xx-psc: Switch to using core message queue
Message-Id: <165636199122.4094756.6914973829832652160.b4-ty@kernel.org>
Date: Mon, 27 Jun 2022 21:33:11 +0100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jun 2022 13:19:46 +0100, Mark Brown wrote:
> We deprecated open coding of the transfer queue back in 2017 so it's high
> time we finished up converting drivers to use the standard message queue
> code. The mpc52xx-psc driver is fairly straightforward so convert to use
> transfer_one_message(), it looks like the driver would be a good fit for
> transfer_one() with a little bit of updating but this smaller change seems
> safer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mpc52xx-psc: Switch to using core message queue
      commit: 145cfc3840e5931a789a8e2e76af841ab4cad44b

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
