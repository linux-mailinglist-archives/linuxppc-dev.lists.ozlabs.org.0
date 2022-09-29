Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7465EF742
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:13:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdb1j35jjz3cFT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:13:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jnS2libg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdb153s7wz301l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 00:12:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jnS2libg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mdb150kCKz4xFt;
	Fri, 30 Sep 2022 00:12:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664460777;
	bh=RNAGBX4ma9aUNULckgRXkAXQUJQNK3JTlJ5goNIwFns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jnS2libgaZsbsZlAQOT9y4O78Pe7Mns9g4wHWhK1EI8qd4sF6vs+ljpZjl+xDZ9kZ
	 OUh1z0T6wXwh6fW2zlsBYuVrODZaoFcyrDBXXN7/IaXTUug8FbaLhbQ/AFzjY0fbd2
	 4eZ0Ym66s1QAc1Hr0KLbawbEOsERDnshXBbKBf6Mb8H5HvWVAbXhLg9rZmMr4Zir2f
	 kLlW44WMq8vmwyzhWWvj3IGvFXO+0qrgSzpSOPYzwFSAxJXqRAGh54g4uNmZ9iFutt
	 udSJ/m1M3zjbkv7RppJmXqHxqA88mye7+V9n4wOPKQzn190sYnKzIR784TiGzZFEP4
	 0HYjrvefQJhsA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/6] powerpc: Add hardware description string
In-Reply-To: <20220929135919.1983269-1-mpe@ellerman.id.au>
References: <20220929135919.1983269-1-mpe@ellerman.id.au>
Date: Fri, 30 Sep 2022 00:12:56 +1000
Message-ID: <87zgeie0bb.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Create a hardware description string, which we will use to record
> various details of the hardware platform we are running on.
>
> Print the accumulated description at boot, and use it to set the generic
> description which is printed in oopses.
>
> To begin with add ppc_md.name, aka the "machine description".
>
> Example output at boot with the full series applied:
>
>   Linux version 6.0.0-rc2-gcc-11.1.0-00199-g893f9007a5ce-dirty (michael@alpine1-p1) (powerpc64-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #844 SMP Thu Sep 29 22:29:53 AEST 2022
>   Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER8 (raw)' pvr:0x4d0200 lpvr:0xf000004 of:'SLOF,HEAD' machine:pSeries
>   printk: bootconsole [udbg0] enabled
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/setup.h   |  2 ++
>  arch/powerpc/kernel/setup-common.c | 19 ++++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> v2: Print the string at boot as suggested by Nathan.
>     Add some comments, update change log.

Ugh, I managed to bork the patches when sending. Don't send patches at
midnight.

New version coming.

cheers
