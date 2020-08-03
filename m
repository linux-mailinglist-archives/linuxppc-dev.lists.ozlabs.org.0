Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A878123A314
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:06:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKw6h4q6LzDqWY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 21:06:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKw500R6DzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 21:04:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Gpjvtzg6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKw4z5Yvtz9sRN;
 Mon,  3 Aug 2020 21:04:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596452675;
 bh=65/JTdsbcn98wboRzsKH235UV4GA3bgs4kodUfKKoFc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Gpjvtzg6r3lJak0Jym/an2ybJqMVwmngme2PJTsa6924TLMCoojyjp2Xti52whAyF
 c/iarL+vXvwmxoKhbUqT/BB7ip/CrMURRHVU6QfDeHuyx/+gcmARxWsTy/uyXx6WOi
 9GV2d2j1i4KM31UrzWGgQ5spA98UwaoTrabHlbCGD80N/0ricSPkKcsuViJQoCEfHr
 v/70YtbaIRZwTYJAfPklR2cZWHDyrOVNeD2H/CVWJGGyn85wc6DZ08W9NVwSF99f8b
 UPSKDGOHXUl+WKxL0soiENGpNzJVgl3OVuLhMAW26sbQvtCXU5+SC70HZkqrRQS/VB
 pjwTXd6QbD0NQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH v2] selftests/powerpc: Fix pkey syscall redefinitions
In-Reply-To: <566dde119ce71f00f9642807ba30ceb7f54c9bfa.1596441105.git.sandipan@linux.ibm.com>
References: <566dde119ce71f00f9642807ba30ceb7f54c9bfa.1596441105.git.sandipan@linux.ibm.com>
Date: Mon, 03 Aug 2020 21:04:35 +1000
Message-ID: <8736540z3w.fsf@mpe.ellerman.id.au>
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
Cc: sachinp@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> On some distros, there are conflicts w.r.t to redefinition
> of pkey syscall numbers which cause build failures. This
> fixes them.
>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
> Previous versions can be found at:
> v1: https://lore.kernel.org/linuxppc-dev/20200803074043.466809-1-sandipan@linux.ibm.com/
>
> Changes in v2:
> - Fix incorrect commit message.
>
> ---
>  tools/testing/selftests/powerpc/include/pkeys.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
> index 6ba95039a034..26eef5c1f8ea 100644
> --- a/tools/testing/selftests/powerpc/include/pkeys.h
> +++ b/tools/testing/selftests/powerpc/include/pkeys.h
> @@ -31,8 +31,13 @@
>  
>  #define SI_PKEY_OFFSET	0x20
>  
> +#undef SYS_pkey_mprotect
>  #define SYS_pkey_mprotect	386

We shouldn't undef them.

They should obviously never change, but if the system headers already
have a definition then we should use that, so I think it should be:

#ifndef SYS_pkey_mprotect
#define SYS_pkey_mprotect	386
#endif

cheers
