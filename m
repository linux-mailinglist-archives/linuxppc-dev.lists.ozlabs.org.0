Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE3571527C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 02:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVXd15hrrz3fDk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 10:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JL5Bt449;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVXc00JYmz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 10:01:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JL5Bt449;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QVXby3xbVz4x3l;
	Tue, 30 May 2023 10:01:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685404862;
	bh=46ba4rrJUFBCegIkM7Ps4olVptXlmrO/sTCXufvD4Vc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JL5Bt449olDg6JwfKkyP+M19y2yKPaCcDUb86xSSoD3XEUC2HapamCQ0NFFfmrkB6
	 dF7VqjFzH3zTwC1kdezP/l22bfU4M/XY+d0efWHsyJEw4GXclnwpIRyt8Ps/UEbJtI
	 HNRjnZKI+8WB3sT/jsJCV8LJGOCu9waAQA5npb+8S6+9M93uY9Pd6V3QWSuSiUhjNR
	 +sSfoOJBOxk8YWLoLgmHcNvJnxoHd64jZQl1lnuTWeyww7UJWkxUa82fIrkV+aH6+U
	 rfQyAgHyoIiGw/s6S/gVYdU0yY9TnI+yF0RImLru/v9Ddc+bT6uGI/qWezttNA3z7W
	 lQHTUlDz03F3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] powerpc: Fail build if using recordmcount with binutils
 v2.37
In-Reply-To: <20230529134512.51749-1-naveen@kernel.org>
References: <20230529134512.51749-1-naveen@kernel.org>
Date: Tue, 30 May 2023 10:00:57 +1000
Message-ID: <877csqu1qe.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N Rao <naveen@kernel.org> writes:
> binutils v2.37 drops unused section symbols, which prevents recordmcount
> from capturing mcount locations in sections that have no non-weak
> symbols. This results in a build failure with a message such as:
> 	Cannot find symbol for section 12: .text.perf_callchain_kernel.
> 	kernel/events/callchain.o: failed
>
> The change to binutils was reverted for v2.38, so this behavior is
> specific to binutils v2.37:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c09c8b42021180eee9495bd50d8b35e683d3901b
>
> Objtool is able to cope with such sections, so this issue is specific to
> recordmcount.
>
> Fail the build and print a warning if binutils v2.37 is detected and if
> we are using recordmcount.
>
> Cc: stable@vger.kernel.org
> Suggested-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index dca73f673d7046..f0540c1f1377c8 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -409,3 +409,11 @@ checkbin:
>  		echo -n '*** Please use a different binutils version.' ; \
>  		false ; \
>  	fi
> +	@if test "x${CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT}" = "xy" -a \
> +		"x${CONFIG_LD_IS_BFD}" = "xy" -a \
> +		"x$(call ld-ifversion, -eq, 23700, y)" = "xy" ; then \
> +		echo -n '*** binutils 2.37 drops unused section symbols, which recordmcount ' ; \
> +		echo 'is unable to handle.' ; \
> +		echo '*** Please use a different binutils version.' ; \
> +		false ; \
> +	fi

Thanks for doing this.

Masahiro wanted to remove ld-ifversion, he suggested to just check
CONFIG_LD_VERSION directly instead. Mind doing a v2 with that change?

https://lore.kernel.org/all/CAK7LNAQWtDHOs=K+qznt5U1WiDv86tChkj4zOer4wtVRB974OA@mail.gmail.com/

cheers
