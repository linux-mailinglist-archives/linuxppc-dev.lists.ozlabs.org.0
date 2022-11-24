Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77907637B72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 15:29:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJ0kT1L0zz3f3d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 01:29:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KTze8bCU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KTze8bCU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJ0jY4rtRz3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 01:28:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92F026216D;
	Thu, 24 Nov 2022 14:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2079CC433D6;
	Thu, 24 Nov 2022 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669300124;
	bh=vSDY92xmrOtkiq1FJrC4dGUzlqSkjlYU9twgxHBDx1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KTze8bCUgXVbYusj8LQGIka1dvsWB2I+DkxRW3Bbcfc8fJfFo5dmxKpg3PKgAjpOn
	 9avnZIur+o74XnCh3gVsMyELrZAQdXd6HCNoIUgHIirXltRyICOLVj51DmDrx0f04w
	 1AGD2KJyVMrzfgVJIQqdI4TdGPyqtrMb3yZ5g1UXHX19YLP72lEiTCyPJzQ9GIumj3
	 G3fEEXxlkAwuCO4fSjFARpiJpt2qdApa9WD0+DjEZ9l7DrBoB8kOlNXSTVKeBIgAoU
	 YJdQi+vG0JQnptu7goXssC91yOy/6Nbeg2WpJcQ9bEaBSQmawOISfd+9Ye4sBXr523
	 UQ93Sgymq7UOw==
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166930011683.316126.16580193554056109830.b4-ty@kernel.org>
Date: Thu, 24 Nov 2022 14:28:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, alsa-devel@alsa-project.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, patches@opensource.cirrus.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Nov 2022 23:35:34 +0100, Uwe Kleine-König wrote:
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[538/606] regulator: act8865-regulator: Convert to i2c's .probe_new()
          (no commit info)
[539/606] regulator: ad5398: Convert to i2c's .probe_new()
          commit: 7f69edba960bbdcbc829d8d0995b1117ce29e8b1
[540/606] regulator: da9121-regulator: Convert to i2c's .probe_new()
          commit: 020cf73b47414a84b666d3e6736a6ae957e27840
[541/606] regulator: fan53555: Convert to i2c's .probe_new()
          (no commit info)
[542/606] regulator: isl6271a-regulator: Convert to i2c's .probe_new()
          (no commit info)
[543/606] regulator: lp3972: Convert to i2c's .probe_new()
          commit: 2532d5f8d5c20d5a0a8a0d57a311bc5df00dea04
[544/606] regulator: lp872x: Convert to i2c's .probe_new()
          commit: 87feccb347b25f5dc6ff451123b832c9ad5dddfe
[545/606] regulator: lp8755: Convert to i2c's .probe_new()
          commit: cb28f74b4809a00b40fdf0c44ccf51ab950581d3
[546/606] regulator: ltc3589: Convert to i2c's .probe_new()
          commit: 78c8f6cdb51d471928d481ed3b2c82dbc110a1ed
[547/606] regulator: max1586: Convert to i2c's .probe_new()
          commit: 3d54f7ba248b0ad1791bc356e9ad3d9020a1c472
[548/606] regulator: max8649: Convert to i2c's .probe_new()
          commit: 3cf4417385d0ac8f02f22888e12a6d21d97d89fc
[549/606] regulator: max8660: Convert to i2c's .probe_new()
          commit: dbf31dac703009174226bb87b3914bd092040327
[550/606] regulator: max8952: Convert to i2c's .probe_new()
          commit: c20c36735949b3b7984692fbab3d92b0e8a845ec
[551/606] regulator: max8973-regulator: Convert to i2c's .probe_new()
          commit: 4e85e5d64f66ac5e4b0286ee4b6f8e8ce1044d42
[552/606] regulator: pca9450-regulator: Convert to i2c's .probe_new()
          commit: ed56fa6e804cb13bbe29e9214792308817f6e553
[553/606] regulator: pfuze100-regulator: Convert to i2c's .probe_new()
          (no commit info)
[554/606] regulator: pv88080-regulator: Convert to i2c's .probe_new()
          (no commit info)
[555/606] regulator: rpi-panel-attiny-regulator: Convert to i2c's .probe_new()
          commit: d85d02d17a608b558d44510e9824668c5d4fe5d8
[556/606] regulator: tps51632-regulator: Convert to i2c's .probe_new()
          commit: d4885f306304ff29eec06b9ad5f526a1099e0418
[557/606] regulator: tps62360-regulator: Convert to i2c's .probe_new()
          commit: 18804160277ec2ab992373385f86c6af2322b28b
[558/606] regulator: tps6286x-regulator: Convert to i2c's .probe_new()
          commit: e34782316281c78c5911f86d4699d4f35a607c9d
[559/606] regulator: tps65023-regulator: Convert to i2c's .probe_new()
          commit: 3b5b07dde998f6ade7433a8db019cf816c7e35af

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
