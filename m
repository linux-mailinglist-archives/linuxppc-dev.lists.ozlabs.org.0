Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB282B72A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 00:49:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbN2m5nMrzDqYL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 10:49:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbMyt3C5yzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 10:46:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MN7PA4Dc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbMyr6430z9sSn;
 Wed, 18 Nov 2020 10:46:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605656773;
 bh=AMrA3+pg0LMhouKa556X8tMX0lNqK/li/UDTQcX3xZU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MN7PA4DcqRWgzqoi0ANOFE3bvUZHVsPDFAjJ00ebAwcWgILEiYwbkr13ef/C47D2I
 R71A+RafewqwMn/KswXWi5sUluMERYnCpggL/tCc2S9tkN5nQxp4Ei76SGrxiFgVaa
 Zk5aU7IToEwOcvl/A5MnP/k4CgCIAtNo5W/aGM9j3XlzGS2nBCJtRurL3zguxZ57d8
 4XIAOh7CEM9bYoYKbb6X5Za8jib9snfUmoTBeJHnopgZSKnKm+21/fXwc4W3bZL6FD
 rvoSQrPkGbl+8GaQ2ANS6R8kqW90IE4cuiHq/9OEai0TY/LUBxs+9U+J8D/Hw0VTIi
 ujCpuXmQZXC9g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 1/3] powerpc: boot: include compiler_attributes.h
In-Reply-To: <20201116043532.4032932-2-ndesaulniers@google.com>
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-2-ndesaulniers@google.com>
Date: Wed, 18 Nov 2020 10:46:06 +1100
Message-ID: <87o8jv35tt.fsf@mpe.ellerman.id.au>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers <ndesaulniers@google.com> writes:
> The kernel uses `-include` to include include/linux/compiler_types.h
> into all translation units (see scripts/Makefile.lib), which #includes
> compiler_attributes.h.
>
> arch/powerpc/boot/ uses different compiler flags from the rest of the
> kernel. As such, it doesn't contain the definitions from these headers,
> and redefines a few that it needs.
>
> For the purpose of enabling -Wimplicit-fallthrough for ppc, include
> compiler_types.h via `-include`.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> We could just `#include "include/linux/compiler_types.h"` in the few .c
> sources used from lib/ (there are proper header guards in
> compiler_types.h).
>
> It was also noted in 6a9dc5fd6170 that we could -D__KERNEL__ and
> -include compiler_types.h like the main kernel does, though testing that
> produces a whole sea of warnings to cleanup. This approach is minimally
> invasive.
>
>  arch/powerpc/boot/Makefile     | 1 +
>  arch/powerpc/boot/decompress.c | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
