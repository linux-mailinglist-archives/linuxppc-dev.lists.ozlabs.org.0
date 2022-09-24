Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207515E8CAD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 14:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZTFP3DwPz3dpr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 22:42:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fjOn8i6t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fjOn8i6t;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZTDm4p5Gz3bqv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 22:42:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A8A960A56;
	Sat, 24 Sep 2022 12:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB10FC433D6;
	Sat, 24 Sep 2022 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664023333;
	bh=6iWK7MK63UXpCUFl7W57m3jhiTiWw7+4+ckgt+e0Lts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjOn8i6tQaf/A+OxVzTK+jqElgTlTWlTxWeN2RIMCAp8qYHIz6ChUbHzcJeHPlgWZ
	 H8AG3/5CGf1BxosP3gUgw0V4ZZxlbNIUKzT2m3qvrsed9HAxjZo2bCEIpNCOLEHfg1
	 k/TqzXbD0yryl8eaVn5StOaq+Amd9aAYvmI94sBrnkHJ8cVeih73gWCbbXC2ZtbExi
	 SkLUuue5oDGgqWgUWwxE3lunOiuiwya2ZRzDioZr0vpwya7lAq8EQArsdD64d+0TOc
	 y1Q67VmIO3d8FZALNL1D9knLvTnnXuqoSC52WI5q0VQ8moKLksPk4UnP0NaTMDN35o
	 ea8S/1mojVTog==
Received: by pali.im (Postfix)
	id 0F31C8A2; Sat, 24 Sep 2022 14:42:10 +0200 (CEST)
Date: Sat, 24 Sep 2022 14:42:09 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sinan Akman <sinan@writeme.com>
Subject: Re: [PATCH 0/7] powerpc/85xx: p2020: Create one unified machine
 description
Message-ID: <20220924124209.7vxsvfdoxbtntegs@pali>
References: <20220819191557.28116-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819191557.28116-1-pali@kernel.org>
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

Hello! Any comments for these patches?

On Friday 19 August 2022 21:15:50 Pali Rohár wrote:
> This patch series unifies all P2020 boards and machine descriptions into
> one generic unified P2020 machine description. With this generic machine
> description, kernel can boot on any P2020-based board with correct DTS
> file.
> 
> Tested on CZ.NIC Turris 1.1 board with has Freescale P2020 processor.
> Kernel during booting correctly detects P2020 and prints:
> [    0.000000] Using Freescale P2020 machine description
> 
> Pali Rohár (7):
>   powerpc/85xx: Mark mpc85xx_rdb_pic_init() as static
>   powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
>   powerpc/85xx: p2020: Move all P2020 machine descriptions to p2020.c
>   powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ callbacks
>   powerpc/85xx: p2020: Define just one machine description
>   powerpc/85xx: p2020: Enable boards by new config option CONFIG_P2020
>   powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string
> 
>  arch/powerpc/boot/dts/turris1x.dts            |   2 +-
>  arch/powerpc/platforms/85xx/Kconfig           |  22 ++-
>  arch/powerpc/platforms/85xx/Makefile          |   1 +
>  arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  25 +--
>  arch/powerpc/platforms/85xx/mpc85xx_rdb.c     |  46 +-----
>  .../platforms/85xx/{mpc85xx_ds.c => p2020.c}  | 144 +++++++-----------
>  6 files changed, 75 insertions(+), 165 deletions(-)
>  copy arch/powerpc/platforms/85xx/{mpc85xx_ds.c => p2020.c} (53%)
> 
> -- 
> 2.20.1
> 
