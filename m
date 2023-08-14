Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B277B8A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 14:29:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZcgVO9dy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPYcT44nqz3cLv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 22:29:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZcgVO9dy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPYbd1Fpdz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 22:28:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692016123;
	bh=2nm287AjV8yh7BNKPrm5uQTpVz6ChQJ5SjvZrIuBMQk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZcgVO9dyUPOaFIVjqdarUVsFTFqw25XWcNIUy+han/mIpep/0/Lml6HyVvaiZmMSY
	 4U99V5iro2xE8D5dtSm9ZhnUwTPk9kcRyJ1sFQnplA4v5Rs6DTpZtreLKJi4oY4THq
	 i37A2Rh8smo/tB60k1MJ0GlXhGrBxVtUK+jmJFkz46u9OGnVnOkS/J2j3YfpbtuZAJ
	 +iaKoNH6kedLN233cDnA8ESqGeg0uMmMPAyF5aMvkUIJUkuXKPGVMRG1DplYN5USrp
	 n85BsYuzl84dCswuc5GkU8Qxo6pTQBSKmMlgTnkzwNbffPcJd1NgZ7l3c470f7KL7e
	 izHI/v2U69q7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RPYbZ29WJz4wZn;
	Mon, 14 Aug 2023 22:28:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Justin Stitt <justinstitt@google.com>, Geoff Levand
 <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RFC 1/3] powerpc/ps3: refactor strncpy usage attempt 1
In-Reply-To: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-1-301052a5663e@google.com>
References: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
 <20230811-strncpy-arch-powerpc-platforms-ps3-v1-1-301052a5663e@google.com>
Date: Mon, 14 Aug 2023 22:28:36 +1000
Message-ID: <87fs4lerkb.fsf@mail.lhotse>
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
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Justin Stitt <justinstitt@google.com> writes:
> This approach simply replicates the implementation of `make_field` which
> means we drop `strncpy` for `memcpy`.
>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  arch/powerpc/platforms/ps3/repository.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/ps3/repository.c b/arch/powerpc/platforms/ps3/repository.c
> index 205763061a2d..1abe33fbe529 100644
> --- a/arch/powerpc/platforms/ps3/repository.c
> +++ b/arch/powerpc/platforms/ps3/repository.c
> @@ -73,9 +73,9 @@ static void _dump_node(unsigned int lpar_id, u64 n1, u64 n2, u64 n3, u64 n4,
>  
>  static u64 make_first_field(const char *text, u64 index)
>  {
> -	u64 n;
> +	u64 n = 0;
>  
> -	strncpy((char *)&n, text, 8);
> +	memcpy((char *)&n, text, strnlen(text, sizeof(n)));
>  	return PS3_VENDOR_ID_NONE + (n >> 32) + index;
>  }

I guess it's a slight improvement, because people generally know
memcpy's behaviour better than strncpy.

The change log should be a bit more verbose and mention that the result
is the same, including the NULL padding done my strncpy().

cheers
