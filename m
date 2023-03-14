Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E76B9643
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 14:31:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbZF92Tljz3cgy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 00:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gmi2DLvR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbZDD31ddz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 00:31:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gmi2DLvR;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PbZD96Sf2z4x5R;
	Wed, 15 Mar 2023 00:31:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678800666;
	bh=RWpQH91z9oCPCV7UgB1VjeBlCalvsZzq/D68BsBI0Ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gmi2DLvR7FFuYEzpwxyajVFJgqqPUe+t2SrIuwdBqzYcgbPpV3TLjtx3waxpWL6PS
	 Tlm2qgbZO6FByZBDH6vF20yDA6dWo8oqnebJk3mUZNrFfgeS07oV/YOl+wQ/pjVzZu
	 NwgdFlLy64biV7j4n9vGCDKf7dkUIoM/W/PbkbUt8GCcCNGFWLT03R3isUmlhyjLoN
	 z+e+Uak4GXq1yhQ7L0Ld0I2uWeJ7ZdLzkVARLCWcim1o6ZC2zU4FnwLI9WmUPUXLXt
	 pck/4eDZ5TqTFY6UejLoZnpTjGPIH2V00sS3IcxUEmiEM4sMhD557XPpadOlNh7qRi
	 JJdlXEA0IptgQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Fangrui Song <maskray@google.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Andy Lutomirski <luto@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
In-Reply-To: <20230310190750.3323802-1-maskray@google.com>
References: <20230310190750.3323802-1-maskray@google.com>
Date: Wed, 15 Mar 2023 00:28:53 +1100
Message-ID: <87jzzjo416.fsf@mpe.ellerman.id.au>
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
Cc: linux-s390@vger.kernel.org, Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fangrui Song <maskray@google.com> writes:
> The actual intention is that no dynamic relocation exists. However, some
> GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> relocations. E.g. ld's powerpc port recently fixed
> https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
> generally no-op in the dynamic loaders. So just ignore them.
>
> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> not called "absolute relocations". (The patch is motivated by the arm64
> port missing R_AARCH64_RELATIVE.)
>
> Signed-off-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for vDSO, aarch64
> Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for aarch64
> ---
> Changes from v2:
> * rebase
>
> Changes from v3:
> * Add a comment before `include $(srctree)/lib/vdso/Makefile` in every touched arch Makefile
> ---
>  arch/arm/vdso/Makefile            |  4 +---
>  arch/arm64/kernel/vdso/Makefile   |  4 +---
>  arch/arm64/kernel/vdso32/Makefile |  3 ---
>  arch/csky/kernel/vdso/Makefile    |  4 +---
>  arch/loongarch/vdso/Makefile      |  4 +---
>  arch/mips/vdso/Makefile           |  4 +---
>  arch/powerpc/kernel/vdso/Makefile |  2 +-

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
