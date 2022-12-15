Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B364E27A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 21:43:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NY41g2B65z3cDM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 07:43:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E3xlF6bU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E3xlF6bU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NY40g1fVYz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 07:42:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4585CB81AFA;
	Thu, 15 Dec 2022 20:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0694C433EF;
	Thu, 15 Dec 2022 20:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671136925;
	bh=d/a7C/PBOg8rdq9nwXwUdpRZ5tsLNSdSY3Squ2imeAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3xlF6bUMRnZWvVutOYkDDYPoagnHMfAjHcWy839UzoWE65h0njzkehIWK3rHiMFl
	 pFFVxTqJqLwGMWEH4DVNlk4yVHvfz6tvKF/Y6uIoo1y8pYyIy9DIkd1p5b7LzigHg7
	 n6EPWk3n6woOvhhKmT0M8USBykiEonQ9P0U8InbXyqZHSyLd5wurBcdSm8pKgCqXpF
	 5PTeCaHzp+F+wr844bzYtcdsKRBC9uOkObwyCxE2AwhpSmp4bpyNxEKMY/jUgjsrXz
	 872QztzTey9jImak0Ss0J4YGmhBBZQ1380yW6dMV3svniT6bDiz0YQDOjcShFbpfdT
	 ieAmiZVdYfVZg==
Received: by pali.im (Postfix)
	id 6DA4A5CD; Thu, 15 Dec 2022 21:42:02 +0100 (CET)
Date: Thu, 15 Dec 2022 21:42:02 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1] powerpc/64: Set default CPU in Kconfig
Message-ID: <20221215204202.mbw2ij4ou7t2ttpv@pali>
References: <3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu>
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

Hello!

On Wednesday 07 December 2022 14:38:40 Christophe Leroy wrote:
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
...
> @@ -166,11 +153,12 @@ CC_FLAGS_FTRACE += -mprofile-kernel
>  endif
>  endif
>  
> -CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> -AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> +CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
> +AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
>  
> -CFLAGS-$(CONFIG_E5500_CPU) += $(call cc-option,-mcpu=e500mc64,-mcpu=powerpc64)
> -CFLAGS-$(CONFIG_E6500_CPU) += $(call cc-option,-mcpu=e6500,$(E5500_CPU))
> +CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
> +				  $(call cc-option,-mtune=power9,	\
> +				  $(call cc-option,-mtune=power8)))
>  
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
>  
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
...
> @@ -251,6 +249,10 @@ config TARGET_CPU
>  	default "power8" if POWER8_CPU
>  	default "power9" if POWER9_CPU
>  	default "power10" if POWER10_CPU
> +	default "e500mc64" if E5500_CPU

Now I'm looking at this change again... and should not E5500_CPU rather
enforce -mcpu=e5500 flag? I know that your patch moves e500mc64 flag
from the Makefile to Kconfig, but maybe it could be changed in some
other followup patch...

Anyway, do you know what is e500mc64 core? I was trying to find some
information about it, but it looks like some unreleased freescale core
which predates e5500 core. ISA (without extensions like altivec) seems
to be same for e500mc64, e5500 and e6500 cores and difference is only
pipeline definitions in gcc config files. So if my understanding is
correct then kernel binary compiled with any of these -mcpu= flag should
work on any of those cores. Just for mismatches core binary will not be
optimized for speed.

> +	default "e6500" if E6500_CPU
> +	default "power4" if POWERPC64_CPU && !CPU_LITTLE_ENDIAN
> +	default "power8" if POWERPC64_CPU && CPU_LITTLE_ENDIAN
>  	default "405" if 405_CPU
>  	default "440" if 440_CPU
>  	default "464" if 464_CPU
> -- 
> 2.38.1
> 
