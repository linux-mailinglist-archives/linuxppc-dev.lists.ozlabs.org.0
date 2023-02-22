Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA469FAEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 19:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMPfk1XJJz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 05:23:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=okC9wkxZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=okC9wkxZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMPdq2cn7z3bWq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 05:22:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B5E860C5B;
	Wed, 22 Feb 2023 18:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57A0C433D2;
	Wed, 22 Feb 2023 18:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677090155;
	bh=CzIR8pGHHiNEiEpf6Yh2H8j5zj5EVQGwTE29uy1k9eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okC9wkxZB+0MdfKesGUBqtFLaECvBpkOWvsCxp2//TFTiQ16yo+mukiMxWlnkSbDL
	 HUiJ4OtDUo7R3zc1OrkS+K/uroN3BSrxCzefijQTNcCo0x/pr+cnQHU/EeIwBssz3+
	 sPVBsxK5Esl/1m/x7rXE1J/fBu4NiquwLuNSDz3DfR/A+aivKEGK08DHDWeQA18qku
	 aVmsK+KdGBgk6eFR2qfgx5K+46v31/97+rRFCDu/0dhJJXuej1ArcFP/exU5a9ZxSm
	 UA9LTI3DWavrfd+Jl8VsVsGK3LNH47f3wu5OQrw3U0V26x6k9LsqZ9Hu3nKOk2jkTR
	 XZb+lby9aS5mA==
Received: by pali.im (Postfix)
	id 1CD0172C; Wed, 22 Feb 2023 19:22:32 +0100 (CET)
Date: Wed, 22 Feb 2023 19:22:32 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 00/17] powerpc/85xx: p2020: Create one unified machine
 description
Message-ID: <20230222182232.uiiwy5pd5n5xc5kl@pali>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday 22 February 2023 15:42:47 Christophe Leroy wrote:
> This patch series unifies all P2020 boards and machine descriptions into
> one generic unified P2020 machine description. With this generic machine
> description, kernel can boot on any P2020-based board with correct DTS
> file.
> 
> Tested on CZ.NIC Turris 1.1 board with has Freescale P2020 processor.
> Kernel during booting correctly detects P2020 and prints:
> [    0.000000] Using Freescale P2020 machine description
> 
> Changes in v4:
> * Added several preparatory cleanup patchs
> * Minimised churn by not duplicating helpers at the first place
> * Split main patch in two
> * Dropped patchs 1 and 2
> * Untested beyond basic build test

Changes looks good. I'm happy with them. You can add my:

Reviewed-by: Pali Rohár <pali@kernel.org>

> Changes in v3:
> * Use 'if (IS_ENABLED(CONFIG_PPC_I8259))' instead of '#ifdef CONFIG_PPC_I8259'
> * Simplify p2020_probe()
> * Patches generated by -M and -C git options
> 
> Link to v2: https://lore.kernel.org/linuxppc-dev/20221224211425.14983-1-pali@kernel.org/
> 
> Changes in v2:
> * Added patch "p2020: Move i8259 code into own function" (separated from the next one)
> * Renamed CONFIG_P2020 to CONFIG_PPC_P2020
> * Fixed descriptions
> 
> Link to v1: https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
> 
> Christophe Leroy (9):
>   powerpc/fsl_uli1575: Misc cleanup
>   powerpc/85xx: Rename setup_arch and pic_init on p1023
>   powerpc/85xx: Remove DBG() macro
>   powerpc/85xx: Remove #ifdefs CONFIG_PCI in mpc85xx_ds
>   powerpc/85xx: mpc85xx_{ds/rdb} compact the call to mpic_alloc()
>   powerpc/85xx: mpc85xx_{ds/rdb} replace BUG_ON() by WARN_ON()
>   powerpc/85xx: mpc85xx_{ds/rdb} replace prink by pr_xxx macro
>   powerpc/85xx: Remove #ifdefs CONFIG_PPC_I8259 in mpc85xx_ds
>   powerpc/85xx: Remove #ifdef CONFIG_QUICC_ENGINE in mpc85xx_rdb
> 
> Pali Rohár (8):
>   powerpc/85xx: p2020: Move all P2020 DS machine descriptions to p2020.c
>   powerpc/85xx: p2020: Move all P2020 RDB machine descriptions to
>     p2020.c
>   powerpc/85xx: p2020: Move i8259 code into own function
>   powerpc/85xx: mpc85xx_ds: Move PCI code into own file
>   powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
>   powerpc/85xx: p2020: Define just one machine description
>   powerpc/85xx: p2020: Enable boards by new config option
>     CONFIG_PPC_P2020
>   powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string
> 
>  arch/powerpc/boot/dts/turris1x.dts         |   2 +-
>  arch/powerpc/include/asm/ppc-pci.h         |   2 +
>  arch/powerpc/platforms/85xx/Kconfig        |  22 +++-
>  arch/powerpc/platforms/85xx/Makefile       |   5 +-
>  arch/powerpc/platforms/85xx/mpc85xx.h      |  12 ++
>  arch/powerpc/platforms/85xx/mpc85xx_8259.c |  78 ++++++++++++
>  arch/powerpc/platforms/85xx/mpc85xx_ds.c   | 133 ++-------------------
>  arch/powerpc/platforms/85xx/mpc85xx_mds.c  |   7 --
>  arch/powerpc/platforms/85xx/mpc85xx_rdb.c  |  79 ++----------
>  arch/powerpc/platforms/85xx/mpc85xx_uli.c  |  64 ++++++++++
>  arch/powerpc/platforms/85xx/p1023_rdb.c    |   8 +-
>  arch/powerpc/platforms/85xx/p2020.c        |  95 +++++++++++++++
>  arch/powerpc/platforms/fsl_uli1575.c       |   6 +-
>  13 files changed, 301 insertions(+), 212 deletions(-)
>  create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_8259.c
>  create mode 100644 arch/powerpc/platforms/85xx/mpc85xx_uli.c
>  create mode 100644 arch/powerpc/platforms/85xx/p2020.c
> 
> -- 
> 2.39.1
> 
