Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5F92532F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 17:08:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc8Q06pWgzDq9J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 01:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc8BG6xyDzDqJm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 00:58:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k0UgxfLH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bc8BD4W0sz9sTj;
 Thu, 27 Aug 2020 00:58:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598453909;
 bh=892/U6xU/zXzNeaF88c010Kk8eMNVMf1LHOMRICOCNo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=k0UgxfLHuY+25qrK+FhYOHDSjva/DV0RO9s8C6oopeFcoxsBe6MAuCxvJy4IIRv3D
 yLE1b+tMZRFspqxJVmLe7lFGPoL0u9oHNnva80oC5Zn4exvh+mRcwtNZW3aWfnXhK7
 lIECUS1fa/iFQijprpyacT0HJ+Op0ez3UAQA9mcR4ybDdSGOZ3izGLvlGl1YesFVbj
 CLedfwFUXk2re6j53FdonZApyp9qX4EU07rgEYHZx5yyew08SZJyaJccElwfRNR4CX
 eWCVkGo9PLjzcI0EFEo0YsASKmq5jG3TEydWoeKDuRGrv8aq6fDhy7IQ3y2UxAbhwb
 V3a4UTj78rdjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 4/9] powerpc/vdso: Remove unnecessary ifdefs in
 vdso_pagelist initialization
In-Reply-To: <834f362626e18bc36226f46ed4113c461a3ad032.1598363608.git.christophe.leroy@csgroup.eu>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
 <834f362626e18bc36226f46ed4113c461a3ad032.1598363608.git.christophe.leroy@csgroup.eu>
Date: Thu, 27 Aug 2020 00:58:26 +1000
Message-ID: <87ft89h2st.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
> index daef14a284a3..bbb69832fd46 100644
> --- a/arch/powerpc/kernel/vdso.c
> +++ b/arch/powerpc/kernel/vdso.c
> @@ -718,16 +710,14 @@ static int __init vdso_init(void)
...
>  
> -
> -#ifdef CONFIG_VDSO32
>  	vdso32_kbase = &vdso32_start;
>  
>  	/*
> @@ -735,8 +725,6 @@ static int __init vdso_init(void)
>  	 */
>  	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
>  	DBG("vdso32_kbase: %p, 0x%x pages\n", vdso32_kbase, vdso32_pages);
> -#endif

This didn't build for ppc64le:

  /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x0): undefined reference to `vdso32_end'
  /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x8): undefined reference to `vdso32_start'
  make[1]: *** [/scratch/michael/build/maint/Makefile:1166: vmlinux] Error 1
  make: *** [Makefile:185: __sub-make] Error 2

So I just put that ifdef back.

cheers
