Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8858FA2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 11:42:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3MKG0Mxfz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 19:42:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kEbdDLRB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3MJg3TClz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 19:41:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kEbdDLRB;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M3MJf6BgNz4x1K;
	Thu, 11 Aug 2022 19:41:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660210899;
	bh=QvU3Ii0mNqZHfLnF6Zfdgva2T6Ppk7BMjH3eteu8YK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kEbdDLRB31+agt8BJ/TeC6VhWX4NEHL3dNzlAAHEaVglBt/IPlWyXaQbYxPzDNupK
	 VN/OxNUYdRcFRQDTumj6IpYsWApJkiEfNpC+xnmIW800GnzemkKLeC69T1tQDdt8VF
	 N7ZCOmwhsPZ/rEPktpKlVXB8XRLL1+e3e8xvPPtbPYv8B1cuKUJqti67ADjcR04r7/
	 Y1outOTSoXOrmVjpBPII2/A3K4LG5K8L611udCZY904nczWqIKDMpdnIh2o61ChM2Z
	 faTpKkkrkJqfZLzfaY+uD9NVhnVPIC956S7DAIQ5p6oSzyY80OGjQKaLQxpqU42AnZ
	 LMao+0e4mYQHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anders Roxell <anders.roxell@linaro.org>, nathan@kernel.org,
 ndesaulniers@google.com
Subject: Re: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else
 block
In-Reply-To: <20220810114318.3220630-1-anders.roxell@linaro.org>
References: <20220810114318.3220630-1-anders.roxell@linaro.org>
Date: Thu, 11 Aug 2022 19:41:35 +1000
Message-ID: <87fsi3ce28.fsf@mpe.ellerman.id.au>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anders Roxell <anders.roxell@linaro.org> writes:
> Clang warns:
>
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                   ^~~~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
>                 unsigned long hstart, hend;
>                                     ^
>                                      = 0
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                           ^~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
>                 unsigned long hstart, hend;
>                                           ^
>                                            = 0
> 2 errors generated.

Which version & config are you building?

I don't see this warning in my test builds.

cheers
