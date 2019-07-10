Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 514686495E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:11:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kN1c6QtpzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kMty29R8zDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45kMtx2lmXz9sPj; Thu, 11 Jul 2019 01:05:29 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9e005b761e7ad153dcf40a6cba1d681fe0830ac6
In-Reply-To: <20190705100144.28785-1-yamada.masahiro@socionext.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 1/2] powerpc/boot: add {get,
 put}_unaligned_be32 to xz_config.h
Message-Id: <45kMtx2lmXz9sPj@ozlabs.org>
Date: Thu, 11 Jul 2019 01:05:29 +1000 (AEST)
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-07-05 at 10:01:43 UTC, Masahiro Yamada wrote:
> The next commit will make the way of passing CONFIG options more robust.
> Unfortunately, it would uncover another hidden issue; without this
> commit, skiroot_defconfig would be broken like this:
> 
> |   WRAP    arch/powerpc/boot/zImage.pseries
> | arch/powerpc/boot/wrapper.a(decompress.o): In function `bcj_powerpc.isra.10':
> | decompress.c:(.text+0x720): undefined reference to `get_unaligned_be32'
> | decompress.c:(.text+0x7a8): undefined reference to `put_unaligned_be32'
> | make[1]: *** [arch/powerpc/boot/Makefile;383: arch/powerpc/boot/zImage.pseries] Error 1
> | make: *** [arch/powerpc/Makefile;295: zImage] Error 2
> 
> skiroot_defconfig is the only defconfig that enables CONFIG_KERNEL_XZ
> for ppc, which has never been correctly built before.
> 
> I figured out the root cause in lib/decompress_unxz.c:
> 
> | #ifdef CONFIG_PPC
> | #      define XZ_DEC_POWERPC
> | #endif
> 
> CONFIG_PPC is undefined here in the ppc bootwrapper because autoconf.h
> is not included except by arch/powerpc/boot/serial.c
> 
> XZ_DEC_POWERPC is not defined, therefore, bcj_powerpc() is not compiled
> for the bootwrapper.
> 
> With the next commit passing CONFIG_PPC correctly, we would realize that
> {get,put}_unaligned_be32 was missing.
> 
> Unlike the other decompressors, the ppc bootwrapper duplicates all the
> necessary helpers in arch/powerpc/boot/.
> 
> The other architectures define __KERNEL__ and pull in helpers for
> building the decompressors.
> 
> If ppc bootwrapper had defined __KERNEL__, lib/xz/xz_private.h would
> have included <asm/unaligned.h>:
> 
> | #ifdef __KERNEL__
> | #       include <linux/xz.h>
> | #       include <linux/kernel.h>
> | #       include <asm/unaligned.h>
> 
> However, doing so would cause tons of definition conflicts since the
> bootwrapper has duplicated everything.
> 
> I just added copies of {get,put}_unaligned_be32, following the
> bootwrapper coding convention.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9e005b761e7ad153dcf40a6cba1d681fe0830ac6

cheers
