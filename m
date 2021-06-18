Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 573FE3AC25E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:32:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mGz6zhNz3ggf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4V0LzGz3c7N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:06 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4S5Qndz9t0k; Fri, 18 Jun 2021 14:23:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210528182752.1852002-1-nathan@kernel.org>
References: <20210528182752.1852002-1-nathan@kernel.org>
Subject: Re: [PATCH] powerpc/barrier: Avoid collision with clang's __lwsync
 macro
Message-Id: <162398828610.1363949.4994127237137922755.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:26 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 May 2021 11:27:52 -0700, Nathan Chancellor wrote:
> A change in clang 13 results in the __lwsync macro being defined as
> __builtin_ppc_lwsync, which emits 'lwsync' or 'msync' depending on what
> the target supports. This breaks the build because of -Werror in
> arch/powerpc, along with thousands of warnings:
> 
>  In file included from arch/powerpc/kernel/pmc.c:12:
>  In file included from include/linux/bug.h:5:
>  In file included from arch/powerpc/include/asm/bug.h:109:
>  In file included from include/asm-generic/bug.h:20:
>  In file included from include/linux/kernel.h:12:
>  In file included from include/linux/bitops.h:32:
>  In file included from arch/powerpc/include/asm/bitops.h:62:
>  arch/powerpc/include/asm/barrier.h:49:9: error: '__lwsync' macro redefined [-Werror,-Wmacro-redefined]
>  #define __lwsync()      __asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
>         ^
>  <built-in>:308:9: note: previous definition is here
>  #define __lwsync __builtin_ppc_lwsync
>         ^
>  1 error generated.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/barrier: Avoid collision with clang's __lwsync macro
      https://git.kernel.org/powerpc/c/015d98149b326e0f1f02e44413112ca8b4330543

cheers
