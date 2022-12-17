Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B187664F6B1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 02:11:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYnwf4R1zz3bZv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 12:11:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQAQYkJz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQAQYkJz;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYnvn39DXz2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 12:10:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 83429B81E4C;
	Sat, 17 Dec 2022 01:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A256C433D2;
	Sat, 17 Dec 2022 01:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671239424;
	bh=Qm/lVWvY5E4nVZ/Q+YcB9XTqpC6qJE2EwMv9F0W5Q2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQAQYkJzdhrp57gPVbOjQRmjth1uLBE320uqyXsqTW0slFz1tg6JqePJD1BavRmIV
	 8xt0e+KQ1M/3ewWtrkxSg24JHdLH1C/kckBlDrTxnOKRXDa7jPH4oiBMlULTyxPD7w
	 bBrkekdZzbtpsKUA2e2DbaiM8iLneDaOpYRDq6fMN9AcTU0FBjapf88inmErRIj2uq
	 A/le4q700JdH3oCLuXrizDFwKZQZfWW+1/jIhJ209lxhCg/kSevhiVhHwjYK6Qqvom
	 IQHC2YpwiUAaWj5JrHg2+8cIDDw0sfvAZnurnKgRxvCKupRhURQ5KX+Yzn9iqtj73G
	 n7S9XUA5D3AFg==
Received: by pali.im (Postfix)
	id 70565B01; Sat, 17 Dec 2022 02:10:21 +0100 (CET)
Date: Sat, 17 Dec 2022 02:10:21 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: Pass correct CPU reference to assembler
Message-ID: <20221217011021.zr4k2wqdh5nnryw7@pali>
References: <01fe73614988e2402a7526fb6b6e903bc3777bb5.1671179743.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01fe73614988e2402a7526fb6b6e903bc3777bb5.1671179743.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jan-Benedict Glaw <jbglaw@lug-owl.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 16 December 2022 09:35:50 Christophe Leroy wrote:
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index bf5f0a998273..528452ce80b4 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -201,18 +201,20 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
>  # often slow when they are implemented at all
>  KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
>  
> -cpu-as-$(CONFIG_40x)		+= -Wa,-m405
> -cpu-as-$(CONFIG_44x)		+= -Wa,-m440
>  cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
> -cpu-as-$(CONFIG_PPC_E500)		+= -Wa,-me500
> +
> +ifeq ($(CONFIG_TARGET_CPU),powerpc)
> +cpu-as-$(CONFIG_TARGET_CPU_BOOL)	+= -Wa,-mppc
> +else
> +cpu-as-$(CONFIG_TARGET_CPU_BOOL)	+= -Wa,-m$(CONFIG_TARGET_CPU)
> +endif

This change will break compilation for e500 cores. Kconfig sets
CONFIG_TARGET_CPU to string "8540" for e500 cores because gcc uses
-mcpu=8540 for e500 but GNU AS uses -me500 for e500 cores.
