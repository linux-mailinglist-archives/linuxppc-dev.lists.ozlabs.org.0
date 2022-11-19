Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C9630CF9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 08:32:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDljd4LFWz3dvM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 18:32:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=seXipkg9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=patchwork-bot+chrome-platform@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=seXipkg9;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDkmv1s8vz3bgR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 17:50:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B256EB82713;
	Sat, 19 Nov 2022 06:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5944BC433D6;
	Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668840616;
	bh=ak6M5fgrTHQ1MM2vf+n5AubLq+AMYqmK/RRzz3/3gig=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=seXipkg9CAyFA9/DRpiD01V8ITXAB4g0Feuk+M72plAUXo40561rs1dMVurztjC0R
	 UGqXlOdf3JC5VrI2IWVezRWqsbHRKhLTyD3mEBicEAh2WBWvOY+SAmQ5aoJgjdz1Vk
	 5aq4YUvgNncdPRSw5IsP6xY0s8PudX8SdTsR/EyWyOmZxNi+pkZtOu70losD9BrvnB
	 Du21LerJzoVvVs4d9eSLNMvDcUU7T0jOw29zyRduMgSnRBWCRcfu03u6uXJN2UHbLy
	 DMpzJwBt86Z35Odc5hTd6y/3r7eqH4zheZmOWuKtOuYVHcjUBHn5l00sWabdAIfdsG
	 FRNiHf2EtKUDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37F78E29F44;
	Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
From: patchwork-bot+chrome-platform@kernel.org
Message-Id:  <166884061622.19423.870710096225259467.git-patchwork-notify@kernel.org>
Date: Sat, 19 Nov 2022 06:50:16 +0000
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cuwe=40kleine-koenig=2Eorg=3E?=@ci.codeaurora.org
X-Mailman-Approved-At: Sat, 19 Nov 2022 18:30:59 +1100
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, grant.likely@linaro.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, chrome-platform@lists.linux.dev, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, ang.iglesiasg@gmail.com, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@puri.sm, patches@ope
 nsource.cirrus.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, wsa@kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 18 Nov 2022 23:35:34 +0100 you wrote:
> Hello,
> 
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
> 
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> [...]

Here is the summary with links:
  - [512/606] platform/chrome: cros_ec: Convert to i2c's .probe_new()
    https://git.kernel.org/chrome-platform/c/f9e510dc92df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


