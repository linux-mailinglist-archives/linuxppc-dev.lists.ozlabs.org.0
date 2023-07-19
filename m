Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE28759C1D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 19:11:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VCV7i/rq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D9aexrnq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5j6J6DtFz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VCV7i/rq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D9aexrnq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5j5N2kzMz2ytZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 03:11:04 +1000 (AEST)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1689786653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HirW/v5+b+1SdqjL/ANp5wg8zZf/k+V30O9KLgN/N70=;
	b=VCV7i/rq/r0OL4jnSJIIRL/zVJue6doxKGkZH+i7m0hs/Cfhjz/jegsB5NdLDGwXEHdjyw
	/ZOmHHfes+BqR6Q/h1EPFYzm20N5ipMdgPzOhtq+8js88qDlgxvA2bIonXFZ47B6CNNoyz
	7QOPGWnRjFfFC4KsRkXdKclpJJv3lNkO67MscLxuiabDWHqb+802i2C0vmdublGmeW77d4
	D56pKH3R562QDJpYiHlmAgMZYVPE6n+nOZjxo5n3xTHvmLLCtymhjdeN2F4frQi2fXqwoT
	EwehAjolwLasKc5mSGO1lQCoYL6m+d7AcG4Nv/uNFFyL03bOPpTarIRB+YSiHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1689786653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HirW/v5+b+1SdqjL/ANp5wg8zZf/k+V30O9KLgN/N70=;
	b=D9aexrnqUIp5mA5MRwcJyGhIXmpsWaxRLo3Bkm64oVqLbuydeZ3Ed3SAlRECuCskCaNEmK
	2Nl6q/BAahE/TFBQ==
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/build: vdso linker warning for orphan sections
In-Reply-To: <87ttu0i095.fsf@mail.lhotse>
References: <20230609051002.3342-1-npiggin@gmail.com>
 <871qh6wcgb.fsf@jogness.linutronix.de> <871qh5jrz2.fsf@mail.lhotse>
 <87o7k9l2oj.fsf@jogness.linutronix.de> <87ttu0i095.fsf@mail.lhotse>
Date: Wed, 19 Jul 2023 19:16:50 +0206
Message-ID: <87v8efu8rp.fsf@jogness.linutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 2023-07-19, Michael Ellerman <mpe@ellerman.id.au> wrote:
> I regularly test with a gcc 5.5.0 / ld 2.29 toolchain and gcc 13.1.1 /
> ld 2.39, and I haven't seen the warning. I tried a bunch of others and
> can't reproduce it.

I will send my config in a separate email (without the lists in
CC). Building the vdso_prepare target is all that is needed.

> Can you confirm that this makes the warning go away?
>
> diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
> index bda6c8cdd459..286e1597c548 100644
> --- a/arch/powerpc/kernel/vdso/vdso64.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
> @@ -85,7 +85,7 @@ SECTIONS
>  		*(.branch_lt)
>  		*(.data .data.* .gnu.linkonce.d.* .sdata*)
>  		*(.bss .sbss .dynbss .dynsbss)
> -		*(.opd)
> +		*(.opd .rela.opd)
>  		*(.glink .iplt .plt .rela*)

Hmmm. Not sure what that would change. And indeed it does not make the
warning go away.

Doing some testing it seems that previously .rela.opd was being silently
placed in the .rela.dyn section. So doing that explicitly obviously gets
rid of the warning:

Index: linux-6.5-rc2/arch/powerpc/kernel/vdso/vdso64.lds.S
===================================================================
--- linux-6.5-rc2.orig/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ linux-6.5-rc2/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -69,7 +69,7 @@ SECTIONS
 	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
 	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
 	.gcc_except_table : { *(.gcc_except_table) }
-	.rela.dyn ALIGN(8) : { *(.rela.dyn) }
+	.rela.dyn ALIGN(8) : { *(.rela.dyn) *(.rela.opd) }
 
 	.got ALIGN(8)	: { *(.got .toc) }

But if the goal is to get rid of .rela.opd then the question is: why is
the linker complaining about it being discarded?

John
