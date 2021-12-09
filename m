Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B946E2B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 07:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8kvR2vKVz3cBr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 17:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GGuZ7Ucq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8ktl5Hs9z2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 17:40:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GGuZ7Ucq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J8ktg48xXz4xhB;
 Thu,  9 Dec 2021 17:40:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639032029;
 bh=suZjxbWzZfiwEHkXF7PVcnVEK2S44YPaAlsYAqlSBBA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GGuZ7UcqMCRzxt11p1WpFVObvEmF7QF3q/jrxLxUc6xSnoo7r1EJRkoqP1vn8unY6
 vk7x0SjUtsMWVgxEegLSD5VvE9ZVlBVlLaw00vXtHyoyazgzpbwSjZnTZon8+G4xf6
 PEj+0jm1xquSXV4uVu283TUDCNW8xthP5oi77M2zTAFJ0nojo4zIaZdV+Aohe0Ccoc
 B0+hu9YJDrmbWYKuxfW36xqYW2PJT6hj38YjIqGG2ECCbWARwgLOH6iGd/5PuGeSE5
 4+66hZc0dkWIA3FSB5tHK6qqWTSkWCHe0LLnqpGbnbHVMCRk3Zt/Tr2/9xnrurM6Gy
 wPcbXvVFr7e4A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anders Roxell <anders.roxell@linaro.org>, arnd@arndb.de
Subject: Re: [PATCH] powerpc: platforms: cell: pervasive: fix clang
 -Wimplicit-fallthrough
In-Reply-To: <20211207110228.698956-1-anders.roxell@linaro.org>
References: <20211207110228.698956-1-anders.roxell@linaro.org>
Date: Thu, 09 Dec 2021 17:40:24 +1100
Message-ID: <87zgpamgbr.fsf@mpe.ellerman.id.au>
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, nathan@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anders Roxell <anders.roxell@linaro.org> writes:
> Clang warns:
>
> arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case SRR1_WAKEEE:
>         ^
> arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
>         case SRR1_WAKEEE:
>         ^
>         break;
> 1 error generated.
>
> Clang is more pedantic than GCC, which does not warn when failing
> through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst.
> Add athe missing break to silence the warning.
>
> Fixes: 6e83985b0f6e ("powerpc/cbe: Do not process external or decremeter interrupts from sreset")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arch/powerpc/platforms/cell/pervasive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
> index 5b9a7e9f144b..dff8d5e7ab82 100644
> --- a/arch/powerpc/platforms/cell/pervasive.c
> +++ b/arch/powerpc/platforms/cell/pervasive.c
> @@ -78,6 +78,7 @@ static int cbe_system_reset_exception(struct pt_regs *regs)
>  	switch (regs->msr & SRR1_WAKEMASK) {
>  	case SRR1_WAKEDEC:
>  		set_dec(1);
> +		break;
>  	case SRR1_WAKEEE:
>  		/*
>  		 * Handle these when interrupts get re-enabled and we take

Thanks. I have definitely fixed this somewhere before, but I guess I
never sent it upstream, or it's still lying in a git stash of mine.

cheers
