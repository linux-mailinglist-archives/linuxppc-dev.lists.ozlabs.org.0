Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B01BF676C41
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jan 2023 12:17:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P09gX613Xz3fHD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jan 2023 22:17:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iKDLgckX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iKDLgckX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P09fZ3JFXz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jan 2023 22:16:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 552E560BAA;
	Sun, 22 Jan 2023 11:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93361C433D2;
	Sun, 22 Jan 2023 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674386194;
	bh=AunzTGYzeDZG64eMKvwgrxj6opCJIB+kNltC35V7dE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iKDLgckXZPUfcjT9BWm7RPTZAhExTI2CqG9A/UoTHS0VvCjVAXxSja6QaO8f+lpZf
	 4igd4+XCik/q9UVQ4mXh58mG7izQ0wN0cAf6V9g+6t1UdBUxhUzqS3q27xk2Cwtd6f
	 rhWmXKs+m8OaCnbxBdcR4IqyCDM9eMTCUZRJdN+Qxkrps3tIm5KGAGagAx7uTNlAic
	 k/B7WHFt7zjg6mIHXYZo3jqrlEHgVd2UYon6uHLPmjSYjaqAwSgo4ipeNQL6rJUXlQ
	 RR+Iev3Q2UYXVGN/Us7sWDj6Xqg5++QWta0AYOmOyIMwVPZTLu1tn/Tdew9WFiYylh
	 HuAjWMj07IS4w==
Received: by pali.im (Postfix)
	id A3FFC93D; Sun, 22 Jan 2023 12:16:31 +0100 (CET)
Date: Sun, 22 Jan 2023 12:16:31 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>, Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: Re: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Message-ID: <20230122111631.dgw5uwtfjsqack57@pali>
References: <20221224211425.14983-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221224211425.14983-1-pali@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello! Do you have any comments for this patch series?

On Saturday 24 December 2022 22:14:17 Pali Rohár wrote:
> This patch series unifies all P2020 boards and machine descriptions into
> one generic unified P2020 machine description. With this generic machine
> description, kernel can boot on any P2020-based board with correct DTS
> file.
> 
> Tested on CZ.NIC Turris 1.1 board with has Freescale P2020 processor.
> Kernel during booting correctly detects P2020 and prints:
> [    0.000000] Using Freescale P2020 machine description
> 
> Changes in v2:
> * Added patch "p2020: Move i8259 code into own function" (separated from the next one)
> * Renamed CONFIG_P2020 to CONFIG_PPC_P2020
> * Fixed descriptions
> 
> Link to v1: https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
> 
> Pali Rohár (8):
>   powerpc/85xx: Mark mpc85xx_rdb_pic_init() as static
>   powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
>   powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
>   powerpc/85xx: p2020: Move i8259 code into own function
>   powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
>   powerpc/85xx: p2020: Define just one machine description
>   powerpc/85xx: p2020: Enable boards by new config option
>     CONFIG_PPC_P2020
>   powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string
> 
>  arch/powerpc/boot/dts/turris1x.dts        |   2 +-
>  arch/powerpc/platforms/85xx/Kconfig       |  22 ++-
>  arch/powerpc/platforms/85xx/Makefile      |   1 +
>  arch/powerpc/platforms/85xx/mpc85xx_ds.c  |  25 +--
>  arch/powerpc/platforms/85xx/mpc85xx_rdb.c |  46 +-----
>  arch/powerpc/platforms/85xx/p2020.c       | 193 ++++++++++++++++++++++
>  6 files changed, 215 insertions(+), 74 deletions(-)
>  create mode 100644 arch/powerpc/platforms/85xx/p2020.c
> 
> -- 
> 2.20.1
> 
