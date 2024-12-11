Return-Path: <linuxppc-dev+bounces-4001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E09ED9C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 23:32:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7r2w1QqRz30MM;
	Thu, 12 Dec 2024 09:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733956376;
	cv=none; b=iDq465INZTyK5ryeQJ8TsqkX9hMLiJa74CiB/5WsNevpFqUIo02SuDkMPhRv++FsmECS3ZjV7vDkbkKxnOJ7iVwcyddyXfC4j8FuZpD2C23H55x2AB1OYhqZJYmwMGY41LS4sdmQ17XokcTGimRFIK3fQylqjHllSBbMT7x82CcbbXKYfuhgllzIZbL7G/Bctv0+fQ3/A5RbDz04Y9ZF7+vu30gNo7jUmAa/ERKWc+Fs6P8VUwAHqSu9tfo67aejlC+KUjJWppJ2e2FFVaesM1LxpJYsvS9qXijoC0lPlVW7jS8hASXkHXq/TtBiMPUsgJjeH3q1oc46RtbJifyxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733956376; c=relaxed/relaxed;
	bh=MFkNZ+i21tlx6hz0vBlYSM97GY8K+YGsUZLUMrNxKW8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e+afqrUYr/0FlIAXD86NrcWTA9+GLlsUTOp6Dlr+vjdKhCmDq1lnHqT0iCuQszlad0rkgenYMMmekPAR6jcBRJ1AOL/FFHLm+VFI35RZ7AqwufJcezt2Zbja6ICSzinPcsPU9+JDF+sdPOBJ4zs4bjInAeQn3V9gSy2sTwAPGJt4ai2Kq8tG2lE2a2aYCueuXdF2QCzNSHO5YJTBnls3S1Wxin+9hM/1IX3PHHtbS0xn2f2nOeSdVfuIFgDRN/wBrG2dAitsTwwZNAg6P/SibVB+8B1euowtYi2RpaGdWrOPSt0g04jjLqWzQxGpaqj1r0sby+7aAmnO7WNjM/1JLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cqZ00nyo; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cqZ00nyo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7r2v2YY3z2yP8;
	Thu, 12 Dec 2024 09:32:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 110A35C67ED;
	Wed, 11 Dec 2024 22:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AB1C4CED3;
	Wed, 11 Dec 2024 22:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956373;
	bh=cVsBRq85rissDz94gS1APPLak1L31WJ3t5TGTSYE/as=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cqZ00nyo1Apj+jfDOCjAb0Dxj/1hdrSgL4z0d1BQUgbsnfyS1cxj2Bs3BmSupO9YI
	 ZrIs7UmW8cKEp43GKNoiniGEMwWKwmjdnER3WeCSCGcRBKWotkXLcx8jndR1TkSpRP
	 uiVGhMx/F4anBNn2cXEIgvbbMNAcLgjaLi7WcLTW60LB7hq+FQhuXx3i6Ic5UlnfEU
	 vzGsMum9i7o+4Bz2yDi5hvchzvThH3EecYX333iWDVqDeJrI5DcrWWqj0yc7VIBVVl
	 GPNr0CGIC5KgEmOa8jzIJQb3v4R6rhXRyTCF1prrQpAlkKDu/E5iMLuOrlL7ULHRg3
	 dPb253YfD0mvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CC8380A965;
	Wed, 11 Dec 2024 22:33:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173395638899.1729195.5401091299734997866.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:08 +0000
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 joel@jms.id.au, andrew@codeconstruct.com.au, christophe.leroy@csgroup.eu,
 herve.codina@bootlin.com, qiang.zhao@nxp.com, hasegawa-hitomi@fujitsu.com,
 lihuisong@huawei.com, linusw@kernel.org, kaloz@openwrt.org,
 kgugala@antmicro.com, mholenko@antmicro.com, gsomlo@gmail.com,
 zhuyinbo@loongson.cn, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, krzysztof.kozlowski@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, heiko@sntech.de,
 alim.akhtar@samsung.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 nm@ti.com, ssantosh@kernel.org, michal.simek@amd.com,
 andriy.shevchenko@linux.intel.com, duje.mihanovic@skole.hr,
 broonie@kernel.org, david.wu@rock-chips.com, jay.xu@rock-chips.com,
 jay.buddhabhatti@amd.com, radhey.shyam.pandey@amd.com,
 izhar.ameer.shaikh@amd.com, naman.trivedimanojbhai@amd.com,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Oct 2024 08:48:58 +0100 you wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Here is the summary with links:
  - soc: Switch back to struct platform_driver::remove()
    https://git.kernel.org/riscv/c/511c06e39035

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



