Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B049598AAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 19:47:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7slq0CCXz3dsM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 03:47:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tx55BSJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tx55BSJy;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7sl85Gxmz2ypC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 03:46:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3A5BEB8239D;
	Thu, 18 Aug 2022 17:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D27C433D7;
	Thu, 18 Aug 2022 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660844797;
	bh=jIxGaTBdcFMXEIeR82RMZMrQKs34LT+64kA5X48aaMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tx55BSJyXHEzf2EF+m5yjFgaajJ1e7uDdT58lCfd/w1pi5D6KhZCHh2bBJdA7q+YW
	 5d3YeR87e+gm/8Wtw69WxfppgGO0scVgMVEKXW+hlQ9ovnCNfgK6wcbrFD3U7KBsoE
	 PR/i2lrNQWqyCYapWpKPUVQZOqLDh2x5L6M+nmdbgm7TYZ6U56QcBCoyF+ZoGvFVwC
	 45tiYeH7r1Qe8i4jhMHJ8nLxzJ3LLeyCBiB7Z/MfTm755alq/QJXUKqPqXpDpjUg78
	 Q2UGhTFvN6IUkN2qfZEsvtJHZUqMBgcofEAUMecB0tTRS6w7BLbUglsQcVwYcNbkmf
	 hekEJ5SWco1Ig==
Received: by pali.im (Postfix)
	id A85E4622; Thu, 18 Aug 2022 19:46:34 +0200 (CEST)
Date: Thu, 18 Aug 2022 19:46:34 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 2/5] powerpc/32: Don't always pass -mcpu=powerpc to
 the compiler
Message-ID: <20220818174634.6nkzcztzn6uqcrzg@pali>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
 <d4df724691351531bf46d685d654689e5dfa0d74.1657549153.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4df724691351531bf46d685d654689e5dfa0d74.1657549153.git.christophe.leroy@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 11 July 2022 16:19:30 Christophe Leroy wrote:
> Since commit 4bf4f42a2feb ("powerpc/kbuild: Set default generic
> machine type for 32-bit compile"), when building a 32 bits kernel
> with a bi-arch version of GCC, or when building a book3s/32 kernel,
> the option -mcpu=powerpc is passed to GCC at all time, relying on it
> being eventually overriden by a subsequent -mcpu=xxxx.
> 
> But when building the same kernel with a 32 bits only version of GCC,
> that is not done, relying on gcc being built with the expected default
> CPU.
> 
> This logic has two problems. First, it is a bit fragile to rely on
> whether the GCC version is bi-arch or not, because today we can have
> bi-arch versions of GCC configured with a 32 bits default. Second,
> there are some versions of GCC which don't support -mcpu=powerpc,
> for instance for e500 SPE-only versions.
> 
> So, stop relying on this approximative logic and allow the user to
> decide whether he/she wants to use the toolchain's default CPU or if
> he/she wants to set one, and allow only possible CPUs based on the
> selected target.

Hello! Exactly same issue is still in file arch/powerpc/boot/Makefile:

  ifdef CONFIG_PPC64_BOOT_WRAPPER
  ifdef CONFIG_CPU_LITTLE_ENDIAN
  BOOTCFLAGS	+= -m64 -mcpu=powerpc64le
  else
  BOOTCFLAGS	+= -m64 -mcpu=powerpc64
  endif
  else
  BOOTCFLAGS	+= -m32 -mcpu=powerpc
  endif

It cause compile error:

  make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnuspe- mpc85xx_smp_defconfig uImage
  ...
    BOOTAS  arch/powerpc/boot/crt0.o
  powerpc-linux-gnuspe-gcc: error: unrecognized argument in option ‘-mcpu=powerpc’
  powerpc-linux-gnuspe-gcc: note: valid arguments to ‘-mcpu=’ are: 8540 8548 native
  make[1]: *** [arch/powerpc/boot/Makefile:231: arch/powerpc/boot/crt0.o] Error 1

> Reported-by: Pali Rohár <pali@kernel.org>
> Tested-by: Pali Rohár <pali@kernel.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Makefile                  | 26 +-------------------------
>  arch/powerpc/platforms/Kconfig.cputype | 21 ++++++++++++++++++---
>  2 files changed, 19 insertions(+), 28 deletions(-)
