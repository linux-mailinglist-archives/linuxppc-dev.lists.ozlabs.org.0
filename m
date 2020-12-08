Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9992D2FCD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 17:37:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr5Rw3BXczDqbx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 03:37:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr5Ps4Nx4zDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 03:35:13 +1100 (AEDT)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, krzk@kernel.org, mripard@kernel.org,
 benh@kernel.crashing.org, emil.l.velikov@gmail.com,
 alexandre.belloni@bootlin.com, mpe@ellerman.id.au,
 linux-parisc@vger.kernel.org, paulus@samba.org,
 nicolas.ferre@microchip.com, tony@atomide.com, sam@ravnborg.org,
 linux@armlinux.org.uk, ludovic.desroches@microchip.com, soc@kernel.org,
 James.Bottomley@HansenPartnership.com, will@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, daniel.thompson@linaro.org,
 jernej.skrabec@siol.net, linux-arm-kernel@lists.infradead.org,
 deller@gmx.de, tsbogend@alpha.franken.de, catalin.marinas@arm.com,
 wens@csie.org, linux-mips@vger.kernel.org, lee.jones@linaro.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
Date: Tue,  8 Dec 2020 17:34:46 +0100
Message-Id: <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:29:17 +0000, Andrey Zhizhikin wrote:
> Since the removal of generic_bl driver from the source tree in commit
> 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") BACKLIGHT_GENERIC config option became obsolete as well and
> therefore subject to clean-up from all configuration files.
> 
> This series introduces patches to address this removal, separated by
> architectures in the kernel tree.
> 
> [...]

While my plan was to only take the arm specific patches, it seems
nobody else has applied the other architecture specific ones,
but there have been a lot of Acks. Also, b4 makes it easy to
merge the entire branch, so I'll just take all of these.

Applied to arm/defconfig, thanks!

[1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
      commit: 0437141b4e2233ae0109a9584e7a003cd05b0a20
[2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
      commit: 717c4c8336486781630893508b3347ae18953fae
[3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
      commit: 2257682282531de45929c6006152f6e2ee881b42
[4/5] parisc: configs: drop unused BACKLIGHT_GENERIC option
      commit: 4e9c44b128d3eb5da129e53c7312240f838c2dbf
[5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
      commit: 4985c506303fb6a41a885d503a6e1f3d3126431d

       Arnd
