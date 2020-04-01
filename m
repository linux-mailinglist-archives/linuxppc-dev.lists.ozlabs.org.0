Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A45119AD07
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:43:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48snTk1JfpzDqQy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:43:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMz12kVzDr28
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMv6Sqjz9sTF; Wed,  1 Apr 2020 23:53:31 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 968339fad422a58312f67718691b717dac45c399
In-Reply-To: <20200325164257.170229-1-maskray@google.com>
To: Fangrui Song <maskray@google.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/boot: Delete unneeded .globl _zimage_start
Message-Id: <48smMv6Sqjz9sTF@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:31 +1100 (AEDT)
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
Cc: clang-built-linux@googlegroups.com,
 Nick Desaulniers <ndesaulniers@google.com>, Joel Stanley <joel@jms.id.au>,
 Fangrui Song <maskray@google.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-03-25 at 16:42:57 UTC, Fangrui Song wrote:
> .globl sets the symbol binding to STB_GLOBAL while .weak sets the
> binding to STB_WEAK. GNU as let .weak override .globl since binutils-gdb
> 5ca547dc2399a0a5d9f20626d4bf5547c3ccfddd (1996). Clang integrated
> assembler let the last win but it may error in the future.
> 
> Since it is a convention that only one binding directive is used, just
> delete .globl.
> 
> Fixes: cd197ffcf10b "[POWERPC] zImage: Cleanup and improve zImage entry point"
> Fixes: ee9d21b3b358 "powerpc/boot: Ensure _zimage_start is a weak symbol"
> Link: https://github.com/ClangBuiltLinux/linux/issues/937
> Signed-off-by: Fangrui Song <maskray@google.com>
> Cc: Alan Modra <amodra@gmail.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: clang-built-linux@googlegroups.com

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/968339fad422a58312f67718691b717dac45c399

cheers
