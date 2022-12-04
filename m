Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8BF641C6F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 11:55:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQ3W71f15z3bgv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 21:55:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F2gRcFHC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F2gRcFHC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQ3V94DYpz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Dec 2022 21:54:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9ACFB8075D;
	Sun,  4 Dec 2022 10:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B6EC433D6;
	Sun,  4 Dec 2022 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670151291;
	bh=X4A+RwjSy9Fvo9Pl+xfw+79UYV7LUSUA43XMnWFe9Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2gRcFHCRvSYMXkIe40sYa8qSNGMfe5Pmqvuyorym/wMll96cwRVNwNB+TogVM8a5
	 P/znLwN+F6u1UyOyiMNSIGsFrzE/tBvLqL+wv7we3k+0LR5UdUd+MIpm6A6xv0Rno1
	 X9m/v3T/83LOsq6Wsae+il7NtaJh8q8dcgTV8FExMv+vWiUSy8Lp6PsNKflYYcjflB
	 Ne/TFg8ZlA6MFnmyaKC2eh5nQe19oYKC9Xbd+nSi3ou6x4RAaH8QwOk4M1SD4zbncC
	 5Jp/Mbm/g+ZFPU6EEEpnM622YFnG3D16MSyqFgp81LlTLB1UfBgoCWFo1XMOU7Z4Sc
	 +ygcuETtg1rig==
Received: by pali.im (Postfix)
	id 5EB17895; Sun,  4 Dec 2022 11:54:48 +0100 (CET)
Date: Sun, 4 Dec 2022 11:54:48 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 0/7] powerpc/85xx: p2020: Create one unified machine
 description
Message-ID: <20221204105448.twotgo4rjd4uk32x@pali>
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
Cc: Sinan Akman <sinan@writeme.com>, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Christophe, could you please summarize for me what is needed to change /
fix / adjust in this patch series? We had discussion about all patches
in this thread but I have not received reply for every my reaction. And
I'm not sure what to do and what not. So I can prepare a V2 version.

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
