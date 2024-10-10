Return-Path: <linuxppc-dev+bounces-1958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290A997F5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 10:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPN4H0ZBgz3bmF;
	Thu, 10 Oct 2024 19:20:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728548447;
	cv=none; b=l5haagwOZiJaYQE2I0pFP19BI2D32arNnJOdkmZdu8EnQR16JPSd4MABJ7kMGGrBPyegH8Z0Gupz+5gCYLP4ct/b0A8/WHitXCTpM3mmjBYdZZ0PdcTu/clRaNBoBpYUd+kPLelfx8Gvkk4mxACgh7KJFyynZ6J6c4tsUIyv6Zj6nbXu2qv40g8z2R/ujfLX1jCr1MA24wlONVjoFRhc4yiBIufqA8BgAs2yJsTnfQO4fEEfii/hOs90YNvUk1f3CeFRElR2kvZANc0dncTSBeWgpNVmpkMfvrn4gUoLX8Q+4A/5J6bQyoEvGOKxL6PE72rdhZOkRbWHFksM9PUDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728548447; c=relaxed/relaxed;
	bh=G0yRJLGN3GR4SU4+Zvv9xJN2+/rKp9fff/+IHuEcpTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrlW2xo5l4J9fhz5S2ocN1d95RSk22XhXLjfVlmSIynK6eQntj/6sNy+g8iVos1z98rYc49fwt64oloQNw8CWS/KSGj3Q71HuOBeVryRTSJozu8pP5GAq1rX1EaTEUqIB2Bcx+3035zhxhXHoMDaiJ25/2JsC4xgyNp8VJEnb6f4Frzi7gUDcIRXxK9BJX2ebN5nnK3FhhQHFa/aOL9+ciGoVC6Ero9D0qyHgm5tSARJFelipbE0wr38m+0D+u68NTU1v7SbeGDwq8JWE3whmlH2YxbUqPRh98vk9Ivt4lUuzmutgrwS+K/rypD3+4iRm8c55HLyumU80xt/RWtNZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MKqGn/cN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=p224maLW; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MKqGn/cN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=p224maLW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPN4G04Bbz3bkd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 19:20:45 +1100 (AEDT)
Date: Thu, 10 Oct 2024 10:20:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728548439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G0yRJLGN3GR4SU4+Zvv9xJN2+/rKp9fff/+IHuEcpTo=;
	b=MKqGn/cNC6Zyq+zH/xAufz8hNQY8ZecCg9s01h/mG/99zJ1ScQ8Qtlsy17qf5zsGj48NIi
	QUmfDfYfMBbpmE3dqHHVRUyHKolg+FYVRqEDtOIBin0HbYcuau2ICNUhga4X/4D6f5oJXm
	7IAFIbW8QatOI1/KRKyr60PbzCA09HgYIUA6wf+GfQy+IAoUOmYWwvvpJBq6/cw4thU/oO
	vm3WvItem5bNmlXJm85bWkmluJYlL8AQS0oBKgj81inPMGJpNhSKKk+u3P+ue4d3OXC5WC
	vbWbMJIgTOZGHb9slJmc6uzZO0tFcGIfXrDmsnvffA9UMVGjVNOfoDZFMRPwKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728548439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G0yRJLGN3GR4SU4+Zvv9xJN2+/rKp9fff/+IHuEcpTo=;
	b=p224maLWJCwIJWR2SmTdxzsy/veWfEa0cZGiCeqqM9jkquJMrxXc6jxLj6qjYJVAln6UwD
	bjJGtiYHoUKQF+Aw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
Message-ID: <20241010101449-007991a0-f7c7-4f76-a6cc-413c474b9219@linutronix.de>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 02, 2024 at 10:39:29AM +0200, Christophe Leroy wrote:
> VDSO time functions do not call any other function, so they don't
> need to save/restore LR. However, retrieving the address of VDSO data
> page requires using LR hence saving then restoring it, which can be
> heavy on some CPUs. On the other hand, VDSO functions on powerpc are
> not standard functions and require a wrapper function to call C VDSO
> functions. And that wrapper has to save and restore LR in order to
> call the C VDSO function, so retrieving VDSO data page address in that
> wrapper doesn't require additional save/restore of LR.
> 
> For random VDSO functions it is a bit different. Because the function
> calls __arch_chacha20_blocks_nostack(), it saves and restores LR.
> Retrieving VDSO data page address can then be done there without
> additional save/restore of LR.
> 
> So lets implement __arch_get_vdso_rng_data() and simplify the wrapper.
> 
> It starts paving the way for the day powerpc will implement a more
> standard ABI for VDSO functions.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/vdso/getrandom.h | 15 +++++++++++++--
>  arch/powerpc/kernel/asm-offsets.c         |  1 -
>  arch/powerpc/kernel/vdso/getrandom.S      |  1 -
>  arch/powerpc/kernel/vdso/vgetrandom.c     |  4 ++--
>  4 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/vdso/getrandom.h b/arch/powerpc/include/asm/vdso/getrandom.h
> index 501d6bb14e8a..4302e7c67aa5 100644
> --- a/arch/powerpc/include/asm/vdso/getrandom.h
> +++ b/arch/powerpc/include/asm/vdso/getrandom.h
> @@ -7,6 +7,8 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <asm/vdso_datapage.h>
> +
>  static __always_inline int do_syscall_3(const unsigned long _r0, const unsigned long _r3,
>  					const unsigned long _r4, const unsigned long _r5)
>  {
> @@ -43,11 +45,20 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
>  
>  static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
>  {
> -	return NULL;
> +	struct vdso_arch_data *data;
> +
> +	asm(
> +		"	bcl	20, 31, .+4\n"
> +		"0:	mflr	%0\n"
> +		"	addis	%0, %0, (_vdso_datapage - 0b)@ha\n"
> +		"	addi	%0, %0, (_vdso_datapage - 0b)@l\n"
> +	: "=r" (data) :: "lr");
> +
> +	return &data->rng_data;
>  }

Did you also try something like this:

extern struct vdso_arch_data _vdso_datapage __attribute__((visibility("hidden")));

static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
{
       return &_vdso_datapage.rng_data;
}

Not knowing much about ppc asm the resulting assembly looks simpler.
And it would be more in line with what other archs are doing.

> [..]

