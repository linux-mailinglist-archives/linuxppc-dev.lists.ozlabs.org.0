Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF4489ADCA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 03:02:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HYazYNyp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VBv880bG1z3vZx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 11:02:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HYazYNyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VBNwf0vnjz3dwr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 16:20:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D4D5CE2777;
	Sat,  6 Apr 2024 05:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5A9C433C7;
	Sat,  6 Apr 2024 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712380828;
	bh=TBj/hcnPrvS19ZOluMZ12evt8AeDaDrUTBeM5kaTuKY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HYazYNypOS+iPe/PmwIZVgrP0OAjOmuWcCZaXmQBd5/DF3DU2Cm7HK1KTLKVM8W2j
	 EfdrhznuDsHvbEh7NeV1r2EDMVkxTqo+hmKt5MdFIcqj68UTB4u7gvHG6geAe3ArfV
	 cYxb7yc2nqhO3pPj8ToTFIgL78NntzPlzi3tNk1u8F7N5z7SqSGJ1Z/QhHbUaQaR1j
	 GTv/7bDPNNXqFXoXNMGCl3bjIAtmML/lX++bgYkRjXumLNf6dEzpQPrpxdPeyVgSKh
	 czfxRuHIWxcuBJ6wGSXEzVfHmRCYmRJdToESEDFulu3u4HF5IZUSSU3tkxxLhyQRAI
	 TbkNIwkM8MMRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 19C9BD84BAC;
	Sat,  6 Apr 2024 05:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/34] address all -Wunused-const warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <171238082809.31617.17365732495689756509.git-patchwork-notify@kernel.org>
Date: Sat, 06 Apr 2024 05:20:28 +0000
References: <20240403080702.3509288-1-arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailman-Approved-At: Sun, 07 Apr 2024 11:01:40 +1000
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
Cc: Shyam-sundar.S-k@amd.com, heiko@sntech.de, rafael@kernel.org, dri-devel@lists.freedesktop.org, benjamin.tissoires@redhat.com, srinivas.pandruvada@linux.intel.com, hch@lst.de, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-sound@vger.kernel.org, abbotti@mev.co.uk, linux-omap@vger.kernel.org, trond.myklebust@hammerspace.com, elder@kernel.org, kristo@kernel.org, chenxiang66@hisilicon.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, hsweeten@visionengravers.com, iyappan@os.amperecomputing.com, linux-crypto@vger.kernel.org, akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, alexandre.belloni@bootlin.com, markuss.broks@gmail.com, hvaibhav.linux@gmail.com, linux-i2c@vger.kernel.org, lars@metafoo.de, minyard@acm.org, deller@gmx.de, lee@kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, iommu@lists.linu
 x.dev, yisen.zhuang@huawei.com, lenb@kernel.org, andi.shyti@kernel.org, michael.hennerich@analog.com, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org, sboyd@kernel.org, jarkko@kernel.org, anna@kernel.org, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, jic23@kernel.org, linux-efi@vger.kernel.org, linux-iio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-fbdev@vger.kernel.org, kasan-dev@googlegroups.com, jirislaby@kernel.org, linux-rtc@vger.kernel.org, stf_xl@wp.pl, masahiroy@kernel.org, linux-staging@lists.linux.dev, linux-input@vger.kernel.org, ychuang3@nuvoton.com, keescook@chromium.org, arnd@arndb.de, jikos@kernel.org, robin.murphy@arm.com, rostedt@goodmis.org, nathan@kernel.org, broonie@kernel.org, mdf@kernel.org, openipmi-developer@lists.sourceforge.net, linux-nfs@vger.kernel.org, martin.petersen@oracle.com, dmitry.torokh
 ov@gmail.com, sre@kernel.org, peda@axentia.se, linux-stm32@st-md-mailman.stormreply.com, tony@atomide.com, liviu.dudau@arm.com, alexandre.torgue@foss.st.com, linux-ide@vger.kernel.org, peterhuewe@gmx.de, ardb@kernel.org, linux-leds@vger.kernel.org, herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, vkoul@kernel.org, linux-serial@vger.kernel.org, kuba@kernel.org, mhiramat@kernel.org, kvalo@kernel.org, john.allen@amd.com, netdev@vger.kernel.org, andersson@kernel.org, tiwai@suse.com, krzysztof.kozlowski@linaro.org, dlemoal@kernel.org, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  3 Apr 2024 10:06:18 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> [...]

Here is the summary with links:
  - [05/34] 3c515: remove unused 'mtu' variable
    https://git.kernel.org/netdev/net-next/c/17b35355c2c6
  - [19/34] sunrpc: suppress warnings for unused procfs functions
    (no matching commit)
  - [26/34] isdn: kcapi: don't build unused procfs code
    https://git.kernel.org/netdev/net-next/c/91188544af06
  - [28/34] net: xgbe: remove extraneous #ifdef checks
    https://git.kernel.org/netdev/net-next/c/0ef416e045ad
  - [33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR annotations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


